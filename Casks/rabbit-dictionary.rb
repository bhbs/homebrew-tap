cask "rabbit-dictionary" do
  version "0.1.9"
  sha256 "dd93c0c9852ccb8f1068d56ef12d6aa1ea6ea8d77a4815e5299c5d78d62172f3"

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
