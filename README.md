# melikechan's dotfiles

My dotfiles I use for my laptop.

> [!NOTE]
> It is **not only for laptops / single monitor setups**. I just _haven't tried_ for **multiple monitors** lol.

## How to use?

Before starting, you need to install [dotter](https://github.com/SuperCuber/dotter).

1. Clone this repository
2. `cd dotfiles`
3. Create a `local.toml` file from the [example local.toml file](.dotter/local.toml.example) and replace the variable values inside.
4. `dotter deploy -v` :)

> [!NOTE]
> For ReGreet and greetd configs, move the [greetd](greetd) folder to `/etc/`.

## Dotfile List

There are dotfiles for the listed apps below:

### Desktop

#### hyprland Ecosystem

> [!NOTE]
> I got some of the configuration from [ML4W dotfiles](https://github.com/mylinuxforwork/dotfiles).

- [hypridle](hypr/hypridle.conf)
- [hyprland](hypr/hyprland.lua)
- [hyprlock](hypr/hyprlock.conf)
- [hyprpaper](hypr/hyprpaper.conf)
- [hyprsunset](hypr/hyprsunset.conf)

#### GTK Configs

- [GTK 3.0](gtk/3.0/settings.ini)
- [GTK 4.0](gtk/4.0/settings.ini)

#### Qt Configs

- [qt6ct](qt6ct/qt6ct.conf)

#### Others

- [swaync](swaync)
- [walker](walker)
- [waybar](waybar)

### Greeter

- [greetd + ReGreet](greetd)

### Shell

- [kitty](kitty/kitty.conf)
- [zsh](.zshrc)

### Python

- [miniconda](.condarc)
- [ruff](ruff/ruff.toml)

## Closing Notes

Interested in my setup more? Check [this repository](https://github.com/melikechan/my-setup)! ✨
