#!/bin/sh
url=$(xclip -selection c -o)
if pgrep mpv >/dev/null
then
   killall mpv
fi

if pgrep chatterino >/dev/null
then
   killall chatterino

fi
if [[ $url == *"twitch.tv"* ]];then
	channel=${url#https://www.twitch.tv/}
	streamlink $url &
	chatterino --channels $channel &
else
	# mpv --ytdl-format='bestvideo[height<=?720][fps<=?60][vcodec!=?vp9]+bestaudio/best' $url &
	mpv $url &
fi

