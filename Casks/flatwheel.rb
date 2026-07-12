cask "flatwheel" do
  version "0.1.10"
  sha256 "c879e01b7648ca4f46dfbda6790f2fe963e84ae8c7bad5e07b2af7735e9eac95"

  url "https://github.com/bhbs/flatwheel/releases/download/v#{version}/FlatWheel-#{version}-notarized.zip"
  name "FlatWheel"
  desc "macOS menu bar utility for trackpad middle click gestures"
  homepage "https://github.com/bhbs/flatwheel"

  depends_on macos: :sonoma

  app "Flat Wheel.app"

  zap trash: [
    "~/Library/Logs/FlatWheel",
    "~/Library/Preferences/dev.bhbs.FlatWheel.plist",
  ]
end
