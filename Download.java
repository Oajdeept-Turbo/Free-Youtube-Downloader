import java.io.File;
import java.io.IOException;
import java.util.Random;
import java.util.Scanner;

public class Download {

    private static void runCommand(String command) {
        try {
            ProcessBuilder pb = new ProcessBuilder("cmd.exe", "/c", command);
            pb.redirectOutput(ProcessBuilder.Redirect.to(new File("NUL")));
            pb.redirectError(ProcessBuilder.Redirect.to(new File("NUL")));
            Process process = pb.start();
            process.waitFor();
        } catch (IOException | InterruptedException e) {
            // Ignore
        }
    }

    private static void pause(long ms) {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    public static void main(String[] args) {
        // === Setup ===
        try {
            new ProcessBuilder("cmd", "/c", "chcp 65001 >nul && mode con: cols=85 lines=35 && title ╔═ RITUAL HARVESTER - BLOOD TORCH EDITION ═╗ && color 0C && cls").inheritIO().start().waitFor();
        } catch (IOException | InterruptedException e) { /* Ignore */ }

        // === Ritual Intro ===
        System.out.println("\n");
        System.out.println("╔══════════════════════════════════════════════════════════════════════════╗");
        System.out.println("║                      ☠ RITUAL HARVESTER ☠                               ║");
        System.out.println("║--------------------------------------------------------------------------║");
        System.out.println("║  This rite binds flesh (video) and soul (audio) into a cursed vessel.    ║");
        System.out.println("╚══════════════════════════════════════════════════════════════════════════╝");
        pause(1000);

        // === URL Prompt ===
        try { new ProcessBuilder("cmd", "/c", "color 0E").inheritIO().start().waitFor(); } catch (Exception e) {}
        System.out.print("📜 Speak the URL to harvest: ");
        String ytUrl;
        try (Scanner scanner = new Scanner(System.in)) {
            ytUrl = scanner.nextLine();
        }
        if (ytUrl == null || ytUrl.trim().isEmpty()) {
            try { new ProcessBuilder("cmd", "/c", "color 0C").inheritIO().start().waitFor(); } catch (Exception e) {}
            System.out.println("✖ The summoning circle remains empty — the rite collapses.");
            System.out.println("Press Enter to exit...");
            try { System.in.read(); } catch (IOException e) {}
            return;
        }

        // === File Names ===
        Random rand = new Random();
        int randNum = rand.nextInt(999) + 1;
        String rawFile = "harvest_" + randNum + ".mp4";
        String finalFile = "sealed_" + randNum + ".mp4";

        // === Harvest Phase ===
        try { new ProcessBuilder("cmd", "/c", "cls && color 0D").inheritIO().start().waitFor(); } catch (Exception e) {}
        System.out.println("[██████░░░░░░░░░░░░] 40% – Carving blood runes");
        pause(1000);
        System.out.println("[████████████░░░░░] 70% – Hooking spectral stream");
        pause(1000);
        System.out.println("[█████████████████] 99.9% – Vessel pulled into circle");
        pause(500);
        System.out.println();
        
        runCommand(String.format("YTDownloader.exe -f bestvideo+bestaudio --merge-output-format mp4 -o \"%s\" \"%s\"", rawFile, ytUrl));

        File rawF = new File(rawFile);
        if (!rawF.exists()) {
            try { new ProcessBuilder("cmd", "/c", "color 0C").inheritIO().start().waitFor(); } catch (Exception e) {}
            System.out.println("✖ The portal tore and the prize was lost.");
            try { System.in.read(); } catch (IOException e) {}
            return;
        }

        // === Purification Phase ===
        try { new ProcessBuilder("cmd", "/c", "cls && color 0E").inheritIO().start().waitFor(); } catch (Exception e) {}
        System.out.println("╔════════════════════════════════════════════════════════════════════╗");
        System.out.println("║        🔥 THE BLACK‑FLAME TORCH IS LIT — PURIFICATION BEGINS 🔥     ║");
        System.out.println("╚════════════════════════════════════════════════════════════════════╝");
        System.out.println();
        
        for (int i = 1; i <= 40; i++) {
            String message = rand.nextInt(20) < 3 ? "☠ engraving corrupted glyphs..." : "🔥 flames scour the Opus spirit...";
            System.out.print("\r" + "█".repeat(i) + " ".repeat(40 - i) + " " + message);
            pause(50);
        }
        System.out.println();

        runCommand(String.format("ffmpeg -i \"%s\" -c:v copy -c:a aac -b:a 192k \"%s\" -y", rawFile, finalFile));
        rawF.delete();

        // === Sealing Phase ===
        try { new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor(); } catch (Exception e) {}
        File finalF = new File(finalFile);
        if (finalF.exists()) {
            try { new ProcessBuilder("cmd", "/c", "color 0A").inheritIO().start().waitFor(); } catch (Exception e) {}
            System.out.println("╔════════════════════════════════════════════════════════════════════╗");
            System.out.println("║                     ✔ RITUAL COMPLETE                              ║");
            System.out.printf("║ The vessel is sealed: %-39s ║%n", finalFile);
            System.out.println("║ Its voice is pure AAC, freed from spectral corruption.             ║");
            System.out.println("╚════════════════════════════════════════════════════════════════════╝");
        } else {
            try { new ProcessBuilder("cmd", "/c", "color 0C").inheritIO().start().waitFor(); } catch (Exception e) {}
            System.out.println("╔════════════════════════════════════════════════════════════════════╗");
            System.out.println("║                     ✖ RITUAL FAILED                                ║");
            System.out.println("║ The vessel crumbled to ash mid‑sealing.                            ║");
            System.out.println("╚════════════════════════════════════════════════════════════════════╝");
        }
        try { System.in.read(); } catch (IOException e) {}
    }
}
