#!/bin/bash

# --------------------------------------------------
# Copyright 2018 Source Foundry Authors
# MIT License
# Source: https://github.com/source-foundry/alt-hack
# ---------------------------------------------------

# 1. Set the path to the downloaded Hack repo here first
HACK_PATH=""

# 2. List your alternate glyphs here
declare -a alternates=(
#    "zero-dotted"
    "zero-forwardslash"
#    "zero-backslash"
#    "zero-diamond"
    "one-noslab"
#    "three-flattop"
    "g-loop"
#    "f-knife"
    "i-slab"
    "l-slab"
    "percent-traditional"
    "ampersand-nogap"
#    "parentheses-curved"
    "parentheses-rounder"
#    "angle-brackets-wider"
#    "square-brackets-oldv3"
)

# 3. Run this script and enjoy!

# ------------------------------------------------------------------------------------------------ #

if [ -z $HACK_PATH ]; then
    echo "❌ Set the HACK_PATH variable in this script to your downloaded Hack repo root."
    exit 1
fi

declare -a styles=("Regular" "Bold" "Italic" "BoldItalic")

for alternate in "${alternates[@]}"
do
    for style in "${styles[@]}"
    do
        stylePath="${HACK_PATH}/source/Hack-${style}.ufo/glyphs"
        lowercaseStyle=$(echo "$style" | tr '[:upper:]' '[:lower:]')
        alternatePath="./glyphs/${alternate}/${lowercaseStyle}"

        if ! cp "$alternatePath"/*.glif "$stylePath"; then
            echo "❌ Aborting patching of Hack, check errors above."
            exit 1
        fi
    done

    echo "✅ Patched $alternate"
done

echo
echo "All done! Now go to the Hack repo and build the font files."
