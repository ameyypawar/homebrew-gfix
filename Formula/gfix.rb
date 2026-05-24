class Gfix < Formula
  desc "Cross-agent MCP-native merge resolver for AI agent swarms"
  homepage "https://gitfix.pro"
  version "0.1.0-alpha.1"
  license :cannot_represent  # Proprietary EULA; not an OSI license

  on_macos do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d83eee053442555bc4fb41822cb76f4e1600ff9753cc4e11970259ab19142461"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "858ba797796066104b36ed78576b7b0af6f8ce0424be6f7ca44f72268873ec5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b628c98c66748f9b6f950a15de8153e1fcb6ea62be42fc14d71e581d8ca0297b"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4463b07ef12dad5e56fce6d927637f02ff538f489927032c3e93baf87a35f919"
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
