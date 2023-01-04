# simpleline.nvim

Simple and lightweight status line for NeoVim.

## Introductions

This statusline is created with minimalistic approach and configurations. Its colors
are parsed from current color theme.

## Installation

```lua
-- Packer
use({
    "hn276/simpleline.nvim",
    requires = { { "tpope/vim-fugitive" } } -- for git branch
})

-- Somewhere in your rtp
require('simpleline').setup()
```
