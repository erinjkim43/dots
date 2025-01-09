# Dots

## Introduction

This repository contains various configuration files and scripts for setting up a development environment. It includes configurations for tools such as Neovim, Alacritty, and Tmux, as well as Lua scripts for configuring Neovim plugins and settings.

## Installation

To set up the configurations in this repository, follow these steps:

1. Clone the repository to your local machine:
   ```sh
   git clone https://github.com/erinjkim43/dots.git
   ```

2. Use `yadm` to manage the dotfiles. Install `yadm` from [yadm.io](https://yadm.io/):
   ```sh
   yadm clone https://github.com/erinjkim43/dots.git
   ```

## Usage

Once the configurations are set up, you can start using the tools with the provided settings. Here are some examples:

- **Neovim**: Open Neovim and the configurations will be automatically loaded. You can customize the settings by editing the Lua scripts in the `~/.config/nvim/lua/erinjkim` directory.
- **Alacritty**: Launch Alacritty and it will use the configuration file located at `~/.config/alacritty/alacritty.yml`.
- **Tmux**: Start a new Tmux session and it will use the configuration file located at `~/.tmux.conf`.

## Configuration

You can customize the configurations to suit your preferences. Here are some tips:

- **Neovim**: Edit the Lua scripts in the `~/.config/nvim/lua/erinjkim` directory to modify the settings and add new plugins.
- **Alacritty**: Edit the `~/.config/alacritty/alacritty.yml` file to change the terminal settings, such as colors, fonts, and keybindings.
- **Tmux**: Edit the `~/.tmux.conf` file to customize the Tmux settings, such as keybindings, status bar, and plugins.

## Contributing

If you would like to contribute to this repository, please follow these guidelines:

1. Fork the repository and create a new branch for your changes.
2. Make your changes and test them thoroughly.
3. Submit a pull request with a clear description of your changes and why they are necessary.
4. Ensure that your code follows the existing style and conventions used in the repository.
5. Be responsive to feedback and make any necessary revisions to your pull request.

Thank you for your contributions!
