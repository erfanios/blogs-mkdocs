# 🧠 Detecting Piped Input vs Interactive Input in Bash (`-t 0` Explained)

When writing Bash scripts that can receive input either **from the terminal** or **via pipes**, it's crucial to know where that input is coming from.

This tutorial explains how to detect if your script's **stdin** is coming from:
- an interactive terminal (e.g. user typing),
- or redirected input (e.g. `echo "..." | script.sh`, cron, or `.forward`).

---

## 🧪 The Test: `-t 0`

```bash
[ -t 0 ]
```

- `-t` checks whether the given file descriptor is open and **refers to a terminal**.
- `0` refers to **stdin**.

### ✅ Meaning:
| Expression  | Result                                |
|-------------|----------------------------------------|
| `-t 0`      | stdin is a terminal (interactive shell) |
| `! -t 0`    | stdin is piped or redirected (not interactive) |
| `-t 1`      | stdout is a terminal                   |
| `-t 2`      | stderr is a terminal                   |

---

## 🎯 Example: Bash Script that Detects Input Source

```bash
#!/usr/bin/env bash

if [ ! -t 0 ]; then
  # stdin is being piped/redirected
  message="$(cat)"
else
  # interactive terminal
  message="$*"
fi

echo "Received: $message"
```

---

## 🔁 Real Use Case: Mail Piping in `.forward`

When using a `.forward` file to redirect local mail into a script:

```bash
# ~/.forward
|/home/username/bin/notify.sh
```

Your script will receive **stdin**, but **not from a terminal**. This check ensures your script handles it correctly:

```bash
if [ ! -t 0 ]; then
  message="$(cat)"
else
  message="$*"
fi
```

Without this, you may wrongly assume input is present, or attempt to read from a terminal that doesn’t exist (e.g. in cron or mail contexts).

---

## 📦 Summary

| File Descriptor | Name        | Use                                |
|------------------|-------------|-------------------------------------|
| `-t 0`           | stdin       | Checks if input is interactive     |
| `-t 1`           | stdout      | Checks if output is to a terminal  |
| `-t 2`           | stderr      | Checks if errors go to terminal    |
| `! -t 0`         | not stdin   | Input is from pipe/cron/etc        |

Use `! -t 0` to reliably detect non-interactive (piped or redirected) input in scripts.

---

## ✅ TL;DR

Use this to make your script smart:

```bash
if [ ! -t 0 ]; then
  message="$(cat)"  # handle piped/cron/mail input
else
  message="$*"
fi
```

This makes your Bash scripts behave correctly in both **interactive** and **automated** environments.


