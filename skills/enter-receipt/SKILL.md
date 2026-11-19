---
name: "enter-receipt"
description: "Enter a receipt or vendor bill in Bolster from a photo or PDF, costed to the right job and item. Use when the user shares a receipt or bill, or asks to log an expense in Bolster."
---

Use the Bolster MCP tools.

1. Read the receipt with `read_receipt` (a drive file id, or the image as base64). It returns the vendor, total, tax and lines it found.
2. Find the vendor with `search` on `vendor`. If there is none, ask before creating one with `create_record`.
3. Ask which job it is for if the user hasn't said, then read the job with `get_job` and match each receipt line to the job item it belongs to (by name and trade). Show the matches as a short table and let the user correct them.
4. Create it with `create_bill`: type `receipt` for something already paid at the till, `bill` for something the vendor will be paid for later. Keep the tax as read unless the user corrects it.
5. Say what was saved and its approval status. If it needs approval, say who approves it in Bolster; never try to get around an approval.

Record a payment to the vendor only when the user says it was paid, with `record_vendor_payment` (it previews first; confirm with the user before the second call). Nothing here moves money.
