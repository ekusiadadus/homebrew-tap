class Ttybird < Formula
  desc "Find coding agents and return to their terminals"
  homepage "https://github.com/ekusiadadus/ttybird"
  version "0.8.3"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    url "https://github.com/ekusiadadus/ttybird/releases/download/v0.8.3/ttybird-0.8.3-aarch64-apple-darwin.tar.gz"
    sha256 "09bdda5cdbcc8ad7b0584928387e66881b0ff55b79bc24edc9b8d6c8650bba5e"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/ekusiadadus/ttybird/releases/download/v0.8.3/ttybird-0.8.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3bca4759fee1f0c69d22687de1a00033e26f31993a1ed9e218d22bd54dfe4abd"
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
