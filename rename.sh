#!/usr/bin/env bash

set -e

if [ -d lib/approvals ]; then
  mv lib/approvals lib/goldeen
  mv lib/approvals.rb lib/goldeen.rb
fi

find ./lib -type f -exec sed -i'' -e 's/Approvals/Goldeen/g' {} +
find ./lib -type f -exec sed -i'' -e 's/approvals\//goldeen\//g' {} +
find ./lib -type f -exec sed -i'' -e "s/require 'approvals'/require 'goldeen'/g" {} +

if [ -f bin/approvals ]; then
  mv bin/approvals bin/goldeen
fi

find ./bin -type f -exec sed -i'' -e 's/Approvals/Goldeen/g' {} +
find ./bin -type f -exec sed -i'' -e "s/require 'approvals/require 'goldeen/g" {} +
