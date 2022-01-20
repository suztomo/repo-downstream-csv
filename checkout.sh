#!/bin/bash

set -e

while IFS="," read -r name url branch
do
  if [[ $name =~ ^#.* ]]; then
    continue
  fi
  echo "name: $name"
  echo "url: $url"
  echo "branch: $branch"
  if [ -z "$name" ] || [ -z "$url" ] || [ -z "$branch" ]; then
    echo "invalid line"
    exit 1
  fi
  directory=$(basename "$url")
  if [ -d "$directory" ]; then
    rm -rf "$directory"
  fi
  git clone "$url" --branch "$branch" --depth 1
done < repositories.csv


