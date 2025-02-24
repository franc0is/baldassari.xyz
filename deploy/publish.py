# Import the required module.
import os
from webdav3.client import Client
import argparse
from dotenv import load_dotenv

load_dotenv()  # Load variables from a .env file into os.environ

parser = argparse.ArgumentParser(description="List current files")
parser.add_argument('--files',
                    help='Path of new files to deploy',
                    default=None)
args = parser.parse_args()

# Set up the connection options.
options = {
    'webdav_hostname': 'https://webdav.fastmail.com/',  # Fastmail's WebDAV hostname.
    'webdav_login':    os.getenv('WEBDAV_LOGIN'),
    'webdav_password': os.getenv('WEBDAV_PASSWORD')
}

# Initialize the WebDAV client.
client = Client(options)

# Specify the remote directory to list files from (e.g., the root is '/').
remote_directory = 'email.franc0is.com/files/baldassari.xyz/'

if args.files:
    # Delete each individual top-level item in the remote directory.
    items = client.list(remote_directory)
    for item in items:
        if item in ("", ".", ".."):
            continue  # Skip irrelevant entries.
        remote_item = remote_directory.rstrip('/') + '/' + item.strip('/')
        print(f"Deleting {remote_item}")
        try:
            client.clean(remote_item)
        except Exception as e:
            print(f"Error cleaning {remote_item}: {e}")
    
    # Recursively walk through the local folder and upload files.
    for root, _, files in os.walk(args.files):
        rel_path = os.path.relpath(root, args.files)
        if rel_path == '.':
            remote_subdir = remote_directory.rstrip('/')
        else:
            remote_subdir = remote_directory.rstrip('/') + '/' + rel_path.replace('\\', '/')
        # Ensure the remote subdirectory exists.
        try:
            client.mkdir(remote_subdir)
        except Exception:
            pass  # Directory may already exist.
        for file in files:
            local_file = os.path.join(root, file)
            remote_file = remote_subdir + '/' + file
            print(f"Uploading {local_file} to {remote_file}")
            client.upload_sync(remote_path=remote_file, local_path=local_file)
    
    # Optionally, list and print the remote directory contents after upload.
    files = client.list(remote_directory)
    print("Files in '{}' after upload:".format(remote_directory))
    for file in files:
        print(file)
else:
    # Retrieve and print the list of files as before.
    files = client.list(remote_directory)
    print("Files in '{}':".format(remote_directory))
    for file in files:
        print(file)
