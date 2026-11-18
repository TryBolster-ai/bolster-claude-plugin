# How Bolster behaves

What a change to a job does beyond the job, and the estimating concepts edits touch, as Bolster's own documentation says it. For the full page, call `read_docs_page` with the slug; for anything else, `search_docs`.

## Jobs (`jobs`)

A job is one record that runs from the first estimate through to the final payment. Pricing it, sending it, booking it, scheduling it, buying for it, invoicing it and closing it are all views of that same record — there is no "convert to project" step, and nothing is ever re-entered.

## Change orders (`change-orders`)

Every version of a job is a change order, and the first one is the original proposal. Versions are cut automatically when you make a change your customer would care about after they've seen the last one. Only the latest version can be booked or declined, booking sweeps up every loose item on the job, and nothing a change order does can alter a line the customer has already paid for.

## Pipeline (`pipeline`)

The pipeline is a read-only board of everything in flight — leads, appointments, estimates, booked jobs, jobs in progress and unpaid invoices. Cards land in a column because of the record's status, not because you dragged them there. Inside each column, cards are bucketed into groups that surface the ones needing attention, and each bucket has a bulk action.

## Running a job (`running-a-job`)

After booking, a job is delivered line by line. Every item walks the same four steps — customer approved the scope, work complete, quality approved by you, paid — and the job's progress percentage is an average of those. Two of the four steps you click; the other two happen to you.

## Approvals & e-signature (`approvals-and-signatures`)

Your customer approves by reviewing the scope and terms, typing their full name into a signature box, and clicking "I accept the terms and conditions". Bolster records the exact terms text they agreed to, their typed name, the time, who they were and their IP address, and produces a signed contract PDF. It is a typed signature, not a drawn one.

## The estimate sheet (`estimate-sheet`)

The estimate sheet is where you build a job — a tree of assemblies and items you edit like a spreadsheet. You work it in the Sheet, Cards or List view over the same data, arrow keys and copy-paste work as you'd expect, and every total on it is the sum of the lines below, not a number you type once.

## Assemblies (`assemblies`)

An assembly is a reusable kit of items priced as one thing — "supply and fit a door", "bathroom, full gut". Set its quantity to 3 and everything inside it multiplies by 3, and the costs roll back up. Assembly quantities always round up to whole numbers, and an assembly pulls fresh prices from your catalog every time you use it.

## Selector tools (`variations`)

A selector tool turns one line on the job into a choice — "Kitchen faucet" instead of one specific faucet — and lets your customer pick from priced options in the proposal. Options can come from your catalog or a generated job-specific list. Their selection re-prices the job. The two things to get right are the order of your option types and having an option for every combination you offer.

## Optional items (`optional-items`)

An optional item is a line already on the job that your customer can switch on or off. Switched off, its quantity goes to zero, so it contributes nothing to the total but stays visible as something they can still add. It is not an add-on — an add-on swaps one thing for another, an optional item is a yes-or-no on a line you have already priced.

## Dimensions & formulas (`dimensions`)

A dimension is a named measurement — floor area, wall perimeter, ceiling height — stored on the job or on an assembly. Item quantities are formulas that read those measurements, so you measure once and every line that uses it prices itself. Typing a measurement on one item writes it up to the job or assembly that owns it, which re-prices every other item using that same measurement.

## Labor & labor rates (`labor-costing`)

Labor cost is your hourly rate multiplied by the hours an item takes. The rate must be fully loaded — gross pay plus employer taxes, benefits and workers' comp — because Bolster applies it exactly as typed and adds nothing. An item or assembly you saved to your library keeps the AutoCost or Bolster labor rate it was saved at — in your catalog and when added to a job — even if we have changed that rate since; the job offers the newer rate quietly, line by line. Lines on your own labor rates always use your current rate.

## Markup, margin & profit (`markup-and-margin`)

Markup is a multiplier applied to your cost. Margin is the share of the sale price you keep. They are two views of one number and Bolster converts between them live — but they are not the same figure, and a 50% markup is only a 33% margin. Price = cost × markup, and everything else on this page is a variation on that.

## Taxes (`taxes`)

A tax rate in Bolster is either one simple percentage on the whole job, or up to four separate taxes — on the whole price, on your own labor, on subcontracted work and on materials — each of which can be charged on the price, on cost only or on profit only. Taxes are shared out by each item's share of cost, not by splitting the line in two.

## AutoCost (`autocost`)

AutoCost is live supplier material pricing and local labor rates, built into the item picker. It's a paid add-on — $99 a month, with a cheaper annual plan and a 45-day free trial — and it covers the United States and Canada. Prices are set by your company's postal or zip code, refreshed automatically, and you review any changes before they hit your job.

## Item & assembly catalog (`catalog`)

Your catalog is the library of items and assemblies your company owns. It sits alongside two libraries Bolster maintains — the AutoCost live-priced catalog and the older Bolster library — and you search all of them from the same picker. The one thing to know before you start copying: the moment you save a Bolster item into your own catalog, that copy stops moving with local market prices, permanently.

## Construction stages (`construction-stages`)

A construction stage says what phase of work an item belongs to — demolition, framing, roofing. It does two jobs at once: it groups items for budgeting and reporting, and it places the work on the schedule in the right order. Every item ends up with a stage whether you choose one or not.

## Schedule & Gantt (`schedule`)

The schedule is built from the estimate — construction stages become group bars, priced items become task bars, and durations come from the labor hours you estimated divided across the crew. It starts as a draft in "Day 1, Day 2" terms and sends nothing to anyone until you set a real start date. Adding a second person to a task halves its planned duration. Deleting a priced item from the schedule never changes the estimate or its price — it can be added back. Deleting a task item deletes it from the job.

## Invoices (`invoices`)

An invoice is always raised against a booked job, for a dollar amount or a percentage of the job. Start it from inside the job and the job is filled in for you; start it from the company invoices list and you pick the job first. You choose summary or itemised before you save — after that the job, the amount and that choice are locked. Invoices are the alternative to progress payments, not an addition to them.

## Progress payments & terms (`progress-payments`)

Payment terms decide when your customer gets billed. You pick one of four types — rolling basis, percentage, stage based or phase based — and Bolster builds the payment schedule from the items on the job. As you approve work, the schedule fills up and payment requests are created for you.

## Deposits (`deposits`)

There is no deposit button in Bolster. A deposit is simply the first payment in your payment schedule — on rolling basis you bill your material items up front, and on percentage, stage or phase terms your first milestone is the deposit. The result is the same: money in before work starts.
