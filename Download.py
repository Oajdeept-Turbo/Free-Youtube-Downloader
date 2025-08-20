import os
import random
import subprocess
import sys
import time

def run_command(command):
    """Runs a command and returns its exit code."""
    try:
        # Using shell=True to allow commands like 'cls' and to handle arguments easily
        result = subprocess.run(command, shell=True, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        return result.returncode
    except (subprocess.CalledProcessError, FileNotFoundError):
        return 1

def main():
    # === Setup ===
    os.system('chcp 65001 >nul')
    os.system('mode con: cols=85 lines=35')
    os.system('title ╔═ RITUAL HARVESTER - BLOOD TORCH EDITION ═╗')
    os.system('color 0C')
    os.system('cls')

    # === Ritual Intro ===
    print("\n")
    print("╔══════════════════════════════════════════════════════════════════════════╗")
    print("║                      ☠ RITUAL HARVESTER ☠                               ║")
    print("║--------------------------------------------------------------------------║")
    print("║  This rite binds flesh (video) and soul (audio) into a cursed vessel.    ║")
    print("╚══════════════════════════════════════════════════════════════════════════╝")
    time.sleep(1)

    # === URL Prompt ===
    os.system('color 0E')
    yt_url = input("📜 Speak the URL to harvest: ")
    if not yt_url:
        os.system('color 0C')
        print("✖ The summoning circle remains empty — the rite collapses.")
        input("Press Enter to exit...")
        sys.exit(1)

    # === File Names ===
    rand_num = random.randint(1, 999)
    raw_file = f"harvest_{rand_num}.mp4"
    final_file = f"sealed_{rand_num}.mp4"

    # === Harvest Phase ===
    os.system('cls')
    os.system('color 0D')
    print("[██████░░░░░░░░░░░░] 40% – Carving blood runes")
    time.sleep(1)
    print("[████████████░░░░░] 70% – Hooking spectral stream")
    time.sleep(1)
    print("[█████████████████] 99.9% – Vessel pulled into circle")
    time.sleep(0.5)
    print()
    
    download_command = f'YTDownloader.exe -f bestvideo+bestaudio --merge-output-format mp4 -o "{raw_file}" "{yt_url}"'
    run_command(download_command)

    if not os.path.exists(raw_file):
        os.system('color 0C')
        print("✖ The portal tore and the prize was lost.")
        input("Press Enter to exit...")
        sys.exit(1)

    # === Purification Phase ===
    os.system('cls')
    os.system('color 0E')
    print("╔════════════════════════════════════════════════════════════════════╗")
    print("║        🔥 THE BLACK‑FLAME TORCH IS LIT — PURIFICATION BEGINS 🔥     ║")
    print("╚════════════════════════════════════════════════════════════════════╝")
    print()
    
    bar_char = "█"
    for i in range(1, 41):
        glitch = random.randint(0, 20)
        bar = bar_char * i
        message = "☠ engraving corrupted glyphs..." if glitch < 3 else "🔥 flames scour the Opus spirit..."
        print(f"\r{bar:<40} {message}", end="")
        time.sleep(0.05)
    print()

    ffmpeg_command = f'ffmpeg -i "{raw_file}" -c:v copy -c:a aac -b:a 192k "{final_file}" -y'
    run_command(ffmpeg_command)
    if os.path.exists(raw_file):
        os.remove(raw_file)

    # === Sealing Phase ===
    os.system('cls')
    if os.path.exists(final_file):
        os.system('color 0A')
        print("╔════════════════════════════════════════════════════════════════════╗")
        print("║                     ✔ RITUAL COMPLETE                              ║")
        print(f"║ The vessel is sealed: {final_file}                                  ║")
        print("║ Its voice is pure AAC, freed from spectral corruption.             ║")
        print("╚════════════════════════════════════════════════════════════════════╝")
    else:
        os.system('color 0C')
        print("╔════════════════════════════════════════════════════════════════════╗")
        print("║                     ✖ RITUAL FAILED                                ║")
        print("║ The vessel crumbled to ash mid‑sealing.                            ║")
        print("╚════════════════════════════════════════════════════════════════════╝")
    
    input("Press Enter to exit...")

if __name__ == "__main__":
    main()
