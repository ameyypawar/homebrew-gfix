class Gfix < Formula
  desc "Cross-agent MCP-native merge resolver for AI agent swarms"
  homepage "https://gfix.space"
  version "0.1.0-alpha.5"
  license :cannot_represent  # Proprietary EULA; not an OSI license

  on_macos do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9fb2846dd4557e3294d7f908cab1fa04e1723155f880a9c37c51bf8b594f7bfb"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b48ec78b1c27b3af217a084accc3d36fcb1d649f452ff3b3229ce243ca828107"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc5aab0426a8fc7ce5af075317408f1f07c2759732151fde7113d4cc3daec70b"
    end
    on_intel do
      url "https://github.com/ameyypawar/gfix/releases/download/v#{version}/gfix-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d713ca9fcdf79c2274641ea79f24c3c2ea9195b3d6f8f68c0521ee102b30a19"
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
