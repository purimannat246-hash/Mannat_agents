# Mannat_agents

This repo is set up as a virtual startup team: 10 specialist Claude Code
subagents (`.claude/agents/`) that plug into any project here, each with a
narrow role, plus [gstack](https://github.com/garrytan/gstack) — Garry Tan's
open-source Claude Code toolkit — for the underlying workflows (CEO review,
design review, security audits, QA, shipping, and more).

## The team

```
                     board-agent (final sign-off, big/risky bets only)
                          |
                      ceo-agent (strategy, scope, go/no-go)
                          |
                product-manager-agent (spec, user stories, priorities)
                          |
        +-----------------+-----------------+
        |                 |                 |
design-lead-agent   frontend-engineer-agent   backend-engineer-agent
        |                 |                 |
        +--------> security-officer-agent (audits anything touching
        |          auth / PII / payments / external input)
        |
        +--------> qa-lead-agent (verifies the golden path + edge cases)
                          |
                devops-release-agent (tests, CI, ship, deploy, rollback)
                          |
                technical-writer-agent (docs, changelog, release notes)
```

**How it flows:** an idea goes to `ceo-agent` for a strategic gut-check, then
`product-manager-agent` turns an approved idea into a testable spec. Design
and engineering build against that spec, `security-officer-agent` reviews
anything sensitive, `qa-lead-agent` verifies it actually works, and
`devops-release-agent` ships it. `technical-writer-agent` keeps docs in sync.
`board-agent` only gets pulled in for genuinely big, expensive, or risky
calls that `ceo-agent` flags — not routine feature work.

Each agent is defined in `.claude/agents/<name>.md` with its own trigger
conditions — Claude Code invokes the right one automatically based on what
you ask for, or you can name one directly ("use the security-officer-agent
to review this").

**Want this team in every project, not just this one?** Run `./install.sh`
from this repo's root (on the machine where you actually use Claude Code —
not a cloud/remote session). It copies the 10 agents into `~/.claude/agents/`,
which Claude Code loads for every project on that machine automatically. This
repo stays the source of truth — edit an agent here, commit, then re-run
`./install.sh` to sync your global copy.

## gstack (recommended)

This project is set up to work with [gstack](https://github.com/garrytan/gstack) —
23 free, MIT-licensed Claude Code skills covering the same kind of roles as
the team above (CEO review, design review, security audits, QA, shipping) as
slash commands, plus a `/skillify` command for turning a workflow into a
permanent new skill. A saved reference copy of gstack's docs (what each skill
does, full README) lives in `docs/gstack-reference/`.

Install it for the best experience:

```bash
git clone --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack
cd ~/.claude/skills/gstack && ./setup --team
```

Skills like `/office-hours`, `/plan-ceo-review`, `/design-review`, `/cso`,
`/qa`, `/review`, `/ship`, and `/skillify` become available after install.
Use `~/.claude/skills/gstack/...` for gstack file paths. See
`docs/gstack-reference/AGENTS.md` for the full skill list.
