define-command -params 0 -override -docstring "
Reschedule the selected date
" reschedule %{
    try %{
        validate_selection

        prompt "Relative date? " %{
            evaluate-commands -no-hooks -itersel -draft %{ today_replace_date %val{text} }
        }
    }
}

define-command -params 0 -override -docstring "
Schedule a new absolute date and time
" schedule %{
    try %{
        validate_selection

        prompt "Date? " %{
            evaluate-commands -itersel -draft -save-regs '"' %sh{
                date=$(date --date="$kak_text" +"%Y-%m-%d %H:%M")

                if [ $? -ne 0 ]; then
                    echo fail
                else
                    printf "set-register dquote '$date'\n"
                    printf "execute-keys R"
                fi
            }
        }
    } catch %{
        fail Invalid selection
    }
}

define-command -hidden -params 0 -override validate_selection %{
    evaluate-commands -itersel -draft %{
        evaluate-commands %sh{
            date --date="${kak_selection}" >/dev/null || echo fail
        }
    }
}

define-command -hidden -params 1 -override -docstring "
Replace the date given a relative or definite date
" today_replace_date %{
    try %{
        evaluate-commands -draft -no-hooks -save-regs '"'  %sh{
            when=$1
            set -- $kak_selection
            d=
            t=
            if [ $# -eq 1 ]; then
                d=$(date --date="$1" +"%Y-%m-%d %H:%M")
            elif [ $# -eq 2 ]; then
                d=$(date --date="$1" +"%Y-%m-%d")
                t=$(date --date="${2-0}" +"%H:%M")
            else
                echo fail
            fi

            date=$(date --date="$d $when $t" +"%Y-%m-%d %H:%M")

            if [ $? -ne 0 ]; then
                echo fail
            else
                printf "set-register dquote '$date'\n"
                printf "execute-keys R"
            fi
        }
    } catch %{
        fail Could not get the next date given the selection and/or input
    }
}

define-command -hidden -params 0 -override -docstring "
Tries if a selection is a valid date, then tries to run replace date
" today_selection_is_valid_date %{
    try %{
        evaluate-commands -itersel -draft %{
            evaluate-commands %sh{
                date --date="${kak_selection}" >/dev/null || echo fail
            }
        }
        prompt "Relative date? " %{
            evaluate-commands -no-hooks -itersel -draft %{ today_replace_date %val{text} }
        }
    } catch %{
        fail No valid selection
    }
}
