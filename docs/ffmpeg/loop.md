# Looping a video or more


Your videos should have the same encoding.

## Create a list of files
Create a list of files inside a normal file such as txt file with `file '<filename>'` syntax.

Example: Creating a list file of all the files in the current dir.
```
printf "file '%s'" $(ls) > list.txt
```

## Looping one file only

Inside the `list.txt` would look like this:

```
file '100.mp4'
file '100.mp4'
file '100.mp4'
file '100.mp4'
```

In this case the same file is being repeated

## Command

```
ffmpeg -f concat -i list.txt -an -c copy output.mp4
```

In this case the `-an` means do not copy the audio and the `-c copy` means just copy frames without reencoding them.
