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
- Build new Hack fonts using the simple make based build approach in the [build documentation](https://github.com/source-foundry/Hack/blob/master/docs/BUILD.md).

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

#### Overwrite existing source files
Copy the alternate glyph source files for the appropriate font variants (i.e. regular, bold, italic, bold italic) from this repository into the corresponding `glyphs` directory of the Hack UFO source for the respective variant.  This should overwrite an existing file in that directory.  Please note that the alternate files for each variant have the same file path. Please confirm that you are overwriting an existing file with a new file that is of the appropriate variant type.

#### Eliminate existing manual instruction sets for alternate glyphs (if present)
Some of the glyphs in the Hack sets include manual changes to the ttfautohint automated instruction sets ("hints").  These must be eliminated if you replace an existing glyph in the main Hack sets with a stylistic alternate from this repository or your build will fail (or create undesirable rendering changes that are not tuned for the alternate glyph).

The control instructions files that are used to manually modify the hints in the Hack builds are located in the [tt-hinting directory](https://github.com/source-foundry/Hack/tree/master/postbuild_processing/tt-hinting) of the Hack repository. There is one text file per Hack variant (i.e. for Regular, Italic, Bold, and Bold Italic sets).  The manual hints are organized by Unicode code point.

Examine these control instructions files before you build your new fonts.  If you identify a block of instructions under a heading for a Unicode code point that you intend to replace, either delete all lines associated with that glyph or comment out the block with `#` symbols at the beginning of each line.

For example, to build a set of fonts with new zero alternate glyphs (Unicode U+0030), you would need to modify an existing control instructions file that includes the following lines:


##### Hack-Regular-TA.txt

```
# U+0030 zero glyph ID 548
uni0030 touch 35,36,45,46,47,56  y -0.5   @8
uni0030 touch 35,36,56 y -1.0 @12,13,14
```

to the following:

```
# U+0030 zero glyph ID 548
# uni0030 touch 35,36,45,46,47,56  y -0.5   @8
# uni0030 touch 35,36,56 y -1.0 @12,13,14
```

or simply delete the heading line `# U+0030 zero glyph ID 548` and the individual instruction lines below that level for the U+0030 glyph.  Repeat this for any values that are included for your glyph changes in each of the four control instructions files before you attempt to build your new files.

#### Build new fonts

Use the [build documentation](https://github.com/source-foundry/Hack/blob/master/docs/BUILD.md) in the Hack repository to compile new desktop `*.ttf` font files and/or web fonts with your custom version of Hack.

### Post-Modification Licensing
These changes to the Hack typeface fall within acceptable modification practice under the Hack license.

- It is not necessary to change the font name as a result of these modifications.
- It is acceptable practice to change the name of the fonts if you would like (e.g. for release to others under a different font name).
- Please maintain the Hack license with modified versions of the upstream source.
 See the Hack license for further details.

## License

The work in the alt-Hack repository is licensed under the MIT license. See [LICENSE.md](LICENSE.md) for details.
