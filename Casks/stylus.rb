cask "stylus" do
  version "0.3.0"
  sha256 "8a832edd6bb931b09ebaea66ba3a101ada5aae262686b343855d88d101a610a6"

  url "https://github.com/1905/stylus-spotify-mini-player/releases/download/v#{version}/Stylus.dmg"
  name "Stylus"
  desc "Small, fast Spotify player with a built-in Spotify Connect speaker"
  homepage "https://github.com/1905/stylus-spotify-mini-player"

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
