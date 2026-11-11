---
name: al-object-id-assignment
description: 'Assign object, field and enum-value IDs from exclusive .objidconfig ranges before writing AL. Use when: creating an AL object, adding a field or enum value, or removing an assigned artifact. Check availability and record the assignment; never claim that a local scan reserves an ID.'
---

# AL Object ID Assignment

Assign IDs from an exclusive, approved range in the owning app's `.objidconfig`. The range
belongs to one developer working on one feature at a time; it must not be used by another
active branch or developer. This replaces Ninja: do not call its tools or rely on its
reservation service.

`al_getnextobjectid` scans the local project; it does not reserve IDs or inspect other
extensions deployed to the same environment. Exclusive ranges and the checks below reduce
collision risk but do not provide a central reservation service.

## When to use

- Before creating an AL object or adding a field or enum value.
- When removing an artifact whose ID was assigned by this workflow.
- Not when changing the body of an existing object: it keeps its ID.

## Procedure

### 1. List artifacts and identify their owning app

List each object, field added to an existing table, and value added to an existing enum.
`app/` and `test/` are separate apps with separate configurations. A field in a new table
or a value in a new enum only needs to be unique within that new object; number these
locally and check for duplicates.

### 2. Establish an exclusive range

Read `<app>/.objidconfig` as JSON. Each `idRanges` entry has inclusive `from` and `to`
bounds and a `description`. The description must unambiguously identify both the feature
and the developer or other exclusive owner. Select the entry for this work; do not infer
ownership from a generic app description.

The allocation must be approved and merged to the shared default branch before IDs are
assigned. Verify that the entry matches that branch, does not overlap another allocation
in the app, and is not shared with another active branch or developer. The team must also
coordinate ranges with other extensions that can be installed together. If ownership,
approval, exclusivity, or cross-extension coordination cannot be established, stop and
ask the user to resolve it. Do not silently split, claim, or widen a range.

### 3. Assign object IDs

Discover `al_getnextobjectid` and use its current schema. Pass the owning project path,
object type, and the selected `rangeStart` and `rangeEnd`. The tool intersects the bounds
with the app's permitted ranges. If it is unavailable, denied, returns no ID, or reports an
invalid range, stop and report the blocker; do not guess an ID or use Ninja as a fallback.

The returned ID is a candidate, not a reservation. Check it is unused for that object
type in the owning app and against the team's known allocations in other extensions.
Report the tool's warnings, including its inability to detect installed dependencies or
other extensions. Write and save the object immediately before requesting the next ID;
never assume consecutive calls reserve distinct IDs. A multi-ID result may be used only
for the requested object type, with each candidate checked and used once.

### 4. Assign fields and enum values

`al_getnextobjectid` does not support fields or enum values. For an existing table or enum,
use the exclusive range assigned to this work and check the candidate against the base
object and every known extension of that same table or enum, including available dependency
symbols and the team's other repositories or allocation records. Field IDs are scoped to
their table; enum-value IDs are scoped to their enum. An object ID of the same number is
not evidence that a field or enum value is available.

If the base object, applicable extensions, or cross-repository allocations cannot be
checked, stop and ask the user to resolve availability. Record each assignment immediately
and check other assignments made in this work before selecting another candidate. Never
reuse an ID known to have been published without an explicit compatibility decision.

### 5. Record and validate

Record each assignment with its app, artifact type, name, ID, selected range and, for a
field or enum value, the owning table or enum. When a spec is in play, fill its `## Reserved
IDs` table with the assignments; its historical title does not mean they are centrally
reserved. Keep concrete IDs out of draft specs until they have been assigned.

Before merging, validate range ownership, overlaps, membership, and duplicate IDs for the
relevant scopes against the shared branch and known extensions. Run any configured CI
checks; if they do not exist, report that this validation is manual, not enforced. A green
build alone does not establish cross-branch or cross-extension availability.

### 6. Remove unused assignments

If an uncommitted artifact is dropped, remove its assignment record; no release service is
involved. For committed or published artifacts, do not automatically recycle IDs: follow
the team's compatibility and retention policy. Record removed or retained IDs in the report.

## Hard stop

No hard stop, try to find the best available ID while respecting the allocation rules and checks.
Stop only if objectId is not in range specified in the app.json file. 

## Related

- `al-build-validation` - run after the artifact is written.
- `specs/TEMPLATE.md` - the `## Reserved IDs` table records assignments for `/done`.