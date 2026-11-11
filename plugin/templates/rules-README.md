# rules/

The plugin provides shared rules automatically. This optional project folder adds local
rules or overrides a shared rule with the same article filename and both local examples.
To change a shared rule for every project, update the plugin's `rules/` instead.

## How the harness uses this folder

- The `company-rules` skill lists the plugin and project folders every time; it never works from a fixed list.
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