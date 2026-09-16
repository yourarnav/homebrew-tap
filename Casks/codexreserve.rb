cask "codexreserve" do
  version "2.0.1"
  sha256 "6be2864ac5e916833b0f6dc6ab4f594991201823e47fb2a98df89e32f9308e5e"

  url "https://github.com/yourarnav/CodexReserve/releases/download/v#{version}/CodexReserve.dmg"
  name "CodexReserve"
  desc "Two rings in your menu bar. Codex limits, nothing else."
  homepage "https://github.com/yourarnav/CodexReserve"

  depends_on macos: :sonoma

  app "CodexReserve.app"
end
