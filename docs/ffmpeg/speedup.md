# Speeding Up a video

```
ffmpeg -i input.mp4 -filter:v "setpts=0.5*PTS" -an -preset slow -crf 18 output.mp4
```

## PTS Parameters (Presentation Time Stamp):
This changes the speed of playback:

- 0.5*PTS → 2× speed (frames shown sooner)
- 2.0*PTS → 0.5× speed (slow motion)


- setpts=1.0*PTS → normal speed
- setpts=0.5*PTS → 2× speed
- setpts=0.25*PTS → 4× speed
- setpts=0.1*PTS → 10× speed


## Preset
> A preset is a collection of options that will provide a certain encoding speed to compression ratio. A slower preset will provide better compression (compression is quality per filesize). This means that, for example, if you target a certain file size or constant bit rate, you will achieve better quality with a slower preset. Similarly, for constant quality encoding, you will simply save bitrate by choosing a slower preset.

- ultrafast
- superfast
- veryfast
- faster
- fast
- medium – default preset
- slow
- slower
- veryslow
- placebo

## CRF (Constant Rate Factor)
CRF is a quality setting used when encoding with libx264 (H.264) or libx265 (H.265) in ffmpeg

> Tip: If you're looking for an output that is roughly "visually lossless" but not technically lossless, use a -crf value of around 17 or 18 (you'll have to experiment to see which value is acceptable for you). It will likely be indistinguishable from the source and not result in a huge, possibly incompatible file like true lossless mode.


## CRF Scale (Lower = Better Quality)
- 0 → lossless (huge files)
- 18 → visually lossless (most people can't see difference from original)
- 23 → default (good quality, smaller size)
- 28+ → noticeable compression artifacts


Ref: https://trac.ffmpeg.org/wiki/Encode/H.264#Overwritingdefaultpresetsettings




