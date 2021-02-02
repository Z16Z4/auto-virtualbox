import requests
import os
import pyfiglet
from multiprocessing.pool import ThreadPool
def download_url(url):
  print("downloading",url)
  file_name_start_pos = url.rfind("/") + 1
  file_name = url[file_name_start_pos:]
  r = requests.get(url, stream=True)
  if r.status_code == requests.codes.ok:
    with open(file_name, 'wb') as f:
      for data in r:
        f.write(data)
      return url
user_input = input("want to download script, or ALL (a) for ALL , (s) for scripts")
if user_input == "a":
    urls = ["URL FOR :/client.ova",
            "URL FOR :/gateway.ova",
            "URL FOR :/cloud.ps1",
            "URL FOR :/cloud.bat"
          ]
if user_input == "s":
    urls = ["URL FOR :/cloud.ps1",
            "URL FOR :/cloud.bat"
          ]
results = ThreadPool(5).imap_unordered(download_url, urls)
for r in results:
  print(r)

os.system('cloud.bat')
