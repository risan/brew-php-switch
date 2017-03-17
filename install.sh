#!/bin/bash

# Colors.
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

BREW_PHP_SWITCH_DIR="$HOME/.brew-php-switch"
ZSHRC_FILE="$HOME/.zshrc"

# Make sure that the Git is installed.
git --version 2>&1 > /dev/null || {
  echo "${RED}Git is not installed on your computer.${NC}"
  exit 1
}

# Make sure that the brew-php-switch is not installed.
if [ -d "$BREW_PHP_SWITCH_DIR" ]; then
  echo "${RED}You already have brew-php-switch installed: $BREW_PHP_SWITCH_DIR${NC}"
  exit 1
fi

# Welcome message.
echo "${CYAN}Installing brew-php-switch...${NC}"

# Clone the brew-php-switch repository.
echo "${CYAN}Cloning brew-php-switch into: $BREW_PHP_SWITCH_DIR${NC}"
git clone --depth=1 https://github.com/risan/brew-php-switch.git $BREW_PHP_SWITCH_DIR

# Add balet to system path permanently within the .zshrc.
echo "${CYAN}Adding brew-php-switch to system path...${NC}"
sed -i '' '/export PATH="$HOME\/.brew-php-switch\/bin:$PATH"/d' $ZSHRC_FILE
echo 'export PATH="$HOME/.brew-php-switch/bin:$PATH"' >> $ZSHRC_FILE

# Goodbye message.
echo "${GREEN}brew-php-switch is successfully installed! \xE2\x9C\x94\n${NC}"
echo "${YELLOW}Don't forget to reload your .zshrc file:\n${NC}"
echo "${YELLOW}\tsource ~/.zshrc\n${NC}"
