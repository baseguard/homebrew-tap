cask "baseguard" do
  version "0.3.3"
  sha256 "435606c8e76e3874db70804b9d1148473d14cf910da599cf46b1bb9c6625a053"

  url "https://github.com/baseguard/baseguard-release/releases/download/v#{version}/bg-darwin-arm64.pkg"
  name "Baseguard"
  desc "Zero-trust mesh network connecting devices peer to peer"
  homepage "https://github.com/baseguard/baseguard-release"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  pkg "bg-darwin-arm64.pkg"

  uninstall launchctl: "net.baseguard.daemon",
            quit:      "net.baseguard.desktop",
            pkgutil:   "net.baseguard.desktop",
            delete:    [
              "/Library/LaunchDaemons/net.baseguard.daemon.plist",
              "/usr/local/bin/baseguard",
            ]

  zap delete: [
    "/var/lib/baseguard",
    "/var/log/baseguard",
    "/var/run/baseguard",
  ]
end
