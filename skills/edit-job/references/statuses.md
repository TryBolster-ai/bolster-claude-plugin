# Statuses

## Record statuses (always codes)
- A status is ALWAYS one of the type's codes below (one or two letters), never a word: filter with quote_status: 'f', not 'In Progress' or 'Inactive'. Words exist only for the user.
- Never set a <type>_status field directly. Change status with the `set_status` tool.
- "Archive", "put away", "get rid of", "I don't want to see these" mean the type's archive status below (a job: Declined if it was Pending, Closed if Booked or In progress): a status that sends the record out of sight, never one that keeps it in an active list (Pending, Declined, In progress, Booked). Use the status the user names when the type has it.
- A type that has no such status cannot be given it: say so and name the statuses it has.

- activity: u Incomplete, c Completed
- appointment: k Booked, x Cancelled, c Completed, r Approved — archive: markAs 'Cancelled' (x)
- assembly: a Active, i Inactive, y Draft, h Hidden, @ Shared library item — archive: markAs 'Inactive' (i)
- change_order: p Pending, k Booked, h Hidden — archive: markAs 'Deleted' (h)
- client: a Active, i Inactive, b Blocked, l Lead — archive: markAs 'Inactive' (i)
- company: a Active, i Inactive — archive: markAs 'Inactive' (i)
- cost_item: a Active, h Hidden — archive: markAs 'Deleted' (h)
- cost_type: a Active, h Hidden, i Inactive, y Draft, @ Shared library item — archive: markAs 'Inactive' (i)
- file: p Pending, v Archived, h Hidden — archive: markAs 'Archived' (v)
- invoice: o Outstanding, e Paid, h Hidden, p Pending, $ Payment processing, x Cancelled — archive: markAs 'Cancelled' (x)
- item: p Pending, d Declined, f In Progress, x Cancelled, q Seen, r Approved, c Completed
- labor_type: a Active, h Hidden — archive: markAs 'Deleted' (h)
- notification: n Not Seen, q Seen
- payment_method: a Active, i Inactive — archive: markAs 'Inactive' (i)
- payment_request: o Outstanding, p Pending, e Paid, x Cancelled, n Not Seen
- payment_segment: a Active, c Completed, i Inactive — archive: markAs 'Inactive' (i)
- payment_segment_item: a Active, c Completed, i Inactive — archive: markAs 'Inactive' (i)
- quote: p Pending, d Declined, k Booked, f In Progress, g Closed, h Hidden — archive: Declined (d) if Pending, Closed (g) if Booked or In progress
- receipt: e Paid, h Hidden — archive: markAs 'Deleted' (h)
- role: a Active, h Hidden — archive: markAs 'Deleted' (h)
- role_permission: a Active, h Hidden — archive: markAs 'Deleted' (h)
- tax: a Active, h Hidden — archive: markAs 'Deleted' (h)
- task: u Incomplete, c Completed
- template: a Active, i Inactive, h Hidden — archive: markAs 'Inactive' (i)
- transaction: q Seen, r Approved, c Completed, x Cancelled
- transfer: w In transit, q Seen, re re, f In Progress
- user: a Active, i Inactive, b Blocked — archive: markAs 'Inactive' (i)
- vendor: a Active, i Inactive — archive: markAs 'Inactive' (i)
- webhook: a Active, i Inactive — archive: markAs 'Inactive' (i)
