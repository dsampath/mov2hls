#!/bin/sh
echo Starting stream segmentation.....
echo vlc -I dummy $1 vlc://quit --sout=#transcode{width=320,height=240,fps=25,vcodec=h264,vb=256,venc=x264{aud,profile=baseline,level=30,keyint=30,ref=1},acodec=mp3,ab=96}:std{access=livehttp{seglen=10,delsegs=false,numsegs=0,index=/var/www/streaming/mystream.m3u8,index-url=http://$2/streaming/mystream-########.ts},mux=ts{use-key-frames},dst=/var/www/streaming/mystream-########.ts}
cvlc -I dummy $1 vlc://quit --sout=#transcode{fps=25,vcodec=h264,venc=x264{aud,profile=baseline,level=30,keyint=30,ref=1},acodec=mp3,ab=96}:std{access=livehttp{seglen=10,delsegs=false,numsegs=0,index=/var/www/streaming/mystream.m3u8,index-url=http://$2/streaming/mystream-########.ts},mux=ts{use-key-frames},dst=/var/www/streaming/mystream-########.ts}
