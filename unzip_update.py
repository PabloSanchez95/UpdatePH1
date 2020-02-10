import os
from glob import glob
from zipfile import ZipFile


def unzip_update():
    update_file = glob("PH1-Images-*.zip")

    if len(update_file) != 1:
        return -1
    update_file = update_file[0]

    with ZipFile(update_file, "r") as zip_ref:
        for zip_info in zip_ref.infolist():
            if zip_info.filename[-1] == '/':
                continue
            zip_info.filename = os.path.basename(zip_info.filename)
            zip_ref.extract(zip_info, "UpdateFiles/")


if __name__ == "__main__":
    unzip_update()
