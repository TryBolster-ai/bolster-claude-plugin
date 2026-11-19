---
name: "schedule-week"
description: "Show and adjust the Bolster schedule: what is on this week, move work, put a job on the schedule, assign crews or vendors. Use when the user asks about the schedule, who is working where, or to move or assign work."
---

Use the Bolster MCP tools.

- **What is on:** `get_schedule` with a date range (no job) for the jobs, then `get_schedule` with a job id for its stages, items and who is assigned. Answer by day.
- **A job not on the schedule yet** (its schedule comes back empty, `onSchedule: false`): offer to put it on with `schedule_job` from a start day, then move items.
- **Move work:** `move_schedule_items` with each item's new first and last day. Read what it answers: an item that did not land where asked was put back by its stage; say so and offer to move the stage instead.
- **Assign:** `assign_items`. Adding keeps whoever is already on the item. Replacing previews who comes off; show that and confirm with the user before the second call.
- **Time:** `log_time` logs finished time for the signed-in user only.

Schedule changes queue the usual notifications in Bolster; they are held until someone sends them from the job. Tell the user that once, the first time you change the schedule.
