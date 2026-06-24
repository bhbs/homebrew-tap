cask "flatwheel" do
  version "0.1.1"
  sha256 "3f749c317f24a0b776ca39dc87ca7dea712caaa964c0a8bdbb834e5c166f6b49"

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
