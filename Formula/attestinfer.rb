class Attestinfer < Formula
  desc "Verifiable inference attestations and selective-disclosure Blake3 Merkle proofs"
  homepage "https://github.com/SMC17/attestinfer"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/attestinfer/releases/download/v0.1.0/attestinfer-v0.1.0-macos-aarch64.tar.gz"
      sha256 "d8297a2de0805342d47761c308a40a749837c7512f77c4c99c9168a904ab7191"
    else
      url "https://github.com/SMC17/attestinfer/releases/download/v0.1.0/attestinfer-v0.1.0-macos-x86_64.tar.gz"
      sha256 "cbcb527f718c9c1d60830ae7c274e0e1bf04cc733d33d175ff0cf5e8c1c0143d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SMC17/attestinfer/releases/download/v0.1.0/attestinfer-v0.1.0-linux-aarch64.tar.gz"
      sha256 "955056fac996e6af8b0f54f6d8e0b75af2ca53f6844bff98c35d5aaa2dd93937"
    else
      url "https://github.com/SMC17/attestinfer/releases/download/v0.1.0/attestinfer-v0.1.0-linux-x86_64.tar.gz"
      sha256 "a8ae0b63947ba3469306b35373148fc3f2b8b0d413e6b356fc7ad90eeb4d0e92"
    end
  end

  def install
    bin.install "attestinfer"
  end

  test do
    assert_match "{", shell_output("#{bin}/attestinfer bench")
  end
end
