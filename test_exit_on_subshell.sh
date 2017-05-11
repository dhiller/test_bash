#!/bin/bash

should_fail=$1; shift

(   

  echo "1"

  if [ "$should_fail" == "1" ]; then
    exit 42
  fi

  echo "2"

  if [ "$should_fail" == "2" ]; then
    exit 66
  fi

  echo "3"

) || ( echo "failed" && exit 37 ) 
