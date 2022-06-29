#!/usr/bin/fish

if test -x (which kak)
    set -gx EDITOR kak
    set -gx VISUAL kak
end
