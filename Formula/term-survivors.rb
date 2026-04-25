class TermSurvivors < Formula
  desc "Vampire Survivors-like roguelike shooter that runs in the terminal"
  homepage "https://github.com/kimulaco/term-survivors"
  version "0.5.0"
  license "MIT"

  darwin_arm64_sha256 = "30fc6da464980c622e8d08a2a22ad02ebb2ee037c39934ddb1d73c4ec01df89d"
  darwin_x64_sha256 = "c01b9fddaa7d6687e69a6f6ff69d6a8fbfadcd5f9c28f5e1edc3743c2f130a09"
  linux_x64_sha256 = "0ab6a1ce8b0baf06e9db01733ee9db060a1fe518e4979437ebd4da403521adab"
  linux_arm64_sha256 = "525c0e758ec36fee33de105cacf38444086a823cecd8650b289276df5397f06e"

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
