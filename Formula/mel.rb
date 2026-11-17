class Mel < Formula
  desc "Create Melius canvases and run AI image/video generations from your terminal"
  homepage "https://docs.melius.com"
  url "https://registry.npmjs.org/@melius-ai/cli/-/cli-0.49.0.tgz"
  sha256 "b02bb13af9938bae571104d38591674c17d233be4c95d4cce7933b7778f3b1fc"
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
