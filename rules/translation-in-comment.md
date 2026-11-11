---
bc-version: [all]
domain: translation
keywords: [translation, xliff, xliff-sync, caption, tooltip, label, comment, placeholders]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Provide French translations in AL comments for XLIFF Sync

## Description

For new or changed translatable `Caption`, `ToolTip`, and `Label` text, write the source in
English and include its French translation in `Comment` as `fr-FR=<translation>`. Keep each
source placeholder in the translation and explain placeholders in the developer comment.
Do not add translations to deliberately locked, non-translatable text.

Check each applicable declaration: the French entry is nonempty, its placeholders match the
source, and any other comment text is separated from it by `|`. `fr-FR=` must begin an
entry with no leading space. Check the translation itself for accuracy. The accompanying AL
files are excerpts, not standalone objects.

For this workflow, configure XLIFF Sync in the project's `.vscode/settings.json`:

```json
{
  "xliffSync.useSelfClosingTags": false,
  "xliffSync.parseFromDeveloperNote": true,
  "xliffSync.enableSnippetsForLanguages": ["al"],
  "xliffSync.snippetTargetLanguage": "fr-FR"
}
```

Merge these settings with any existing settings. Build and synchronize XLIFF files using
XLIFF Sync, then check for missing translations and translations needing work. By default,
an existing translation is not overwritten by one parsed from the developer note.

## Best Practice

Separate the placeholder explanation from `fr-FR=` using `|`, the default XLIFF Sync
separator. For multiple languages, use one `<language>=<translation>` entry per language,
separated by `|`. Double apostrophes inside AL string literals.

See sample: [`translation-in-comment.good.al`](translation-in-comment.good.al).

## Anti Pattern

Do not omit the French translation or join it to other comment text with a comma. XLIFF Sync
cannot recognize `fr-FR` as a language entry in that form. Do not remove placeholder
explanations or change placeholders in the translation.

See sample: [`translation-in-comment.bad.al`](translation-in-comment.bad.al).

Source: [XLIFF Sync - Parse from Developer Note](https://marketplace.visualstudio.com/items?itemName=rvanbekkum.xliff-sync).