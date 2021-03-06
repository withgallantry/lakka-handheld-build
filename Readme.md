# Lakka Handheld Edition

[Lakka](http://www.lakka.tv) is a lightweight OS for playing all your favourite retro games, problem is that it's typically not been designed for handheld systems. 
This repo contains a custom compilation of Lakka that includes fbtft, allowing you to use Lakka on smaller screens. I've also put together a few example config files that you can either use as they are or customise for your own needs.

### Getting started using example files

* Download the latest Lakka image from [releases](https://github.com/withgallantry/lakka-handheld-build/releases)
* Burn the image to an SD Card and mount it.
* Download this repository.
* Copy autostart.h into the .config folder in the LAKKA_DISK partition.
* Copy retroarch.cfg into the .config/retroarch folder replacing the existing one in the LAKKA_DISK partition.
* Copy the /software folder into the LAKKA_DISK partition.
* Edit /software/retrogame/retrogame.cfg according to your GPIO configuration. You can use an existing retrogame.cfg if you have one.
* Copy and Replace the config.txt and distroconfig.txt in LAKKA with the one from this repository.

### Enable controls in games
Following the steps above you should have Lakka booting and controllable by GPIO buttons however when startng games the controls won't work. To fix this you need to [enable SSH](http://www.lakka.tv/doc/Accessing-Lakka-command-line-interface/) and [enable WiFi](http://www.lakka.tv/articles/2016/10/06/major-release-brings-wifi-and-simplified-interface/#wi-fi-configuration-interface) via the Lakka menu. Once you've done this you can SSH into the box and run the following:
 
 ```$xslt
nano /etc/udev/rules.d/10-retrogame.rules
```

Add the following line and save

```$xslt
SUBSYSTEM=="input", ATTRS{name}=="retrogame", ENV{ID_INPUT_KEYBOARD}="1"
```

Thanks to [Pi0cket](https://www.instagram.com/pi0cket/) for that!

### File explanations

| File / Directory | Explanation |
| ------ | ------ |
| autostart.h | This file is reponsible for everything that runs on startup |
| retroarch.cfg | It is the config for Retroarch. This config has been tuned to turn Lakka into something a bit more small screen friendly. |
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
