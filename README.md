# README

Script to update Essentials PH1

### Getting started

- It uses python [3.7+](https://www.python.org/downloads/)
- Version 0.1
- [Essentials developer page](https://www.essential.com/developer/current-builds)
- [ADB and fastboot tools](https://developer.android.com/studio/releases/platform-tools.html)

### Installation steps

- To get pythons venv and dependencies, run:

```sh
make start
```

- To transfer boot to the phones internal memory:

```sh
make push_file
```

- Use magisk to patch file
- To get de patched image from the phone and reboot the phone:

```sh
make pull_file bootloader_restart
```

- To flash the patched image and reboot phone:

```sh
make flash_boot reboot
```
