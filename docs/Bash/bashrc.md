# .bashrc

# Save pid of a process under tmp

Add this to your `.bashrc` or `.bash_profile`. After `source ...` you can use ist as `sid <1231312> <usage>`

```bash
alias sid='f() { mkdir -p /tmp/ids; echo "$1" > /tmp/ids/$(date "+%FT%H-%M-%S")-$2.pid; echo /tmp/ids/$(date "+%FT%H-%M-%S")-$2.pid; }; f'
```
