conky | sh | dzen2 -ta r -p -y 600 &
while true; 
do
   xsetroot -name "$(date +"%A %B %d.%m.%Y")"
   sleep 1m
done &

xset -dpms &
xset s off &
xrdb ~/.Xresources &

feh --bg-scale /home/web/images/wall.jpg &
sakura &
sakura &
google-chrome &
exec dwm
