#!/usr/bin/env python3
import json
import subprocess
import datetime
import re
import sys
import os
from zoneinfo import ZoneInfo

# --- Configuration ---
timezones = ["Europe/Istanbul", "Europe/Berlin", "UTC"]
OFFSET_FILE = "/tmp/waybar_calendar_offset"

# --- Handle Scroll Arguments ---
current_offset = 0

if os.path.exists(OFFSET_FILE):
    try:
        with open(OFFSET_FILE, "r") as f:
            current_offset = int(f.read().strip())
    except Exception:
        current_offset = 0

if len(sys.argv) > 1:
    action = sys.argv[1]
    if action == "up":
        current_offset += 1
    elif action == "down":
        current_offset -= 1
    elif action == "reset":
        current_offset = 0

    # Save the new offset
    with open(OFFSET_FILE, "w") as f:
        f.write(str(current_offset))

# --- Date Calculation ---
now = datetime.datetime.now()
today_day = now.day
today_month = now.month
today_year = now.year

target_month_idx = today_month - 1 + current_offset
target_year = today_year + (target_month_idx // 12)
target_month = (target_month_idx % 12) + 1

# --- Generate Content ---

# 1. Main Bar Text
main_text = f"{now.strftime('%H:%M:%S')}  "

# 2. Header (Use target daFte)
target_date_obj = datetime.date(target_year, target_month, 1)

if current_offset == 0:
    header_raw = f" {now.strftime('%A, %d %B %Y')}"
else:
    header_raw = f" {target_date_obj.strftime('%B %Y')}"

# 3. Calendar Body
try:
    cal_cmd = ["cal", "--color=never", "-m", str(target_month), str(target_year)]
    cal_output = subprocess.check_output(cal_cmd).decode("utf-8")
    cal_lines_raw = cal_output.splitlines()
except Exception:
    cal_lines_raw = ["Calendar Error"]

# 4. Timezones
tz_lines_raw = []
tz_title_raw = "Other Timezones:"
tz_lines_raw.append(tz_title_raw)

for tz_name in timezones:
    try:
        dt = datetime.datetime.now(ZoneInfo(tz_name))
        clean_name = tz_name.split("/")[-1] if "/" in tz_name else tz_name
        time_str = dt.strftime("%H:%M:%S")
        tz_lines_raw.append(f"{clean_name:<12} {time_str}")
    except Exception:
        pass

# --- Calculate Width (Centering) ---
max_width = len(header_raw)
for line in cal_lines_raw:
    max_width = max(max_width, len(line))
for line in tz_lines_raw:
    max_width = max(max_width, len(line))

max_width += 4


def center_text(text):
    return text.center(max_width)


# --- Styling ---
header_styled = f"<b>{center_text(header_raw)}</b>"

cal_styled = []
highlight_active = current_offset == 0
pattern = re.compile(r"\b" + str(today_day) + r"\b")

for i, line in enumerate(cal_lines_raw):
    centered_line = center_text(line)

    if i == 0:
        cal_styled.append(f"<span color='#f6f6f6'><b>{centered_line}</b></span>")
    elif i == 1:
        cal_styled.append(f"<span color='#d4d4d4'><b>{centered_line}</b></span>")
    else:
        if highlight_active:

            def highlight(match):
                return f"<span color='#eebb11'><b><u>{match.group(0)}</u></b></span>"

            colored_line = pattern.sub(highlight, centered_line)
            cal_styled.append(f"<b>{colored_line}</b>")
        else:
            cal_styled.append(f"<b>{centered_line}</b>")

formatted_calendar = "\n".join(cal_styled)

tz_styled = []
for i, line in enumerate(tz_lines_raw):
    centered = center_text(line)
    if i == 0:
        tz_styled.append(f"\n<b>{centered}</b>")
    else:
        tz_styled.append(centered)

tz_string = "\n".join(tz_styled)

# --- Final Output ---
tooltip_combined = f"<tt>{header_styled}\n\n{formatted_calendar}\n{tz_string}</tt>"

data = {"text": main_text, "tooltip": tooltip_combined, "class": "custom-clock"}

print(json.dumps(data))
