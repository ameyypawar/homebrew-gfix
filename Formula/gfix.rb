class Gfix < Formula
  desc "Cross-agent MCP-native merge resolver for AI agent swarms"
  homepage "https://gitfix.pro"
  version "0.1.0-alpha.1"
  license :cannot_represent  # Proprietary EULA; not an OSI license

  on_macos do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_DARWIN_ARM64_SHA256"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_DARWIN_X86_64_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_WITH_LINUX_ARM64_SHA256"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_WITH_LINUX_X86_64_SHA256"
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
        https://github.com/ameyypawar/gitfix-docs#install

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
