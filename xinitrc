while true; 
do
   xsetroot -name "$(date +"%A %B %d.%m.%Y")"
   sleep 1m
done &

xset -dpms &
xset s off &
xrdb ~/.Xresources &

sakura &
sakura &
google-chrome &
conky | sh | dzen2 -ta r -p -y 100 &
exec dwm
