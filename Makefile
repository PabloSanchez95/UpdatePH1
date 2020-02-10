# descargat fastboot
# push_file
# patch
# pull_file bootloader_restart
# flash_boot reboot

adb = tools/adb
fastboot = tools/fastboot

devices:
	@echo "Checking adb"
	@${adb} devices
	@echo "Checking fastboot"
	@${fastboot} devices

bootloader_restart:
	@echo "Restarting..."
	${adb} reboot bootloader

reboot:
	@echo "Restarting..."
	@${fastboot} reboot

flash_update:
	@echo "Flashing magisk patched..."
	@${fastboot} flash nvdef_a UpdateFiles/nvdef.img
	@${fastboot} flash nvdef_b UpdateFiles/nvdef.img
	@${fastboot} flash boot_a UpdateFiles/magisk_patched.img
	@${fastboot} flash boot_b UpdateFiles/magisk_patched.img
	@${fastboot} flash system_a UpdateFiles/system.img
	@${fastboot} flash system_b UpdateFiles/system.img
	@${fastboot} flash bluetooth_a UpdateFiles/bluetooth.img
	@${fastboot} flash bluetooth_b UpdateFiles/bluetooth.img
	@${fastboot} flash xbl_a UpdateFiles/xbl.img
	@${fastboot} flash xbl_b UpdateFiles/xbl.img
	@${fastboot} flash abl_a UpdateFiles/abl.img
	@${fastboot} flash abl_b UpdateFiles/abl.img
	@${fastboot} flash dsp_a UpdateFiles/dsp.img
	@${fastboot} flash dsp_b UpdateFiles/dsp.img
	@${fastboot} flash modem_a UpdateFiles/modem.img
	@${fastboot} flash modem_b UpdateFiles/modem.img
	@${fastboot} flash vendor_a UpdateFiles/vendor.img
	@${fastboot} flash vendor_b UpdateFiles/vendor.img
	@${fastboot} flash keymaster_a UpdateFiles/keymaster.mbn
	@${fastboot} flash keymaster_b UpdateFiles/keymaster.mbn
	@${fastboot} flash cmnlib_a UpdateFiles/cmnlib.mbn
	@${fastboot} flash cmnlib_b UpdateFiles/cmnlib.mbn
	@${fastboot} flash cmnlib64_a UpdateFiles/cmnlib64.mbn
	@${fastboot} flash cmnlib64_b UpdateFiles/cmnlib64.mbn
	@${fastboot} flash tz_a UpdateFiles/tz.mbn
	@${fastboot} flash tz_b UpdateFiles/tz.mbn
	@${fastboot} flash hyp_a UpdateFiles/hyp.mbn
	@${fastboot} flash hyp_b UpdateFiles/hyp.mbn
	@${fastboot} flash rpm_a UpdateFiles/rpm.mbn
	@${fastboot} flash rpm_b UpdateFiles/rpm.mbn
	rm -r UpdateFiles/


clean:
	@${adb} shell rm /mnt/sdcard/Download/magisk_patched.img ||:
	@${adb} shell rm /mnt/sdcard/Flash/boot.img ||:

push_file: clean
	@echo "Extracting file..."
	@python3 unzip_update.py
	@mv UpdateFiles/boot.img boot.img
	@${adb} push boot.img /mnt/sdcard/Flash/boot.img
	@rm boot.img

pull_file:
	@echo "Getting magisk patched..."
	@${adb} pull /mnt/sdcard/Download/magisk_patched.img UpdateFiles/magisk_patched.img
	@make clean
