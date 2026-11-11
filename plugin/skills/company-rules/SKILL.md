---
name: company-rules
description: 'Load and apply shared plugin and project-local AL rules as mandatory constraints, and report PASS / FAIL per rule. Use BEFORE writing or designing AL, when reviewing AL, and for /done line D7. Enumerate both rule folders every time.'
---

# Company Rules

The plugin's shared rules and the project's optional `rules/` are mandatory AL constraints.
Each rule has one article, a `.good.al` sample and a `.bad.al` sample. Project rules override
shared rules with the same filename; other shared and project rules all apply.

They come **on top of BCQuality**, not instead of it. BCQuality is the general layer
(Microsoft + community best practice) and still applies in full; the company rules add what
your shop decided on top. Where the two disagree, the company rule wins.

This skill returns rules, not answers: after reading them, **you** apply each one to the code
at hand.

## When to use

- Before writing AL (the `al-coder` and `al-sdd` agents), before designing (`al-spec`).
- Reviewing AL (`al-reviewer`), and `/done` line D7.

## Procedure

### 1. Locate and enumerate both folders

Locate the installed copy of this `SKILL.md`. Its plugin root is two directories above its
parent (`company-rules/../..`); read shared rules from `<plugin root>/rules/`, not from a
path relative to the project. When available, `CLAUDE_PLUGIN_ROOT` may identify the plugin
root, but verify that it is the root containing this skill. Do not assume the source checkout
or the current working directory is the installed plugin.

List all `*.md` except `README.md` in the shared folder and in the project root's `rules/`,
if present. Match rules by filename: a project article replaces the shared article of the
same name, including both examples; project-only articles are added. Enumerate both folders
every time, and report each selected rule's source. A missing project folder is fine. If
the installed plugin root or shared folder cannot be found, stop and report the blocker;
do not silently report that no rules exist.

### 2. Select what applies

Read each article's frontmatter `keywords` and its `## Description`. A rule applies when the
code at hand contains what it talks about (a tableextension, a page, a Label, a Meth
codeunit, any `.al` file). In doubt, include it: a rule is cheap to check and expensive to
miss.

### 3. Read the selected rules in full

The whole article plus its `.good.al` and `.bad.al` from the same folder. If either sample
is missing, stop and report the incomplete rule; do not combine sources. The samples are the authoritative form.
Normative are `## Best Practice` and `## Anti Pattern`; the `## Description` says how to check.

### 4. Apply

- **Writing code:** follow the `.good.al` pattern as you write; never emit the `.bad.al`
  pattern.
- **Designing:** list each applicable rule in the spec under `## Decisions` as a constraint
  ("D5 - rule translation-in-comment: include French translations in comments").
- **Checking:** run the check from the rule's Description on every changed `.al` file.

### 5. Report (checking)

```
Company rules (plugin + project, 2 selected, 1 applicable)
  PASS  translation-in-comment        <plugin root>/rules/translation-in-comment.md  app/src/Example.al:5
  N/A   use-table-field-captions       <plugin root>/rules/use-table-field-captions.md  no table or field caption in messages
```

Every line has its selected rule source and evidence (`file:line`) or, for N/A, the reason.
A FAIL on a company rule blocks done.

## Never

- Never add a rule to this skill. Shared rules belong in the plugin's `rules/`; local rules
  belong in the project root's `rules/`.
- Never soften a rule because general guidance says otherwise: the company rule wins.

## Related

- `<plugin root>/rules/README.md` - shared rules and local overrides.
- `definition-of-done` - D7 runs step 5 of this skill.
- `al-knowledge` - general guidance, which these rules override.