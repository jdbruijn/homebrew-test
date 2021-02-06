class Gothanks < Formula
  desc "Automatically star your go.mod Github dependencies"
  homepage "https://github.com/psampaz/gothanks"
  url "https://github.com/psampaz/gothanks/archive/v0.3.0.tar.gz"
  sha256 "ce5440334b3eac2e058724faa4c6e4478ca1d81ea087e55ccca33f1996752aad"
  license "MIT"

  bottle do
    root_url "https://github.com/jdbruijn/homebrew-test/releases/download/gothanks-0.3.0"
    sha256 cellar: :any_skip_relocation, catalina:     "c1bb5614f7103d4176a9d98bee8fe7d9d70755d42d0d19e8d8c312c63b53365f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "48dc2bc15c5fe703cc2895fda4596707d816a89b10960ee8fdae2d735bcc894a"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    ENV.delete "GITHUB_TOKEN"
    assert_match "no Github token found", shell_output(bin/"gothanks", 255)
  end
end
