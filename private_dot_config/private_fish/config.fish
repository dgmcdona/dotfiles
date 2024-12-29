if status is-interactive
    fish_add_path /opt/homebrew/bin
    # Commands to run in interactive sessions can go here
    alias vim=nvim
    alias lg=lazygit
    alias l='eza -l'
    alias la='eza -la'
    alias ls='eza'
    alias s2='ssh SERVER-2'
    alias cmew='chezmoi edit --watch $(chezmoi list -p absolute| fzf)'
    alias fixup='git status --porcelain | grep "^UU" | awk \'{print $2}\' | xargs nvim'
    alias zk='zellij list-sessions --no-formatting | fzf -m | cut -d " " -f 1 | xargs -L 1 zellij kill-session'
    alias pass="rbw unlock && rbw get (rbw list | fzf) | tr -d '\n' | pbcopy"
    fish_vi_key_bindings
    zoxide init fish | source
    fzf_configure_bindings --directory=\cf
    if ! set -q COLORTHEME;
        set -x COLORTHEME "light"
    end
    set -g MANPAGER "sh -c 'sed -e s/.\\\\x08//g | bat -l man -p --theme gruvbox-$COLORTHEME'"

    # Git
    alias gst='git status'
    alias gb='git branch'

    function light_mode;
        set -x COLORTHEME "light"
        gsed -i -E 's/theme = "[^"]+"/theme = "light"/' "$HOME/.wezterm.lua"
        set -g MANPAGER "sh -c 'sed -e s/.\\\\x08//g | bat -l man -p --theme gruvbox-light'"
        kitty +kitten themes 'Catppuccin-Latte'
    end

    function dark_mode;
        set -x -U COLORTHEME "dark"
        set -g MANPAGER "sh -c 'sed -e s/.\\\\x08//g | bat -l man -p --theme gruvbox-dark'"
        gsed -i -E 's/theme = "[^"]+"/theme = "dark"/' "$HOME/.wezterm.lua"
        kitty +kitten themes 'Gruvbox Material Dark Soft'
    end

    function gso;
        set BRANCH (git branch | awk '{print $NF}' | fzf) || return
        set EXTENSION (read -P "Input file extension: ") || return
        set FILE (fd ".*\.$EXTENSION" | fzf) || return
        git show $BRANCH:$FILE | bat -l $EXTENSION --theme "gruvbox-$COLORTHEME"
    end

    pyenv init - | source

end
