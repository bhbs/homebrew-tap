cask "floodlight" do
  version "0.1.4"
  sha256 "2660e5bb2bcf7948f0112831de1e8879e057952d1fc4da4ce608e56c805fccf1"

  url "https://github.com/bhbs/floodlight/releases/download/v#{version}/Floodlight-#{version}-notarized.zip"
  name "Floodlight"
  desc "macOS disk usage scanner and cleanup guide"
  homepage "https://github.com/bhbs/floodlight"

  depends_on macos: :tahoe

  app "Floodlight.app"

  zap trash: [
    "~/Library/Application Support/Floodlight",
    "~/Library/Preferences/dev.bhbs.Floodlight.plist",
  ]
end
