using System;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Threading;

class RitualHarvester
{
    static void Main(string[] args)
    {
        // === Setup ===
        Console.OutputEncoding = Encoding.UTF8;
        try {
            Console.SetWindowSize(85, 35);
        } catch { /* Ignored if not supported */ }
        Console.Title = "╔═ RITUAL HARVESTER - BLOOD TORCH EDITION ═╗";
        Console.ForegroundColor = ConsoleColor.Red;
        Console.Clear();

        // === Ritual Intro ===
        Console.WriteLine("\n");
        Console.WriteLine("╔══════════════════════════════════════════════════════════════════════════╗");
        Console.WriteLine("║                      ☠ RITUAL HARVESTER ☠                               ║");
        Console.WriteLine("║--------------------------------------------------------------------------║");
        Console.WriteLine("║  This rite binds flesh (video) and soul (audio) into a cursed vessel.    ║");
        Console.WriteLine("╚══════════════════════════════════════════════════════════════════════════╝");
        Thread.Sleep(1000);

        // === URL Prompt ===
        Console.ForegroundColor = ConsoleColor.Yellow;
        Console.Write("📜 Speak the URL to harvest: ");
        string ytUrl = Console.ReadLine();
        if (string.IsNullOrEmpty(ytUrl))
        {
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine("✖ The summoning circle remains empty — the rite collapses.");
            Console.ReadLine();
            return;
        }

        // === File Names ===
        Random rand = new Random();
        int randNum = rand.Next(1, 1000);
        string rawFile = $"harvest_{randNum}.mp4";
        string finalFile = $"sealed_{randNum}.mp4";

        // === Harvest Phase ===
        Console.Clear();
        Console.ForegroundColor = ConsoleColor.DarkMagenta;
        Console.WriteLine("[██████░░░░░░░░░░░░] 40% – Carving blood runes");
        Thread.Sleep(1000);
        Console.WriteLine("[████████████░░░░░] 70% – Hooking spectral stream");
        Thread.Sleep(1000);
        Console.WriteLine("[█████████████████] 99.9% – Vessel pulled into circle");
        Thread.Sleep(500);
        Console.WriteLine();
        
        RunCommand($"YTDownloader.exe -f bestvideo+bestaudio --merge-output-format mp4 -o \"{rawFile}\" \"{ytUrl}\"");

        if (!File.Exists(rawFile))
        {
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine("✖ The portal tore and the prize was lost.");
            Console.ReadLine();
            return;
        }

        // === Purification Phase ===
        Console.Clear();
        Console.ForegroundColor = ConsoleColor.Yellow;
        Console.WriteLine("╔════════════════════════════════════════════════════════════════════╗");
        Console.WriteLine("║        🔥 THE BLACK‑FLAME TORCH IS LIT — PURIFICATION BEGINS 🔥     ║");
        Console.WriteLine("╚════════════════════════════════════════════════════════════════════╝");
        Console.WriteLine();
        
        for (int i = 1; i <= 40; i++)
        {
            int glitch = rand.Next(0, 20);
            string bar = new string('█', i);
            string message = glitch < 3 ? "☠ engraving corrupted glyphs..." : "🔥 flames scour the Opus spirit...";
            Console.Write($"\r{bar.PadRight(40)} {message}");
            Thread.Sleep(50);
        }
        Console.WriteLine();

        RunCommand($"ffmpeg -i \"{rawFile}\" -c:v copy -c:a aac -b:a 192k \"{finalFile}\" -y");
        if (File.Exists(rawFile)) File.Delete(rawFile);

        // === Sealing Phase ===
        Console.Clear();
        if (File.Exists(finalFile))
        {
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("╔════════════════════════════════════════════════════════════════════╗");
            Console.WriteLine("║                     ✔ RITUAL COMPLETE                              ║");
            Console.WriteLine($"║ The vessel is sealed: {finalFile}                                  ║");
            Console.WriteLine("║ Its voice is pure AAC, freed from spectral corruption.             ║");
            Console.WriteLine("╚════════════════════════════════════════════════════════════════════╝");
        }
        else
        {
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine("╔════════════════════════════════════════════════════════════════════╗");
            Console.WriteLine("║                     ✖ RITUAL FAILED                                ║");
            Console.WriteLine("║ The vessel crumbled to ash mid‑sealing.                            ║");
            Console.WriteLine("╚════════════════════════════════════════════════════════════════════╝");
        }
        Console.ReadLine();
    }

    static void RunCommand(string command)
    {
        var processInfo = new ProcessStartInfo("cmd.exe", "/c " + command)
        {
            CreateNoWindow = true,
            UseShellExecute = false,
            RedirectStandardError = true,
            RedirectStandardOutput = true,
        };
        var process = Process.Start(processInfo);
        process.WaitForExit();
    }
}
