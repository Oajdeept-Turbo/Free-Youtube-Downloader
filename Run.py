import subprocess
import sys
import os

try:
    from colorama import init, Fore
    # Initialize colorama
    init(autoreset=True)
except ImportError:
    print("Colorama not found. For a better experience, please install it using: pip install colorama")
    # Create a dummy Fore class if colorama is not available so the script doesn't crash
    class DummyFore:
        def __getattr__(self, name):
            return ""
    Fore = DummyFore()

def main():
    """Main function to run the YouTube video downloader."""
    # Banner
    print(Fore.MAGENTA + "=" * 60)
    print(Fore.YELLOW + "This APP is Not an Offensive ACT Against YouTube Policy")
    print(Fore.CYAN + "and is just a Preview Test")
    print(Fore.MAGENTA + "=" * 60)

    # Check if YTDownloder.exe exists in the current directory
    if not os.path.exists("YTDownloder.exe"):
        print(Fore.RED + "YTDownloder.exe not found. Make sure it's in the same folder as this script.")
        sys.exit(1)

    try:
        # Prompt for URL
        url = input(Fore.YELLOW + "Enter YouTube video URL: ")

        # Run yt-dlp
        subprocess.run(
            [
                ".\\YTDownloder.exe",
                "-f", "bv*+ba/best",
                "-o", "%(title)s.%(ext)s",
                url
            ],
            check=True,
            text=True
        )

        print(Fore.GREEN + "\nDownload completed successfully.")

    except KeyboardInterrupt:
        print(Fore.RED + "\nOperation cancelled by user.")
    except subprocess.CalledProcessError as e:
        print(Fore.RED + f"\nyt-dlp failed with exit code {e.returncode}.")
        print(Fore.RED + "Please check the URL and your network connection.")

if __name__ == "__main__":
    main()
