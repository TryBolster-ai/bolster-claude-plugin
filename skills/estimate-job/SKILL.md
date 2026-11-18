---
name: estimate-job
description: Build a priced Bolster estimate with Bolster's AI estimator from a description of the work, site photos, plans or drawings, or an existing quote or itemised document to recreate. Use whenever the user asks to quote, estimate, price or create a job for some work (a deck, a reroof, a pool, a kitchen), for one customer or several.
---

Use the Bolster MCP tools.

Asking for a quote IS asking for an AI estimate. Don't create a blank job first, and don't ask before spending credits: the user already asked.

1. **Start right away** with `start_estimate`, one per job, all at once when there are several. Pick `mode` by what the user gave you:

   | They gave | `mode` | `fileIds` |
   | --- | --- | --- |
   | Words only: described work | `prompt` | none |
   | Photos of the site | `photos` | the photos |
   | Floor plans, drawings, blueprints | `plans` | the drawings |
   | An existing quote, estimate, bid or itemised spreadsheet, PDF or document to recreate | `import` | that document |

   Import rebuilds the document as the job and saves reusable assemblies to the catalog; its objective is optional extra instructions. The objective is the user's own words for the work (sizes, materials, address, anything they said). Missing details don't block it: the estimator assumes typical sizes and states them. Put a street address or city in the objective: it becomes the job address and its prices are local. Give `customerId` (from `search` on `client`) and `jobName` when you know them; `quoteId` only to estimate into a job that already exists: with `replaceExisting: true` to re-estimate or redo it (its old lines are replaced), without it to add new scope to what's there.
2. If the user mentions photos, plans or a document already in Bolster, find their file ids with `search` on `file` and pass them in `fileIds`; a file they hand you goes up with `upload_file` first. Photos and plans together: start with `plans` (the drawings set the sizes).
3. **While it runs,** ask in one short message for what would sharpen it, only what matters for that work: a deck's size, height and material; a roof's address (for its measurements) and material; a pool's size, shape and finish. Then check `estimate_status` about every 30 seconds; say when a step changes, not on every check. It usually takes a few minutes.
4. **When it is ready,** read the job with `get_job` and summarize: the total, the main groups and their prices, the options the customer can choose, and the assumptions it made. Point out anything that looks wrong (a zero price, a quantity far off the description).
5. **With the user's answers,** change the job (the `edit-job` skill) rather than starting over, unless the work itself changed.
6. **If a run failed,** say why from its error in plain words. If the error says to start again, start again once with the same objective; never run two on the same job at once.

Nothing is sent to the customer. Changes after the draft go through the `edit-job` skill, with the user's say-so. For what a good estimate holds (scope, selectors, sizing), the same rules Bolton's estimator follows are in the `edit-job` skill's `references/estimating-best-practices.md`.
