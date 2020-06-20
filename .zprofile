# If running from tty1 start
if [ "$(tty)" = "/dev/ttyv0" ]; then
    exec xinit awesome > /dev/null 2>&1
fi
