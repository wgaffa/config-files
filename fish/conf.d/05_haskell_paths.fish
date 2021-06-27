if ! status is-login
    exit
end

if test -d $HOME/.ghcup/bin
    set -gx PATH $PATH $HOME/.ghcup/bin
end

if test -d $HOME/.cabal/bin
    set -gx PATH $PATH $HOME/.cabal/bin
end
