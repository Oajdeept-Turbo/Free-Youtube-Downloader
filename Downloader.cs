using System;
using System.Diagnostics;

class Downloader
{
    static void Main(string[] args)
    {
        string url = args.Length > 0 ? args[0] : "https://www.youtube.com/watch?v=dQw4w9WgXcQ"; // Default URL
        Process.Start("YTDownloder.exe", $"\"{url}\"");
    }
}
