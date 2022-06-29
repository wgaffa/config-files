# Defined in /tmp/fish.92H5uF/rupdoc.fish @ line 2
function rupdoc
  set -l rpath (rustup doc --path $argv)
  set -l wpath (wslpath -w $rpath)
  set -l escaped (echo $wpath | string escape)

  wslview $wpath
end
