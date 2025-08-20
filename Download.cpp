#include <iostream>
#include <string>
#include <vector>
#include <cstdlib>
#include <ctime>
#include <windows.h>
#include <thread>
#include <chrono>
#include <fstream>

void SetConsoleColor(int color) {
    SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), color);
}

void ClearScreen() {
    system("cls");
}

bool FileExists(const std::string& name) {
    std::ifstream f(name.c_str());
    return f.good();
}

int main(int argc, char* argv[]) {
    // === Setup ===
    SetConsoleOutputCP(65001);
    system("mode con: cols=85 lines=35");
    SetConsoleTitleA("╔═ RITUAL HARVESTER - BLOOD TORCH EDITION ═╗");
    SetConsoleColor(12); // Red
    ClearScreen();

    // === Ritual Intro ===
    std::cout << "\n";
    std::cout << "╔══════════════════════════════════════════════════════════════════════════╗" << std::endl;
    std::cout << "║                      ☠ RITUAL HARVESTER ☠                               ║" << std::endl;
    std::cout << "║--------------------------------------------------------------------------║" << std::endl;
    std::cout << "║  This rite binds flesh (video) and soul (audio) into a cursed vessel.    ║" << std::endl;
    std::cout << "╚══════════════════════════════════════════════════════════════════════════╝" << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(1));

    // === URL Prompt ===
    SetConsoleColor(14); // Yellow
    std::cout << "📜 Speak the URL to harvest: ";
    std::string ytUrl;
    std::getline(std::cin, ytUrl);
    if (ytUrl.empty()) {
        SetConsoleColor(12); // Red
        std::cout << "✖ The summoning circle remains empty — the rite collapses." << std::endl;
        system("pause");
        return 1;
    }

    // === File Names ===
    srand(time(0));
    int randNum = rand() % 999 + 1;
    std::string rawFile = "harvest_" + std::to_string(randNum) + ".mp4";
    std::string finalFile = "sealed_" + std::to_string(randNum) + ".mp4";

    // === Harvest Phase ===
    ClearScreen();
    SetConsoleColor(13); // Magenta
    std::cout << "[██████░░░░░░░░░░░░] 40% – Carving blood runes" << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(1));
    std::cout << "[████████████░░░░░] 70% – Hooking spectral stream" << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(1));
    std::cout << "[█████████████████] 99.9% – Vessel pulled into circle" << std::endl;
    std::this_thread::sleep_for(std::chrono::milliseconds(500));
    std::cout << std::endl;
    
    std::string downloadCmd = "YTDownloader.exe -f bestvideo+bestaudio --merge-output-format mp4 -o \"" + rawFile + "\" \"" + ytUrl + "\" >nul 2>nul";
    system(downloadCmd.c_str());

    if (!FileExists(rawFile)) {
        SetConsoleColor(12); // Red
        std::cout << "✖ The portal tore and the prize was lost." << std::endl;
        system("pause");
        return 1;
    }

    // === Purification Phase ===
    ClearScreen();
    SetConsoleColor(14); // Yellow
    std::cout << "╔════════════════════════════════════════════════════════════════════╗" << std::endl;
    std::cout << "║        🔥 THE BLACK‑FLAME TORCH IS LIT — PURIFICATION BEGINS 🔥     ║" << std::endl;
    std::cout << "╚════════════════════════════════════════════════════════════════════╝" << std::endl;
    std::cout << std::endl;

    for (int i = 1; i <= 40; ++i) {
        int glitch = rand() % 20;
        std::string message = (glitch < 3) ? "☠ engraving corrupted glyphs..." : "🔥 flames scour the Opus spirit...";
        std::cout << "\r";
        for(int j=0; j<i; ++j) std::cout << "█";
        for(int j=i; j<40; ++j) std::cout << " ";
        std::cout << " " << message << std::flush;
        std::this_thread::sleep_for(std::chrono::milliseconds(50));
    }
    std::cout << std::endl;

    std::string ffmpegCmd = "ffmpeg -i \"" + rawFile + "\" -c:v copy -c:a aac -b:a 192k \"" + finalFile + "\" -y >nul 2>nul";
    system(ffmpegCmd.c_str());
    remove(rawFile.c_str());

    // === Sealing Phase ===
    ClearScreen();
    if (FileExists(finalFile)) {
        SetConsoleColor(10); // Green
        std::cout << "╔════════════════════════════════════════════════════════════════════╗" << std::endl;
        std::cout << "║                     ✔ RITUAL COMPLETE                              ║" << std::endl;
        std::cout << "║ The vessel is sealed: " << finalFile << std::string(35 - finalFile.length(), ' ') << "║" << std::endl;
        std::cout << "║ Its voice is pure AAC, freed from spectral corruption.             ║" << std::endl;
        std::cout << "╚════════════════════════════════════════════════════════════════════╝" << std::endl;
    } else {
        SetConsoleColor(12); // Red
        std::cout << "╔════════════════════════════════════════════════════════════════════╗" << std::endl;
        std::cout << "║                     ✖ RITUAL FAILED                                ║" << std::endl;
        std::cout << "║ The vessel crumbled to ash mid‑sealing.                            ║" << std::endl;
        std::cout << "╚════════════════════════════════════════════════════════════════════╝" << std::endl;
    }

    system("pause");
    return 0;
}
