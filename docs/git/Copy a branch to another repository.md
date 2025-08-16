# Copy a branch to another repository


```bash
git remote add sourcerepo git@github.com:path/of/your/repo.git

# Fetch the branch from the old repo
git fetch sourcerepo targetbranch

# Create a local branch from it
git checkout -b targetbranch sourcerepo/targetbranch

# Push it to your new repo
git push origin targetbranch
```
