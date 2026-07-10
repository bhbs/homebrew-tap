cask "shorts-blocker" do
  version "0.1.1"
  sha256 "76f33af05a797415a72330f77901d1f257b58b994ee39ad2ec95e2be56e9c2f7"

  url "https://github.com/bhbs/shorts-blocker/releases/download/v#{version}/ShortsBlocker-#{version}-notarized.zip"
  name "Shorts Blocker"
  desc "Reduce short-form video interruptions with a macOS URL filter"
  homepage "https://github.com/bhbs/shorts-blocker"

  depends_on macos: :tahoe

  app "ShortsBlocker.app"

  zap trash: [
    "~/Library/Application Support/ShortsBlocker",
    "~/Library/Preferences/dev.bhbs.ShortsBlocker.plist",
  ]
end
