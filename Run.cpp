#include <iostream>
#include <string>
#include <vector>
#include <windows.h>
#include <cstdlib>

int main() {
    // Banner
    std::cout << "========================================" << std::endl;
    std::cout << "This APP is Not an Offensive ACT Against YouTube Policy" << std::endl;
    std::cout << "and is just a Preview Test" << std::endl;
    std::cout << "========================================" << std::endl;
    std::cout << std::endl;

    // Ask for URL
    std::string ytURL;
    std::cout << "Enter YouTube video URL: ";
    std::getline(std::cin, ytURL);

    // Find the EXE
    WIN32_FIND_DATA findFileData;
    HANDLE hFind = FindFirstFile("YTdow*.exe", &findFileData);
    std::string ytExe;

    if (hFind != INVALID_HANDLE_VALUE) {
        ytExe = findFileData.cFileName;
        FindClose(hFind);
    }

    // Handle missing EXE
    if (ytExe.empty()) {
        std::cout << "❌ No YTdow*.exe found in this folder." << std::endl;
        system("pause");
        return 1;
    }

    // Run the EXE with high-res merged download
    std::cout << "✅ Found: " << ytExe << std::endl;
    std::cout << "🔄 Downloading in highest available resolution..." << std::endl;
    
    std::string command = "\"" + ytExe + "\" -f \"bv*+ba/best\" --merge-output-format mp4 \"" + ytURL + "\"";
    
    STARTUPINFO si;
    PROCESS_INFORMATION pi;
    ZeroMemory(&si, sizeof(si));
    si.cb = sizeof(si);
    ZeroMemory(&pi, sizeof(pi));

    if (CreateProcess(NULL, (LPSTR)command.c_str(), NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi)) {
        WaitForSingleObject(pi.hProcess, INFINITE);
        CloseHandle(pi.hProcess);
        CloseHandle(pi.hThread);
    } else {
        std::cout << "❌ Error starting download process." << std::endl;
        system("pause");
        return 1;
    }

    std::cout << "✅ Download completed!" << std::endl;
    return 0;
}
