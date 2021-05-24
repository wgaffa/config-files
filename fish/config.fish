#!/usr/bin/env fish

if test -d $HOME/.local/bin
    set -gx PATH $HOME/.local/bin
end

if test -d $HOME/.ghcup/bin
    set -gx PATH $HOME/.ghcup/bin
end

if test -d $HOME/.cabal/bin
    set -gx PATH $HOME/.cabal/bin
end

