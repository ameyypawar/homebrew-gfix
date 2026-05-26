class Gfix < Formula
  desc "Cross-agent MCP-native merge resolver for AI agent swarms"
  homepage "https://gfix.space"
  version "0.1.0-alpha.2"
  license :cannot_represent  # Proprietary EULA; not an OSI license

  on_macos do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a4fa82941a645e90411eb5671af431cf5f63473c7a8613efc1674912b0179152"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "32c87875c34869559323fb3a21e8cfd3bab723b159ba2e7b74e73575d8a0ed89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8551444e2b5cb14fa5e187e5011c22b39fe3ade43e886f2aaaaf982e8c42566"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe8eec462ca01ece3f9f18e9d2b5089fb9ad1c5b8c74594257518243cc475dad"
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
