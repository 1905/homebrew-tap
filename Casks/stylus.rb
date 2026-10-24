cask "stylus" do
  version "0.4.0"
  sha256 "e160f0c12171e4384f29a18c002c14aa41644cb53aae51f34e607b56bc565f0c"

  url "https://github.com/1905/stylus-spotify-mini-player/releases/download/v#{version}/Stylus.dmg"
  name "Stylus"
  desc "Small, fast Spotify player with a built-in Spotify Connect speaker"
  homepage "https://github.com/1905/stylus-spotify-mini-player"

  auto_updates true

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Stylus.app"

  # Stylus is not signed with an Apple Developer ID: clear the quarantine flag so it opens
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Stylus.app"]
  end

  zap trash: [
    "~/Library/Application Support/stylus",
    "~/Library/Caches/com.kass.stylus",
    "~/Library/WebKit/com.kass.stylus",
  ]

  caveats "Stylus requires a Spotify Premium account."
end
