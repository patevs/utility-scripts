#!/bin/bash

# --------------------- #
# scripts/bash/covid.sh #
# --------------------- #

# Bash script for tracking the COVID19 pandemic.

# ! Requires curl to be installed.

###################
# COLOR CONSTANTS #
###################


RED='\033[0;31m'
GREEN='\033[0;32m'
# BROWN='\033[0;33m'
# BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'

LIGHT_GREEN='\033[1;32m'
LIGHT_BLUE='\033[1;34m'
# LIGHT_PURPLE='\033[1;35m'
# LIGHT_CYAN='\033[1;36m'
NC='\033[0m' # No Color

BACKGROUND_GREEN='\033[42m'
BACKGROUND_BLUE='\033[44m'
BACKGROUND_PURPLE='\033[45m'
# BOLD='\033[1m'

####################
# HELPER FUNCTIONS #
####################

# Helper function used for checking a given command exist
# https://stackoverflow.com/questions/5431909/returning-a-boolean-from-a-bash-function/5431932
command_exists () {
    # Check command exists
    if ! [ -x "$(command -v $1)" ]; then
        # exit 1
        false
        return
    else
      true
      return
    fi
}

#######################
# VERIFY REQUIREMENTS #
#######################

printf "\n ${CYAN}Checking System Requirements...${NC}\n"

# Verify curl is installed and can be found
if command_exists "curl"; then
  printf "\n ${BACKGROUND_PURPLE} Curl installation: ${NC}\n\n"
  which curl
  curl --version
else
  printf "\n ${RED}Error:${NC} Curl is not installed. Exiting...\n\n" # >&2
  exit 1
fi

################
# START SCRIPT #
################

# clear
printf "\n ${BACKGROUND_GREEN} COVID19 Pandemic Tracker ${NC} \n\n"

curl -L covid19.trackercli.com/history/nz

# EOF #

