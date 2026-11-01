# Testing the Yoncé Zed port

Theme: `themes/yonce.json`  
Installed copy: `~/.config/zed/themes/yonce.json`  
Fixtures: `dev/test/`

Install the current file and pick it once:

```sh
cp themes/yonce.json ~/.config/zed/themes/yonce.json
```

Then in Zed: `Ctrl+K Ctrl+T` (macOS: `Cmd+K Cmd+T`) → **Yoncé**.  
Zed live-reloads local themes on save, so you can edit a color and see it immediately.

---

## Automated pre-flight (already run)

| Check | Result |
| --- | --- |
| Valid JSON | ✅ |
| Top-level `name`, `author`, `themes` | ✅ |
| Every color is `#RRGGBBAA` | ✅ |
| UI keys vs. Zed's One Dark | 149 vs. 139 (superset) |
| Syntax captures vs. One Dark | 47 vs. 46 (superset) |
| Missing conflict-marker keys | added (`ours` / `theirs`) |
| Theme parse errors in Zed log | none |

### Contrast audit (editor background `#1c1c1c`)

| Pair | Ratio | Note |
| --- | --- | --- |
| text | 11.50:1 | ✅ |
| text.muted | 7.34:1 | ✅ |
| keyword / function / type | 5.09:1 | ✅ |
| string | 11.97:1 | ✅ |
| number | 4.56:1 | ✅ |
| property | 5.77:1 | ✅ |
| warning | 7.75:1 | ✅ |
| info | 6.22:1 | ✅ |
| selection + text | 5.56:1 | ✅ |
| search match + text | 6.65:1 | ✅ |
| comment | 3.26:1 | inherited from VS Code (Nevada) |
| line number | 3.81:1 | inherited from VS Code |
| error | 2.93:1 | inherited from VS Code (`#c42412`) |
| text.placeholder | 1.75:1 | inherited from VS Code (`#444444`) |

The last four are intentionally faithful to the original. See "Optional accessibility overrides" if you want to lift them.

---

## Manual checklist

### Loading

- [ ] Theme shows up as **Yoncé** in the theme selector
- [ ] Switching to it updates the UI immediately (no restart)
- [ ] `"theme": { "mode": "dark", "dark": "Yoncé" }` survives a restart
- [ ] Editing the theme file and saving live-reloads the window
- [ ] Saving invalid JSON does **not** crash Zed (previous theme stays)
- [ ] Deleting the file and restarting falls back cleanly

### Window chrome

- [ ] Title bar (active / inactive)
- [ ] Tab bar: active tab, inactive tab, hover, modified dot, close button
- [ ] Status bar: text, icons, diagnostics badge, vim badge
- [ ] Left dock / project panel: file tree, hover, selection, indent guides
- [ ] Outline panel
- [ ] Terminal panel and panel tabs
- [ ] Agent / collaboration panel
- [ ] Command palette
- [ ] Settings editor and settings file tabs
- [ ] Extensions page
- [ ] Search & replace panel (match, active match, focus)
- [ ] Notifications / toasts
- [ ] Context menus, menus, tooltips, hover popovers
- [ ] Buttons, inputs, dropdowns, checkboxes, toggles
- [ ] Scrollbars (thumb, hover, track)
- [ ] Breadcrumbs
- [ ] Modal / dialog backgrounds and borders
- [ ] Focus rings / focused borders

### Editor

- [ ] Background and foreground
- [ ] Current-line highlight
- [ ] Line numbers: normal, active, hover
- [ ] Cursor
- [ ] Selection, selection highlight, multi-cursor
- [ ] Bracket matching
- [ ] Indent guides: normal / active
- [ ] Invisible characters (spaces/tabs)
- [ ] Wrap guide / active wrap guide
- [ ] Search matches: normal / active
- [ ] Document highlights: read / write
- [ ] Diagnostics: error, warning, info, hint + squiggles
- [ ] Hover popover
- [ ] Inline / predictive completions
- [ ] Code folding markers
- [ ] Diff view (added / removed lines)

### Syntax fixtures

Open each file in `dev/test/` and check the listed captures.

| File | What to look at |
| --- | --- |
| `sample.rs` | doc comments, attributes, lifetimes, types, `fn`, macros, `self`, raw strings |
| `sample.go` | types, methods, `range`, format verbs, comments |
| `sample.py` | decorators, docstrings, f-strings, regex, type hints, lambda |
| `sample.tsx` | JSX tags/attributes, interfaces, generics, optional chaining, regex, template strings |
| `sample.css` | selectors, pseudo-elements, custom properties, units, functions, `!important` |
| `sample.html` | tags, attributes, embedded `<script>` |
| `sample.md` | headings, bold, italic, inline code, links, images, lists, blockquote, table, fence |
| `sample.sh` | shebang, variables, parameter expansion, arrays, builtins, conditionals |
| `sample.sql` | keywords, aliases, strings, aggregates, window functions |
| `sample.php` | namespaces, attributes, promoted properties, strings |
| `sample.json` | keys, strings, numbers, booleans, null, punctuation |
| `sample.yaml` | keys, anchors/aliases, lists, booleans |
| `sample.toml` | sections, keys, strings, arrays of tables |
| `sample.diff` | `diff.plus`, `diff.minus`, hunk headers, added/removed backgrounds |

Specific colors to confirm:

- [ ] comments and doc comments are Nevada gray + italic
- [ ] variables and parameters are italic
- [ ] strings are straw yellow
- [ ] numbers/constants are amethyst
- [ ] function/type/keyword/attribute are pink
- [ ] object keys / CSS properties are Bondi Blue
- [ ] punctuation brackets are rose; delimiters are green
- [ ] markdown italic is straw; bold is bold white; inline code is amethyst
- [ ] markdown list markers are orange
- [ ] markdown table pipes are green (expected, from `punctuation.delimiter`)

### Git

- [ ] Diff view added/removed line backgrounds
- [ ] Diff word-level highlights (`version_control.word_added/deleted`)
- [ ] Gutter added/modified/deleted indicators
- [ ] Conflict markers (`ours` green, `theirs` aqua)
- [ ] Commit message editor
- [ ] Branch / sync status in the status bar

### Terminal

Run the included sample in Zed's terminal:

```sh
./dev/test/terminal-colors.sh
```

- [ ] ANSI 0–7 and bright 8–15
- [ ] 256-color ramp and grayscale
- [ ] 24-bit color samples
- [ ] bold, dim, italic, underline, reverse
- [ ] terminal selection and cursor colors

### Accessibility / comfort

- [ ] Read comments comfortably for a long session
- [ ] Line numbers are visible but not distracting
- [ ] Error squiggles and error text are distinguishable
- [ ] Diff red/green is distinguishable (also check with a color-blind simulator)
- [ ] Selection does not swallow syntax colors
- [ ] Works at 100%, 125%, 150% zoom
- [ ] Works with Iosevka, Dank Mono, Operator Mono, or your usual font
- [ ] Ligatures do not break italics

### Edge cases

- [ ] Two Zed windows open at once
- [ ] `theme_overrides` in `settings.json`
- [ ] Light mode falls back to the configured light theme
- [ ] Very large file (syntax + scroll performance)
- [ ] Collaboration cursors/selection (`players` colors)
- [ ] Screen share / presentation mode

### Publish readiness

- [ ] Decide whether to publish at all
- [ ] Decide who maintains the Zed port
- [ ] Confirm attribution to Mina Markham in README and description
- [ ] Include Mina's MIT notice in the extension `LICENSE`
- [ ] Extension ID ends in `-theme` (e.g. `yonce-theme`)
- [ ] Theme-only extension (no extra functionality)
- [ ] `extension.toml` version matches `extensions.toml`
- [ ] Tested at the exact submodule commit
- [ ] `pnpm sort-extensions` run

---

## Known deviations from the VS Code theme

These are Zed limitations or tree-sitter capture differences, not bugs in the palette:

- **No underline.** Zed's theme schema only supports `normal`, `italic`, and `oblique`; VS Code's underline on class/type names cannot be reproduced.
- **No per-tab border.** VS Code uses a pink bottom border on the active tab; Zed has no tab-border key, so the active tab is distinguished with a lighter background only.
- **Doc comments are gray, not pink.** Verified in `sample.rs`.
- **Shell shebang is pink.** Zed captures it as `preproc`, so it does not get the comment color. Minor.
- **Some VS Code scopes have no direct Zed capture.** SQL/PHP/CSS/Pug etc. may need per-language tweaks if a specific token looks wrong.
- **Placeholder / error contrast.** The original colors are dim by design on `#1c1c1c`.

## Optional accessibility overrides

If you want to keep the theme file faithful but improve readability, add this to `~/.config/zed/settings.json`:

```jsonc
"theme_overrides": {
  "Yoncé": {
    "text.placeholder": "#6a6a6aff",
    "error": "#e5484dff",
    "syntax": {
      "comment": { "color": "#7a7f83ff" },
      "comment.doc": { "color": "#7a7f83ff" }
    }
  }
}
```

Remove the override block after testing if you want the exact original palette back.
