REM PART 1 [Defaults: shakiness=5:accuracy=15:stepsize=6:mincontrast=0.3:show=0]
ffmpeg -i %1 -vf vidstabdetect=shakiness=5:accuracy=15:stepsize=6:mincontrast=0.3:show=2 -y %1-dummy-tripod.mp4

REM PART 2
ffmpeg -i %1 -vf scale=trunc((iw*1.15)/2)*2:trunc(ow/a/2)*2 -y %1-scaled-tripod.mp4

REM PART 3 [-strict -2 ONLY IF OPUS AUDIO] - [Unsharp Default: '5:5:1.0:5:5:0.0']
ffmpeg -i %1-scaled-tripod.mp4 -vf vidstabtransform=tripod=1:crop=black:interpol=no:zoom=-35 -y %1-stabilized-tripod.mp4
