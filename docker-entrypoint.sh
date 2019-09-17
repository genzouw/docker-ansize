#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o noclobber

TMP=$(mktemp)

/usr/lib/x86_64-linux-gnu/go/bin/ansize /dev/stdin ${TMP} "${@}"
