set -eu
set -o pipefail

echo "Copying macro header..."
mkdir -p resources/autogenerated/macros
cp src/Axel/Parse/AST.hs resources/autogenerated/macros/AST.hs
echo "Macro header copied!"

stack build --fast
stack exec axel-exe -- project
stack build --fast
