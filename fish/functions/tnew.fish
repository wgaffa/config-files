function tnew
    set -l session $argv[1]

    if test (count $argv) -lt 1
        echo "No session name given"
        exit 1
    end

    tmux has-session -t $session 2> /dev/null

    if test $status -ne 0
        TMUX='' tmux new -d -s "$session"
    end

    if test -z $TMUX
        tmux attach -t "$session"
    else
        tmux switch-client -t "$session"
    end
end
