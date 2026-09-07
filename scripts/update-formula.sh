#!/usr/bin/env bash
# Regenerates Formula/hotword.rb for a released version from that release's
# SHA256SUMS. Usage: scripts/update-formula.sh 0.1.0
set -euo pipefail
version="${1:?version, like 0.1.0}"
base="https://github.com/matthewvilaysack/hotword/releases/download/v$version"
sums=$(curl -fsSL "$base/SHA256SUMS")
sha() { printf '%s\n' "$sums" | grep " hotword-$version-$1.tar.gz\$" | cut -d' ' -f1; }
cat > "$(dirname "$0")/../Formula/hotword.rb" <<RUBY
class Hotword < Formula
  desc "Phrase-triggered and session-start workflows for terminal coding agents"
  homepage "https://hotword-dusky.vercel.app"
  version "$version"
  license "MIT"

  on_macos do
    on_arm do
      url "$base/hotword-$version-aarch64-apple-darwin.tar.gz"
      sha256 "$(sha aarch64-apple-darwin)"
    end
    on_intel do
      url "$base/hotword-$version-x86_64-apple-darwin.tar.gz"
      sha256 "$(sha x86_64-apple-darwin)"
    end
  end

  on_linux do
    on_arm do
      url "$base/hotword-$version-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "$(sha aarch64-unknown-linux-gnu)"
    end
    on_intel do
      url "$base/hotword-$version-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "$(sha x86_64-unknown-linux-gnu)"
    end
  end

  def install
    bin.install "hotword"
    (share/"hotword/examples").install Dir["examples/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hotword --version")
  end
end
RUBY
echo "wrote Formula/hotword.rb for $version"
