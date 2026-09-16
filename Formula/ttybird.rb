class Ttybird < Formula
  desc "Find coding agents and return to their terminals"
  homepage "https://github.com/ekusiadadus/ttybird"
  version "0.11.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    url "https://github.com/ekusiadadus/ttybird/releases/download/v0.11.0/ttybird-0.11.0-aarch64-apple-darwin.tar.gz"
    sha256 "e96f0bdda193e94785cd17f25eaa6af1bd36e67f208a51c638ea34c7596c8a99"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/ekusiadadus/ttybird/releases/download/v0.11.0/ttybird-0.11.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "df4971d84a413570bdef358ce315777bd53a126ac9f3cfb21ba56ea33c479ee2"
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
