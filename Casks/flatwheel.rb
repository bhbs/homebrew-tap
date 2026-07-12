cask "flatwheel" do
  version "0.1.11"
  sha256 "062cd5fd8596450937f2395cda8dc0a549dca0409a98f2e1a32753e8a09550ea"

  url "https://github.com/bhbs/flatwheel/releases/download/v#{version}/FlatWheel-#{version}-notarized.zip"
  name "FlatWheel"
  desc "Menu bar utility for trackpad middle-click gestures"
  homepage "https://github.com/bhbs/flatwheel"

  depends_on macos: :sonoma

  deprecate! date: "2026-07-12", because: "has been renamed", replacement_cask: "flat-wheel"

  app "Flat Wheel.app"

  zap trash: [
    "~/Library/Logs/FlatWheel",
    "~/Library/Preferences/dev.bhbs.FlatWheel.plist",
  ]
end
