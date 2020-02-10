import os
from glob import glob
from zipfile import ZipFile


def unzip_update():
    update_file = glob("PH1-Images-*.zip")

    if len(update_file) != 1:
        return -1
    update_file = update_file[0]

    with ZipFile(update_file, "r") as zip_ref:
        update_path = update_file.replace(".zip", "")

        target_file = zip_ref.getinfo(f"{update_path}/boot.img")
        target_file.filename = os.path.basename(target_file.filename)
        target_file
        zip_ref.extract(target_file, "UpdateFiles/")


if __name__ == "__main__":
    unzip_update()
