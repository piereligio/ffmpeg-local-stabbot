//PART 1 [Defaults: shakiness=5:accuracy=15:stepsize=6:mincontrast=0.3:show=0]
ffmpeg -i %1 -vf vidstabdetect=shakiness=5:accuracy=15:stepsize=6:mincontrast=0.3:show=2 -y %1-dummy-crop.mp4

//PART 2
ffmpeg -i %1 -vf scale=trunc((iw*0.90)/2)*2:trunc(ow/a/2)*2 -y %1-scaled-crop.mp4

//PART 3 [-strict -2 ONLY IF OPUS AUDIO] - [Unsharp Default: '5:5:1.0:5:5:0.0']
ffmpeg -i %1-scaled-crop.mp4 -vf vidstabtransform=smoothing=20:input="transforms.trf":interpol=no:zoom=-10:optzoom=2,unsharp=5:5:0.8:3:3:0.4 -y %1-stabilized-crop.mp4