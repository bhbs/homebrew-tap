cask "flatwheel" do
  version "0.1.9"
  sha256 "ac2fbd9d438a760b3d91c813f4f588c44d823ec613b84cb7228fba0a7084a1bb"

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
