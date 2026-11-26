cask "duodisplay" do
  version "1.0"
  sha256 "95734753055ad02464d0422612cfce73d71881399ce2eb4f7a266c024e4e2f5c"

  url "https://github.com/LB26121/DuoDisplay/releases/download/v#{version}/DuoDisplay-#{version}.zip"
  name "DuoDisplay"
  desc "Low-latency second display and shared input over Thunderbolt"
  homepage "https://github.com/LB26121/DuoDisplay"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "DuoDisplay.app"

  uninstall quit:   "io.github.lb26121.DuoDisplay",
            delete: "/Library/Audio/Plug-Ins/HAL/DuoDisplayMic.driver"

  zap trash: [
    "~/Library/Caches/io.github.lb26121.DuoDisplay",
    "~/Library/HTTPStorages/io.github.lb26121.DuoDisplay",
    "~/Library/Preferences/io.github.lb26121.DuoDisplay.plist",
  ]
end
