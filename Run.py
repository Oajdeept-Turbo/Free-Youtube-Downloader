import subprocess

url = input("Enter YouTube video URL: ")
subprocess.run([
    "YTDownloader.exe",
    "-f", "bv*+ba/best",
    "--merge-output-format", "mp4",
    "-o", "%(title)s.%(ext)s",
    url
])

print("Download started...")
