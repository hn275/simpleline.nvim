# simpleline.nvim

Simple and lightweight status line for NeoVim.

## Introductions

This statusline is created with minimalistic approach and configurations.

I have an idea of not having to specify what theme you need to match with the current
`colorscheme` and somehow things would just... work out. So wrote a statusline that would
do just that, and it is lowkey enough that it's not taking my attention away from the codes!

**NOTE**: This is currently a WIP project, if it breaks, it breaks. I am a full-time uni student with a job,
if you create an issue, I (eventually) will get to it. Feel free to fork it, and make it your own though.

## Installation

Well, it is a lua plugin residing in a github repo

```lua
-- Packer
use("hn275/simpleline.nvim")
```

Don't forget to drop this oneliner somewhere in your `rtp` :D

```lua
require('simpleline').setup() -- passing options - coming soon!
```

## Screenshots

![](./screenshots/normal.png)

![](./screenshots/insert.png)

![](./screenshots/visual.png)

![](./screenshots/replace.png)

![](./screenshots/cmd.png)

## Features

- [x] `git`.
- [x] NeoVim native `lsp` (I have not used `coc` before and therefore have no idea how to integrate it lol).
- [ ] Laptop battery.
