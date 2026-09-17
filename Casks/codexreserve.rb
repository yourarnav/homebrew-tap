cask "codexreserve" do
  version "2.0.2"
  sha256 "c91e7ac18dfab6b9d0328893b1d0da304b8ac8b8de29c275cd1090807ef83c14"

  url "https://github.com/yourarnav/CodexReserve/releases/download/v#{version}/CodexReserve.dmg"
  name "CodexReserve"
  desc "Two rings in your menu bar. Codex limits, nothing else."
  homepage "https://github.com/yourarnav/CodexReserve"

  depends_on macos: :sonoma

  app "CodexReserve.app"

  caveats <<~EOS
    CodexReserve is free and self-signed, so macOS calls it "damaged" on first launch.
    Clear the flag once, then open it normally:
      xattr -dr com.apple.quarantine /Applications/CodexReserve.app
    The source is fully open at https://github.com/yourarnav/CodexReserve if you want to inspect it first.
  EOS
end
