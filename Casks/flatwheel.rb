cask "flatwheel" do
  version "0.1.9"
  sha256 "0933229f2554a309756930f4825d1e5f40ac3ee75f0a531913a5947f911ab977"

  url "https://github.com/bhbs/flatwheel/releases/download/v#{version}/FlatWheel-#{version}-notarized.zip"
  name "FlatWheel"
  desc "macOS menu bar utility for trackpad middle click gestures"
  homepage "https://github.com/bhbs/flatwheel"

  depends_on macos: :sonoma

  app "FlatWheel.app"

  zap trash: [
    "~/Library/Logs/FlatWheel",
    "~/Library/Preferences/dev.bhbs.FlatWheel.plist",
  ]
end
