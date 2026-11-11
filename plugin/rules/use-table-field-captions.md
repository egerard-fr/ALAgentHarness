---
bc-version: [all]
domain: translation
keywords: [translation, caption, fieldcaption, tablecaption, label, message, placeholder]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Reuse table and field captions in user-facing messages

## Description

When a user-facing message refers to the displayed name of a specific table or field,
insert its current caption instead of duplicating that name in a `Label`. Use
`Record.TableCaption()` for a table and `Record.FieldCaption(Field)` for a field. This
keeps the message aligned with the caption and its translation when they change.

Check applicable `Error`, `Message`, and `Confirm` labels: replace duplicated table or
field captions with placeholders, pass the corresponding caption as an argument, and
explain each placeholder in `Comment`. Preserve placeholders in translations and follow
`translation-in-comment` for the French translation. Check the resulting sentence in each
language; a caption alone may not supply the grammatical context a sentence needs.

## Best Practice

Use a descriptive `Label` with `%1` and pass the field or table caption to `Message` (or
use `StrSubstNo` when formatted text is needed separately). The sample consists of AL
excerpts, not a standalone object.

See sample: [`use-table-field-captions.good.al`](use-table-field-captions.good.al).

## Anti Pattern

Do not hardcode a table or field caption in the English source and French translation of
a message. Both copies can become inconsistent with the caption displayed by Business
Central after a caption or translation changes.

See sample: [`use-table-field-captions.bad.al`](use-table-field-captions.bad.al).

Sources: [FieldCaption](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/record/record-fieldcaption-method), [TableCaption](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/record/record-tablecaption-method).