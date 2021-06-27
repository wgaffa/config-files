if ! status is-login
    exit
end

if test -d $HOME/.local/bin
    set -gx PATH $PATH $HOME/.local/bin
end
