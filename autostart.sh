#!/bin/bash
modprobe fbtft_device custom name=fb_ili9341 gpios=reset:25,dc:24 speed=76000000 fps=60 bgr=1
(sleep 1 && LD_LIBRARY_PATH=/storage/software/fbcp /storage/software/rpi-fbcp/fbcp)&
(modprobe uinput; sleep 10 && LD_LIBRARY_PATH=/storage/software/retrogame /storage/software/retrogame/retrogame /storage/software/retrogame/retrogame.cfg)&
exit

