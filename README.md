# melikechan's dotfiles

My dotfiles I use for my laptop.

> [!NOTE]
> It is not only for laptops. I just haven't tried for multiple monitors lol.

## How to use?

Before starting, you need to install [dotter](https://github.com/SuperCuber/dotter).

1. Clone this repository
2. `cd dotfiles`
3. Assign values to those variables in [`.dotter/local.toml`](.dotter/local.toml):
    - `home_dir`: Your home directory (example: `/home/username`)
    - `wallpaper_path`: Your wallpaper path. (example: `/home/username/wallpapers/wallpaper.png`)
    - `start_env_name`: Your conda start environment. (example: `daily-drive`)
4. `dotter deploy -v` :)

## Dotfile List

There are dotfiles for the listed apps below:

### Desktop

- [hyprland](hypr/hyprland.conf)
- [hyprpaper](hypr/hyprpaper.conf)
- [walker](walker)
- [waybar](waybar)

### Shell

- [kitty](kitty/kitty.conf)
- [zsh](.zshrc)

### Python

- [miniconda](.condarc)

## Forenotes

Interested in my setup more? Check [this repository](https://github.com/melikechan/my-setup)!