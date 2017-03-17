# Brew PHP Switch

Brew PHP switch is shell script for switching [Homebrew PHP](https://github.com/Homebrew/homebrew-php) versions.

## Table of Contents

* [Requirements](#requirements)
* [Installation](#installation)
* [Switching PHP Version](#switching-php-version)

## Requirements

Before installing Brew PHP Switch, make sure you have installed all of the followings packages:

1. [Git](https://git-scm.com/book/en/v1/Getting-Started-Installing-Git#Installing-on-Mac) — Distributed version control system
2. [Oh My Zsh](http://ohmyz.sh) — Framework for managing Zsh terminal configurations
3. [Homebrew](https://brew.sh) — The package manager for MacOS
5. [Homebrew PHP](https://github.com/Homebrew/homebrew-php) — Install PHP with Homebrew

## Installation

To install Brew PHP Switch, simply open up your terminal application and paste the following command:

```bash
sh -c "$(curl -fsSL https://raw.github.com/risan/brew-php-switch/master/install.sh)"
```

Once it's completed, your Brew PHP Switch installation will be found on `~/.brew-php-switch` directory. Next, you may want to reload your `.zshrc` file to get the latest PATH variable:

```bash
source ~/.zshrc
```

## Switching PHP Version

Once Brew PHP Switch is installed, you can easily switch between PHP versions:

```bash
# Switch to PHP 7.1
phpswitch 71

# or switch to PHP 5.6
phpswitch 56
```
