cask "flatwheel" do
  version "0.1.2"
  sha256 "5b81c54f5fb60774359905f4b90638751aa35bdab2b65ed2743cd762d1d9e803"

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
