#!/bin/bash

[ -n "$1" ] && path="$1"; shift

cwd=$(pwd)
[ -n "$path" ] && [ -d "$cwd/$path" ] && cd "$cwd/$path"
commit_id=$(git rev-parse HEAD)
echo -n "$commit_id"
