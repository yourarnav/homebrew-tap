cask "codexreserve" do
  version "2.0.0"
  sha256 "cb54df769ab09af5557bd5ec0e5b262546aacc0c753ad714d68380cd04f56a76"

  url "https://github.com/yourarnav/CodexReserve/releases/download/v#{version}/CodexReserve.dmg"
  name "CodexReserve"
  desc "Two rings in your menu bar. Codex limits, nothing else."
  homepage "https://github.com/yourarnav/CodexReserve"

  depends_on macos: ">= :sonoma"

  app "CodexReserve.app"
end
