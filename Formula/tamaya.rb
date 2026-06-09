class Tamaya < Formula
  desc "Self-hosted deployment for single Linux executables over SSH"
  homepage "https://github.com/bhbs/tamaya"
  version "0.0.3"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bhbs/tamaya/releases/download/v0.0.3/tamaya-aarch64-apple-darwin.tar.xz"
    sha256 "6f9e6b264b1a2d650ec5d4ac0909a8170e4852556cc058bc58c77aad8d3f20bf"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/bhbs/tamaya/releases/download/v0.0.3/tamaya-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "98a1d7a864e03e22c7a3b29e681678b056f1c1828335eebcc44c21c61cd084da"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bhbs/tamaya/releases/download/v0.0.3/tamaya-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "72ba0d10cf3282dc7079be3544f650bb88f8ec98e1e837c28625f078ce123dfa"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "tamaya" if OS.mac? && Hardware::CPU.arm?
    bin.install "tamaya" if OS.linux? && Hardware::CPU.arm?
    bin.install "tamaya" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
