# Zed test fixtures

Small, deliberately dense files used to exercise the Zed syntax captures in the
Yoncé port. Open them one at a time in Zed and compare against `../TESTING.md`.

| File | Exercises |
| --- | --- |
| `sample.rs` | doc comments, attributes, lifetimes, types, macros, raw strings |
| `sample.go` | types, methods, `range`, format verbs |
| `sample.py` | decorators, docstrings, f-strings, regex, type hints |
| `sample.tsx` | JSX, interfaces, generics, optional chaining, template strings |
| `sample.css` | selectors, pseudo-elements, custom properties, units, functions |
| `sample.html` | tags, attributes, embedded JavaScript |
| `sample.md` | headings, emphasis, links, lists, blockquotes, tables, fences |
| `sample.sh` | shebang, variables, arrays, builtins, conditionals |
| `sample.sql` | keywords, aliases, aggregates, window functions |
| `sample.php` | namespaces, promoted properties, strings |
| `sample.json` | keys, strings, numbers, booleans, null |
| `sample.yaml` | keys, anchors/aliases, lists, booleans |
| `sample.toml` | sections, keys, arrays of tables |
| `sample.diff` | added/removed lines, hunk headers |
| `terminal-colors.sh` | ANSI 16, 256-color, truecolor, text styles |

These fixtures are for local testing only. A published theme extension only
needs `extension.toml`, `LICENSE`, `README.md`, and `themes/yonce.json`.
