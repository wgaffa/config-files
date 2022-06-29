function ctest --wraps='cargo test'
    cargo test -- --list 2>/dev/null | grep ": test" | sed 's/: test$//' | fzf-tmux -m --bind "ctrl-a:select-all" | xargs cargo test $argv -- 
end
