class TermSurvivors < Formula
  desc "Vampire Survivors-like roguelike shooter that runs in the terminal"
  homepage "https://github.com/kimulaco/term-survivors"
  version "0.4.1"
  license "MIT"

  darwin_arm64_sha256 = "541c647986df29d26d8f57114f3ba1e23ce70173ffe74a1240012a5f4925fb63"
  darwin_x64_sha256 = "3e034b629b42bc82161a704fa16c71dfa02b9508378969e968a7f5fbc88de990"
  linux_x64_sha256 = "04a686c9dd3ad219d810f8676dcd893dbc1a4500ad664a4c589f1c0bb9de48e8"
  linux_arm64_sha256 = "57549853c2d2b9fda4ecdacf675d6f14f644c5574ffb253dbd13aec06e1c5f2e"

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
