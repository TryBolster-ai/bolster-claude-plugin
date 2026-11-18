# Labor types reference

Quick reference for Bolster system-default `ac-*` labor types. These are used
by the estimating pipeline as the **absolute last-resort fallback** when no
AI setting, stage default, or company-custom labor type matches a given
stage.

## How labor type resolution works

Every cost item with `cost_type_has_labor = 1` MUST have a `labor_type_id`,
or the item will save with `$0` labor cost and cause downstream audit errors.

The estimating pipeline resolves a labor type for each stage via this priority
chain:

1. **User preference** — `settings.estimating.laborRates[stageId]` from AI
   Estimating Settings.
2. **Stage's own `labor_type_id`** — if the stage record has a default labor
   type linked.
3. **Company-custom labor type matching the stage's `trade_type_id`** — any
   custom labor type belonging to the current company whose `trade_type_ids`
   includes the stage's trade.
4. **LLM inference** — if the prompt callback is provided, the LLM picks the
   best match from the available labor types.
5. **Company general labor type** — the company's own "General" labor type
   (name contains "general" or `labor_type_is_default = 1`).
6. **System general fallback** — the first of Bolster's system-default labor
   types that matches the trade.
7. **Role-based fallback** — the item's name is matched against the roles
   each system labor type covers (e.g. "electrical" → `ac-8` "1 electrician").
8. **Absolute fallback** — `DEFAULT_FALLBACK_LABOR_TYPE_ID` = `ac-3`
   "1 laborer". If nothing else fits, every labor item gets this.

## Why rates are NOT stored in the reference

Rates are `labor_type_is_indexed: 1` — they get location-scaled per-company
via the `mod` when `AutoCost.fetchLaborType({ id })` runs. Storing them in
code would be wrong for every company except the one the data was pulled
from. Only stable identifiers (`labor_type_id`, `name`, `roles`) are kept in
the reference.

When the pipeline selects a fallback id from the reference, it immediately
calls `AutoCost.fetchLaborType({ id, useCache: true })` which fetches the
labor type with correctly-scaled rates.

## Absolute fallback

| Field | Value |
|-------|-------|
| `DEFAULT_FALLBACK_LABOR_TYPE_ID` | `ac-3` |
| Name | 1 laborer |
| When used | No other tier matched — every labor item gets this if nothing else fits |

## Single-trade labor types (`ac-1` … `ac-25`)

All active, `company_id = null`, `collection = 'AutoCost'`, `is_indexed = 1`.

### Masonry & stone
| id | name | role match |
|----|------|------------|
| `ac-1` | 1 bricklayer | bricklayer, mason, brickmason, masonry |
| `ac-2` | 1 bricklayer's helper | bricklayer helper, mason helper, masonry helper |
| `ac-12` | 1 marble setter | marble setter, marble, stone setter, stonemason, stone |
| `ac-14` | 1 mosiac & terrazzo worker | mosaic, mosiac, terrazzo |

### Carpentry & framing
| id | name | role match |
|----|------|------------|
| `ac-4` | 1 carpenter | carpenter, carpentry, framer, framing, deck, wood, trim, finish carpentry |

### Concrete
| id | name | role match |
|----|------|------------|
| `ac-5` | 1 cement mason | cement mason, concrete finisher, concrete, slab, footing, foundation |

### Drywall
| id | name | role match |
|----|------|------------|
| `ac-6` | 1 drywall installer | drywall installer, drywall install, gypsum, sheetrock |
| `ac-7` | 1 drywall taper | drywall taper, drywall finish, tape, mud, joint |
| `ac-11` | 1 lather | lather, lath |
| `ac-17` | 1 plasterer | plasterer, plaster, stucco |
| `ac-18` | 1 plasterer helper | plasterer helper, plaster helper |

### Electrical
| id | name | role match |
|----|------|------------|
| `ac-8` | 1 electrician | electrician, electrical, wiring, outlet, switch, lighting, panel, circuit |

### Flooring
| id | name | role match |
|----|------|------------|
| `ac-9` | 1 floor layer | floor layer, flooring, hardwood, laminate, vinyl, lvp, tile floor, carpet install |

### Glass
| id | name | role match |
|----|------|------------|
| `ac-10` | 1 glazier | glazier, glass, window install, glazing |

### Industrial / mechanical
| id | name | role match |
|----|------|------------|
| `ac-13` | 1 millwright | millwright, machine install, industrial install |

### Equipment operators
| id | name | role match |
|----|------|------------|
| `ac-15` | 1 operating engineer | operating engineer, equipment operator, excavator, bobcat, skid steer, backhoe |
| `ac-25` | 1 truck driver | truck driver, trucking, haul, dump |

### Paint
| id | name | role match |
|----|------|------------|
| `ac-16` | 1 painter | painter, paint, staining, stain |

### Plumbing
| id | name | role match |
|----|------|------------|
| `ac-19` | 1 plumber | plumber, plumbing, pipe, drain, supply, sink install, toilet install, faucet |

### Rebar
| id | name | role match |
|----|------|------------|
| `ac-20` | 1 reinforcing iron worker | reinforcing iron worker, rebar, ironwork, reinforcement |

### Roofing
| id | name | role match |
|----|------|------------|
| `ac-21` | 1 roofer | roofer, roofing, shingle, underlayment, flashing, gutter |

### HVAC / sheet metal
| id | name | role match |
|----|------|------------|
| `ac-22` | 1 sheet metal worker | sheet metal, ductwork, hvac install, tin knocker |

### Fire protection
| id | name | role match |
|----|------|------------|
| `ac-23` | 1 sprinkler fitter | sprinkler fitter, sprinkler, fire protection |

### Tile
| id | name | role match |
|----|------|------------|
| `ac-24` | 1 tile layer | tile layer, tile setter, tile install, tile, backsplash |

### Generic (default fallback)
| id | name | role match |
|----|------|------------|
| `ac-3` | 1 laborer | laborer, labourer, general labor, general labour, helper, handyman, demo, demolition, removal, disposal, cleanup, prep |

## Crew combinations (`ac-26` … `ac-39`)

Multi-trade crew labor types — useful when a task realistically needs a mixed
crew rather than a single trade. Role matcher checks these AFTER single
trades, so a search for "carpenter" picks `ac-4` first but "framing crew"
picks `ac-26`.

| id | name | role match |
|----|------|------------|
| `ac-26` | 1 laborer, 1 carpenter | carpenter crew, framing crew, carpentry crew |
| `ac-27` | 1 laborer, 2 carpenters | large framing crew, large carpentry crew |
| `ac-28` | 2 laborers, 1 carpenter | carpenter plus helpers |
| `ac-29` | 1 laborer, 1 operating engineer, 1 reinforcing iron worker | concrete reinforcement crew, rebar crew |
| `ac-30` | 1 laborer, 1 carpenter, 1 cement mason, 1 operating engineer, 1 reinforcing iron worker | full concrete crew, foundation crew, slab crew |
| `ac-31` | 1 laborer, 1 cement mason | concrete crew, cement crew, slab labor |
| `ac-32` | 1 laborer, 1 truck driver | haul crew, disposal crew, dump crew |
| `ac-33` | 1 laborer, 1 operating engineer | excavation crew, grading crew, site prep crew |
| `ac-34` | 1 bricklayer, 1 bricklayer's helper | masonry crew, brick crew |
| `ac-35` | 1 drywall installer, 1 drywall taper | drywall crew |
| `ac-36` | 1 laborer, 1 plumber | plumbing crew, rough-in crew |
| `ac-37` | 1 painter, 1 laborer | paint crew, painting crew |
| `ac-38` | 1 roofer, 1 laborer | roofing crew |
| `ac-39` | 1 tile layer, 1 laborer | tile crew, backsplash crew |
