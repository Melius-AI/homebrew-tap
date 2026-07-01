#!/usr/bin/env bash
# Update Formula/mel.rb to the latest @melius-ai/cli on npm.
# Usage (from the tap root):
#   scripts/bump.sh          # edit the formula locally (you commit)
#   scripts/bump.sh --push   # edit, commit, and push (used by CI)
set -euo pipefail

latest=$(curl -fsSL https://registry.npmjs.org/@melius-ai/cli/latest \
  | python3 -c "import sys,json;print(json.load(sys.stdin)['version'])")
current=$(grep -oE 'cli-[0-9]+\.[0-9]+\.[0-9]+\.tgz' Formula/mel.rb | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')

if [ "$latest" = "$current" ]; then
  echo "Formula already at $current — nothing to do."
  exit 0
fi

url="https://registry.npmjs.org/@melius-ai/cli/-/cli-${latest}.tgz"
sha=$(curl -fsSL "$url" | shasum -a 256 | awk '{print $1}')
[ "${#sha}" -eq 64 ] || { echo "bad sha256 for $url" >&2; exit 1; }

perl -i -pe "s#cli-\d+\.\d+\.\d+\.tgz#cli-${latest}.tgz#" Formula/mel.rb
perl -i -pe "s#sha256 \"[a-f0-9]{64}\"#sha256 \"${sha}\"#" Formula/mel.rb
echo "Bumped ${current} → ${latest} (${sha})"

if [ "${1:-}" = "--push" ]; then
  git commit -am "mel ${latest}"
  git push
fi
