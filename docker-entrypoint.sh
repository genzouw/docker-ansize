#!/bin/sh

/go/bin/ansize /dev/stdin /dev/null "$@" | sed 's/m1/m0/g'
