#!/bin/bash
# Just run or copy this script to the 1Panel -> scheduled task to run it regularly
if [ -f "./.env" ]; then
	set -o allexport
	source "./.env"
	set +o allexport
fi
# Directory of the local app (if not installed by default, you need to create it manually)
app_local_dir="/opt/1panel/resource/apps/local"

# Appstore git repository URL (required)
# git_repo_url="https://github.com/xxxily/local-appstore-for-1Panel"
# git_repo_url="https://github.com/okxlin/appstore"
# git_repo_url="https://github.com/qwenode/1panel-appstore"
git_repo_url="${GIT_REPO_URL:-https://github.com/Ragdata/1panel-appstore.git}"

# Access token for the git repository (optional)
# Using an access token is recommended to reduce the risk of leaking account secrets
git_access_token="${GIT_ACCESS_TOKEN:-}"

# Username for accessing the git repository, used for private repositories (optional)
git_username="${GIT_USERNAME:-}"
# Password for accessing the git repository, used for private repositories (optional)
git_password="${GIT_PASSWORD:-}"

# Specify the branch to clone (optional)
git_branch="${GIT_BRANCH:-'master'}"
# Specify the clone depth (optional, default is 1 for shallow clone)
git_depth=${GIT_DEPTH:-1}

# Whether to empty the local app directory before pulling the remote repository (optional)
clean_local_app=false
# Whether to empty the remote app cache data after pulling (optional)
clean_remote_app_cache=false

# Setup an agent to use when pulling the remote repository (optional)
proxyUrl=${PROXY_URL:-}
# Example setup:
# proxyUrl="http://127.0.0.1:7890"
# proxyUrl="socks5://127.0.0.1:7890"
# proxyUrl="socks5://user:password@host:port"

# Clone a remote Appstore project to a local working directory
work_dir=${WORK_DIR:-"/opt/1panel"}

set -e

mkdir -p "$work_dir/logs"
log_file="$work_dir/logs/local_appstore_sync_helper_$(date +"%Y-%m-%d").log"
logs() {
  local message="$1"

  if [ -n "$log_file" ]; then
    if mkdir -p "$(dirname "$log_file")"; then
    #if [ $? -eq 0 ]; then
      echo -e "[$(date +"%Y-%m-%d %H:%M:%S")] $message"
      echo "[$(date +"%Y-%m-%d %H:%M:%S")] $message" >>"$log_file"
      return
    fi
  fi

  echo -e "$message"
}

# Function: url_encode
# Parameters:
#   - url: The string to be encoded
# Return:
#   URL-encoded string
function url_encode() {
  local string=$1
  local length="${#string}"
  local url_encoded_string=""
  local c

  for ((i = 0; i < length; i++)); do
    c=${string:i:1}
    case "$c" in
    [a-zA-Z0-9.~_-]) url_encoded_string+=$c ;;
    *) url_encoded_string+=$(printf '%%%02X' "'$c") ;;
    esac
  done

  echo "$url_encoded_string"
}

# A function to replace or remove the protocol part of a URL
replace_protocol() {
  local url=$1
  local replacement=$2
  local new_url

  # If no replacement is provided, remove the protocol part
  if [[ -z $replacement ]]; then
    new_url=$(echo "$url" | sed "s/http:\/\///" | sed "s/https:\/\///")
  else
    new_url=$(echo "$url" | sed "s/http:\/\//${replacement}/" | sed "s/https:\/\//${replacement}/")
  fi

  echo "$new_url"
}

# Function: clone_git_repo
# Parameters:
#   - url: URL of the git repository
#   - username: Username (optional)
#   - password: Password (optional)
#   - access_token: Access token (optional)
#   - branch: Clone branch (optional)
#   - depth: Clone depth (optional)
function clone_git_repo() {
  local url=$1
  local username=$2
  local password=$3
  local access_token=$4
  local branch=$5
  local depth=$6
  local fix_url encoded_username encoded_password

  branch=${branch:---branch $branch}
  depth=${depth:---depth $depth}

  echo "branch: $branch, depth: $depth"

  if [[ -n $access_token ]]; then
    echo "use access_token to clone"
    fix_url=$(replace_protocol "$url")
    git clone "https://oauth2:$access_token@$fix_url" "$branch" "$depth"
  elif [[ -n $username && -n $password ]]; then
    encoded_username=$(url_encode "$username")
    encoded_password=$(url_encode "$password")
    fix_url=$(replace_protocol "$url")

    # echo "use username and password to clone, encoded_username: $encoded_username, encoded_password: $encoded_password, fix_url: $fix_url"
    echo "use username and password to clone"

    git clone "https://$encoded_username:$encoded_password@$fix_url" "$branch" "$depth"
  else
    echo "use default clone"
    git clone "$url" "$branch" "$depth"
  fi
}

# Cancel proxy
function proxy_off() {
  unset http_proxy
  unset https_proxy
  unset ALL_PROXY
  unset no_proxy
  logs "Proxy Off"
}

# Enable proxy
function proxy_on() {
  proxy_url="http://127.0.0.1:7890"
  match_str="://"

  if [ -n "$1" ]; then
    if [[ $1 =~ $match_str ]]; then
      proxy_url=$1
    else
      logs "Incorrect proxy_url, use defualt proxy_url"
      return
    fi
  fi

  export http_proxy=$proxy_url
  export https_proxy=$proxy_url
  export ALL_PROXY=$proxy_url
  export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
  logs "Proxy On $proxy_url"
}

function scriptInfo() {
  echo ""
  logs "##################################################################"
  logs "#    Name: local appstore sync helper for 1Panel                 #"
  logs "# Version: v1.0.0                                                #"
  logs "#  Author: xxxily                                                #"
  logs "#  Github: https://github.com/xxxily/local-appstore-for-1Panel   #"
  logs "##################################################################"
  echo ""
}

function main() {
  scriptInfo

  if [ ! -d "$app_local_dir" ]; then
    logs "If the app directory of 1Panel is not detected, check whether 1Panel is installed corrector, or modify the app_local_dir variable"
    exit 1
  fi

  # Check if the address ends with .git and autocomplete if not
  if [[ "$git_repo_url" != *".git" ]]; then
    git_repo_url="${git_repo_url}.git"
  fi

  local repo_username=""
  local repo_projectname=""

  # Use regular expressions to match the username and project name from the git_repo_url
  if [[ $git_repo_url =~ .*\/(.*)\/(.*)\.git ]]; then
    repo_username=${BASH_REMATCH[1]}
    repo_projectname=${BASH_REMATCH[2]}
    # logs "username: $repo_username"
    # logs "project name: $repo_projectname"
  fi

  if [ -z "$repo_username" ] || [ -z "$repo_projectname" ]; then
    logs "If you can't extract the username and project name, check that the address provided by git_repo_url is correct"
    exit 1
  fi

  mkdir -p "$work_dir/temp"

  local repo_user_dir="$work_dir/temp/$repo_username"
  local repo_dir="$repo_user_dir/$repo_projectname"

  # The value of the clean_remote_app_cache variable decides whether to clear the remote app cache data
  if [ "$clean_remote_app_cache" = true ] && [ -d "$repo_dir" ]; then
    rm -rf "$repo_dir"
    logs "Remote cache data cleared"
  fi

  # The value of the proxyURL variable determines whether to enable the proxy
  if [ -n "$proxyUrl" ]; then
    proxy_on "$proxyUrl"
  fi

  # Clone or pull the latest code from the remote repository
  logs "Prepare to get the latest code from the repository：$git_repo_url"
  if [ -d "$repo_dir" ]; then
    logs "Perform git pull"
    cd "$repo_dir"

    # Force pull the latest code
    git pull --force 2>>"$log_file"
  else
    logs "Perform git clone"
    mkdir -p "$repo_user_dir"
    cd "$repo_user_dir"

    clone_git_repo "$git_repo_url" "$git_username" "$git_password" "$git_access_token" "$git_branch" "$git_depth" 2>>"$log_file"
  fi

  logs "Latest repository code obtained"

  if [ ! -d "$repo_dir/apps" ]; then
    logs "The apps directory is not detected - check if the remote repository is correct"
    exit 1
  fi

  # The value of the clean_local_app variable decides whether to clear the local app directory
  if [ "$clean_local_app" = true ]; then
    rm -rf "${app_local_dir:?}"/*
    logs "The local app directory has been cleared"
  fi

  # Copy all apps in the remote apps directory to the local app directory
  cd "$repo_dir"
  cp -rf apps/* "$app_local_dir"

  pwd
  ls -lah
  du -sh

  # The value of the clean_remote_app_cache variable decides whether to clear the remote app cache data
  if [ "$clean_remote_app_cache" = true ]; then
    rm -rf "$repo_dir"
  fi

  if [ -n "$proxyUrl" ]; then
    proxy_off
  fi

  logs "1Panel local app synchronization completed, enjoy it!"
}

main "$@"
