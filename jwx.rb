class Jwx < Formula
  desc "A beautiful CLI for working with JSON Web Tokens"
  homepage "https://github.com/manimovassagh/jwx"
  url "https://github.com/manimovassagh/jwx/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "a1c9b3d8ef41490f3ebaf58df7551ecf1eaf700045628c89380860fe32c1c860"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=HEAD
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/jwx"
  end

  test do
    system bin/"jwx", "version"
  end
end
