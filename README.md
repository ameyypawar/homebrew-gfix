# homebrew-gfix

Homebrew tap for [gfix](https://github.com/ameyypawar/gfix) -- the cross-agent MCP-native merge resolver.

## Install

```sh
brew tap ameyypawar/gfix
brew install gfix
```

That is it.

## What this repo is

Just a Homebrew formula. The formula points at binary releases hosted on
[github.com/ameyypawar/gfix](https://github.com/ameyypawar/gfix). When a new
`gfix` version ships, this repo's `Formula/gfix.rb` is updated with new URLs
and SHA256s.

If `brew install gfix` fails, file an issue on the [gfix repo](https://github.com/ameyypawar/gfix/issues), not here. This repo has no logic to debug -- it is one Ruby file pointing at download URLs.

## Manual install (no Homebrew)

```sh
curl -fsSL https://gitfix.pro/install | sh
```

Or download directly from [github.com/ameyypawar/gfix/releases](https://github.com/ameyypawar/gfix/releases).

## License

Proprietary (alpha). See [LICENSE.txt](LICENSE.txt).
