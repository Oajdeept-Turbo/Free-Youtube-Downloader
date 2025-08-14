#include <iostream>
#include <string>
#include <cstdlib>

int main() {
    std::cout << "=============================================================\n";
    std::cout << "This APP is Not an Offensive ACT Against YouTube Policy\n";
    std::cout << "and is just a Preview Test\n";
    std::cout << "=============================================================\n\n";

    std::string url;
    std::cout << "Enter YouTube video URL: ";
    std::getline(std::cin, url);

    std::string command = "YTDownloder.exe -f \"bv*+ba/best\" -o \"%(title)s.%(ext)s\" \"" + url + "\"";
    int result = std::system(command.c_str());

    if (result != 0) {
        std::cerr << "\nError: yt-dlp failed with exit code " << result << "\n";
    } else {
        std::cout << "\nDownload completed successfully.\n";
    }

    return 0;
}
