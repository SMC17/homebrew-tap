class Substrate < Formula
  desc "Zero-allocation Zig 0.15.2 computational substrate (checkpoint validator, eval-gate, H3, asof_join, Quant, MCP)"
  homepage "https://smc17.github.io/zinging/"
  version "3.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-macos-aarch64.tar.gz"
      sha256 "1e1991fab977528b54d1feca9caeb8f4fd54e4f966eb819c9172eba94d7ebc55"
    else
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-macos-x86_64.tar.gz"
      sha256 "047ced496b35ae11dc4e4df98c662b6dd02e57816085703f5a0c4e3078746467"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-linux-aarch64.tar.gz"
      sha256 "c07e8bd821162bdeb48f4cc402339f28cb928418888b5b7154b512f996b54869"
    else
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-linux-x86_64.tar.gz"
      sha256 "b6a70f5f9c14081f3e5ed973736bba6bca86fb548545be70f7c705d73c664de4"
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
    assert_match "usage: substrate inspect", shell_output("#{bin}/substrate inspect", 1)
    assert_match "reject_null", shell_output("#{bin}/substrate eval-gate --delta 0.05 --variance 0.000036 --json")
  end
end
