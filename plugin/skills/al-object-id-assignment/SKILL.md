---
name: al-object-id-assignment
description: 'Assign AL object, field and enum-value IDs after checking their availability. Use when: creating an AL object, adding a field or enum value, or removing an assigned artifact.'
---

# AL Object ID Assignment

1. Identify the owning application and read its `.objidconfig`.
2. Select the requested range. If several ranges exist and the choice is unclear, ask the
	user. The range bounds are inclusive.
3. Find a free ID for the object type within that range using `al_getnextobjectid`. Pass
	the owning project path and the selected `rangeStart` and `rangeEnd`.
4. Verify the ID is inside the selected range and also belongs to an `idRanges` entry in
	the application's `app.json`.
5. Save the object immediately and record its ID, type, application and selected range.
6. If no valid ID is available, report the issue and ask for another range. If the tool
	is unavailable or denied, report the blocker; do not guess an ID.

The tool does not reserve IDs or inspect other branches and deployed extensions. Report
this limitation and its warnings, and check known conflicts before assigning an ID.

For fields and enum values, check availability within the owning table or enum and its
known extensions; `al_getnextobjectid` does not support them. Record the owner and ID.

Do not automatically reuse IDs from committed or published artifacts.