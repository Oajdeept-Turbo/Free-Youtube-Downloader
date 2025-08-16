#include <iostream>
#include <string>

int main() {
    std::string url;
    std::cout << "Enter YouTube video URL: ";
    std::getline(std::cin, url);

    std::string command = "YTDownloader.exe -f \"bv*+ba/best\" --merge-output-format mp4 -o \"%(title)s.%(ext)s\" \"" + url + "\"";
    system(command.c_str());

    std::cout << "Download started...\n";
    return 0;
}
