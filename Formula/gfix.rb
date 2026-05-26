class Gfix < Formula
  desc "Cross-agent MCP-native merge resolver for AI agent swarms"
  homepage "https://gfix.space"
  version "0.1.0-alpha.3"
  license :cannot_represent  # Proprietary EULA; not an OSI license

  on_macos do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1234aba138ffcfa5171372aa3f8f439008122cf84fb0add6a0c89be4834b8196"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c42d030b4c02c48256c69a8dffd3292c17e7f060ac406a044afd3ad51de0a718"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1b8567fc5eeb6277b24de08213529203602590dae7d34b88b72d0c207025c61"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "055e0e0aa301794000c26b3fac5fb9a65eb11f16b0ab365939c0eb036edff30b"
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
