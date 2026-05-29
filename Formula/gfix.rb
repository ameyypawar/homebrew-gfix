class Gfix < Formula
  desc "Cross-agent MCP-native merge resolver for AI agent swarms"
  homepage "https://gfix.space"
  version "0.1.0-alpha.4"
  license :cannot_represent  # Proprietary EULA; not an OSI license

  on_macos do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c5e48d0ad80f85fed23c9361759ff558756e962624f48ccd101c8544bb4f4901"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "da86c0ad5f994029cfb11ac557cbad2bf627c7fb4d668a2be661852cf96ed78e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "faedf445fc57dae77f3f4e78f060e055998699efc203307bfa0f36aeacafc4b1"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "effbcfbd3975532f93d19433370c49eb91f41a8e0b2df7370fba658290ec7138"
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
