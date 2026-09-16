class Ttybird < Formula
  desc "Find coding agents and return to their terminals"
  homepage "https://github.com/ekusiadadus/ttybird"
  version "0.9.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    url "https://github.com/ekusiadadus/ttybird/releases/download/v0.9.0/ttybird-0.9.0-aarch64-apple-darwin.tar.gz"
    sha256 "257aa983aa232c81b61bdd5c3a1f2d542b0ce5f1c967b72b8079e203c7d62bcb"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/ekusiadadus/ttybird/releases/download/v0.9.0/ttybird-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8104a929bd097d49c16f41909ad113f64a76373d65bae9463f8858fb3e11aeb4"
  end

  def install
    bin.install "ttybird"
    pkgshare.install "licenses"
  end

  def caveats
    <<~EOS
      tmux is optional; install it to use tmux navigation and preview.
      On Linux, ttybird requires glibc 2.39 or newer (Ubuntu 24.04 or newer).
    EOS
  end

  test do
    assert_match "ttybird #{version}", shell_output("#{bin}/ttybird --version")
  end
end
