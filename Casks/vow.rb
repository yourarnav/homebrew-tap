cask "vow" do
  version "1.0.29"
  sha256 "7e3f205a3163fa09a500982c1ec6664c7608714963595ba57b83eff8e127ca59"

  url "https://raw.githubusercontent.com/byarnav/offline-lock-releases/main/Vow-#{version}.dmg"
  name "Vow"
  desc "System-level offline lock on a timer for macOS"
  homepage "https://vow.byarnav.com/"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Vow.app"

  zap trash: [
    "/Library/Application Support/OfflineLock",
    "~/Library/Application Support/OfflineLock",
    "~/Library/Preferences/com.offlinelock.app.plist",
  ]
end
