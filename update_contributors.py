import json
from urllib.request import urlopen
import os.path

CONTRIBUTORS_URL = "http://api.github.com/repos/RustPython/RustPython/contributors"
CONTRIBUTORS_FILE = os.path.join(
    os.path.dirname(__file__), "website/_data/contributors.json"
)

contributors = json.load(urlopen(CONTRIBUTORS_URL))

del contributors[10:]

contributors = [{"github_username": c["login"]} for c in contributors]

with open(CONTRIBUTORS_FILE, "w") as f:
    json.dump(contributors, f)
