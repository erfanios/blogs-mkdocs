# Considering you want to delete main with all commits

```bash
# create a dummy branch

git checkout --orphan temp_branch

git branch -D main
git checkout --orphan main

git rm -rf .

git commit --allow-emtpy -m "Initial commit (after wipe)"
git push origin main --force
```
