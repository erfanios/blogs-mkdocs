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

## Prioritizing Column Width with Weights

If you want one column (e.g. the third) to get **more horizontal space**, use weights in the `X[...]` column specification:

```latex
colspec = {|X[1,l]|X[1,l]|X[2,l]|}
```

| Column     | Weight | Description                                    |
|------------|--------|------------------------------------------------|
| 1st        | `1`    | Normal width share                             |
| 2nd        | `1`    | Normal width share                             |
| 3rd        | `2`    | **Gets double the space of the others**        |

You can apply any combination like `X[3,l]`, `X[1,l]`, etc., to control which columns get more space.

## Note

Using `Q[...]` requires enabling the `varwidth` library:

```latex
\UseTblrLibrary{varwidth}
```

Place this after loading the `tabularray` package to allow automatic width adjustment.
