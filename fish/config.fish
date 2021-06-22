#!/usr/bin/fish

if test -x (which nvim)
    set -gx EDITOR nvim
    set -gx VISUAL nvim
end
