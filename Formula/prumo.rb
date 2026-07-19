class Prumo < Formula
  desc "App de tarefas todo.txt em pt-BR para te manter no prumo (TUI + CLI)"
  homepage "https://github.com/wolffness/prumo"
  # Pin by git tag + commit: GitHub's on-demand archive tarballs changed hash
  # after the release tag was recreated by CI, so a sha256 pin is unreliable here.
  url "https://github.com/wolffness/prumo.git",
      tag:      "v2026.7.1-prumo4",
      revision: "624e74f281a1682c85c4084bff02fbd443ecd70e"
  version "2026.7.1-prumo4"
  license "MIT"

  depends_on "rust" => :build

  def install
    # The crate also builds the upstream tuxedo binary; ship only prumo so
    # the keg never collides with a standalone tuxedo install.
    system "cargo", "install", "--bin", "prumo", *std_cargo_args
  end

  test do
    system bin/"prumo", "--version"
  end
end
