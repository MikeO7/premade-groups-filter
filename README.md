# Mythic Plus Party Scout

**Mythic Plus Party Scout** is the ultimate tool for optimizing your Mythic+ search experience in World of Warcraft. It enhances the default LFG Premade Groups interface with powerful filtering, real-time party composition checks, and advanced logic expressions to find the perfect group in seconds.

![Party Scout Preview](Screenshots/Screenshot_01_Dungeons.png)

---

### 🚀 Key Features

*   **Precision Composition Filtering**: Find groups that need *exactly* your role or have specific spots open (e.g., 1 Tank, 2 DPS, 0 Heals).
*   **M+ Rating Integration**: Filter by leader's rating at a glance.
*   **Party Fit Detection**: Automatically hides groups that don't have room for your entire current party.
*   **Visual Enhancements**:
    *   **Class Icons & Specializations**: See the exact specs of everyone in the group before applying.
    *   **Raider.IO Support**: Color-coded ratings and detailed tooltips.
    *   **Leader Highlights**: Easily identify the group leader.
*   **Leaver Scouting (Coming Soon)**: Visual indicators for known leavers to protect your keys.
*   **Advanced Logic**: Use powerful Lua expressions for complex searches (e.g., `rating > 2500 and (tanks == 0 or heals == 0)`).

---

### 🛠️ Advanced Filter Keywords

Party Scout supports over 150 properties for filtering. You can mix and match standard UI filters with the **Advanced Expression Box** to fine-tune your search.

| Keyword | Description |
| :--- | :--- |
| `mprating` | Leader's Mythic+ Rating |
| `partyfit` | Has spots for your current group roles |
| `age` | How long the group has been listed |
| `matchingid` | Groups with the same instance lockout |

---

### 📜 Attribution & License

This project is a heavily modified fork of **Premade Groups Filter**, originally developed by **Bernhard Saumweber**. 

**Mythic Plus Party Scout** is maintained by **MikeO**.

Licensed under the **GNU General Public License, Version 2**.
See the [LICENSE](LICENSE) file for the full legal text.

---

### 🔗 Resources

*   **GitHub**: [https://github.com/MikeO7/wow_mythic_plus_party_scout](https://github.com/MikeO7/wow_mythic_plus_party_scout)
*   **Wiki**: [Detailed Keyword Documentation](https://github.com/MikeO7/wow_mythic_plus_party_scout/wiki)
