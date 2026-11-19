cask "vow" do
  version "1.0.27"
  sha256 "e0715147326b4fecd7fe90251ce17a967331f1fdf1c8728946ea9a67a43bceb8"

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
