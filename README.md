# Homebrew tap for Lens

[Lens](https://lens.whitehyun.com) is a macOS HTTP(S) debugging proxy.

```
brew install --cask whitehyun/lens/lens-proxy
```

The cask is `lens-proxy` because Homebrew's own `lens` cask is a different app. It also links the `lens` command line tool. Lens updates itself; the release workflow bumps this cask with each version.
