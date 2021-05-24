#!/usr/bin/fish

if test -d "$HOME/.local/bin"
    set -gx PATH $PATH $HOME/.local/bin
end

if test -d "$HOME/.ghcup/bin"
    set -gx PATH $PATH $HOME/.ghcup/bin
end

if test -d "$HOME/.cabal/bin"
    set -gx PATH $PATH $HOME/.cabal/bin
end

if test -x (which nvim)
    set -gx EDITOR nvim
    set -gx VISUAL nvim
end

