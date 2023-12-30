import json

import main

with open("openapi.json", "w") as f:
    f.write(json.dumps(main.app.openapi()))
