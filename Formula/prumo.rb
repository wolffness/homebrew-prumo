class Prumo < Formula
  desc "App de tarefas todo.txt em pt-BR para te manter no prumo (TUI + CLI)"
  homepage "https://github.com/wolffness/prumo"
  # Pin by git tag + commit: GitHub's on-demand archive tarballs changed hash
  # after the release tag was recreated by CI, so a sha256 pin is unreliable here.
  url "https://github.com/wolffness/prumo.git",
      tag:      "v2026.7.1-prumo2",
      revision: "7e348b3b22bbd292975059085cb4473ae1e32cf5"
  version "2026.7.1-prumo2"
  license "MIT"

  depends_on "rust" => :build

  def install
    # The crate builds both the prumo and the upstream tuxedo binary.
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"prumo", "--version"
  end
end
