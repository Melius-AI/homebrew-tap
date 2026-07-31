class Mel < Formula
  desc "Create Melius canvases and run AI image/video generations from your terminal"
  homepage "https://docs.melius.com"
  url "https://registry.npmjs.org/@melius-ai/cli/-/cli-0.12.0.tgz"
  sha256 "09e0a0d2339f5084abe33f428bd029970e6ed5279563e9dc9035e02cc5659280"
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
