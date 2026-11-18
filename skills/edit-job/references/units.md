# Units of Measure Reference

Canonical list of valid `unit_of_measure_id` values from the API. When code
writes `purchase_unit_of_measure_id` or `unit_of_measure_id` on a cost item,
the value MUST be a valid id from this list — otherwise the UI shows
"By the [not found]" and the package-format widget collapses.

## Convertible measures (have a measureType + conversion table)

These appear as keys in `c.conversionTables` and can convert between each
other. They are valid for `unit_of_measure_id` but should NEVER be used as
a `purchase_unit_of_measure_id` when they collide with the entity's own
dimensional uom — substitute a count-style discrete uom (e.g. `box`).

| id | name | measureType | metric |
|---|---|---|---|
| `in` | Inches | length | no |
| `ft` | Linear feet/inches | length | no |
| `yd` | Linear yard | length | no |
| `mi` | Mile | length | no |
| `mm` | Linear millimetre | length | yes |
| `cm` | Centimetre | length | yes |
| `m` | Linear metre | length | yes |
| `km` | Kilometre | length | yes |
| `ft2` | Square feet | area | no |
| `yd2` | Square yard | area | no |
| `mm2` | Square millimetre | area | yes |
| `m2` | Square metre | area | yes |
| `acre` | Acre | area | no |
| `hectare` | Hectare | area | yes |
| `sqr` | Square (100 ft²) | area | no |
| `ft3` | Cubic feet | volume | no |
| `yd3` | Cubic yard | volume | no |
| `mm3` | Cubic millimetre | volume | yes |
| `m3` | Cubic metre | volume | yes |
| `mbf` | Metric board feet | volume | no |
| `lbs` | Pounds | weight | yes |
| `kg` | Kilogram | weight | yes |
| `t` | Metric ton | weight | yes |
| `us_ton` | US ton | weight | no |

## Count / discrete (valid as `purchase_unit_of_measure_id`)

These are the units allowed for purchase units. Use any of these when the
dimensional `unit_of_measure_id` is a convertible measure (ft/ft²/ft³/m/...)
and you need a discrete package uom for coverage rendering.

| id | name | abbr | linkable |
|---|---|---|---|
| `count` | Each | each | yes |
| `bag` | Bag | bag | no |
| `barrel` | Barrel | brl | no |
| `box` | Box | box | no |
| `bucket` | Bucket | bckt | no |
| `bulk` | Bulk Order | bulk | no |
| `bundle` | Bundle | bundle | no |
| `bushel` | Bushel | bshl | no |
| `caseload` | Caseload | cld | no |
| `cord` | Cord | crd | no |
| `cyl` | Cylinder | cyl | no |
| `gallon` | Gallon | gallon | no |
| `gram` | Gram | g | no |
| `halfpallet` | Half pallet | hplt | no |
| `load` | Load | load | no |
| `package` | Package | pkg | no |
| `pail` | Pail | pail | no |
| `pair` | Pair | pair | no |
| `pallet` | Pallet | plt | no |
| `piece` | Piece | piece | no |
| `quart` | Quart | quart | no |
| `roll` | Roll | roll | no |
| `sack` | Sack | sack | no |
| `set` | Set | set | no |
| `slab` | Slab | slab | no |
| `stone` | Stone | st | no |
| `ton` | Ton (US) | ton | no |
| `tonne` | Tonne (metric) | tonne | no |
| `vial` | Vial | vial | no |

## Common mistakes — invalid ids that look valid

These strings are **NOT** valid `unit_of_measure_id` values. The
dimensionalizer LLM sometimes returns them; downstream code MUST map
them to a real id from the list above (typically `box` or `package`).

| Invalid string | Map to |
|---|---|
| `case` | `box` (no `case` uom exists) |
| `kit` | `set` |
| `tray` | `box` |
| `pack` | `package` |
| `each` | `count` (`each` is the abbr; the id is `count`) |
| `lf`, `lft`, `linear ft` | `ft` |
| `sf`, `sqft`, `square feet` | `ft2` |

## Defaults for `purchase_unit_of_measure_id`

When the dimensional `unit_of_measure_id` is convertible (anything in the
first table above) and a discrete package uom is needed for coverage:

- Tile, sheets, lumber → `box` (default)
- Mortar, grout, sealant, paint → `bag` or `bucket` or `gallon`
- Hardware (screws, nails) → `box` or `package`
- Fabric, sheeting → `roll`
- Aggregate → `pallet` or `bag`

When in doubt, use `box`. It's always a valid linkable uom and renders
correctly in the package-format widget.
