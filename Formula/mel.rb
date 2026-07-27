class Mel < Formula
  desc "Create Melius canvases and run AI image/video generations from your terminal"
  homepage "https://docs.melius.com"
  url "https://registry.npmjs.org/@melius-ai/cli/-/cli-0.10.1.tgz"
  sha256 "687f4786a74d6802789afac6f734287c9e5ab80823aebc3cf4d31cffa431d911"
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
