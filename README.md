# README

Script to update Essentials PH1

### Getting started

- [Unlock the bootloader](https://android.gadgethacks.com/how-to/unlock-bootloader-essential-ph-1-0187597/)
- Version 0.1
- Python [3.7+](https://www.python.org/downloads/)
- [Essentials developer page](https://www.essential.com/developer/current-builds)
- [ADB and fastboot tools](https://developer.android.com/studio/releases/platform-tools.html)

### Installation steps

- Download the latest [Essential Fastboot files](https://www.essential.com/developer/current-builds).
- Place the update zip with name starting with "_PH1-Images_"
- Transfer boot.img file to the phones internal memory by running: (This will automatically extract the update files)

```sh
make push_file
```

- Use the [magisk app](https://magiskmanager.com/downloading-magisk-manager) to patch the boot.img on /Flash directory
- To get de patched image from the phone and reboot into fastboot mode:

```sh
make pull_file bootloader_restart
```

- To flash the patched image and reboot phone once finished:

```sh
make flash_update reboot
```
