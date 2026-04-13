class TermSurvivors < Formula
  desc "Vampire Survivors-like roguelike shooter that runs in the terminal"
  homepage "https://github.com/kimulaco/term-survivors"
  version "0.4.0"
  license "MIT"

  darwin_arm64_sha256 = "8176688cf0b06efd550936b4450fe928ab89cfba8e839b3674e5935098deeb2d"
  darwin_x64_sha256 = "0268445788c770bb65c5699a590b631a31d852939d1af6f0c5f12480da772b6a"
  linux_x64_sha256 = "51ee9a444e710d41051ea4193b154a89e03e898030314f36f3c337eb1a3fc20f"
  linux_arm64_sha256 = "531005f005244e46813b651b040cb12ff097453cdba93db2eff84fecaaaae7d2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kimulaco/term-survivors/releases/download/v#{version}/term-survivors-darwin-arm64.tar.gz"
      sha256 darwin_arm64_sha256
    else
      url "https://github.com/kimulaco/term-survivors/releases/download/v#{version}/term-survivors-darwin-x64.tar.gz"
      sha256 darwin_x64_sha256
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kimulaco/term-survivors/releases/download/v#{version}/term-survivors-linux-arm64.tar.gz"
      sha256 linux_arm64_sha256
    else
      url "https://github.com/kimulaco/term-survivors/releases/download/v#{version}/term-survivors-linux-x64.tar.gz"
      sha256 linux_x64_sha256
    end
  end

  def install
    bin.install "term-survivors"
  end

  test do
    assert_match "term-survivors", shell_output("#{bin}/term-survivors --version")
  end
end
