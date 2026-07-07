class Mel < Formula
  desc "Create Melius canvases and run AI image/video generations from your terminal"
  homepage "https://docs.melius.com"
  url "https://registry.npmjs.org/@melius-ai/cli/-/cli-0.3.0.tgz"
  sha256 "2419ae3e1862d511e37bea8e3c222ad770372585d75e388da37984ad36ec49c2"
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
