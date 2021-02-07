class Gothanks < Formula
  desc "Automatically star your go.mod Github dependencies"
  homepage "https://github.com/psampaz/gothanks"
  url "https://github.com/psampaz/gothanks/archive/v0.3.0.tar.gz"
  version "0.1.0"
  sha256 "ce5440334b3eac2e058724faa4c6e4478ca1d81ea087e55ccca33f1996752aad"
  license "MIT"

  # Bump comment

  bottle do
    root_url "https://github.com/jdbruijn/homebrew-test/releases/download/gothanks-0.3.0"
    sha256 cellar: :any_skip_relocation, catalina:     "ece3d82a126f820e609275f254fd39f956200f51e2c8c79c0e6af2c3c3204172"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3d4ad3512c37678e0d7a3f86f7f3d1c08f932f2c7073ddd5a6a058d30c6f41ab"
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
