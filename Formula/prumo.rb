class Prumo < Formula
  desc "App de tarefas todo.txt para te manter no prumo — TUI + CLI, pt-BR, feito para cérebros TDAH/TEA"
  homepage "https://github.com/wolffness/prumo"
  # Pin by git tag + commit: GitHub's on-demand archive tarballs changed hash
  # after the release tag was recreated by CI, so a sha256 pin is unreliable here.
  url "https://github.com/wolffness/prumo.git",
      tag:      "v2026.7.1-prumo1",
      revision: "b9d5e0efc2453dbf0b951c855ebde9f5128798a8"
  version "2026.7.1-prumo1"
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
