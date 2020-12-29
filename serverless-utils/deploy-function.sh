#!/bin/sh

function="$1"
shift

search() {
  grep -rl "$1" . | \
    grep '\/serverless\.yml$' | \
    xargs -i sh -c "cat {} | docker run -i --rm mikefarah/yq e '.functions.$1 | not | not' - | grep -q true && echo {}"
}

# Do search
echo -n "🔍 Finding services containing function '$function'... "
matches=`search "$function"`
numMatches=`echo "$matches" | sed '/^$/d' | wc -l`
echo "$numMatches found."

# Handle edge cases
if [ $numMatches -eq 0 ]; then
  exit 1
elif [ $numMatches -gt 1 ]; then
  echo "$matches" | sed 's/\(.*\)/ \1/'
  echo ""
  echo "Please switch to the relevant directory and deploy manually."
  exit 1
fi

# Deploy
dir=`dirname "$matches"`
echo "🚀 Deploying '$function' from $dir..."
cd "$dir" && sh --login -c "serverless deploy function -f $function $@"
