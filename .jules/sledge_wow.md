## [1.2.1] - [Bug] Fix EditBox focus trap
Root Cause: WoW Addon `EditBox` components (like `InputBoxTemplate`) do not automatically lose focus when Enter is pressed, causing them to trap user input.
Prevention: Added handlers for `OnEnterPressed` to call `:ClearFocus()` on all relevant `EditBox` UI components.

## [@project-version@] - [Bug] Fix pcall non-string error crash & string sanitization
Root Cause: In Lua, `pcall()` can return a non-string error object, leading to UI exceptions when string methods like `:find()` are called. Additionally, the error strings exposed internal chunk names (e.g. `[string "PGF_Expression"]:1:`).
Prevention: Always explicitly coerce error variables to strings using `tostring()` before performing string operations or displaying them, and use string substitution to sanitize internal module details.
## v2.0 - [Bug] HUD/Layer overlap issues\nRoot Cause: Hardcoded stratas (HIGH/FULLSCREEN) instead of relative frame levels caused UI to overlap standard WOW frames unexpectedly.\nPrevention: Set dialog frameStrata to 'DIALOG' and compute relative FrameLevel using parent:GetFrameLevel() + offset.

## [@project-version@] - [Bug] Fix pattern matching alternation in lua
Root Cause: Lua 5.1 pattern matching does not support regex alternation (`|`), so standard regex patterns like `^(the|die)$` silently fail and do not match, always returning `nil` and evaluating to `true`.
Prevention: Replaced string pattern matching with an $O(1)$ table lookup (hash map) instead of attempting alternation for multi-string exact matching to ensure correct behavior and better performance.
