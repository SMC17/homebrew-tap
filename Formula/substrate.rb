class Substrate < Formula
  desc "Zero-allocation Zig 0.15.2 computational substrate (LOB, SeqAB, VecDB, Infer, Quant, IOFlow, Chess)"
  homepage "https://smc17.github.io/zinging/"
  version "3.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-macos-aarch64.tar.gz"
      sha256 "7c972b6bcaaee568689b4810d281f471488dcd9e8e6e51307823afada9a2e310"
    else
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-macos-x86_64.tar.gz"
      sha256 "3735a02a27f3a7b5b7bb97163a3fad4b8f55985dd0fa3b52c1e6e51307823af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-linux-aarch64.tar.gz"
      sha256 "28ed47dd148e3fdeb9bcce515340ce5b1f12b23c1e8949da59a70d4bb7776929"
    else
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-linux-x86_64.tar.gz"
      sha256 "b9654eee38ef08bd8cd3960799850c747cdf1ebfc3cd945d8d9322eb75bf3cea"
    end
  end

  def install
    bin.install "bin/substrate"
    lib.install Dir["lib/*"]
    include.install Dir["include/*"]
  end

  test do
    assert_match "zig-substrate", shell_output("#{bin}/substrate version")
  end
end
