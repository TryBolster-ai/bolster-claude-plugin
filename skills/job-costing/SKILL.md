---
name: job-costing
description: Report how a Bolster job is doing against its budget (committed, actual, projected, margin), or which jobs are over budget. Use when the user asks how a job is tracking, about job profit or margin, or about cost overruns.
---

Use the Bolster MCP tools.

1. Find the job with `search` on `quote` by name, customer or address, unless you have its id.
2. Call `job_costing` for it. The numbers are the same as the job's Budget tab in Bolster.
3. Answer first in one line: budget, projected cost, projected margin, and whether it is over or under.
4. Then a short table of the stages or items most over budget, money right-aligned, with committed (vendor orders) and actual (bills and labor) side by side.
5. If something looks off, say what would explain it (a bill not costed to an item, a vendor order not yet billed, labor hours not logged) and offer to look at the bills (`list_bills`) or time (`list_time`) for that job.

For several jobs, use `pipeline_summary` to list the active ones first, then run `job_costing` on the ones the user cares about. Keep to read tools unless the user asks for a change.
