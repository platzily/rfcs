#!/usr/bin/env bash

set -e

if [ ! -d src ]; then
    mkdir src
fi

printf '[Introduction](introduction.md)\n\n' > src/SUMMARY.md

printf '[Contributing](contributing.md)\n\n' > src/SUMMARY.md

printf '[Code of conduct](code_of_conduct.md)\n\n' > src/SUMMARY.md

printf '# Accepted \n\n' >> src/SUMMARY.md

find ./text/accepted ! -type d -print0 | xargs -0 -I {} ln -frs {} -t src/

find ./text/accepted ! -type d -name '*.md' -print0 \
  | sort -z \
  | while read -r -d '' file;
do
    printf -- '- [%s](%s)\n' "$(basename "$file" ".md")" "$(basename "$file")"
done >> src/SUMMARY.md

printf '# Implemented \n\n' >> src/SUMMARY.md


find ./text/implemented ! -type d -print0 | xargs -0 -I {} ln -frs {} -t src/

find ./text/implemented ! -type d -name '*.md' -print0 \
  | sort -z \
  | while read -r -d '' file;
do
    printf -- '- [%s](%s)\n' "$(basename "$file" ".md")" "$(basename "$file")"
done >> src/SUMMARY.md

ln -frs README.md src/introduction.md

ln -frs CONTRIBUTING.md src/contributing.md

ln -frs CODE_OF_CONDUCT.md src/code_of_conduct.md

mdbook build