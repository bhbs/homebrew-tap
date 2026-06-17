cask "floodlight" do
  version "0.1.2"
  sha256 "3ef213c1784147856dfd9191af9e33632f189ea705064a31a81bbe6dd6fb89e3"

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
