#!/bin/sh

sed -E '/^\s*(#|$)/d; /^\w+:/i \
' $@
