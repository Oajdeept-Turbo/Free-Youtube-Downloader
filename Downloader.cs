using System;
using System.Diagnostics;

class Program {
    static void Main() {
        Console.Write("Enter YouTube video URL: ");
        string url = Console.ReadLine();

        Process.Start(new ProcessStartInfo {
            FileName = "YTDownloader.exe",
            Arguments = $"-f \"bv*+ba/best\" --merge-output-format mp4 -o \"%(title)s.%(ext)s\" \"{url}\"",
            UseShellExecute = false
        });

        Console.WriteLine("Download started...");
    }
}
