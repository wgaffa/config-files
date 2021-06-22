set -l configDir $HOME/.config/fish

if command -qs my_prompt
    set -l prompt (my_prompt)

    if set -q prompt
        set -l promptFile $configDir/conf.d/prompts/$prompt.fish

        test -f $promptFile; and source $promptFile
    end
end

