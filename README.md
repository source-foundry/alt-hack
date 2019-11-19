# alt-hack

[![Build Status](https://semaphoreci.com/api/v1/sourcefoundry/alt-hack/branches/master/badge.svg)](https://semaphoreci.com/sourcefoundry/alt-hack)

alt-hack is a stylistic alternate glyph library for the [Hack typeface](https://github.com/source-foundry/Hack).  It provides alternate glyph design source files (`*.glif`) to support drag + drop + overwrite existing source Unicode code point customization.  Overwrite the existing glyph design files in the Hack source with any combination of alternate designs that are available here, rebuild the fonts, and use your custom version.

This repository is open to contributions of new glyph designs intended to be used with the Hack typeface.

## Install

Hack is a submodule that needs to be pulled in, so clone it recursively:
``` shell
git clone --recursive https://github.com/source-foundry/alt-hack.git
```

The install script `generator.ros` uses the [Roswell facility for Common Lisp](https://github.com/roswell/roswell). You will need to [install it](https://github.com/roswell/roswell/blob/master/INSTALL.md).

## Usage

### View Available Symbols
This list may be outdated.
``` shell
./generator.ros show
...
 0 u0030-backslash
...
```

### View help

``` shell
./generator.ros help
```
### Confirm Correct Installation

``` shell
./generator.ros test
```
Will run the tests.

### Examples

Generate all fonts (desktop, web, and woff2 version web) with a backslashed zero:
``` shell
./generator.ros --ttf --woff --woff2 backslash
```

Opt for slabbed `i` variants for desktop use, and a dotted zero:
``` shell
./generator.ros --ttf slabi dot
```

### View Alternate Glyph Styles
The `*.glif` source files are located in the `glyphs` directory of this repository and are organized by Unicode code point. A short string is added to the Unicode code point to describe the type of design modification that was performed to the Hack default style.  Source files are supplied for regular, bold, italic, and bold italic font variants.

You may view images of the alternate designs in the README.md files at the top level of each alternate glyph directory.


### Post-Modification Licensing
These changes to the Hack typeface fall within acceptable modification practice under the Hack license.

- It is not necessary to change the font name as a result of these modifications.
- It is acceptable practice to change the name of the fonts if you would like (e.g. for release to others under a different font name).
- Please maintain the Hack license with modified versions of the upstream source.
 See the Hack license for further details.

## License

The work in the alt-Hack repository is licensed under the MIT license. See [LICENSE.md](LICENSE.md) for details.
