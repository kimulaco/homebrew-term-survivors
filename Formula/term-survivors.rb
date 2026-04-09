class TermSurvivors < Formula
  desc "A Vampire Survivors-like roguelike shooter that runs in the terminal"
  homepage "https://github.com/kimulaco/term-survivors"
  license "MIT"

  version "0.3.0"

  darwin_arm64_sha256 = "9090b31782188673b20e30e6bc282e879546bd7385422aba90e4c5ba45812524"
  darwin_x64_sha256 = "b4dd75b2ca259bd2a71baf9b2775937bfc95acaedc9ec7911e41e92a9518c529"
  linux_x64_sha256 = "12e19e74f37e370a9ddb8da0e3a51d6679946b928d1446a600eef0807474f503"
  linux_arm64_sha256 = "f133a63e04fab10004b39f70432f0473cd522a79c2fbad87f0c03d525f4c11c2"

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
