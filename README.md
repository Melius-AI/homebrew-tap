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

`Formula/mel.rb` pins a version (url + sha256), so it must be bumped when a new
`@melius-ai/cli` is published to npm.

- **Automatic (once configured):** `.github/workflows/bump.yml` runs hourly and
  bumps the formula. It needs a GitHub App token to push (the Melius-AI
  enterprise disables the default `GITHUB_TOKEN` write and deploy keys) — set
  `RELEASE_PLEASE_APP_ID` + `RELEASE_PLEASE_APP_PRIVATE_KEY` (the same org app
  used for release-please, installed on this repo).
- **Manual (works today):** from the tap root, run `scripts/bump.sh` and commit.
