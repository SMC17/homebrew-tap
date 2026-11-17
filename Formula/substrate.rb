class Substrate < Formula
  desc "Zero-allocation Zig 0.15.2 computational substrate (checkpoint validator, H3, asof_join, SeqAB, Quant, MCP)"
  homepage "https://smc17.github.io/zinging/"
  version "3.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-macos-aarch64.tar.gz"
      sha256 "14cdcf1b3951069f0675fe97a242e59387151a1061ab36eb5e0de9efba02dedf"
    else
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-macos-x86_64.tar.gz"
      sha256 "3a21c9f532050e8926eff12b6b642ad9ec73b04a1ad70bbd09d609f37110efee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-linux-aarch64.tar.gz"
      sha256 "55ee1fb62437ddcbb7575344aafa220ca2c9cfc3be1722bdfb8e5e2facc901bf"
    else
      url "https://github.com/SMC17/zinging/releases/download/v3.12.0/zig-substrate-v3.12.0-linux-x86_64.tar.gz"
      sha256 "9ff193289d54b6c73f741ae3eaff32fe476d341ae73dfa2f0833ad384c658a11"
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
  end
end
