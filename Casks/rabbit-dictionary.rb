cask "rabbit-dictionary" do
  version "0.1.1"
  sha256 "fb0f53b02ac208fa84b16f8dd3c67ad13ed0f653970a86dcc55be8efe507e5c9"

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
