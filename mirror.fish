#!/usr/bin/fish

function print_help
    echo "mirror [-p/--print] SOURCE TARGET"
end

argparse --name=mirror -N 2 -X 2 'p/print'  -- $argv

if test (count $argv) -ne 2
    print_help
    exit 1
end

set source $argv[1]
set target $argv[2]

set source_files (find "$source" -type f -printf '%P\n')
set outdated

for file in $source_files
    if test -f $target/$file; and cmp $source/$file $target/$file
    else
        set -a outdated $file
    end
end

if test -n "$outdated"
    pushd $source
    if set -q _flag_print
        echo $outdated "files will be copied into $target"
    else
        cp -v --parent -t $target $outdated
    end
    popd
end
