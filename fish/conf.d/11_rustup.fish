if ! status is-login
    exit
end

if test -d $HOME/.cargo/bin
    set -gx PATH $PATH $HOME/.cargo/bin
end
