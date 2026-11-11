# rules/

The plugin supplies shared translation rules to every project. The rules in this folder are
local to this project: they add to the shared rules or override a shared rule with the same
article filename and both local examples. To change shared rules for all projects, edit the
plugin's `rules/` instead; local copies are not synchronized automatically.

| Rule | In one line |
|------|-------------|
| `meth-codeunit-single-public-procedure` | table business logic lives in a Meth codeunit with exactly one public procedure |
| `tableextension-pte-suffix` | new fields and procedures in a tableextension end in ` PTE` |
| `page-no-local-procedures` | pages and page extensions have no local procedures |
| `label-naming` | Labels are named `<Context><Reason>Err`, `...Msg`, `...Qst` |
| `single-object-per-file` | one AL object per `.al` file |
| `translation-in-comment` | provide French translations in comments for XLIFF Sync |
| `use-table-field-captions` | reuse table and field captions in user-facing messages |

## How the harness uses this folder

- The `company-rules` skill lists both plugin and project rule folders every time.
- Agents that write AL (`al-coder`, `al-sdd`) apply every applicable rule while writing.
- `/done` line D7 and the `al-reviewer` agent report PASS / FAIL per rule.
- A rule here wins over general guidance (BCQuality, Microsoft Learn) when they disagree.

## Add a rule (two minutes)

Three files, same base name:

- `<rule-id>.md` - the article, at most ~60 lines, in the format below.
- `<rule-id>.good.al` - the pattern to follow.
- `<rule-id>.bad.al` - the pattern to refuse.

The article uses the BCQuality knowledge-file format, so you can later move it into a
BCQuality `custom/knowledge/` layer unchanged:

```markdown
---
bc-version: [all]
domain: style
keywords: [three, to, ten, search, terms]
technologies: [al]
countries: [w1]
application-area: [all]
---

# <The rule as one sentence>

## Description
What the rule is, where it applies, and why. How to check it in code.

## Best Practice
What to write. See sample: [`<rule-id>.good.al`](<rule-id>.good.al).

## Anti Pattern
What to refuse, and the harm it does. See sample: [`<rule-id>.bad.al`](<rule-id>.bad.al).
```

Then run `/done` again: the new rule shows up as its own line.
