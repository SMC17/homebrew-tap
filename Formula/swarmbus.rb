class Swarmbus < Formula
  desc "Lock-free cross-process POSIX mmap swarm bus, CRDT blackboard, and compute auction"
  homepage "https://github.com/SMC17/swarmbus"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/swarmbus/releases/download/v0.1.0/swarmbus-v0.1.0-macos-aarch64.tar.gz"
      sha256 "7b31c815ac00c113ec339066eaa5e2cd988b958140f53bd5a6a27755afbdefcc"
    else
      url "https://github.com/SMC17/swarmbus/releases/download/v0.1.0/swarmbus-v0.1.0-macos-x86_64.tar.gz"
      sha256 "e5b059b70dee2968d8fb3f49396ec8168df43f8a1aabb0b62ebacca9d88d6b99"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/swarmbus/releases/download/v0.1.0/swarmbus-v0.1.0-linux-aarch64.tar.gz"
      sha256 "7ec5e926dfabc75b8cb46f4dc4b89cf91ac9410a410ad8af65268a2095c1fbe3"
    else
      url "https://github.com/SMC17/swarmbus/releases/download/v0.1.0/swarmbus-v0.1.0-linux-x86_64.tar.gz"
      sha256 "a8754045a3a3399eb3c03b6695e47e964e11e5a16741775e00e86c187ec9940c"
    end
  end

  def install
    bin.install "swarmbus"
  end

  test do
    assert_match "{", shell_output("#{bin}/swarmbus bench")
  end
end
