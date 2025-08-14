using System;
using System.Diagnostics;

class Program {
    static void Main() {
        Console.ForegroundColor = ConsoleColor.Magenta;
        Console.WriteLine("=============================================================");
        Console.ForegroundColor = ConsoleColor.Yellow;
        Console.WriteLine("This APP is Not an Offensive ACT Against YouTube Policy");
        Console.ForegroundColor = ConsoleColor.Cyan;
        Console.WriteLine("and is just a Preview Test");
        Console.ForegroundColor = ConsoleColor.Magenta;
        Console.WriteLine("=============================================================\n");
        Console.ResetColor();

        Console.ForegroundColor = ConsoleColor.Yellow;
        Console.Write("Enter YouTube video URL: ");
        Console.ResetColor();
        string url = Console.ReadLine();

        var process = new Process();
        process.StartInfo.FileName = "YTDownloder.exe";
        process.StartInfo.Arguments = $"-f \"bv*+ba/best\" -o \"%(title)s.%(ext)s\" \"{url}\"";
        process.StartInfo.UseShellExecute = false;
        process.StartInfo.RedirectStandardOutput = false;
        process.StartInfo.RedirectStandardError = false;

        try {
            process.Start();
            process.WaitForExit();

            if (process.ExitCode == 0) {
                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine("\nDownload completed successfully.");
            } else {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine($"\nyt-dlp failed with exit code {process.ExitCode}.");
            }
        } catch (Exception ex) {
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine($"\nError: {ex.Message}");
        }

        Console.ResetColor();
    }
}
