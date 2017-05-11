#!/bin/bash

SUBPROCESS_EXIT_CODE=42

function sleep_and_exit {
  local sleep_seconds=$1; shift
  local exit_code=$1; shift

  echo "sleep_and_exit $sleep_seconds with exit_code $exit_code"
  [ "$sleep_seconds" -gt 0 ] && sleep "$sleep_seconds"
  exit "$exit_code"
}

function call_sleep_and_exit {
  local sleep_seconds=$1; shift
  local exit_code=$1; shift

    # create a subshell for process
    ( sleep_and_exit "$sleep_seconds" "$exit_code" ) &

    # retrieve pid for subshell
    pid=$!

    # use wait to retrieve the exit code in the next step
    wait $pid

    # check whether the exitcode is the one of the subshell
    [ "$?" -eq "$exit_code" ] && echo "SUCCESS: exit_code was $exit_code" || echo "FAILED: exit code $exit_code != $?"
}

call_sleep_and_exit 0 37

call_sleep_and_exit 1 42
