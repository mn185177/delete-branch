#!/usr/bin/env bash

source "$PROJECT_HOME/src/ensure.sh"
source "$PROJECT_HOME/src/github.sh"
source "$PROJECT_HOME/src/github_actions.sh"
source "$PROJECT_HOME/src/misc.sh"

main() {
  ensure::env_variable_exist "GITHUB_REPOSITORY"
  ensure::env_variable_exist "GITHUB_EVENT_PATH"
  ensure::env_variable_exist "GITHUB_REF"
  ensure::total_args 1 "$@"

  export GITHUB_TOKEN="$1"

  local -r branch_name="$GITHUB_REF"
  
  modified_branch=${branch_name:11}

  log::message "$modified_branch"
  log::message "$branch_name"

  if [[ $modified_branch == @(qa|main|master|rel-*|fssre-*) ]] || str::contains "$branch_name" "refs/tags"; then
    log::message "Protected branch or Tag will not be deleted"
  else
    github::delete_ref "$branch_name"

    log::message "Branch removed!!"
  fi

  exit $?
}
