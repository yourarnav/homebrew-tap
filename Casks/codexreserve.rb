cask "codexreserve" do
  version "2.0.7"
  sha256 "dbfa59908efe7e3391287a0fbcea9fc7da2bdebcba5b43823520f8f3c93cef33"

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
