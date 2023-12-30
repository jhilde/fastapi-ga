import uuid
from enum import Enum
from uuid import UUID

from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()


class Color(Enum):
    RED = "red"
    BLUE = "blue"
    GREEN = "green"


class FunStuff(BaseModel):
    title: str
    description: str
    color: Color


class MoreFun(FunStuff):
    id: UUID


@app.get("/")
async def root():
    return {"message": "Hello Bigger Application!"}


@app.get("/health")
async def health():
    return {}


@app.post("/fun")
async def create(fun: FunStuff) -> MoreFun:
    return MoreFun(
        title="title",
        description="desc",
        color=Color.BLUE,
        id=uuid.uuid4()
    )
