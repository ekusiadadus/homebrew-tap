class Ttybird < Formula
  desc "Find coding agents and return to their terminals"
  homepage "https://github.com/ekusiadadus/ttybird"
  version "0.10.2"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    url "https://github.com/ekusiadadus/ttybird/releases/download/v0.10.2/ttybird-0.10.2-aarch64-apple-darwin.tar.gz"
    sha256 "851ce66e2302a9e431e2ec2b3e53a073f603870551cd6a270eeccff262bec579"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/ekusiadadus/ttybird/releases/download/v0.10.2/ttybird-0.10.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "83d29a3e052aa1dea9193c53d3f309e1ac47461a925dafc470c4fbdcfc42ea6f"
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
