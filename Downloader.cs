using System;
using System.Diagnostics;
using System.IO;
using System.Linq;

class Downloader
{
    static void Main()
    {
        // Banner
        Console.WriteLine("========================================");
        Console.WriteLine("This APP is Not an Offensive ACT Against YouTube Policy");
        Console.WriteLine("and is just a Preview Test");
        Console.WriteLine("========================================");
        Console.WriteLine();

        // Ask for URL
        Console.Write("Enter YouTube video URL: ");
        string ytURL = Console.ReadLine();

        // Find the EXE
        string ytExe = Directory.GetFiles(Directory.GetCurrentDirectory(), "YTdow*.exe").FirstOrDefault();

        // Handle missing EXE
        if (string.IsNullOrEmpty(ytExe))
        {
            Console.WriteLine("❌ No YTdow*.exe found in this folder.");
            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
            return;
        }

        // Run the EXE with high-res merged download
        Console.WriteLine($"✅ Found: {Path.GetFileName(ytExe)}");
        Console.WriteLine("🔄 Downloading in highest available resolution...");
        
        ProcessStartInfo startInfo = new ProcessStartInfo
        {
            FileName = ytExe,
            Arguments = $"-f \"bv*+ba/best\" --merge-output-format mp4 \"{ytURL}\""
        };
        Process.Start(startInfo);

        Console.WriteLine();
        Console.WriteLine("✅ Download complete or in progress...");
        Console.WriteLine("Press any key to exit...");
        Console.ReadKey();
    }
}
