cask "rabbit-dictionary" do
  version "0.1.8"
  sha256 "04b5ca96a220003d7cb9316f097275f5e302f4cc9b023e62590c672e54b3e002"

  url "https://github.com/bhbs/rabbit-dictionary/releases/download/v#{version}/RabbitDictionary-#{version}-notarized.zip"
  name "RabbitDictionary"
  desc "macOS dictionary lookup with global text capture"
  homepage "https://github.com/bhbs/rabbit-dictionary"

  depends_on macos: :tahoe

  app "Rabbit Dictionary.app"

  zap trash: [
    "~/Library/Application Support/RabbitDictionary",
    "~/Library/Preferences/dev.bhbs.RabbitDictionary.plist",
  ]
end
