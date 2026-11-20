cask "hangar" do
  version "1.1.0"
  sha256 "f4b054fae2731b473364ba500bef0d09a0a2aed9e4b25a1c9d016d2a33d3301c"

  url "https://github.com/baseguard/hangar/releases/download/v#{version}/Hangar.dmg"
  name "Hangar"
  desc "Virtual machines with their network traffic watched and filtered"
  homepage "https://github.com/baseguard/hangar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Hangar.app"
  binary "#{appdir}/Hangar.app/Contents/Helpers/HangarCLI.app/Contents/MacOS/hangar"

  zap trash: [
    "~/Library/Preferences/io.baseguard.hangar.plist",
    "~/Library/Saved Application State/io.baseguard.hangar.savedState",
  ]
end
