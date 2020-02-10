# descargat fastboot
# push_file FILE=
# patch
# pull_file bootloader_restart
# flash_boot reboot

adb = tools/adb
fastboot = tools/fastboot

####################
# Android commands #
####################

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

flash_boot:
	@echo "Flashing magisk patched..."
	@${fastboot} flash boot_a ./magisk_patched.img
	@${fastboot} flash boot_b ./magisk_patched.img
	rm magisk_patched.img


clean:
	@${adb} shell rm /mnt/sdcard/Download/magisk_patched.img ||:
	@${adb} shell rm /mnt/sdcard/Flash/boot.img ||:

push_file: clean
	@echo "Extracting file..."
	@python unzip_update.py
	@mv UpdateFiles/boot.img boot.img
	@rmdir UpdateFiles
	@${adb} push boot.img /mnt/sdcard/Flash/boot.img
	@rm boot.img

pull_file:
	@echo "Getting magisk patched..."
	@${adb} pull /mnt/sdcard/Download/magisk_patched.img magisk_patched.img
	@make clean


##########################
#    Environment setup   #
##########################
start:
	@echo "Making virtual env"
	@( \
		if [ ! -d venv ]; then python3 -m venv --copies venv; fi; \
		source venv/bin/activate; \
		pip install -qU pip; \
		pip --version; \
	)
	