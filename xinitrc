while true; 
do
   xsetroot -name "CPU$(sensors |grep 'temp1'|awk '{print $2}')  media-$(df -h|grep sda4|awk '{print $5}') $(date +"%d/%m/%Y %H:%M")"
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
