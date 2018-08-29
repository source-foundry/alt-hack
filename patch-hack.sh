#!/bin/bash

# 1. Set the path to the downloaded Hack repo here first
HACK_PATH=""

# 2. List your alternate glyphs here
declare -a alternates=(
    "u00EC-slab"
    "u00ED-slab"
    "u00EF-slab"
    "u012B-slab"
    "u012D-slab"
    "u012F-slab"
    "u0030-diamond"
    "u0069-slab"
    "u0129-slab"
    "u0131-slab"
    "u0456-slab"
    "u0457-slab"
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
        lowercaseStyle=`echo "$style" | tr '[:upper:]' '[:lower:]'`
        alternatePath="./glyphs/${alternate}/${lowercaseStyle}/*.glif"

        cp $alternatePath $stylePath
        if [ $? -ne 0 ]; then
            echo "❌ Aborting patching of Hack, check errors above."
            exit 1
        fi
    done

    echo "✅ Patched $alternate"
done

echo
echo "All done! Now go to the Hack repo and build the font files."