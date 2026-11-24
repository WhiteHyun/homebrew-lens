cask "lens-proxy" do
  version "1.4.9"
  sha256 "c77848df621490f9a9eaf961c14143bdde7159db4439f2cfbff91b810f6fe5ed"

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
