cask "stylus" do
  version "0.1.0"
  sha256 "426e3b7f6b68ad1ad89668c72f1e0c2912c3631b980f23b32a7f30567c17ff74"

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
