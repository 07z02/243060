from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"status": "ok", "message": "Web4 Playground API"}

@app.get("/echo/{msg}")
def echo(msg: str):
    return {"echo": msg}
