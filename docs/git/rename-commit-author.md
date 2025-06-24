# How to Rename Author and Email of a Commit

## Enter Rebase Mode
You need to enter interactive rebase mode, where you can see the list of commits. There are two options:

1) Using `HEAD~N` (N = number of commits back):
```bash
git rebase -i HEAD~3
```

2) Using a specific commit hash (choose one before the target commit):
```bash
git rebase -i <commit-hash>
```

## Replace `pick` with `edit`
Find the commit you want to change and replace `pick` with `edit`. Then save and exit the editor.

## Amend the Commit
You’ll return to the terminal, still in rebase mode. Amend the author and email with:

```bash
git commit --amend --author="New Name <new.email@example.com>"  --no-edit
```

## Continue Rebase
Finish the rebase process with:

```bash
git rebase --continue
```

## Force Push
Since this rewrites history, you’ll need to force-push your changes:

```bash
git push --force
```

If you're collaborating with others, use the safer option:

```bash
git push --force-with-lease
```

