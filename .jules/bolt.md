
## 2024-04-27 - [Memoizing Static LFG Info]
**Learning:** In the filtering core (`Main.lua` doing hundreds of passes), repeatedly calling `PGF.Table_Copy_Rec` on `C_LFGList.GetActivityInfoTable` leads to huge overhead through deep copies of static dictionaries.
**Action:** Memoize and cache these tables by their ID (like `resultID` returning `activityInfo`) globally to prevent excessive garbage collection and deep copying overhead during continuous LFG filter sweeps.
