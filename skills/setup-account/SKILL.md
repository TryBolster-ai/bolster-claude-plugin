---
name: setup-account
description: Set up a new company's Bolster account from its own documents with Smart Build-out (markup, payment terms, terms and conditions, logo and theme, tax and labor rates, company details, a catalog, an assembly and an example job). Use when the user is new to Bolster, says they just signed up, or asks to set up, onboard, configure or import their company, catalog or price list.
---

Use the Bolster MCP tools.

1. **Ask for their documents,** in one short message. The more they give, the better the setup:
   - old quotes or estimates they sent customers;
   - supplier price lists or item lists;
   - plans or drawings, and material takeoffs from past jobs;
   - their contract or terms and conditions;
   - their logo;
   - their website.
   Anything they already have in Bolster's drive can be used as it is: find it with `search` (entityType `file`).
2. **Upload each file** with `upload_file` and `folder: "onboarding"` (text as `text`, anything else as `contentBase64`, up to 4 MB each; larger files go up in the app). Keep each returned file id and name.
3. **Start** with `start_setup`: every file id with its name, the website, and anything they said about how they work in `notes`. It uses AI credits and is refused when the company has none left or a setup is already under way; say which, in plain words. Nothing is saved to the company yet.
4. **While it builds,** check `setup_status` about every 30 seconds; say when the step changes, not on every check. It usually takes several minutes. If a file was read as the wrong thing, fix it at the review.
5. **When it is ready for review** (status `k`), read `get_setup_review` and show them what will change: each enabled row's current and proposed value, the files and what each was read as, how many catalog items were built, and the example job (read it with `get_job` if they want to see it).
6. **Apply their changes** with `edit_setup_review`: `{ kind: "row", key, patch: { enabled, proposed } }` to turn a setting off or change it, `{ kind: "entry", key, entryId, patch }` for one tax or labor rate, `{ kind: "role", inputId, role }` for a file read as the wrong kind. Show the result again.
7. **Confirm only when they say so,** with `confirm_setup`. Then check `setup_status` about every 30 seconds until `applied` is true, and report what was saved and anything listed in `applyResult.failed`.
8. **If it failed,** say why from its error. To try again, `start_setup` with the same files. `cancel_setup` stops a setup that has not been confirmed; a confirmed one cannot be stopped.

Statuses are codes: `p` starting, `a` building, `k` ready for review, `r` confirmed, `n` failed, `x` cancelled. Nothing is sent to customers or vendors.
