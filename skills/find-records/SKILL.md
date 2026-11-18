---
name: find-records
description: Find Bolster records precisely - jobs, customers, invoices, tasks, vendors, vendor orders, files, catalog items, assemblies, lead sources - with Bolster's filter syntax (status codes, number ranges, dates, text matches, sorting, paging). Use whenever the user asks to find, list, count or look up anything in Bolster.
---

Use the Bolster MCP `search` tool, then `fetch` (or `get_job`) for the full record. The syntax and rules are Bolster's own: [../edit-job/references/filtering.md](../edit-job/references/filtering.md).

## How to search

1. Pick the record type (`entityType`): `quote` (jobs), `client` (customers), `invoice`, `task`, `vendor`, `vendor_order`, `file`, `cost_type` (catalog items), `assembly`, `lead_source`.
2. Don't guess field names: `get_entity_fields` with the type (and a keyword) lists them.
3. Put conditions in `filters`, not in your head: one field per condition, all must match.
4. Ask for just the `fields` you'll show, sort with `order`, and page with `limit` (max 50) + `offset`. Say when there are more than you showed.

## The syntax in one table

| You want | Filter value |
| --- | --- |
| Exactly | `{"client_id": 123}` |
| Not | `{"quote_status": "!d"}` |
| Empty / not empty | `"NULL"` / `"!NULL"` |
| Range | `{"quote_price_gross": ">=10000&&<50000"}` |
| One of | `{"quote_status": "p||k||f"}` |
| Contains text | `{"quote_name": "LIKEdeck"}` |
| Starts with | `{"quote_name": "LIKEdeck*"}` |
| Newest first | `order: [["quote_time_created", "desc"]]` |

- **Statuses are codes, never words.** Look the codes up in [../edit-job/references/statuses.md](../edit-job/references/statuses.md) (a job: `p` pending, `k` booked, `f` in progress, `d` declined, `g` closed …). "Open jobs" is a set of codes, not a word.
- **Dates are unix seconds.** Work out the number for the date first (start of 1 January 2026 UTC = 1767225600).
- `"*deck*"` without `LIKE` is an exact match, not a wildcard. Use `LIKEdeck`.
- `query` is keyword search across a type's searchable columns; use it for names when you don't know the field, and filters for everything exact.

## Examples

| Ask | Call |
| --- | --- |
| Pending jobs over $20k, biggest first | `search` `quote`, filters `{"quote_status":"p","quote_price_gross":">=20000"}`, order `[["quote_price_gross","desc"]]` |
| Invoices due this month and not paid | `search` `invoice`, filters `{"invoice_status":"o","invoice_time_due":">=<month start>&&<<next month start>"}` |
| Customers named Garcia | `search` `client`, query `Garcia` (or filters `{"user_lname":"LIKEgarcia"}`) |
| Catalog items for decking | `search` `cost_type`, query `deck` |

Before acting on a list (archiving, sending, changing), count what matched and show the user what you found.
