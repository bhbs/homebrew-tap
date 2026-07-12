cask "flat-wheel" do
  version "0.1.10"
  sha256 "5ed031aca8bc5f39a626a61ea561df1606d332c100a120c0cd30a6b66057c2af"

  url "https://github.com/bhbs/flatwheel/releases/download/v#{version}/FlatWheel-#{version}-notarized.zip"
  name "FlatWheel"
  desc "Menu bar utility for trackpad middle-click gestures"
  homepage "https://github.com/bhbs/flatwheel"

  depends_on macos: :sonoma

  app "Flat Wheel.app"

  zap trash: [
    "~/Library/Logs/FlatWheel",
    "~/Library/Preferences/dev.bhbs.FlatWheel.plist",
  ]
end
