class Mel < Formula
  desc "Create Melius canvases and run AI image/video generations from your terminal"
  homepage "https://docs.melius.com"
  url "https://registry.npmjs.org/@melius-ai/cli/-/cli-0.16.0.tgz"
  sha256 "a095f7f9c0e378e0e4f1c1ea83a62c6accd52f705748f3649d8589fc7680cb37"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mel --version")
  end
end
