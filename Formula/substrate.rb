class Substrate < Formula
  desc "Zero-allocation Zig 0.15.2 computational substrate (LOB, SeqAB, VecDB, Infer, Quant, IOFlow, Chess)"
  homepage "https://smc17.github.io/zinging/"
  version "3.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-macos-aarch64.tar.gz"
      sha256 "cfcd50a2e5d82a31bfd4cacbe912b0658abfd9c7a2bd02e541749707e1ef626f"
    else
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-macos-x86_64.tar.gz"
      sha256 "4a1fc39b1cb2f484d5452651971b699581df003a8ff6bf750adb195d7bf9601f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-linux-aarch64.tar.gz"
      sha256 "14cab29ec7f11117e88587225d7540bd6b799c3b1b73e774166b3ac19ae77c9f"
    else
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-linux-x86_64.tar.gz"
      sha256 "63d927308940917847615107580550e4896d307194dcc218764e87f852c9e46d"
    end
  end

  def install
    bin.install "bin/substrate"
    lib.install Dir["lib/*"]
    include.install Dir["include/*"]
  end

  test do
    assert_match "zig-substrate", shell_output("#{bin}/substrate version")
    assert_match "zig-substrate", pipe_output("#{bin}/substrate mcp", "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"initialize\"}\n")
  end
end
