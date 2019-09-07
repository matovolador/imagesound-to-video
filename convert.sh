#!/bin/bash
read -p "This script will convert any FLAC file inside the 'in' folder into a MP4 Video inside the 'out' folder, asigning to them the first 'cover.jpg' file found within the 'in' folder. Press any key to continue." continue
for file in ./in/*.flac; do
    filename="${file/.\/in\//}"
    echo $filename
    videofile=${filename//.flac/.mp4}
    ffmpeg -loop 1 -i "./in/cover.jpg" -i "$file" -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest ./out/"$videofile"
    echo "Converted file $filename to $videofile"
done
read -p "Coverted all files. Press any key to exit." continue