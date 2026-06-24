#!/usr/bin/env python3
"""Compact three-dot privacy indicator for Waybar.

Dots, left to right: [mic] [speaker] [screen].
Dim (#5e5e5e) when idle, lit when in use. Hover shows per-resource status.

Detection: reads PipeWire stream nodes via `pw-dump` and checks which are
actually `running`. (Earlier pactl approach was wrong: sink-inputs /
source-outputs don't carry a State field -- that lives on the devices.)
"""

import json
import subprocess

DIM = "#5e5e5e"
MIC = "#26a65b"  # green
SPK = "#2980b9"  # blue
SCRN = "#cf5700"  # orange
DOT = "\u25cf"  # ●


def _nodes():
    try:
        raw = subprocess.run(
            ["pw-dump"], capture_output=True, text=True, timeout=2
        ).stdout
        return json.loads(raw) if raw else []
    except Exception:
        return []


def _running(nodes, *media_classes):
    for n in nodes:
        info = n.get("info") or {}
        props = info.get("props") or {}
        if props.get("media.class") in media_classes and info.get("state") == "running":
            return True
    return False


def _dot(color, label, on):
    glyph = f"<span color='{color if on else DIM}'>{DOT}</span>"
    return glyph, f"{label}: {'in use' if on else 'idle'}"


def main():
    nodes = _nodes()
    mic = _running(nodes, "Stream/Input/Audio")
    spk = _running(nodes, "Stream/Output/Audio")
    # screencast producer node; both names seen across portal versions
    screen = _running(nodes, "Stream/Output/Video", "Video/Source")

    d_mic, t_mic = _dot(MIC, "Microphone", mic)
    d_spk, t_spk = _dot(SPK, "Speaker", spk)
    d_scr, t_scr = _dot(SCRN, "Screen share", screen)

    print(
        json.dumps(
            {
                "text": f"{d_mic} {d_spk} {d_scr}",
                "tooltip": "\n".join([t_mic, t_spk, t_scr]),
                "class": "active" if (mic or spk or screen) else "idle",
            }
        )
    )


if __name__ == "__main__":
    main()
