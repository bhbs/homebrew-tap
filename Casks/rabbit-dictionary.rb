cask "rabbit-dictionary" do
  version "0.1.7"
  sha256 "3d696b6f1a503ec5975191d70888578a4e5a877e9f8c53ed7ca87428863cd098"

  url "https://github.com/bhbs/rabbit-dictionary/releases/download/v#{version}/RabbitDictionary-#{version}-notarized.zip"
  name "RabbitDictionary"
  desc "macOS dictionary lookup with global text capture"
  homepage "https://github.com/bhbs/rabbit-dictionary"

  depends_on macos: :tahoe

  app "RabbitDictionary.app"

  zap trash: [
    "~/Library/Application Support/RabbitDictionary",
    "~/Library/Preferences/dev.bhbs.RabbitDictionary.plist",
  ]
end
