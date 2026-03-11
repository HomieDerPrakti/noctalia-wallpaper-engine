#!/bin/python3

import json
import pathlib
import subprocess
HOME = pathlib.Path("~/").expanduser()
WP_ENGINE_DIR = pathlib.Path(f"{HOME}/.local/share/Steam/steamapps/workshop/content/431960/")
ACTIVE_WP_FILE = f"{HOME}/.config/linux-wallpaperengine/wallpaper.json"

wallpapers = {}

def getTitle(wp_id):
    project_path = f"{WP_ENGINE_DIR}/{wp_id}/project.json"
    with open(project_path, 'r') as projectfile:
        project_data = json.load(projectfile)
    project_title = project_data["title"]
    return project_title

iter = 0
for item in WP_ENGINE_DIR.iterdir():
    if item.is_dir():
        id = item.name
        title = getTitle(id)
        wallpapers.update({ f"{iter}": { "id": id, "title": title } })
        print(f"{iter}: - {title}")
        iter += 1

while True:
    new_wallpaper_num = input("Enter new Wallpaper: ")
    if iter < int(new_wallpaper_num) or int(new_wallpaper_num) < 0:
        continue
    else:
        break

wp_id = wallpapers[new_wallpaper_num]["id"]

with open(ACTIVE_WP_FILE, 'r') as wp_conf_file:
    wp_conf = json.load(wp_conf_file)

wp_conf["active_wallpaper"] = wp_id

with open(ACTIVE_WP_FILE, 'w') as wp_conf_file:
    json.dump(wp_conf, wp_conf_file, indent=4)

subprocess.run(["wallpaperengine-wrapper.sh"])