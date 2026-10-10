cask "stylus" do
  version "0.2.0"
  sha256 "f658ad548b1cd629520076010f2a47e8664cd9d04c305bb78efcf007943c2cef"

  url "https://github.com/1905/stylus-spotify-mini-player/releases/download/v#{version}/Stylus.dmg"
  name "Stylus"
  desc "Small, fast Spotify player with a built-in Spotify Connect speaker"
  homepage "https://github.com/1905/stylus-spotify-mini-player"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Stylus.app"

  # Stylus is not signed with an Apple Developer ID: clear the quarantine flag so it opens
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Stylus.app"]
  end

  zap trash: [
    "~/Library/Application Support/stylus",
    "~/Library/Caches/com.kass.stylus",
    "~/Library/WebKit/com.kass.stylus",
  ]

  caveats "Stylus requires a Spotify Premium account."
end
