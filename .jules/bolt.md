## 2024-05-19 - String Operation Bottlenecks in LFG List Updates
**Learning:** Functions like `PGF.IsMostLikelySameInstance` that perform heavy string allocations (bracket removal loops, gmatch/gsubs for tokenization) can cause significant UI stuttering when called frequently during frame updates. Since the set of instance names is small and bounded, repeated complex parsing is wasteful.
**Action:** Always lift static lookup tables (like regex pattern arrays) outside of functions to module scope to avoid re-instantiation. Use memoization (caching) via a composite string key for functions performing repetitive, deterministic, heavy string parsing when inputs have low cardinality.

## 2024-05-20 - Dynamic Lua Compilation Bottleneck in Filter Execution
**Learning:** Calling `load()` to compile Lua strings dynamically inside high-frequency loops, such as LFG list filtering which is evaluated per-search-result, causes redundant CPU overhead and can lead to UI blocking/stuttering since the expression text usually remains constant for a given filter pass.
**Action:** Always cache the compiled function object (e.g., via simple memoization checking the expression string) when executing dynamically provided expressions over collections.
## 2024-05-18 - Avoid Table and Metatable Allocations in Search Filters
**Learning:** WoW add-ons heavily rely on `OnUpdate` or frequent event triggers (like LFG search updates). Re-allocating tables, metatables, or extracting static regex numbers on *every single result* during filtering causes massive unnecessary garbage collection pressure and can stutter the UI.
**Action:** Always lift static metatables and their closures to the module scope. Use localized caches for repeated strings and pre-flatten static array loops (like keyword lookups) into single flat tables when hydrating large data structures sequentially.

## 2024-05-21 - Intermediate Table Allocations and string.match limitations
**Learning:**
1. `JaccardIndex` calculation and similar set operations don't need intermediate table allocations to compute intersection/union counts if done correctly within the loop, reducing GC pressure during frame updates.
2. Lua's standard `string.match` does not support regex alternation (`|`), meaning standard regex patterns like `^(the|die)$` silently fail and don't match.
**Action:** Use O(1) hash maps for multi-string exact matching instead of `string.match` with alternations, and calculate statistics on-the-fly rather than building intermediate tables just for counts.
