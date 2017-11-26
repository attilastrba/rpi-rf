rpi-rf
======
This is a modified version to work with Turris Omnia and the home assistant in the lxc container

Instal Home Assistant with lxc in turris:
1. Follow this guide https://beenje.github.io/blog/posts/home-assistant-on-turris-omnia-via-lxc-container/ (also in my google drive)
  BUT we need root rights to access /dev/mem so don't create user instead run it as root
  python3 -m venv $HOME/homeassistant 
  pip3 install --upgrade homeassistant
  #to start it write
  hass

2. Now we have to give access to the GPIO controll of the LXC Container
Read here https://forum.turris.cz/t/controlling-gpio-from-lxc-container-with-python/5762/3
lxc.cgroup.devices.allow = c 1:* rwm
lxc.mount.entry = /dev/mem dev/mem  none bind,optional,create=file 0 0

3. To install the turris-gpio do the following:
 su -s /bin/bash homeassistant
 git clone https://gitlab.labs.nic.cz/turris/python-turris-gpio.git
 python3 setup.py install --board=Omnia
 
4. To install rpi-rf do the following:
 git clone https://github.com/milaq/rpi-rf
 change the stuff to the turris-gpio
 python3 setup.py install 

5. Example Home automation script
switch:
  platform: rpi_rf
  gpio: 42
  switches:
      bedroom_light:
        protocol: 1
        pulselength: 316
        code_on: 5393
        code_off: 5396
        signal_repetitions: 15

automation:
  trigger:
    platform: time
    # Matches every hour at 5 minutes past whole
    minutes: 4
    seconds: 20
  action:
    service: switch.turn_on
    entity_id: switch.bedroom_light
~                                      

