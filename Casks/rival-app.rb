cask "rival-app" do
  version "5.0.0"
  sha256 "184a239000714a1300107fe4ac77daec931e71da000373629b7e7d42de1eca73"

  url "https://github.com/1905/rival/releases/download/v#{version}/Rival-app.zip"
  name "Rival"
  desc "Menu bar + window dashboard for rival review runs"
  homepage "https://github.com/1905/rival"

  depends_on macos: :sonoma

  app "Rival.app"

  # The app is ad-hoc signed, not notarized. Strip the quarantine flag so
  # Gatekeeper lets it launch (verified in the P0 spike, 2026-09-26).
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Rival.app"]
  end
end
