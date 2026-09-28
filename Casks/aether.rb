require "download_strategy"

class GitHubPrivateReleaseDownloadStrategy < AbstractFileDownloadStrategy
  require "system_command"
  include SystemCommand::Mixin

  def initialize(url, name, version, **meta)
    super
    parse_url_pattern
  end

  def parse_url_pattern
    url_pattern = %r{https://github.com/([^/]+)/([^/]+)/releases/download/([^/]+)/(.*)}
    match = @url.match(url_pattern)
    raise "Invalid GitHub release URL: #{@url}" unless match

    @owner = match[1]
    @repo = match[2]
    @tag = match[3]
    @filename = match[4]
  end

  def fetch(timeout: nil)
    if cached_location.exist?
      puts "Already downloaded: #{cached_location}"
      create_symlink_to_cached_download(cached_location)
      return
    end

    gh_bin = which("gh", "#{ENV["PATH"]}:/opt/homebrew/bin:/usr/local/bin")
    if gh_bin
      ohai "Downloading #{@filename} using GitHub CLI..."
      system_command! gh_bin,
                      args: [
                        "release", "download", @tag,
                        "--repo", "#{@owner}/#{@repo}",
                        "--pattern", @filename,
                        "--output", temporary_path.to_s,
                        "--clobber",
                      ],
                      print_stderr: true
    else
      token = ENV["HOMEBREW_GITHUB_API_TOKEN"] || ENV["GITHUB_TOKEN"]
      if token.to_s.empty?
        raise "Downloading private release requires GitHub CLI (`gh auth login`) or HOMEBREW_GITHUB_API_TOKEN set in your environment."
      end

      ohai "Fetching asset metadata from GitHub API..."
      release_api_url = "https://api.github.com/repos/#{@owner}/#{@repo}/releases/tags/#{@tag}"
      headers = [
        "Accept: application/vnd.github.v3+json",
        "Authorization: token #{token}",
      ]
      output, = curl_output("--silent", "--fail", *headers.flat_map { |h| ["-H", h] }, release_api_url)
      require "json"
      release = JSON.parse(output)
      asset = release["assets"]&.find { |a| a["name"] == @filename }
      raise "Asset #{@filename} not found in release #{@tag}" unless asset

      asset_url = asset["url"]
      ohai "Downloading #{@filename} via GitHub API..."
      curl_download(
        asset_url,
        "--header", "Accept: application/octet-stream",
        "--header", "Authorization: token #{token}",
        to: temporary_path
      )
    end

    cached_location.dirname.mkpath
    temporary_path.rename(cached_location.to_s)
    create_symlink_to_cached_download(cached_location)
  end
end

cask "aether" do
  version "1.0.0"
  sha256 "6777898736fe7de24ba74dbf1a83b85ac9d485ee0c3ce77fb87e45a9569d00cb"

  url "https://github.com/yourarnav/Aether/releases/download/v#{version}/Aether.dmg",
      using: GitHubPrivateReleaseDownloadStrategy
  name "Aether"
  desc "Ultra-lightweight native macOS menu bar dictation powered by Groq Whisper"
  homepage "https://github.com/yourarnav/Aether"

  depends_on macos: :sonoma

  app "Aether.app"

  caveats <<~EOS
    Aether is downloaded from a private GitHub repository.
    Make sure you are logged into GitHub via `gh auth login` or have
    HOMEBREW_GITHUB_API_TOKEN set in your environment.

    Because Aether is ad-hoc signed, macOS may flag it on first launch:
      xattr -dr com.apple.quarantine /Applications/Aether.app
  EOS
end
