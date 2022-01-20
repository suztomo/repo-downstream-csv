#!/bin/bash

while IFS="," read -r name url branch
do
  if [[ $name =~ ^#.* ]]; then
    continue
  fi
  echo "name: $name"
  echo "url: $url"
  echo "branch: $branch"
  git clone $url --branch $branch --depth 1
done < repositories.csv
