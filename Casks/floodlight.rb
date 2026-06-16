cask "floodlight" do
  version "0.1"
  sha256 "8cb30cf517c7acd6c63e66efd6fc5ce436a2fdda71049711a1b8bdc2cb9e1321"

  url "https://github.com/bhbs/floodlight/releases/download/v#{version}/Floodlight-#{version}-notarized.zip"
  name "Floodlight"
  desc "macOS disk usage scanner and cleanup guide"
  homepage "https://github.com/bhbs/floodlight"

  depends_on macos: ">= :tahoe"

  app "Floodlight.app"

  zap trash: [
    "~/Library/Application Support/Floodlight",
    "~/Library/Preferences/dev.bhbs.Floodlight.plist",
  ]
end
