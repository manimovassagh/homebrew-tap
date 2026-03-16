class Jwx < Formula
  desc "A beautiful CLI for working with JSON Web Tokens"
  homepage "https://github.com/manimovassagh/jwx"
  url "https://github.com/manimovassagh/jwx/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "7a4e74e20ed14a41fc31d8951a88d1951b64b50e2dbe19c15942362181cf7627"
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
