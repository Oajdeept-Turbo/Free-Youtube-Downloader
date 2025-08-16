import java.io.*;

public class YTDownload {
    public static void main(String[] args) throws IOException {
        System.out.print("Enter YouTube video URL: ");
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        String url = reader.readLine();

        String command = "YTDownloader.exe -f \"bv*+ba/best\" --merge-output-format mp4 -o \"%(title)s.%(ext)s\" \"" + url + "\"";
        Runtime.getRuntime().exec(command);

        System.out.println("Download started...");
    }
}
