class Mel < Formula
  desc "Create Melius canvases and run AI image/video generations from your terminal"
  homepage "https://docs.melius.com/cli/overview"
  url "https://registry.npmjs.org/@melius-ai/cli/-/cli-0.1.1.tgz"
  sha256 "592f9a0c6b18c65e115db85bd36a27ca533022029792b7fd6633e2040301cae4"
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
