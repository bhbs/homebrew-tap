class Tamaya < Formula
  desc "Self-hosted deployment for single Linux executables over SSH"
  homepage "https://github.com/bhbs/tamaya"
  version "0.1.0"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bhbs/tamaya/releases/download/v0.1.0/tamaya-aarch64-apple-darwin.tar.xz"
    sha256 "f0a10bbad376c44802729e110d00dc170ab555a0a7eeb371213c457a1cac3a8f"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/bhbs/tamaya/releases/download/v0.1.0/tamaya-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2c5c5bf2dafa1ccebbbaf173f0dd14b846e2bb3ab8a72799374480f24851c4a6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bhbs/tamaya/releases/download/v0.1.0/tamaya-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ea182fedc14dfb6ef659108bbad8a1d5cf361eb005be8b2612c2052d7b556af9"
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
