---
name: edit-job
description: Change a Bolster job the way Bolton's editor does - rename, add, remove, move, duplicate, group, change quantities, costs, prices, markup, optional or included flags, or any change across many lines - with every total recalculated by Bolster's audit. Use for any edit to a job's items or assemblies.
---

Use the Bolster MCP tools. You are doing what Bolton's sidebar editor and script writer do inside the app, over MCP. The rules are the same; the references in this skill are Bolton's own, generated from the same sources.

## Read first

- `get_job` for the job: every assembly and item with its refId, name, quantity, unit, cost, price, markup, and the dimensions. Find lines by name (case-insensitive, closest match). Never guess a refId.
- `get_entity_fields` (type `cost_item`, `assembly` or `quote`) when you need a field you have not seen.
- Before a structural or computed change, read [references/job-fields.md](references/job-fields.md): which fields are inputs and which the audit computes. Setting a computed field does nothing: the audit writes it straight back.

## Pick the tool

| The change | Tool |
| --- | --- |
| One quantity (a number, or a formula over dimensions) | `set_item_quantity` |
| One dimension on the job or an assembly (floor area, fence length) | `set_job_dimension` |
| One line's total price or markup; margin on a line | `set_item_price` |
| Add catalog items or assemblies (find them with `search` on `cost_type` or `assembly`) | `add_items_to_job` |
| Remove lines or assemblies | `remove_items` (previews what goes, then confirm) |
| Several of the above together | `edit_job` (all saved together; one refused means none saved) |
| Anything else: renaming, moving, grouping into a new assembly, duplicating an assembly, optional / included flags, a change computed from current values ("up 10%", "round every price", "match the catalog cost"), anything applied to every line that meets a condition | `edit_job_script` |

Every job tool can show the result without saving (`dryRun: true`, or a script run without `save`). Show the user the change and the new total, and save only when they want it saved.

## edit_job_script: the sandbox

The script gets a full copy of the job and changes it like Bolton's script writer does with `job.apply`: any entity, any input field, add, remove, move, clone. Bolster then validates the set, applies it, runs the audit and answers what was added, removed and changed with the totals before and after. A run is a preview; saving needs a second call with `save: true` and the preview's `confirm` value, and it is refused if the result would differ from the preview.

Rules the script writer follows, and so do you:

- Read before you write: check a field exists on the entities before relying on it. When unsure, return what you found instead of guessing.
- Set inputs, never computed fields. "Raise the cost by 10%" = materials cost per unit × 1.1 (and/or labor hours per unit). "Raise the price by 10%" = markup × 1.1. Change margin through markup, never by writing totals.
- A quantity on a line with a formula: clear `cost_type_qty_equation` (set it to `""`) and set `cost_item_qty_net_base`, or the formula wins.
- Optional / not included are flags (`cost_item_is_optional`, `assembly_is_optional`, `cost_item_is_included`), never a rename or a wrapper.
- A group, section, category or package IS an assembly: create one (`as_` refId) and move lines into it in the same script. Never make a copy by moving lines into a new assembly: that empties the original. Duplicate with clone.
- Hierarchy: every entity has `refId`, `type`, `parentRefId`; a parent lists its children in `aoChildren`. Keep both sides in step. New refIds use the type's prefix (`as_`, `co_`).
- Change only what was asked. Never delete or hide anything unless asked.
- Before a bulk change, count what matched and check the units. A price rule across items priced per sq ft, per hour and per lb changes rates, not prices: ask which to change, with how many of each.
- After the run, check its answer: the changed fields and totals must show the change. If they don't, say so; never report a change the result does not show.
- If a run fails, fix the cause in its error; don't repeat the same code.

## What a change does beyond the job

Read [references/concepts.md](references/concepts.md) before changing a job that has been sent, approved or booked: it is how Bolster behaves, from its own documentation. The ones that catch people out:

- **Change orders are automatic.** Every version of a job is a change order; editing a job after the customer has seen it cuts a new version, and on a booked job that version is a change order the customer approves. Don't create change orders by hand.
- **Only the latest version can be booked or declined**, and nothing a change order does can alter a line the customer has already paid for.
- **Statuses move through their own actions**, never by writing a status field.

For anything else about how a feature behaves, `search_docs` / `read_docs_page` (the slugs are in concepts.md).

## Rules from Bolster

- **Dimensions and formulas:** quantities link to dimensions by code (`fa` floor area, `iwp` interior wall perimeter). Units convert automatically: never multiply by 12 to go from feet to inches in a formula. Codes: [references/dimensions.md](references/dimensions.md).
- **Labor:** every line with labor needs a `labor_type_id`, or its labor costs $0. Types: [references/labor-types.md](references/labor-types.md). Units: [references/units.md](references/units.md).
- **Building or extending an estimate** (new scope, selectors, options): follow [references/estimating-best-practices.md](references/estimating-best-practices.md). For new scope from a description, the `estimate-job` skill's AI estimate usually does better than building line by line.
- **Statuses** are codes, and "archive" means the status that takes a record out of sight: [references/statuses.md](references/statuses.md). Change them only with `set_status`.
- **Finding records:** the filter syntax and how `search` takes it: [references/filtering.md](references/filtering.md) (and the `find-records` skill).
- **Saved assemblies:** an item inside a saved assembly links to the catalog by id. Changing a catalog-linked item changes this job only; say so if the user seems to expect the catalog to change too.

## Report

One or two sentences on exactly what the result shows was added, changed and removed, and the job total before → after. Nothing is sent to the customer by editing.
