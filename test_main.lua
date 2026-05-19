time = os.time
hooksecurefunc = function() end
PremadeGroupsFilter = {}
local PGF = {
    L = {},
    C = {},
    Table_Copy_Shallow = function(t) return t end,
    Dialog = {
        GetSortingExpression = function()
            return "friends asc, age desc"
        end
    },
    Empty = function(s) return s == nil or s == "" end
}
-- Inject mock PGF table
loadfile("Main.lua")(nil, PGF)

-- Test 1: Calling GetUserSortingTable returns the parsed table
local t1 = PGF.GetUserSortingTable()
assert(t1[1].key == "friends" and t1[1].order == "asc")
assert(t1[2].key == "age" and t1[2].order == "desc")

-- Test 2: Calling it again returns the EXACT same table (memoized)
local t2 = PGF.GetUserSortingTable()
assert(t1 == t2, "Memoization failed! Tables are not identical.")

print("Tests passed successfully!")
