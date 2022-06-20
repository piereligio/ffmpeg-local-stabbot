//PART 1 [Defaults: shakiness=5:accuracy=15:stepsize=6:mincontrast=0.3:show=0]
ffmpeg -i %1 -vf vidstabdetect=shakiness=5:accuracy=15:stepsize=6:mincontrast=0.3:show=2 -y %1-dummy.mp4

//PART 2
ffmpeg -i %1 -vf scale=trunc((iw*1.15)/2)*2:trunc(ow/a/2)*2 -y %1-scaled.mp4

//PART 3 [-strict -2 ONLY IF OPUS AUDIO] - [Unsharp Default: '5:5:1.0:5:5:0.0']
ffmpeg -i %1-scaled.mp4 -vf vidstabtransform=smoothing=30:input="transforms.trf":crop=black:interpol=no:zoom=-15:optzoom=0,unsharp=5:5:0.8:3:3:0.4 -y %1-stabilized.mp4