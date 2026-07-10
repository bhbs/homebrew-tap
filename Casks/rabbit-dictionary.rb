cask "rabbit-dictionary" do
  version "0.1.6"
  sha256 "d967f9960e93c22e4366bc5ec09b9da9978936d701cac79c6de42018408fcb67"

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
