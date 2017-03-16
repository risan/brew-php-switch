#!/bin/bash

# Colors.
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# Command arguments.
REQUESTED_VERSION="$1"

# Make sure that the requested version is set.
if [ -z $REQUESTED_VERSION ]; then
  echo "${RED}The requested version argument is required!\n${NC}"
  exit 1
fi

# Get current PHP version.
CURRENT_VERSION="$(php --version | head -n 1 | cut -d " " -f 2 | cut -c 1,3)"

if [ "$REQUESTED_VERSION" == "$CURRENT_VERSION" ]; then
  echo "${RED}The current PHP version is already $CURRENT_VERSION!${NC}"
  exit 1
fi

CURRENT_PHP="php$CURRENT_VERSION"
REQUESTED_PHP="php$REQUESTED_VERSION"

# Stoping the current PHP service.
echo "${CYAN}Stoping the $CURRENT_PHP service...${NC}\n"
brew services stop "homebrew/php/$CURRENT_PHP"

# Unlinking the current PHP brew formula.
echo "${CYAN}Unlinking the $CURRENT_PHP...${NC}\n"
brew unlink "$CURRENT_PHP"

# Linking the requested PHP brew formula.
echo "${CYAN}Linking the $REQUESTED_VERSION...${NC}\n"
brew link "$REQUESTED_PHP"

# Starting the requested PHP service.
echo "${CYAN}Starting the $REQUESTED_PHP service...${NC}\n"
brew services start "homebrew/php/$REQUESTED_PHP"

# Adding the requested PHP service to launch agent.
echo "${CYAN}Adding $REQUESTED_PHP service to launch agent...${NC}\n"
launchctl load -w "~/Library/LaunchAgents/homebrew.mxcl.$REQUESTED_PHP.plist"
