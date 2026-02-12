# dmenu-utils-fish

Personal utilities for rofi written using
[fish shell](https://github.com/fish-shell/fish-shell). Those are the only two
dependencies. Not intended for public use but it would be trivial to update if
anyone happens upon this and finds it interesting.

Originally written for dmenu, I just substituted each dmenu call with the
appropriate rofi call. Easy enough to switch back.

## Install


```
cp -R src/* ~/.local/
stow -vnt ~/.local src  # for development
```

### Regenerate data files

```
git submodule update --init
fish bin/generate_*_list.fish
```

[bin/generate\_emoji\_list.fish](bin/generate_emoji_list.fish) requires
[jq](https://github.com/stedolan/jq).


## Acknowledgements

I ~~stole from~~ referenced these cool alternatives:

* [porras/dmenu-emoji](https://github.com/porras/dmenu-emoji)

* [sumnerevans/menu-calc](https://github.com/sumnerevans/menu-calc)