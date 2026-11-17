class Physkernel < Formula
  desc "Zero-alloc real-time physical-AI sensor fusion, safety E-STOP, and MPC rollout engine"
  homepage "https://github.com/SMC17/physkernel"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/physkernel/releases/download/v0.1.0/physkernel-v0.1.0-macos-aarch64.tar.gz"
      sha256 "66786e03a3cbe9ce46ee43b70fc28d30b8bffea943740cd1d177ed14eaca3dc6"
    else
      url "https://github.com/SMC17/physkernel/releases/download/v0.1.0/physkernel-v0.1.0-macos-x86_64.tar.gz"
      sha256 "33ae8753fe732930d40ce3aa7075c3b352b4c539753e143f4777772b01ddf8cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/physkernel/releases/download/v0.1.0/physkernel-v0.1.0-linux-aarch64.tar.gz"
      sha256 "727a926d0b0b6cf3cbfecc38a8441db2178f904f7d6670ce9febc4f2e32c7160"
    else
      url "https://github.com/SMC17/physkernel/releases/download/v0.1.0/physkernel-v0.1.0-linux-x86_64.tar.gz"
      sha256 "a85d5bf483f289a2f2b0b1743854bfc263aa10e2c0f8843f02120498a38ac78d"
    end
  end

  def install
    bin.install "physkernel"
  end

  test do
    assert_match "{", shell_output("#{bin}/physkernel bench")
  end
end
