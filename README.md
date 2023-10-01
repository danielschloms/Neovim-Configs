# My personal Neovim + NvChad Config

## Install

+ Install Neovim (>= 0.9) and NvChad (requires `ripgrep`)
+ `cd ~/.config/nvim/lua/`
+ `rm -rf custom/`
+ `git clone git@github.com:danielschloms/NvChad-Config.git custom`
+ Install relevant languages for Treesitter (`rust`, `cpp`, ...) with `:TSInstall <language>`, but especially `markdown` to fix some issues
+ `:MasonInstallAll`

## Supported languages

+ C++
+ Rust
+ More could probably work out of the box with just installing the language for Treesitter and relevant Mason plugins

## TODO

+ Ensure installed languages for Treesitter (at least `markdown`)

+ Fix debugging
  + Don't close output automatically, potentially keep UI open in general
  + Don't open UI when starting with DapContinue (i.e. choosing executable) and aborting with ESC
  + Possibly add more DAP adapters, e.g. `lldb-vscode`
