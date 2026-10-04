cask "petal" do
  version "0.4.1"
  sha256 "e0346a0271719ad19f7c62c35c564006fb8ab73d29a7a9bc072b60b8fa430ff6"

  url "https://github.com/henrydennis/petal/releases/download/v#{version}/Petal-#{version}.dmg"
  name "Petal"
  desc "Disk-space explorer with a live sunburst chart"
  homepage "https://github.com/henrydennis/petal"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Petal.app"

  zap trash: [
    "~/Library/Application Support/Petal",
    "~/Library/Preferences/io.github.henrydennis.petal.plist",
    "~/Library/Saved Application State/io.github.henrydennis.petal.savedState",
  ]

  caveats <<~EOS
    Petal isn't notarized by Apple yet, so macOS blocks it the first time it opens.
    Open it once, click Done, then go to System Settings › Privacy & Security and
    click Open Anyway next to the message about Petal. Or run:
      xattr -dr com.apple.quarantine #{appdir}/Petal.app

    For a complete picture, give Petal Full Disk Access when it asks.
  EOS
end
