# Melius Homebrew tap

Homebrew formulae for [Melius](https://melius.com) tools.

## `mel` — the Melius CLI

```bash
brew install melius-ai/tap/mel
```

or

```bash
brew tap melius-ai/tap
brew install mel
```

`mel` is also on npm (`npm install -g @melius-ai/cli`). Docs: https://docs.melius.com/cli/overview

## Keeping the formula current

`Formula/mel.rb` pins a version (url + sha256), so it must be re-pinned when a
new `@melius-ai/cli` is published to npm.

`master` is branch-protected — no direct pushes, so every bump lands as a PR
that the workflow auto-merges.

- **Automatic (once configured):** `.github/workflows/bump.yml` re-pins the
  formula to the latest npm version and merges it. It fires right after a new
  version publishes (a `repository_dispatch` from the monorepo release workflow)
  and hourly as a fallback. It needs `RELEASE_PLEASE_TOKEN` — a fine-grained PAT
  with **Contents + Pull requests: read/write** on this repo (the same secret
  the monorepo uses) — because the Melius-AI enterprise disables the default
  `GITHUB_TOKEN` write and deploy keys. Until it's set the job is a clean no-op.
- **Manual (works today):** from the tap root, run `scripts/bump.sh` to edit the
  formula, then commit on a branch and open a PR.
