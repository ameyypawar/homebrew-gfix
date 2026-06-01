class Gfix < Formula
  desc "Cross-agent MCP-native merge resolver for AI agent swarms"
  homepage "https://gfix.space"
  version "0.1.0-alpha.6"
  license :cannot_represent  # Proprietary EULA; not an OSI license

  on_macos do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b9370bcd2a208cafe392dac1e9ae7053355beed4d4cafc77a7eb3fa2eaf1d3bd"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "948ccf5239cfd0ec607163401f0ca196bffe8bd8aba6dc70d902351950994d47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48204a8a94003c5da7f77589df972844ea0a28a67ee2ff57dc12c188244a3e49"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46958584eaa2d24843494e7bd7196cca6653325d3b64e53b5c21e2aa652b2650"
    end
  end

  def install
    bin.install "gfix"
  end

  def caveats
    <<~EOS
      gfix is the cross-agent MCP-native merge resolver.

      Wire into Claude Code:
        claude mcp add --scope user gfix #{opt_bin}/gfix mcp

      First-time setup (BYO-key, capability matrix, troubleshooting):
        https://github.com/ameyypawar/gfix-docs#install

      macOS first launch: if Gatekeeper complains, run:
        xattr -d com.apple.quarantine #{opt_bin}/gfix

      The binary is unsigned during alpha. Apple Developer ID signing
      lands at v1.0. Proprietary EULA at:
        https://github.com/ameyypawar/gfix/blob/main/LICENSE.txt
    EOS
  end

  test do
    assert_match "gfix", shell_output("#{bin}/gfix --version")
  end
end
