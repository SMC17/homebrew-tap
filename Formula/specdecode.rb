class Specdecode < Formula
  desc "Mid-decode semantic pruner, 128k-vocab logit-mask C ABI, KV-cache paging, and cascade router"
  homepage "https://github.com/SMC17/specdecode"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/specdecode/releases/download/v0.1.0/specdecode-v0.1.0-macos-aarch64.tar.gz"
      sha256 "91bf5d93d6688f0a57fca457709dce3f156f51978b8248d4ca33c3c2cd07b09c"
    else
      url "https://github.com/SMC17/specdecode/releases/download/v0.1.0/specdecode-v0.1.0-macos-x86_64.tar.gz"
      sha256 "ca10a60469560473230d42b91190345245eea9fd0d80713157690c906010a48b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/specdecode/releases/download/v0.1.0/specdecode-v0.1.0-linux-aarch64.tar.gz"
      sha256 "6e26cea9d7f1ed8279720c008adad2dec3202fdf741bbf402133fc73a858aee5"
    else
      url "https://github.com/SMC17/specdecode/releases/download/v0.1.0/specdecode-v0.1.0-linux-x86_64.tar.gz"
      sha256 "5c64cde98695237c47829c7812988509cfa45ce137f484278bf7e9f14611998f"
    end
  end

  def install
    bin.install "specdecode"
  end

  test do
    assert_match "{", shell_output("#{bin}/specdecode bench")
  end
end
