class Ttybird < Formula
  desc "Find coding agents and return to their terminals"
  homepage "https://github.com/ekusiadadus/ttybird"
  version "0.11.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    url "https://github.com/ekusiadadus/ttybird/releases/download/v0.11.1/ttybird-0.11.1-aarch64-apple-darwin.tar.gz"
    sha256 "ee05a72604eaa5b2fefeaad8a7e7e65e30a1cb1b0bb8ad18d233a6a93c851925"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/ekusiadadus/ttybird/releases/download/v0.11.1/ttybird-0.11.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "93a1748e7dbb542baa0e7e1d9e047b541f6660c02b7c0586a8e76c92608af465"
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
