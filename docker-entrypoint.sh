#!/bin/sh

TMP=$(mktemp)

/go/bin/ansize /dev/stdin ${TMP} "${@}"
