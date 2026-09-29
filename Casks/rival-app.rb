cask "rival-app" do
  version "4.1.1"
  sha256 "56104fa675fac07056e33a4006e570949220e75b4bfd44c4e929b436dd3ff7df"

  url "https://github.com/1905/rival/releases/download/v#{version}/Rival-app.zip"
  name "Rival"
  desc "Menu bar + window dashboard for rival review runs"
  homepage "https://github.com/1905/rival"

  depends_on macos: ">= :sonoma"

  app "Rival.app"

  # The app is ad-hoc signed, not notarized. Strip the quarantine flag so
  # Gatekeeper lets it launch (verified in the P0 spike, 2026-09-26).
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Rival.app"]
  end
end
