cask "codexreserve" do
  version "2.1.0"
  sha256 "f3fc9ed67b0b27e05a6687321524cca0ee7968bacd4aee614122f27fd453aab1"

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
