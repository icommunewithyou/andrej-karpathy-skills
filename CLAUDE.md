# CLAUDE.md

Behavioral guidelines to reduce common LLM coding mistakes. Merge with project-specific instructions as needed.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

---

**These guidelines are working if:** fewer unnecessary changes in diffs, fewer rewrites due to overcomplication, and clarifying questions come before implementation rather than after mistakes.

---

# Working on this repository

Everything above is the **product** this repo ships. Everything below applies only when you are editing this repository itself — if you copied this file into another project, you can delete this section.

## What this repo is

A documentation-only repo. There is no source code, no build step, no test suite, no CI, no dependencies, and no lockfile. The deliverable is one set of behavioral guidelines, published through three distribution channels.

## Layout

```
CLAUDE.md                              # Channel 1: per-project file (curl'd by users)
skills/karpathy-guidelines/SKILL.md    # Channel 2: Claude Code plugin skill
.cursor/rules/karpathy-guidelines.mdc  # Channel 3: Cursor project rule (alwaysApply: true)
.claude-plugin/plugin.json             # Plugin manifest; points at skills/karpathy-guidelines
.claude-plugin/marketplace.json        # Marketplace manifest wrapping that plugin
README.md                              # English landing page + install instructions
README.zh.md                           # Simplified Chinese translation of README.md
CURSOR.md                              # Cursor setup + the sync rule for contributors
EXAMPLES.md                            # Long-form ❌/✅ code examples per principle
```

## The one convention that matters: the four principles are duplicated

The body of the four principles exists in **three files that must stay byte-identical** in their principle sections:

1. `CLAUDE.md` (sections 1–4 above)
2. `skills/karpathy-guidelines/SKILL.md`
3. `.cursor/rules/karpathy-guidelines.mdc`

There is no generator and no CI check — nothing will catch a drift for you. If you change wording in one, change it in all three in the same commit, then diff them to confirm:

```bash
diff <(sed -n '/^## 1\./,/^---$/p' CLAUDE.md) \
     <(sed -n '/^## 1\./,/^---$/p' .cursor/rules/karpathy-guidelines.mdc)
```

Only the frontmatter and the one-line intro differ between the three:

- `SKILL.md` has YAML frontmatter with `name`, `description`, `license`, and ends after principle 4 (no "working if" footer).
- `.mdc` has YAML frontmatter with `description` and `alwaysApply: true`, and keeps the "working if" footer.
- `CLAUDE.md` has no frontmatter.

`README.md` and `README.zh.md` restate the same principles in expanded prose. A principle change means updating them too — including the Chinese translation, which is expected to track the English version (see commit "Sync Chinese README with English version").

## Editing rules

- **Don't overwrite `CLAUDE.md` with repo-meta content.** Users fetch this file raw and append it to their own `CLAUDE.md`. The four principles must remain the first thing in the file.
- **Prose style:** ASCII hyphens (`-`) inside the principle bodies, `→` in the goal-transformation lines, bold one-line summary under each `##` heading. Match it.
- **`EXAMPLES.md`** follows a fixed shape per example: user request → `❌ What LLMs Do` with code → `✅ What Should Happen` with code/dialogue. Keep the emoji markers and the four top-level sections mirroring the four principles.
- **Version bumps** must be applied in two places: `.claude-plugin/plugin.json` (`version`) and `.claude-plugin/marketplace.json` (both `metadata.version` and `plugins[0].version`). They are currently all `1.0.0`.
- **Plugin paths** are load-bearing. `plugin.json` `skills: ["./skills/karpathy-guidelines"]` points at a *directory* containing `SKILL.md`; `marketplace.json` uses `"source": "./"` because the marketplace and the plugin live in the same repo. Past commits fixed breakage here — don't restructure these paths casually.

## Verifying a change

There is nothing to run. Verification is manual:

1. JSON still parses → `python3 -m json.tool .claude-plugin/plugin.json .claude-plugin/marketplace.json`
2. All three principle copies match → the `diff` above
3. Relative links in `README.md` / `CURSOR.md` still resolve to existing paths
4. If you touched `README.md`, `README.zh.md` reflects the same change

## Upstream note

`README.md` and both manifests reference `forrestchang/andrej-karpathy-skills` as the owner and install source. This checkout is `icommunewithyou/andrej-karpathy-skills`. That is expected for a fork — leave the upstream references alone unless you are explicitly asked to rebrand.
