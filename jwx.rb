class Jwx < Formula
  desc "A beautiful CLI for working with JSON Web Tokens"
  homepage "https://github.com/manimovassagh/jwx"
  url "https://github.com/manimovassagh/jwx/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "9179e2f63bc9734afccc6b4984923af8a22b0039341bda045f84000361333393"
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
