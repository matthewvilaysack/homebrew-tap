class Hotword < Formula
  desc "Phrase-triggered and session-start workflows for terminal coding agents"
  homepage "https://hotword-dusky.vercel.app"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/matthewvilaysack/hotword/releases/download/v0.1.0/hotword-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "967fe9bae654f49b40792236d417b2a08b7a12a3e1c0553f927bbc5ecac2fe94"
    end
    on_intel do
      url "https://github.com/matthewvilaysack/hotword/releases/download/v0.1.0/hotword-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "402b5cbe4865f47b47aea3b4b97731090f04bdc74aed08ac46708b30d02147d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/matthewvilaysack/hotword/releases/download/v0.1.0/hotword-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26423232adc49aa6731b94cd10654969b3dc8dc428bed6e4ad278b34a6bda740"
    end
    on_intel do
      url "https://github.com/matthewvilaysack/hotword/releases/download/v0.1.0/hotword-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5899188fee6136112f5b40341d7614b9eda35f32dbe51c9b97842401334a6ed2"
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
