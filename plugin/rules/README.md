# rules/

These are shared rules shipped with the plugin and applied in every project. The project
may add a rule in its own `rules/`, or override a shared rule by supplying an article with
the same filename and both local examples. The `company-rules` skill applies the merged set.

| Rule | In one line |
|------|-------------|
| `translation-in-comment` | provide French translations in comments for XLIFF Sync |
| `use-table-field-captions` | reuse table and field captions in user-facing messages |

## How the harness uses this folder

- The `company-rules` skill lists both shared and project folders every time; it never works from a fixed list.
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
