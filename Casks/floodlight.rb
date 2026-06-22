cask "floodlight" do
  version "0.1.5"
  sha256 "2a3d1265ecf598ccf61f174f1009e6ca9ae3f1bb404848db779b46382601523a"

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
