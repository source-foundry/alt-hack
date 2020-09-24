#!/bin/bash

set -euo pipefail

if [ $# -eq 0 ]; then
    echo "Usage: create-pngs.sh PATH"
    echo "  Create transparent pngs with a consistent size for all, potentially, replaced"
    echo "  characters appropriate for uploading to the github alt-hack page."
    echo ""
    echo "  PATH  A Hack build directory containing Hack-{Regular,Bold,Italic,BoldItalic}.ttf files"
    echo ""
    echo "Image files are written to a pngs/ directory"
    echo ""
    echo "This tool depends on the \"convert\" tool from ImageMagick"
    exit 1
fi

# Map each character to the glif name
declare -A chars=(
    ["&"]="ampersand"
    [">"]="greater"
    ["<"]="less"
    ["f"]="f"
    ["ğ"]="gbreve"
    ["ǧ"]="gcaron"
    ["ĝ"]="gcircumflex"
    ["ġ"]="gdotaccent"
    ["g"]="g"
    ["ģ"]="uni0123"
    ["ı"]="dotlessi"
    ["í"]="iacute"
    ["ĭ"]="ibreve"
    ["î"]="icircumflex"
    ["ï"]="idieresis"
    ["i"]="i"
    ["ì"]="igrave"
    ["ī"]="imacron"
    ["į"]="iogonek"
    ["ĩ"]="itilde"
    ["і"]="uni0456"
    ["ї"]="uni0457"
    ["ĺ"]="lacute"
    ["ľ"]="lcaron"
    ["ŀ"]="ldot"
    ["l"]="l"
    ["ł"]="lslash"
    ["ļ"]="uni013C"
    ["1"]="one"
    ["("]="parenleft"
    [")"]="parenright"
    ["%"]="percent"
    ["["]="bracketleft"
    ["]"]="bracketright"
    ["3"]="three"
    ["0"]="zero"
)

mkdir -p pngs

for char in "${!chars[@]}"; do
    desc="${chars[$char]}"
    for style in Regular Bold Italic BoldItalic; do
        filename=./pngs/"${desc}"-"${style}".png
        echo Creating "${filename}"
        convert -font "${1}"/Hack-"${style}".ttf -background transparent -size 36x60\
        label:"${char}" "${filename}"
    done
done
