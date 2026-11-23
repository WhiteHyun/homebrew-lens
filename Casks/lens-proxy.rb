cask "lens-proxy" do
  version "1.4.2"
  sha256 "1db2121ef0e360948ff56622a50e480815fbe271424c0a57ba416f03049768ec"

  url "https://whitehyun.github.io/lens-updates/Lens-#{version}.dmg",
      verified: "whitehyun.github.io/lens-updates/"
  name "Lens"
  desc "HTTP and HTTPS debugging proxy"
  homepage "https://lens.whitehyun.com/"

  livecheck do
    url "https://whitehyun.github.io/lens-updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Lens.app"
  binary "#{appdir}/Lens.app/Contents/MacOS/lens-mcp", target: "lens"

  uninstall launchctl: "com.whitehyun.Lens.HelperTool",
            quit:      "com.whitehyun.Lens"

  zap trash: [
    "~/Library/Application Support/Lens",
    "~/Library/Caches/com.whitehyun.Lens",
    "~/Library/HTTPStorages/com.whitehyun.Lens",
    "~/Library/Preferences/com.whitehyun.Lens.plist",
  ]
end
