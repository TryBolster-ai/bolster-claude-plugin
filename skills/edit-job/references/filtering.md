# Filtering

- Every Bolster search uses this filter syntax.

### Bolster Filter Syntax

Filters map field names → expressions. Operators (left-to-right):

- equality: { quote_id: 123 } will find exactly that entry
- **!**: NOT ("!h" = not 'h')
- **NULL/!NULL**: IS NULL / IS NOT NULL - must be a uppercase string
- **>=, <=, >, <**: Numeric comparisons
- **&&**: AND (">=100&&<5000")
- **||**: OR ("h||p||f")
- **INSET**: translates to INSET in sql ie: {"company_ids": "INSET2"}
- **LIKE**: text match. `"LIKEjoe"` = contains joe (`%joe%`); `"LIKEjoe*"` = starts with joe (`*` becomes `%`); a value with `%` in it (`"%joe%"`) is a raw LIKE. `"*joe*"` without `LIKE` is an exact match, not a wildcard

Examples:

- quote_status: "!h||NULL" - NOT 'h' OR NULL
- quote_price_gross: ">=100&&<5000" - Between 100-5000
- user_id: "1||2||4" - 1 OR 2 OR 4
- For example: { "filters": { "quote_id": "1||2||3", quote_time_created: '>1342342&&<13423434232', quote_status: '!NULL' } }

- Sort/order is defined like this: { "order": [["quote_name", "asc"], ...] }

## Over MCP (the search tool)

- `search` takes `filters` (the syntax above), `query` (keywords), `fields`, `order` (`[["quote_time_created","desc"]]`), `limit` (max 50) and `offset`. Page with offset for more.
- Ask only for the fields you need. Field names per record type: `get_entity_fields`.
- Statuses are codes, never words: see statuses.md. "Open jobs" is a set of codes ("p||k||f"), not "open".
- Times are unix seconds (`quote_time_created`, `invoice_time_due`…). Work out the number from the date first.
- Money fields are numbers: `quote_price_gross` ">=10000".
- To count, page through with a small `fields` list; there is no count tool.
- Lead sources can't be filtered by name in PHP; a keyword query on them is matched on the name.
