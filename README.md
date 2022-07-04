# ffmpeg local stabbot
Little set of scripts for stabilizing videos in the same fashion as Reddit u/stabbot does. 
It requires that you have got ffmpeg on your machine in the environment variables (or that you put the scripts in the same folder as ffmpeg).
You can also put the scripts in a folder that you reference with the environment variables, so that you can use the scripts anywhere (this is what I personally did, meaning both ffmpeg and the scripts in a env path folder).

Both are set to process the file that you pass as argument. 
By instance you will call:
ffmpeg.stabbot.bat shaky-video.mp4

The videotoolbox versions that I provided for Mac OS are a lot faster than the regular ones, but final quality ends up being worse.
