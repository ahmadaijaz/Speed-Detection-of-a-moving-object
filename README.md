# Speed-Detection-of-a-moving-object
A Speed detection algorithm designed on Matlab

# Tools and Language
- Matlab

# Description
1) Firstly I have read a video.
2) Then I have made the frames of the video.
3) I have taken the first frame.
4) I have taken the last frame(i.e the frame in which the last time complete pic of car was visible).
5) I have found the COA of both the frames and found the pixel distance.
6) A we know 1 pixel = 0.0002645833 m, so we have converted the pixel distance to metre distance.
7) Then I have divided that distance with time.

PS: For time I have divided the total frames by 27 , because in 1 second, 27 frames are generated so we started the counter till the last frame created. Then I divided that counter by 27 to get the time in seconds The speed is in metre per second.
