#!/bin/bash

cwd=$(pwd)
[ -n "$path" ] && cd "$cwd/$path"
git rev-parse HEAD
