cask "floodlight" do
  version "0.1.7"
  sha256 "b31e9b159872ddf8a262d2f7b9b46083b7fdd6e7056dc0f8b5b0c58ed7a84ed5"

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
