class Tamaya < Formula
  desc "Self-hosted deployment for single Linux executables over SSH"
  homepage "https://github.com/bhbs/tamaya"
  version "0.1.2"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bhbs/tamaya/releases/download/v0.1.2/tamaya-aarch64-apple-darwin.tar.xz"
    sha256 "93076ad59c0e36156e0690f781a88da040f4ee67605950ea3cf4d44f859796ec"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/bhbs/tamaya/releases/download/v0.1.2/tamaya-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e84e07e790bc46dd1e08f6188f4c4b2910cfe7c4bf0879a676e6e15ff040bd2b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bhbs/tamaya/releases/download/v0.1.2/tamaya-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2e9701c262f1d885986e04c96ed9dfe1e8331f770ce75a725b5ba0dde7321696"
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
