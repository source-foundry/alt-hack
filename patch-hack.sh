#!/bin/bash

# --------------------------------------------------
# Copyright 2018 Source Foundry Authors
# MIT License
# Source: https://github.com/source-foundry/alt-hack
# ---------------------------------------------------

# 1. Set the path to the downloaded Hack repo, or set HACK_PATH environment variable
HACK_PATH="${HACK_PATH:=""}"

# 2. List your alternate glyphs here, or specify them on the command line
declare -a alternates=(
    "ampersand-nogap"
#    "angle-brackets-wider"
#    "f-knife"
    "g-loop"
    "i-slab"
    "l-slab"
    "one-noslab"
#    "parentheses-curved"
    "parentheses-rounder"
    "percent-traditional"
#    "square-brackets-oldv3"
#    "three-flattop"
#    "zero-dotted"
    "zero-forwardslash"
#    "zero-backslash"
#    "zero-diamond"
)

# 3. Run this script and enjoy!

# ------------------------------------------------------------------------------------------------ #

# If arguments provided, use them as alternates instead
if [ $# -gt 0 ]; then
    alternates=("$@")
fi

if [ -z "$HACK_PATH" ]; then
    echo "❌ Set the HACK_PATH variable in this script or via an environment variable to your"\
         "downloaded Hack repo root."
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

        if ! cp "${alternatePath}"/*.glif "${stylePath}"; then
            echo "❌ Aborting patching of Hack, check errors above."
            exit 1
        fi

        # Extract the unicode hex values from each glif
        while read -r hexcode
        do
          # Remove hinting of patched glyphs
          sed -i "s/^\(uni${hexcode}\)/#\1/" \
                 "${HACK_PATH}"/postbuild_processing/tt-hinting/Hack-"${style}"-TA.txt
        done < <(grep "unicode hex=" "${alternatePath}"/*.glif | sed 's/.*"\(.*\)".*/\1/' | sort -u)
    done

    echo "✅ Patched ${alternate}"
done

echo
echo "All done! Now go to the Hack repo and build the font files."
