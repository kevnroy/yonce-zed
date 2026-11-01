# Yoncé for Zed

An unofficial [Zed](https://zed.dev) port of **Yoncé**, the Queen Bey-inspired
theme created by [Mina Markham](https://github.com/minamarkham).

> **Attribution**
>
> Yoncé was created by **Mina Markham**. The original theme, palette, and VS Code
> extension are © 2018 Mina Markham and released under the MIT license.
>
> This repository is an **unofficial Zed port**. It is not affiliated with,
> sponsored by, or endorsed by the original author. See [NOTICE.md](NOTICE.md)
> for full provenance and [LICENSE](LICENSE) for the license text.

The port reproduces the original palette and visual intent using Zed's theme
schema and tree-sitter syntax captures. It targets Zed 1.26+ and theme schema
v0.2.0.

## Install

### Local file

```sh
mkdir -p ~/.config/zed/themes
cp themes/yonce.json ~/.config/zed/themes/yonce.json
```

On Windows, use `%USERPROFILE%\AppData\Roaming\Zed\themes\`. On Flatpak, use
`~/.var/app/dev.zed.Zed/config/zed/themes/`.

Then open the theme selector with `Ctrl+K Ctrl+T` (`Cmd+K Cmd+T` on macOS) and
pick **Yoncé**. Zed live-reloads local theme files when they change.

To make it the default dark theme, add this to `~/.config/zed/settings.json`:

```jsonc
"theme": {
  "mode": "dark",
  "light": "One Light",
  "dark": "Yoncé"
}
```

### Extension store

Once the extension is published to the Zed registry, search for **Yoncé** in
`zed: extensions` or install it from the Zed extension website.

## Palette

| Name | Hex | Main use |
| --- | --- | --- |
| Background | `#1C1C1C` | editor and app background |
| Foreground | `#D4D4D4` | default text, punctuation, variables |
| Violet Red | `#FC4384` | keywords, functions, types, attributes, cursor |
| Straw | `#E6DB74` | strings, emphasis |
| Amethyst | `#A06FCA` | numbers, constants, inline code |
| Bondi Blue | `#00A7AA` | object keys / CSS properties |
| Sushi | `#98E342` | delimiters, diff additions |
| Nevada | `#696D70` | comments and doc comments |
| Yellow Sea | `#F39B35` | booleans, warnings, list markers |
| Sky Magenta | `#DA7DAE` | brackets |
| Rose | `#FFB1F2` | terminal magenta, link hover |

The port defines **149 UI style keys** and **47 syntax captures**.

## Repository layout

```text
.
├── extension.toml          # Zed extension metadata
├── themes/yonce.json       # the theme
├── LICENSE                 # original MIT license (Mina Markham)
├── NOTICE.md               # attribution and provenance
└── dev/                    # local test kit (not part of the theme)
    ├── TESTING.md
    └── test/
```

The `dev/` directory is only for development and verification. A Zed theme
extension only needs `extension.toml`, `themes/yonce.json`, and the license.

## Differences from the VS Code theme

These are Zed limitations or differences in tree-sitter captures, not changes
to the original palette:

- **No underline.** Zed supports `normal`, `italic`, and `oblique` only, so the
  original underline on class/type names cannot be reproduced.
- **No per-tab border.** The active tab uses a lighter background instead of the
  original pink bottom border.
- **Shell shebangs** are captured as preprocessor tokens by Zed and render pink.
- **CSS custom property names** render pink rather than gray/italic.
- Some VS Code TextMate scopes have no exact Zed equivalent, so SQL, PHP, CSS,
  and other languages may differ slightly at the margins.

### Contrast notes

The port keeps the original colors, including a few deliberately dim ones:

| Pair | Contrast |
| --- | --- |
| comments | 3.26:1 |
| line numbers | 3.81:1 |
| errors | 2.93:1 |
| input placeholders | 1.75:1 |

If you prefer more contrast, `dev/TESTING.md` includes optional
`theme_overrides` that leave the theme file untouched.

## Development

See [dev/TESTING.md](dev/TESTING.md) for the full checklist, automated audit
results, and the list of known deviations. The fixtures in `dev/test/` cover
Rust, Go, Python, TypeScript/TSX, CSS, HTML, Markdown, shell, SQL, PHP, JSON,
YAML, TOML, and unified diffs. `dev/test/terminal-colors.sh` exercises the
terminal ANSI palette.

## Publishing to the Zed extension registry

The repository is laid out as a Zed extension. To submit it:

1. Create a public GitHub repository from this directory.
2. Fork `zed-industries/extensions`.
3. Add this repository as a submodule at `extensions/yonce-theme`:

   ```sh
   git submodule add https://github.com/kevnroy/yonce-zed.git extensions/yonce-theme
   ```

4. Add the extension to the top-level `extensions.toml`:

   ```toml
   [yonce-theme]
   submodule = "extensions/yonce-theme"
   version = "0.1.0"
   ```

5. Run `pnpm sort-extensions`, commit, and open the PR.

The extension ID must stay `yonce-theme` (theme extensions are suffixed with
`-theme`), and the version in `extensions.toml` must match `extension.toml`.

## License

MIT. The original theme and palette are © 2018 **Mina Markham**; see
[LICENSE](LICENSE) and [NOTICE.md](NOTICE.md). The Zed port and documentation
were prepared by [Kevin Roy](https://github.com/kevnroy).

## Credits

- Original theme and palette: **Mina Markham** —
  <https://github.com/minamarkham/yonce-vscode>
- Zed port: **Kevin Roy** — <https://github.com/kevnroy>
- Zed theme schema and documentation: <https://zed.dev/docs/themes>
