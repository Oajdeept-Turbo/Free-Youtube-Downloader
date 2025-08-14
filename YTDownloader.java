import java.io.*;
import java.util.*;

public class YTDownloader {
    public static void main(String[] args) throws IOException, InterruptedException {
        System.out.println("=============================================================");
        System.out.println("This APP is Not an Offensive ACT Against YouTube Policy");
        System.out.println("and is just a Preview Test");
        System.out.println("=============================================================");

        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter YouTube video URL: ");
        String url = scanner.nextLine();
        scanner.close();

        ProcessBuilder pb = new ProcessBuilder("YTDownloder.exe", 
            "-f", "bv*+ba/best", 
            "-o", "%(title)s.%(ext)s", 
            url);
        pb.inheritIO();
        Process process = pb.start();
        process.waitFor(); // Wait for yt-dlp to finish
    }
}
