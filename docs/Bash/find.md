# A collection of different find commands


## find and delete all files older than a certain age

```bash
age_of_files=3
find . -maxdepth 1 -type f -mtime +$age_of_files


# or

find "$abs_path" -maxdepth 1 -type f -mtime +$age_of_file -delete
```
