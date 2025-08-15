### **Option 1 — Upgrade Ruby**
If you want the latest RubyGems, you need a newer Ruby.  
On macOS, the easiest way is to use a version manager like `rbenv` or `rvm`:

**With `rbenv`:**
```bash
brew install rbenv ruby-build
rbenv install 3.3.4   # latest stable as of now
rbenv global 3.3.4
ruby -v               # verify version
gem update --system   # now works
```

**With `rvm`:**
```bash
\curl -sSL https://get.rvm.io | bash
rvm install 3.3.4
rvm use 3.3.4 --default
ruby -v
gem update --system
```

run:
```bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init - bash)"' >> ~/.bash_profile
```
### **Option 2 — Install an Older Compatible RubyGems**
If you can’t upgrade Ruby right now, you can update RubyGems only to the latest version that works with Ruby 2.6.

First, find the latest compatible version:
```bash
gem list --remote rubygems-update
```
Pick the newest version **before 3.2.0** (Ruby 2.6.x usually works with RubyGems up to ~3.3.x).

Then install:
```bash
gem install rubygems-update -v 3.3.26
update_rubygems
```

run:
```bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init - bash)"' >> ~/.bash_profile
```
