#this will download bing image of the day with a custom resolution and set it with nitrogen

mkt="en-us" #"en-US" "zh-CN" "ja-JP" "en-AU" "en-UK" "de-DE" "en-NZ" "en-CA"
width=2560
height=1440
savepath=~/Pictures/wallpapers/

jsonimgdataurl="https://bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&uhd=1&uhdwidth=$width&uhdheight=$height&mkt=$mkt"
jsondata=$(curl $jsonimgdataurl 2>/dev/null)
urlpath=$(jq -r '.images[0].url' <<< $jsondata)
filename=$(grep -o -P '(?<=th\?id\=).*?(?=\&)' <<< "$urlpath")

fullfilepath=${savepath}/${filename}  
if [ -f $fullfilepath ]; then 
	echo "exists"
else
       echo "no"	
	wget -O $fullfilepath "bing.com${urlpath}"
	#set on both monitors
	nitrogen --set-auto --head=0  --save $fullfilepath
	nitrogen --set-auto --head=1  --save $fullfilepath
fi
