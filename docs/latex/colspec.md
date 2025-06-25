# Documentation: `colspec` in `tabularray` (LaTeX)

This documentation explains the meaning of the following `tabularray` table definition:

```latex
colspec = {|Q[l,m]|X[l,m]|}
```

## Explanation

| Component     | Meaning                                                                 |
|---------------|-------------------------------------------------------------------------|
| `|`           | Vertical line between columns                                            |
| `Q[l,m]`      | First column: minimum width, **left-aligned**, **vertically centered**   |
| `X[l,m]`      | Second column: fills remaining space, **left-aligned**, **centered**     |

## Column Types Overview

| Type        | Description                                                                 |
|-------------|-----------------------------------------------------------------------------|
| `l`, `c`, `r` | Classic alignment (left, center, right) — fixed width, no auto-wrapping     |
| `p{<width>}`  | Fixed-width column with automatic line wrapping                            |
| `X[...]`      | Flexible-width column, shares available space with other `X` columns        |
| `Q[...]`      | Width adapts to content (like `varwidth`), useful for compact table layouts |

## Example

```latex
\begin{talltblr}[
  caption = {Example with Q and X columns},
  label = {tab:example},
  colspec = {|Q[l,m]|X[l,m]|},
  width = \linewidth
]
  Short label & Long explanatory text that should wrap and fill remaining space. \\
\end{talltblr}
```

## Note

Using `Q[...]` requires enabling the `varwidth` library:

```latex
\UseTblrLibrary{varwidth}
```

Place this after loading the `tabularray` package to allow automatic width adjustment.

