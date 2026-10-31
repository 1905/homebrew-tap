# typed: false
# frozen_string_literal: true

# Built by hand from the tagged source (see README "CLI releases").
class Lobo < Formula
  desc "Rent an RTX 5090 on RunPod or Vast.ai and serve Qwen3.8-27B behind an OpenAI-compatible API"
  homepage "https://github.com/1905/lobocode"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/1905/lobocode/releases/download/v0.2.0/lobo_darwin_amd64.tar.gz"
      sha256 "e86fd1bdc095837202569a5ed298473e6c99456571d0a8cfb33c4ad68f8e5e9c"

      define_method(:install) do
        bin.install "lobo"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/1905/lobocode/releases/download/v0.2.0/lobo_darwin_arm64.tar.gz"
      sha256 "4c924c957e74a9f9ce2e7f220408479bcf46c6babd1f02a4479a917f6dd54426"

      define_method(:install) do
        bin.install "lobo"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/1905/lobocode/releases/download/v0.2.0/lobo_linux_amd64.tar.gz"
      sha256 "d5dc0a5d9f3778c4fa7346e3ec1e29c90eca89795399ea47d9a5d173cc8ec794"

      define_method(:install) do
        bin.install "lobo"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/1905/lobocode/releases/download/v0.2.0/lobo_linux_arm64.tar.gz"
      sha256 "927bce1503c40162954ae2835d843ab78574196bb6b9f6132db5e5b3a68fd3e2"

      define_method(:install) do
        bin.install "lobo"
      end
    end
  end

  test do
    system "#{bin}/lobo", "version"
  end
end
