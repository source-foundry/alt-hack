# alt-hack

alt-hack is a stylistic alternate glyph library for the [Hack typeface](https://github.com/source-foundry/Hack).  It provides alternate glyph design source files (`*.glif`) to support drag + drop + overwrite existing source Unicode code point customization.  Overwrite the existing glyph design files in the Hack source with any combination of alternate designs that are available here, rebuild the fonts, and use your custom version.

This repository is open to contributions of new glyph designs intended to be used with the Hack typeface.

## Usage

### View Alternate Glyph Styles
The `*.glif` source files are located in the `glyphs` directory of this repository and are organized by Unicode code point. A short string is added to the Unicode code point to describe the type of design modification that was performed to the Hack default style.  Source files are supplied for regular, bold, italic, and bold italic font variants.

You may view images of the alternate designs in the README.md files at the top level of each alternate glyph directory.


### How to Build a Custom Version of Hack

### Quickstart Instructions

- Download the [Hack typeface source](https://github.com/source-foundry/Hack/archive/master.zip).
- Download the `*.glif` source files from the alt-hack repository that you would like to use as replacements in the Hack source.
- Overwrite the existing Hack `*.glif` files for your selected Unicode code points with the alt-hack `*.glif` files (replacements in alt-hack have the same file paths as those in default source).
- Build new Hack fonts using the simple make based build approach in the [build documentation](#).

### Detailed Instructions

Detailed instructions of the above quickstart steps follow.

#### Download the Hack source repository

[Download the Hack repository as a zip archive](https://github.com/source-foundry/Hack/archive/master.zip) and unpack the archive locally on your system.  The default Hack UFO source is located in the `source` directory of the repository.  There are separate UFO source directories for each of the four Hack variants:

- Hack-Regular.ufo
- Hack-Italic.ufo
- Hack-Bold.ufo
- Hack-BoldItalic.ufo

The glyph design source files live in the `glyphs` subdirectory within each of these top level `*.ufo` source directories.

#### Obtain replacement source files
Download the `*.glif` files in the regular, bold, italic, and bolditalic directories from the alt-hack repository for each replacement that you want to make in the Hack source.  The alternate style source files have the same file path as we use in the Hack source.  The `*.glif` design source files are intended to be used as direct replacements for the existing default source files.

#### Overwrite Existing Source Files
Copy the alternate glyph source files for the appropriate font variants (i.e. regular, bold, italic, bold italic) from this repository into the corresponding `glyphs` directory of the Hack UFO source for the respective variant.  This should overwrite an existing file in that directory.  Please note that the alternate files for each variant have the same file path. Please confirm that you are overwriting an existing file with a new file that is of the appropriate variant type.

#### Build new fonts

Use the build instructions in the Hack repository to compile new desktop `*.ttf` font files and/or web fonts with your custom version of Hack.

### Post-Modification Licensing
These changes to the Hack typeface fall within acceptable modification practice under the Hack license.

- It is not necessary to change the font name as a result of these modifications.
- It is acceptable practice to change the name of the fonts if you would like (e.g. for release to others under a different font name).
- Please maintain the Hack license with modified versions of the upstream source.
 See the Hack license for further details.

## License

The work in the alt-Hack repository is licensed under the MIT license. See [LICENSE.md](LICENSE.md) for details.
