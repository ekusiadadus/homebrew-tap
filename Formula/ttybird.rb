class Ttybird < Formula
  desc "Find coding agents and return to their terminals"
  homepage "https://github.com/ekusiadadus/ttybird"
  version "0.8.4"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    url "https://github.com/ekusiadadus/ttybird/releases/download/v0.8.4/ttybird-0.8.4-aarch64-apple-darwin.tar.gz"
    sha256 "2b0895f7c49ccbab699e221fc64618b0ac27998611aacbec46f64d87e32f2fda"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/ekusiadadus/ttybird/releases/download/v0.8.4/ttybird-0.8.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4cc0a9b586d56effa67fc39915b38e80f267481d5263584e0952891488025a67"
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
