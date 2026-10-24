cask "stylus" do
  version "0.4.1"
  sha256 "c5b0e9f0711e56b9cc8c2ef2f4263d79ab8cdd51a454a0d0ee20696612b29438"

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
