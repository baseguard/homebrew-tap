cask "hangar" do
  version "1.0.0"
  sha256 "3e0471c5072f2ae40b2d746276a6198ec500f567f785b9c205a060b89d17ae4e"

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
