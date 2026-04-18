class TermSurvivors < Formula
  desc "Vampire Survivors-like roguelike shooter that runs in the terminal"
  homepage "https://github.com/kimulaco/term-survivors"
  version "0.4.2"
  license "MIT"

  darwin_arm64_sha256 = "ff7b5189f99378ba614fb7ee22429be99d03bfd9d52654fc526ff5cebe21e1b7"
  darwin_x64_sha256 = "7c1f21428e7ef778ef9c4019122f84641069e0d46f6f1153784134535caf8c33"
  linux_x64_sha256 = "61888c6699e8cc70a4abc1e381863747a275055efd857979818d256c4b13b119"
  linux_arm64_sha256 = "ca4edf6f5c9668f5f2858ea11697228e18e91052f82ab754d56f2267f7250020"

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
