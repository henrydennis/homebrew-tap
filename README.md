# henrydennis/tap

Homebrew casks for [Petal](https://github.com/henrydennis/petal), a fast, exact disk-space explorer for macOS.

```sh
brew install --cask henrydennis/tap/petal
```

Petal isn't notarized by Apple yet, so macOS blocks it the first time it opens. Open it once and click **Done**. Then go to **System Settings › Privacy & Security** and click **Open Anyway** next to the message about Petal. Or run `xattr -dr com.apple.quarantine /Applications/Petal.app`.

Update with `brew upgrade --cask petal`. To remove Petal and its settings, run `brew uninstall --zap --cask petal`.

## Releasing a new version

Once the release and its DMG are on GitHub, update the cask's `version` and `sha256`:

```sh
brew bump-cask-pr --version <version> henrydennis/tap/petal
```

Or edit `Casks/petal.rb` by hand. The checksum is in the release notes, or from `shasum -a 256 Petal-<version>.dmg`.
