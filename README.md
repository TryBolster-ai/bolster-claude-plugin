# Bolster for Claude

Work your [Bolster](https://www.bolsterbuilt.com) account from Claude: AI estimates, jobs and
customers, bills and receipts, vendor orders and bid requests, the schedule, time, lead forms and
job costing.

This plugin connects Claude to Bolster's MCP server (`https://mcp.bolsterbuilt.com/mcp`) and adds
skills for the common jobs:

| Skill | What it does |
| --- | --- |
| `setup-account` | Sets up a new company from its own documents (old quotes, price lists, terms, logo) with Smart Build-out |
| `estimate-job` | Builds a priced estimate from a description, site photos, plans, or an existing quote |
| `edit-job` | Changes a job's lines, quantities, prices and options, with every total recalculated |
| `find-records` | Finds jobs, customers, invoices, tasks, vendors and catalog items precisely |
| `enter-receipt` | Enters a receipt or vendor bill from a photo or PDF, costed to the right job |
| `job-costing` | Reports how a job is tracking against its budget |
| `schedule-week` | Shows and adjusts the schedule and who is assigned |

## Install (Claude Code)

```
/plugin marketplace add TryBolster-ai/bolster-claude-plugin
/plugin install bolster@bolster-tools
```

The first time Claude uses a Bolster tool it opens Bolster to sign in. Choose the companies to
connect (or your own projects as a homeowner) and approve. The plugin carries no keys: every call
acts as you, with your own permissions in Bolster. You can disconnect at any time.

## Without the plugin

Claude on the web, desktop and mobile can connect to the same server as a connector:
**Settings → Connectors → Add custom connector**, with `https://mcp.bolsterbuilt.com/mcp`.

## Privacy and support

- Privacy policy: https://www.bolsterbuilt.com/privacy-policy/
- Documentation: https://www.bolsterbuilt.com/docs
- Help: https://www.bolsterbuilt.com/learn/connect-bolster-to-claude-and-chatgpt/
