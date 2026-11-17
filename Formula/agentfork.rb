class Agentfork < Formula
  desc "Sub-millisecond APFS CoW agent sandbox, HTTP taint firewall, and proof-carrying merge gate"
  homepage "https://github.com/SMC17/agentfork"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/agentfork/releases/download/v0.1.0/agentfork-v0.1.0-macos-aarch64.tar.gz"
      sha256 "76084f833585de912c69244ffdef9b99a7e966eef7efd5ac29b666252b2a37f1"
    else
      url "https://github.com/SMC17/agentfork/releases/download/v0.1.0/agentfork-v0.1.0-macos-x86_64.tar.gz"
      sha256 "3f7c14900bacc7e004abc70dfed24fb59f64d806a16d060cbd68419cb3cb66a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/agentfork/releases/download/v0.1.0/agentfork-v0.1.0-linux-aarch64.tar.gz"
      sha256 "43e783cd150fc9e5752b720c6c234c47f091387f59fedd7f5369d8c8e3b2f242"
    else
      url "https://github.com/SMC17/agentfork/releases/download/v0.1.0/agentfork-v0.1.0-linux-x86_64.tar.gz"
      sha256 "af9b032cf1edd735cf2132a8bab7c40306ec075c48e6e1bffa8aa96928c9a415"
    end
  end

  def install
    bin.install "agentfork"
  end

  test do
    assert_match "{", shell_output("#{bin}/agentfork bench")
  end
end
