class Hotword < Formula
  desc "Phrase-triggered and session-start workflows for terminal coding agents"
  homepage "https://hotword-dusky.vercel.app"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/matthewvilaysack/hotword/releases/download/v0.2.0/hotword-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "7544dcc0f36e6bf265a07aa442537069068703d627b2ac3e0ea3ceea6697b398"
    end
    on_intel do
      url "https://github.com/matthewvilaysack/hotword/releases/download/v0.2.0/hotword-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "22d1633bc7e0f183357cf87f5aedafdbd45f611e648b1c419af057e2b7247c4a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/matthewvilaysack/hotword/releases/download/v0.2.0/hotword-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1d6952d1ea0f0ec40056108c25dbfcd0f4925f069316fdb4b39a7d4ce7962d9a"
    end
    on_intel do
      url "https://github.com/matthewvilaysack/hotword/releases/download/v0.2.0/hotword-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7743a9969da337b17c917855e4be3122fd7a1d6c7fd73d3b20f158b4f0f42842"
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
