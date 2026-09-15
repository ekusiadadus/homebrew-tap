# Homebrew tap

Install TTYbird, a Rust TUI for finding coding agents and returning to their terminals:

```sh
brew install ekusiadadus/tap/ttybird
ttybird --local
```

Prebuilt binaries support Apple Silicon macOS 14+ and x86_64 Linux with glibc 2.39+.
Install `tmux` separately for tmux navigation and previews. Ghostty navigation requires Ghostty 1.3+ on macOS.

[TTYbird source, walkthrough and documentation](https://github.com/ekusiadadus/ttybird)

## Updating

TTYbird's release workflow publishes `ttybird.rb` from the checksums of its tested release archives.
Copy that release asset to `Formula/ttybird.rb`, review the version and checksums, and commit it here.
The workflow tests installation and execution on macOS and Linux.
