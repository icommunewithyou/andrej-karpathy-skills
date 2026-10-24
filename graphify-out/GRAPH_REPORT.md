# Graph Report - andrej-karpathy-skills  (2026-10-18)

## Corpus Check
- Corpus is ~7,370 words - fits in a single context window. You may not need a graph.

## Summary
- 72 nodes · 149 edges · 11 communities (8 shown, 3 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 16 edges (avg confidence: 0.89)
- Token cost: 97,579 input · 0 output

## Community Hubs (Navigation)
- Court Setup Commands
- Court Trial Roles
- Think & Simplicity Examples
- Court CLI Entry Points
- Jury Vote Tallying
- Guideline Copies & Sync
- Project & Karpathy Origin
- Goal-Driven Execution
- Juror Brief Prompts
- Surgical Changes
- Graphify Skill

## God Nodes (most connected - your core abstractions)
1. `court skill` - 11 edges
2. `Karpathy-Inspired Claude Code Guidelines` - 11 edges
3. `CLAUDE.md behavioral guidelines` - 10 edges
4. `Examples of the four principles` - 10 edges
5. `cmd_init()` - 9 edges
6. `main()` - 9 edges
7. `karpathy-guidelines skill` - 9 edges
8. `load_state()` - 8 edges
9. `tally()` - 8 edges
10. `jobs()` - 7 edges

## Surprising Connections (you probably didn't know these)
- `court skill` --semantically_similar_to--> `Think Before Coding`  [INFERRED] [semantically similar]
  .claude/skills/court/SKILL.md → CLAUDE.md
- `karpathy-guidelines skill` --semantically_similar_to--> `CLAUDE.md behavioral guidelines`  [INFERRED] [semantically similar]
  skills/karpathy-guidelines/SKILL.md → CLAUDE.md
- `Claude Code plugin (andrej-karpathy-skills@karpathy-skills)` --references--> `karpathy-guidelines skill`  [INFERRED]
  README.md → skills/karpathy-guidelines/SKILL.md
- `karpathy-guidelines skill` --implements--> `Think Before Coding`  [INFERRED]
  skills/karpathy-guidelines/SKILL.md → CLAUDE.md
- `karpathy-guidelines skill` --implements--> `Simplicity First`  [INFERRED]
  skills/karpathy-guidelines/SKILL.md → CLAUDE.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Court trial adversarial roles** — claude_skills_court_skill_prosecutor, claude_skills_court_skill_defense, claude_skills_court_skill_jury, claude_skills_court_skill_judge, claude_skills_court_skill_case_file [EXTRACTED 1.00]
- **Four Karpathy principles** — claude_think_before_coding, claude_simplicity_first, claude_surgical_changes, claude_goal_driven_execution [EXTRACTED 1.00]
- **Synced copies of the guidelines across tools** — claude_behavioral_guidelines, cursor_karpathy_guidelines_mdc, skills_karpathy_guidelines_skill_karpathy_guidelines [EXTRACTED 1.00]

## Communities (11 total, 3 thin omitted)

### Community 0 - "Court Setup Commands"
Cohesion: 0.31
Nodes (6): cmd_init(), cmd_plan(), jury_size(), load_jurors(), run_dir(), save_state()

### Community 1 - "Court Trial Roles"
Cohesion: 0.24
Nodes (10): Case file (.court/case.md), Conditions for acquittal, court skill, court.py bookkeeping tool, Defense Claude, Judge Claude, Jury of 12 Claudes, Prosecutor Claude (+2 more)

### Community 2 - "Think & Simplicity Examples"
Cohesion: 0.28
Nodes (7): Anti-Patterns Summary, Examples of the four principles, Example: Hidden Assumptions (export user data), Example: Multi-Step with Verification (rate limiting), Example: Multiple Interpretations (make search faster), Example: Over-abstraction (discount strategy), Example: Speculative Features (PreferenceManager)

### Community 3 - "Court CLI Entry Points"
Cohesion: 0.39
Nodes (7): cmd_check(), cmd_next(), cmd_render(), cmd_tally(), load_state(), main(), verdict_line()

### Community 4 - "Jury Vote Tallying"
Cohesion: 0.36
Nodes (6): done(), jobs(), missing(), parse_vote(), render(), tally()

### Community 5 - "Guideline Copies & Sync"
Cohesion: 0.67
Nodes (4): CLAUDE.md behavioral guidelines, Cursor integration guide, Cursor rule .cursor/rules/karpathy-guidelines.mdc, karpathy-guidelines skill

### Community 6 - "Project & Karpathy Origin"
Cohesion: 0.40
Nodes (6): Andrej Karpathy, Claude Code plugin (andrej-karpathy-skills@karpathy-skills), Karpathy-Inspired Claude Code Guidelines, Karpathy X post on LLM coding pitfalls, Multica, Chinese README (受 Karpathy 启发的 Claude Code 指南)

### Community 8 - "Juror Brief Prompts"
Cohesion: 0.67
Nodes (3): _abs(), brief_text(), cmd_prompts()

## Knowledge Gaps
- **8 isolated node(s):** `graphify skill (/graphify trigger)`, `Prosecutor Claude`, `Defense Claude`, `Jury of 12 Claudes`, `Trial phases (opening, rebuttal, jury, judge)` (+3 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 13 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **3 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Think Before Coding` connect `Think & Simplicity Examples` to `Court Trial Roles`, `Guideline Copies & Sync`, `Project & Karpathy Origin`?**
  _High betweenness centrality (0.133) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `CLAUDE.md behavioral guidelines` (e.g. with `Cursor rule .cursor/rules/karpathy-guidelines.mdc` and `karpathy-guidelines skill`) actually correct?**
  _`CLAUDE.md behavioral guidelines` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `graphify skill (/graphify trigger)`, `Prosecutor Claude`, `Defense Claude` to the rest of the system?**
  _8 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Why does `court skill` connect `Court Trial Roles` to `Think & Simplicity Examples`?**
  _High betweenness centrality (0.129) - this node is a cross-community bridge._
- **Why does `Karpathy-Inspired Claude Code Guidelines` connect `Project & Karpathy Origin` to `Surgical Changes`, `Think & Simplicity Examples`, `Guideline Copies & Sync`, `Goal-Driven Execution`?**
  _High betweenness centrality (0.071) - this node is a cross-community bridge._