cask "hangar" do
  version "0.10.0"
  sha256 "ea5837c41f0458fb293dcfefe2db3f3958473c21ae6bf004b6de6f67ce3b6a4c"

  url "https://github.com/baseguard/hangar/releases/download/v#{version}/Hangar.dmg"
  name "Hangar"
  desc "Virtual machines with their network traffic watched and filtered"
  homepage "https://github.com/baseguard/hangar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :golden_gate"

  app "Hangar.app"
  binary "#{appdir}/Hangar.app/Contents/Helpers/HangarCLI.app/Contents/MacOS/hangar"

  zap trash: [
    "~/Library/Preferences/io.baseguard.hangar.plist",
    "~/Library/Saved Application State/io.baseguard.hangar.savedState",
  ]
end
