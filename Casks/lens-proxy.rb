cask "lens-proxy" do
  version "1.4.7"
  sha256 "016227107f868b1ceffbfd82f0376bf3f55a4e77cfb10e02e948d2863200984a"

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
