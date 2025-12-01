# Set directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit"

# Download Zinit, if it's not there yet with the plugins
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME/zinit.git"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZINIT_HOME/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZINIT_HOME/plugins/zsh-syntax-highlighting"
fi

# Source/Load zinit and plugins
source "${ZINIT_HOME}/zinit.git/zinit.zsh"
source "${ZINIT_HOME}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${ZINIT_HOME}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
export PATH="$HOME/.local/bin:$PATH"

##################################################
##########------ Not blury apps -------###########
##################################################

alias code='ELECTRON_OZONE_PLATFORM_HINT=wayland code --enable-features=WaylandWindowDecorations'
alias steam="STEAM_FORCE_DESKTOPUI_SCALING=1 QT_QPA_PLATFORM=xcb steam"

##################################################
##########------ Terminal configs -------#########
##################################################

# Starship
eval "$(starship init zsh)"
