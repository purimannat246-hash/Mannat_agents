# About this folder

This is a saved reference snapshot of [gstack](https://github.com/garrytan/gstack) —
Garry Tan's (President & CEO of Y Combinator) open-source Claude Code toolkit.
It ships 23 specialist skills (CEO reviewer, designer, security officer, QA lead,
release engineer, and more) as free, MIT-licensed slash commands.

**Why only a reference snapshot, and not the full source?**

gstack's own installer explicitly avoids vendoring itself inside a project repo —
its `bin/gstack-team-init` script auto-detects and *removes* a full copy if it
finds one, because a copied-in version drifts out of date and never gets
security/bugfix updates. Upstream's own recommendation (see `README.md` in this
folder, "Team mode") is:

1. One person on the team runs the real installer once, globally:
   ```bash
   git clone --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack
   cd ~/.claude/skills/gstack && ./setup --team
   ```
2. That's it — after that, slash commands like `/office-hours`, `/plan-ceo-review`,
   `/design-review`, `/cso`, `/qa`, `/review`, and `/ship` become available in
   Claude Code for anyone working on this repo. See the root `CLAUDE.md` for the
   exact snippet that nudges any teammate who opens this repo to install it.

**Files in this folder:**

- `README.md` — full project overview, install instructions, and the complete
  list of all 23 specialist skills.
- `AGENTS.md` — quick-reference table of every skill and what it does.
- `ETHOS.md` — the design philosophy behind gstack's specialist roles.
- `LICENSE` — MIT license, © 2026 Garry Tan.

**"Skillify" note:** gstack ships a `/skillify` skill that codifies a successful
one-off workflow into a permanent, reusable skill. Once gstack is installed
(step 1 above), that's the tool to use to grow this project's own skill library
over time.
