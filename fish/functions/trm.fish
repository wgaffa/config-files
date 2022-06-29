function trm --wraps=today\ list\ \|\ fzf-tmux\ -d\ 10\ \|\ awk\ \'\{print\ \}\'\ \|\ xargs\ today\ remove
    set id (today list | fzf-tmux -d 10)
    if test $status -eq 0
        echo $id | awk '{print $1}' | xargs today remove
    end
end
