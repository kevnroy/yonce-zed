# Attribution and provenance

## Original theme

**Yoncé** was created by **Mina Markham**.

- Upstream repository: <https://github.com/minamarkham/yonce-vscode>
- Original theme, palette, and VS Code extension: **© 2018 Mina Markham**
- License: MIT — see [LICENSE](LICENSE)

## This repository

This repository is an **unofficial Zed port** of the original theme. It is a new
implementation for Zed's theme schema and tree-sitter syntax captures; it is not
a copy of the VS Code extension's source code.

The port, extension metadata, documentation, and test fixtures were prepared by
**Kevin Roy** (<https://github.com/kevnroy>) and are distributed under the same
MIT license as the original.

This project is not affiliated with, sponsored by, or endorsed by Mina Markham
or the Zed Industries team.

## What was preserved

- The original color palette and its intended use.
- The original MIT copyright notice and permission notice.
- The theme name, as a reference to the original work.

## What changed

- The VS Code `colors` and `tokenColors` structures were translated to Zed's
  `style` and `syntax` keys.
- TextMate scopes were mapped to Zed's tree-sitter captures (for example
  `entity.name.function` → `function`, `constant.numeric` → `number`).
- UI surfaces, terminal ANSI colors, diff/version-control colors, and
  collaboration player colors were added for Zed.
- The original underline on type/class names and the active-tab bottom border
  are not representable in Zed's current theme schema.
