#!/usr/bin/env fish

function fish_prompt
    eval $GOPATH/bin/powerline-go -error $status -newline -shell bare
end

set -gx PATH $PATH $HOME/.local/bin $HOME/.ghcup/bin $HOME/.cabal/bin
set -gx EDITOR nvim
set -gx VISUAL nvim
