cask "codexreserve" do
  version "2.0.6"
  sha256 "8ddc8241b4ed05fe78e1deffe822be9114ea7cc5bcfbb8ba32de4bc70803d34f"

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
