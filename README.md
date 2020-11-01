<h1 align="center">
  <img src="https://airsonic.github.io/img/logo.png" style="width:256px" alt="Airsonic">
  <br />
  Airsonic
</h1>

<p align="center"><b>This is the snap for Airsonic</b>, <i>“a Free and Open Source community driven media server, providing ubiquitous access to your music.”</i>. It works on Ubuntu, Fedora, Debian, and other major Linux
distributions.</p>

<p align="center">
<a href="https://build.snapcraft.io/user/arubislander/airsonic"><img src="https://build.snapcraft.io/badge/arubislander/airsonic.svg" alt="Snap Status"></a>
</p>


<p align="center">Published for <img src="https://raw.githubusercontent.com/anythingcodes/slack-emoji-for-techies/gh-pages/emoji/tux.png" align="top" width="24" /> with 💝 by ArubIslander</p>

## Build from repo and test the snap

    $ git clone https://gitlab.com/arubislander/airsonic-snap.git
    $ cd airsonic-snap
    $ snapcraft snap try
    $ snap try prime

## Install from store

    sudo snap install airsonic

or

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/airsonic)

([Don't have snapd installed?](https://snapcraft.io/docs/core/install))

## Summary

### Airsonic is a media streaming and sharing platform maintained by the community. (see https://airsonic.github.io/)

This snap runs under full confinement, which means it will not be able to access files outside of its 'home' folder. Normally this would make the app pretty useless, right? So to get around this issue somewhat the snap also consumes the removable-media interface. But it is not hooked up by default. So after installing the snap do:

    $ sudo snap connect airsonic:removable-media

After that, anything mounted under /media will be accessible to the snap.

### configuration settings:

- **host**: IP address for the service to listen on. Defaults to *0.0.0.0* to listen on all IP addresses.
- **port**: What port the service should listen on. Defaults to *8080*
- **context-path**: The context path to use for the url of the service. Defaults to "/"
- **max-memory**: Max amount of memory in MB that the java virtual machine is allowed to use. Defaults to *150*  

#### Example:

To set the aironic service to use a maximum of 450 MB and listen on URL: http://192.168.5.10:4040/airsonic do:

    $ sudo snap set airsonic host=192.168.1.10 port=4040 context-path="/airsonic" max-memory=450

The service needs to be restarted to pick up the new settings:

    $ sudo snap restart airsonic

Happy listening!

---

## Version history
### New in version 10.6.2+snap1
Initial release to the Snap Store
