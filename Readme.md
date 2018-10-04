# Lakka Handheld Edition

[Lakka] is a lightweight OS for playing all your favourite retro games, problem is that it's typically not been designed for handheld systems. 
This repo contains a custom compilation of Lakka that includes fbtft, allowing you to use Lakka on smaller screens. I've also put together a few example config files that you can either use as they are or customise for your own needs.

### Getting started using example files

* Burn the image to an SD Card and mount it.
* Download this repository.
* Copy autostart.h into the .config folder in the LAKKA_DISK partition.
* Copy the /software folder into the LAKKA_DISK partition.
* Edit /software/retrogame/retrogame.cfg according to your GPIO configuration. You can use an existing retrogame.cfg if you have one.
* Copy and Replace the config.txt and distroconfig.txt in LAKKA with the one from this repository.


### File explanations

| File / Directory | Explanation |
| ------ | ------ |
| autostart.h | This file is reponsible for everything that runs on startup |
| config.txt | This file contains the configuration for the system |
| /software | This contains all the software needed. This includes retrogame for controls and fbcp for copying the framebuffer |

### Configuring SPI Screen

If you've followed the steps above in 'Getting Started' then your Lakka installation is set up for an ili9341 screen. If you wish to change this, or any settings of your ili9341 screen, you will need to edit the autostart.h file. Once opened you will see the line
```
modprobe fbtft_device custom name=fb_ili9341 gpios=reset:25,dc:24 speed=76000000 fps=60 bgr=1
```
This should be self explanatory for those familar with it. If not, there is a brilliant guide here:
https://sudomod.com/forum/viewtopic.php?t=2312

Install the dependencies and devDependencies and start the server.

### Questions or Problems

Please raise an issue on this repo and I'll try to help!