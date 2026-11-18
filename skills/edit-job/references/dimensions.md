# Dimensions reference

Quick reference for all system dimension codes used in construction estimating equations.

## How dimensions work
- Assembly entities hold dimensions in the `oDimensions` field
- Cost items link quantities via `cost_type_qty_equation` (e.g., `=fa`, `=ewp*ewh`)
- Dimensions can inherit from parent (`inherit: 1`) or be computed via equations
- Unit conversion is automatic — do NOT manually convert units in equations
- 14 built-in dimensions are always available
- 350+ trade-specific dimensions are available to every company

## Quick lookup — most common dimensions

| Abbr | Name | Type | Default equation |
|------|------|------|-----------------|
| fa | Floor area | area | — |
| fp | Building footprint | area | fa |
| iwp | Interior wall perimeter | length | — |
| iwh | Interior wall height | length | — |
| iwa | Interior wall area | area | iwp * iwh |
| ewp | Exterior wall perimeter | length | — |
| ewh | Exterior wall height | length | — |
| ewa | Exterior wall area | area | ewp * ewh |
| ca | Ceiling area | area | fa |
| ra | Roof area | area | fp * 1.2 |
| dcka | Deck area | area | — |
| slaba | Slab area | area | — |
| win | Window count | count | — |
| indor | Interior door count | count | — |
| oudor | Exterior door count | count | — |
| outlets | Outlet count | count | — |
| toil | Toilet count | count | — |
| sinks | Sink count | count | — |
| each | Each / generic count | count | — |
| area | Generic area | area | — |

## Building core (14 built-in dimensions)

These are the original built-in dimensions.

| Abbr | Name | Type | Default equation | dim_type_id |
|------|------|------|-----------------|-------------|
| fa | Floor area | area | — | 100 |
| fp | Building footprint | area | fa | 150 |
| iwp | Interior wall perimeter | length | — | 200 |
| iwh | Interior wall height | length | — | 210 |
| ca | Ceiling area | area | fa | 215 |
| iwa | Interior wall area | area | iwp * iwh | 220 |
| ewp | Exterior wall perimeter | length | — | 300 |
| ewh | Exterior wall height | length | — | 310 |
| ewa | Exterior wall area | area | ewp * ewh | 320 |
| rp | Roof perimeter | length | — | 500 |
| rl | Roof length | length | — | 510 |
| ra | Roof area | area | fp * 1.2 | 520 |
| la | Land area | area | — | 900 |
| lp | Land perimeter | length | — | 910 |

## Walls

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| iwp | Interior wall perimeter | length | Baseboard, trim, chair rail, wainscoting |
| ewp | Exterior wall perimeter | length | Starter strips, J-channel, plates |
| efl | Exterior framing length | length | Exterior wall framing runs |
| ifl | Interior framing length | length | Interior wall framing runs |
| twp | Total wall perimeter | length | Combined interior + exterior |
| ewh | Exterior wall height | length | Corner posts, vertical items |
| iwh | Interior wall height | length | Stud length calculations |

## Framing

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| joist | Joist count | count | Joist hangers scale with this |
| joistlen | Joist total length | length | Total linear feet of joists |
| beams | Beam count/length | count | Beam brackets, beam hangers |
| sbl | Structural beam length | length | Fallback for beam length |
| holddn | Hold-down count | count | Hold-down hardware |
| plates | Plate count | count | Top/bottom plates |
| rebar | Rebar quantity | length | Rebar in shell/foundation |
| header | Header total length | length | Header stock lumber |
| raft | Rafter/truss count | count | Trusses, collar ties, hurricane ties |
| stud | Stud count | count | Wall studs |
| stsp | Stud spacing | length | Spacing between studs |
| purlin | Purlin count | count | Roof purlins |
| tfl | Total framing length | length | Total linear framing for structural calculations |

## Deck

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| dcka | Deck area | area | ALL deck surface items — never use fa for decks |
| deckp | Deck perimeter | length | Rim joist, perimeter trim, sanding |
| dckht | Deck height | length | Post length, railing height reference |
| deledger | Ledger length | length | Ledger board, flashing, anchor bolts |
| post | Post count | count | Footings, brackets, concrete per post |
| joist | Joist count | count | Joist hangers |
| joistlen | Joist total length | length | Floor joist lumber |
| beams | Beam count | count | Beam brackets/hangers (not =post) |
| footdpth | Footing depth | length | Depth of footing hole below grade. Default: 2 ft |

## Stairs & railings

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| stair | Staircase length | length | Stringers, stair handrail |
| strngr | Stringer count | count | Default: =ceil(stairwd/4)+1 |
| stairwd | Stair width | length | Tread width; a deck's box step along an edge is a stair this wide |
| treads | Stair treads | count | Treads, risers, brackets, screws; a deck step's tread count |
| stq | Number of stair treads | count | Same count as treads on the stair takeoff tool |
| trdp | Stair tread depth | length | One tread front to back; boards per tread = ceil(trdp / board width) |
| strh | Stair riser height | length | One riser (the stair tool's riser height) |
| stht | Staircase height | length | Total rise to the top of the stair |
| riserlen | Riser board total length | length | The stair tool computes treads × stairwd; the catalog still names it "Riser height" |
| stla | Stair landings | count | The catalog counts landings; the stair tool's stla is a landing area in ft2 |
| strc | Stair tread count | count | Per-step items (interior stairs) |
| strl | Stair total run length | length | Stringers, continuous rails (interior) |
| balc | Baluster count | count | Individual balusters/spindles |
| rail | Railing length | length | Deck railing — NOT stair handrail |
| railpost | Railing post count | count | Railing posts |
| railh | Railing height | length | Railing height |
| railspsec | Rail post spacing | length | Spacing between rail posts |

## Roof

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| rfacets | Roof facets count | count | Distinct planar roof faces, including dormers and attached lower roofs; measured independently, no default |
| rfa | Roof flat area | area | Horizontal projection with overhangs (plan, overhead photo, footprint). Feeds ra; no roofing line measures by it |
| ra | Roof area (sloped surface) | area | Every roofing area line (shingles, underlayment, tear-off, labor). On roofing assemblies: `rfa*sqrt(1+(rp/12)*(rp/12))`; a stated or measured surface overrides it |
| rl | Roof length | length | Roof run length |
| rp | Roof pitch | count | Rise per 12, 1–12 (6 for 6/12); photo slopes (rise/12) seed it. The built-in list above names rp Roof perimeter — roofing uses it as the pitch. Shingle installation labor adds 22% per inch of rise above 6/12 |
| complexity | Complexity | count | Labor multiplier, 1 = standard (0.85 simple, 1.15 moderate, 1.3 complex, 1.5 very complex, 1.75 extreme), judged from planes, valleys, dormers, penetrations, mixed pitches, height and access (never the pitch alone — that is rp). Shingle installation labor: `ra*(1+0.22*max(rp-6,0))*complexity`. Default 1 on the shingle package |
| rridge | Ridge length | length | Ridge cap, ridge vent |
| rhip | Hip length | length | Hip cap shingles |
| rvalley | Valley length | length | Valley flashing |
| rrakes | Rake length | length | Rake trim |
| rgable | Gable length | length | Gable trim |
| eaves | Eaves length | length | Eaves trim |
| fascia | Fascia length | length | Drip edge, gutter, soffit runs |
| gutt | Gutter length | length | Gutter sections |
| soffit | Soffit length | length | Soffit panels |
| soffitd | Soffit depth | length | Soffit panel depth |
| rise | Roof rise | length | Vertical rise |
| run | Roof run | length | Horizontal run |
| slope | Roof slope | count | Rise/run ratio |
| span | Roof span | length | Total span |
| skylt | Skylight count | count | Skylights |
| dwnspt | Downspout count | count | Downspouts |
| roofdrain | Roof drain count | count | Roof drains |
| swfl | Step wall flashing | length | — |
| sflash | Step flashing length | length | Roof-to-wall step flashing (sidewalls, headwalls); 0 when the roof meets no wall |
| wflash | Wall flashing | length | — |

## Fence & gates

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| fenl | Fence length | length | Total fence run |
| fenh | Fence height | length | Fence panel height |
| fena | Fence area | area | fenl * fenh |
| post | Post count | count | Total posts (shared with deck) |
| pstsp | Post spacing | length | Distance between posts |
| endpost | End post count | count | End/corner posts |
| lnpost | Line post count | count | Intermediate line posts |
| landposts | Landing posts | count | Posts at grade changes |
| postspac | Post spacing | length | Alternate spacing dim |
| gates | Gate count | count | Total gates |
| singat | Single gate count | count | Single-width gates |
| doubgat | Double gate count | count | Double-width gates |
| gatew | Gate width | length | Gate opening width |
| gateh | Gate height | length | Gate height |
| panel | Panel count/length | count | Fence panel sections |

## Foundation & concrete

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| footp | Footing perimeter | length | Forms, forming lumber |
| footh | Footing height/depth | length | — |
| footw | Footing width | length | — |
| footv | Footing volume | volume | — |
| foundp | Foundation perimeter | length | Drainage tile, waterproofing |
| foundh | Foundation height | length | — |
| foundw | Foundation width | length | — |
| foundv | Foundation volume | volume | Concrete walls |
| slaba | Slab area | area | ALL concrete flatwork — never use fa |
| slabh | Slab height/thickness | length | — |
| slabv | Slab volume | volume | — |
| slabp | Slab perimeter | length | Concrete forms, form lumber — use instead of fp for driveways/walkways/slabs |
| footdpth | Footing depth | length | Depth of footing below grade for posts. Default: 2 ft |
| concv | Concrete volume | volume | Shotcrete, gunite |
| fp | Slab perimeter | length | DEPRECATED for slabs — use slabp. Still valid for building footprint perimeter. |

## Cabinets & counters

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| cbl | Cabinet length | length | Wall/upper cabinets, installation labor |
| bcbl | Base cabinet length | length | Base cabinets — not iwp |
| upcbl | Upper cabinet length | length | Upper cabinets |
| lowcab | Lower cabinet length | length | Lower cabinets |
| cnta | Counter area | area | Countertop material |
| cnth | Counter height | length | — |
| cabd | Cabinet depth | length | — |
| islen | Island length | length | Island countertop |
| iswid | Island width | length | Island width |
| icnta | Island counter area | area | — |
| cabbox | Cabinet box count | count | Individual boxes |
| draw | Drawer count | count | Drawers |
| cabval | Cabinet valance length | length | — |
| shlf | Shelf count | count | Shelves |
| crod | Closet rod length | length | — |
| back | Backsplash area | area | Backsplash tile, grout — subset of iwa |
| crown | Crown molding length | length | Crown molding |
| lucl | Under-cabinet lighting length | length | LED strips |
| cbdrb | Drawer base cabinets | count | Base cabinets that are all drawers — usually three stacked drawers, sometimes two or four, and no doors |
| cbddb | Door-and-drawer base cabinets | count | Base cabinets with one drawer across the top and one or two doors below |
| cbfdb | Full-door base cabinets | count | Base cabinets with doors from top to bottom and no drawer |
| cbsnk | Sink base cabinets | count | The base cabinet under a sink: doors below a fixed panel that looks like a drawer |
| cbcrb | Corner base cabinets | count | Base cabinets that turn an inside corner — a lazy susan or a blind corner box |
| cbwal | Wall cabinets | count | Upper cabinets hung on the wall, with one or two doors |
| cbwfr | Refrigerator wall cabinets | count | The deep, short wall cabinet over a refrigerator — as deep as the fridge (about 24 in) but only 12 to 24 in tall |
| cbwrg | Above-range wall cabinets | count | The shorter wall cabinet over a range, cooktop or over-the-range microwave, raised to clear the hood. None when a chimney hood goes up to the ceiling |
| cbwcr | Corner wall cabinets | count | Wall cabinets that turn an inside corner — diagonal or blind corner |
| cbwsg | Staggered wall cabinets | count | Wall cabinets set at a second height so the line of uppers steps — usually taller boxes, sometimes raised or deeper, often with glass doors |
| cbtal | Tall cabinets | count | Floor-to-ceiling cabinets, 84 to 96 inches tall — pantry, broom or utility |
| cbtov | Oven cabinets | count | Tall cabinets with an opening for a wall oven or built-in microwave |
| cbvsb | Vanity sink bases | count | Bathroom vanity cabinets that sit under a sink |
| cbvdb | Vanity drawer banks | count | Bathroom vanity cabinets that are all drawers, usually beside a vanity sink base |
| cbfil | Cabinet fillers | count | Narrow strips that close gaps between cabinets and walls, and at blind corners |
| cbpnl | Cabinet end and appliance panels | count | Finished panels on exposed cabinet ends and beside or over appliances |
| cbfft | Cabinet false fronts | count | Fixed drawer-look panels that don't open, such as above a sink |
| cbfsh | Floating shelves | count | Open wall shelves with hidden brackets, in place of or beside wall cabinets — count each shelf |
| cbfsl | Floating shelf length | length | The length of each floating shelf |
| cabdoortotal | Total cabinet doors | count | Derived from box counts on cabinets-by-box assemblies |
| cabdrawtotal | Total cabinet drawers | count | Derived from box counts on cabinets-by-box assemblies |
| cbwht | Wall cabinet height | length | 30, 36 or 42 in; set by takeoff |
| cbtht | Tall cabinet height | length | 84, 90 or 96 in; set by takeoff |
| cbdrb18, cbwal30, … | Per-width box counts | count | `<box code><width>` for each standard cabinet width (81 codes); written by takeoff / schedule import |

## Electrical

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| outlets | Outlet/receptacle count | count | GFCI outlets, cover plates |
| switch | Switch count | count | Light switches, cover plates |
| lit | Light/fixture count | count | Recessed lights, fixtures |
| wire | Wire run length | length | Romex/NM cable |
| epanel | Electrical panel count | count | Breaker panels |
| circuits | Branch circuit count | count | One breaker and one termination per circuit. Declared by the panel upgrade package; not in the company dimension list |
| servlen | Service entrance cable length | length | Weatherhead through the meter to the panel. Declared by the panel upgrade package; not in the company dimension list |
| cfan | Ceiling fan count | count | — |
| nopl | Number of pot lights | count | Not a circuit count |
| nope | Number of pendant lights | count | Not a circuit count |
| smkdet | Smoke detector count | count | — |
| datajk | Data jack count | count | — |
| evchg | EV charger count | count | — |
| apc | Arc-fault protection count | count | — |
| ran | Range circuit count | count | — |

## Plumbing & fixtures

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| sinks | Sink count | count | Sink, faucet, P-trap, supply lines |
| toil | Toilet count | count | Toilet, wax ring, supply kit |
| shwr | Shower count | count | Shower valve, showerhead — NOT area |
| tub | Tub count | count | Bathtub |
| faucet | Faucet count | count | — |
| wh | Water heater count | count | — |
| hoseb | Hose bib count | count | — |
| fldrain | Floor drain count | count | — |
| clnout | Cleanout count | count | — |
| sump | Sump pump count | count | — |
| bfprev | Backflow preventer count | count | — |
| gasoff | Gas shutoff count | count | — |
| pipe | Pipe length | length | — |
| fhv | Floor heating valve count | count | — |

## HVAC

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| furn | Furnace count | count | — |
| acunit | AC unit count | count | — |
| msplit | Mini-split count | count | — |
| hrvunit | HRV/ERV unit count | count | — |
| tstat | Thermostat count | count | — |
| ventc | Vent/register count | count | Supply registers, grilles |

## Windows & doors

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| win | Window count | count | Window units, trim, hardware |
| windowheight | Window height | length | — |
| windorheight | Window/door height | length | — |
| indor | Interior door count | count | Door, hardware, casing |
| oudor | Exterior door count | count | Door, deadbolt, weatherstripping |
| gdor | Garage door count | count | — |
| opgs | Opening count (interior) | count | — |
| eopgs | Opening count (exterior) | count | — |

## Bathroom-specific

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| showfa | Shower floor area | area | — |
| showwall | Shower wall area | area | Tile, waterproofing, grout — NOT shwr |
| showht | Shower height | length | — |
| showerl | Shower length | length | — |
| showerdepth | Shower depth | length | — |
| showlen | Shower length | length | — |
| showwid | Shower width | length | — |
| shwrenc | Shower enclosure count | count | — |
| benchlen | Shower bench length | length | — |
| benchht | Shower bench height | length | — |
| benchdep | Shower bench depth | length | — |
| bathac | Bathroom accessory count | count | — |
| mirror | Mirror count | count | — |

## Landscaping & sitework

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| la | Land area | area | Built-in dimension |
| lp | Land perimeter | length | Built-in dimension |
| larea | Landscaped area | area | — |
| excv | Excavation volume | volume | Bulk excavation, soil removal |
| exca | Excavation area | area | Surface grading, compaction |
| exch | Excavation depth | length | — |
| fillv | Fill volume | volume | — |
| filld | Fill depth | length | — |
| mulch | Mulch volume | volume | — |
| gravel | Gravel volume | volume | — |
| sand | Sand volume | volume | — |
| plntct | Plant count | count | — |
| curb | Curb length | length | — |
| utrench | Utility trench length | length | — |
| retainl | Retaining wall length | length | Wall block, caps, drainage |
| retainh | Retaining wall height | length | — |
| siltl | Silt fence length | length | Silt fence run (temporary sediment barrier) and its install labor. Not fenl, not fp |
| treeprot | Protected tree count | count | Trees ringed by a tree protection barricade (~50 LF barrier fence, 8 T-posts each) |

## Hardscaping

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| patioa | Patio area | area | Paver/stone surface — NOT slaba (slaba is concrete) |
| walka | Walkway area | area | Walkway paver/stone surface |
| edgel | Edge restraint length | length | Landscape/paver edge restraint |
| firepit | Fire pit count | count | Block fire pits; declared by the hardscaping practice, not in the company dimension list |

## Driveway & sidewalk

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| drv | Driveway area | area | DEPRECATED — use `slaba`. Kept for backwards compatibility only. |
| dwlength | Driveway length | length | Raw driveway length — prefer `slaba` + `slabp` at the slab level. |
| dwwidth | Driveway width | length | Raw driveway width — prefer `slaba` + `slabp` at the slab level. |
| swarea | Sidewalk area | area | DEPRECATED — use `slaba` at the sidewalk slab level. |
| swlength | Sidewalk length | length | — |
| swwidth | Sidewalk width | length | — |

**rebar**: REMOVED. Rebar length is not an input — it's derived from slab area: `=slaba*2` for a 12″ OC grid (two orthogonal runs per ft²).

## Pool

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| psd | Pool shallow depth | length | — |
| pdd | Pool deep depth | length | — |

## Siding & exterior

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| outsidecorner | Outside corner count | count | Corner posts |
| insidecorners | Inside corner count | count | Corner posts |
| oscl | Outside corner length | length | — |
| iscl | Inside corner length | length | — |
| ststrip | Starter strip length | length | — |
| bellyband | Belly band length | length | — |
| bargeb | Barge board length | length | — |
| blength | Board length | length | — |
| shut | Shutter count | count | — |

## Fire protection

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| sprklr | Sprinkler head count | count | — |
| fpull | Fire pull station count | count | — |
| hrnstr | Horn/strobe count | count | — |
| fsmoke | Fire smoke detector count | count | — |
| fext | Fire extinguisher count | count | — |

## Solar

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| pnlcnt | Panel count | count | Panels, micro-inverters, optimizers |
| racklen | Rack rail length | length | Continuous rail runs |
| condlen | Conduit run length | length | DC/AC conduit |
| acRunLen | AC run length | length | Inverter to service panel |

## Masonry

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| wa | Wall area (masonry) | area | Brick, block, stone veneer |
| wl | Wall length (masonry) | length | Coping, caps, base course |
| wh | Wall height (masonry) | length | Vertical rises |
| volm | Masonry volume | volume | Grout fill, solid masonry |

## Fireplace

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| surroundArea | Surround area | area | Stone/brick/tile surround |
| hearthArea | Hearth area | area | Hearth stone/tile |
| hearthPerimeter | Hearth perimeter | length | Hearth base framing |
| chimneyHeight | Chimney height | length | Chimney liner |

## Generic / standard

| Abbr | Name | Type | Notes |
|------|------|------|-------|
| each | Each / per unit | count | Generic single items |
| area | Generic area | area | — |
| length | Generic length | length | — |
| width | Generic width | length | — |
| height | Generic height | length | — |
| depth | Generic depth | length | — |
| thickness | Generic thickness | length | — |
| weight | Generic weight | weight | — |
| volume | Generic volume | volume | — |
| days | Days | count | Duration-based items |
| complexity | Complexity | count | Generic labor multiplier for any trade, 1 = standard. Presets: 0.85 simple, 1 standard, 1.15 moderate, 1.3 complex, 1.5 very complex, 1.75 extreme. Multiply a labor line's quantity by it (e.g. `=fa*complexity`); judge it from layout, detail, obstacles and access, never from a size or pitch that has its own dimension. Roofing uses it in shingle labor (see Roof) |

## Common mistakes to avoid

1. **fa vs slaba** — Use `fa` for interior floors (flooring, tile). Use `slaba` for concrete flatwork (driveways, patios). Never use `slaba` for interior flooring.
2. **fa vs dcka** — Use `dcka` for ALL deck items. Never use `fa` for deck surfaces.
3. **showwall vs shwr** — `showwall` is area (ft2) for tile/waterproofing. `shwr` is count (number of showers). Never use `shwr` for area-based items.
4. **rail vs stair** — `rail` is deck railing length. `stair` is staircase length. A stair handrail uses `stair`, not `rail`.
5. **iwp vs ewp** — `iwp` is interior wall perimeter (baseboard, trim). `ewp` is exterior (siding starter strips, plates). Never use `iwp` for deck/exterior items.
6. **post vs beams** — `post` is post count. `beams` is beam count. Beam brackets use `beams`, not `post`.
7. **siltl vs fenl / fp** — `siltl` is a silt fence run; `fenl` is a property fence build and `fp` a building footprint perimeter. Silt fence and tree protection never use `fenl`, `rail` or `excv`.
8. **Unit conversion** — The system auto-converts units. Never multiply by 12 or divide by 12 in equations.
