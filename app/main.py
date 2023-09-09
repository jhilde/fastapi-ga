from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Wow!"}


@app.get("/health")
async def health():
    return {}
