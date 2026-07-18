class Prumo < Formula
  desc "App de tarefas todo.txt para te manter no prumo — TUI + CLI, pt-BR, feito para cérebros TDAH/TEA"
  homepage "https://github.com/wolffness/prumo"
  url "https://github.com/wolffness/prumo/archive/refs/tags/v2026.7.1-prumo1.tar.gz"
  sha256 "4a8e2fa6f4a773021bf2cf8b917f92ca0a532d1493156c0384b5788823516e01"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--locked"
    # The crate keeps the upstream name (tuxedo); the installed command is prumo.
    bin.install "target/release/tuxedo" => "prumo"
  end

  test do
    system bin/"prumo", "--version"
  end
end
