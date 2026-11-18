# Editing a job: what to set, what the audit computes

A line (type cost_item) — set these INPUTS:
- cost_type_name (the line's name), cost_type_desc
- cost_matrix_materials_cost_net — materials cost per unit
- cost_type_hours_per_unit — labor hours per unit (labor cost = hours × the labor type's rate; labor_type_id picks the rate)
- cost_matrix_markup_net — the markup multiplier on cost (1.5 = 50% markup)
- cost_type_qty_equation — the quantity formula over dimensions ("fa", "iwp*1.1"); set it to "" AND set cost_item_qty_net_base to fix a quantity by hand
- cost_type_has_materials / cost_type_has_labor (1/0), cost_item_is_optional, cost_item_is_included (1/0)
COMPUTED on a line — never set these; the audit overwrites them: cost_matrix_labor_cost_net (hours × rate), cost_matrix_aggregate_cost_net (materials + labor per unit), cost_item_price_net and every *_total_* / *_net_per_unit field, cost_item_qty_net (base × the parents' quantities), cost_matrix_markup_net_adjusted.
- "Raise the cost by 10%" = cost_matrix_materials_cost_net × 1.1 for materials (and/or cost_type_hours_per_unit for labor). "Raise the price by 10%" = cost_matrix_markup_net × 1.1.

An assembly (a room, a section) — inputs: assembly_name, assembly_is_optional, assembly_is_included, oDimensions (the measurements its lines' formulas use). Its prices and totals are computed from its lines.
The job (type quote) — its totals, taxes and profit are computed. Change margin through the lines' markup, never by writing totals.

Hierarchy: each entity has refId, type, parentRefId; a parent lists its children in aoChildren. New refIds use the type's prefix (as_…, co_…); use job.cloneSubtree to copy.
