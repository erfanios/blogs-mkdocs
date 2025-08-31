# How to use Tar for coping a folder into another user with sudo


```bash
tar -cf- <folder> | (sudo -i-u <user> -xvf-
```

With path:

```bash
tar -C www -cf- . | (sudo -i-u <user> tar -C
<path> -xvf-)
```
