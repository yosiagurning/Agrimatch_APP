from datetime import datetime
from typing import Optional, List
from pydantic import BaseModel, EmailStr, Field

# Auth
class Token(BaseModel):
    access_token: str
    refresh_token: str
    token_type: str = "bearer"

class TokenPayload(BaseModel):
    sub: str
    exp: int

class UserBase(BaseModel):
    email: EmailStr
    full_name: Optional[str] = None

class UserCreate(UserBase):
    password: str = Field(min_length=6)

class UserLogin(BaseModel):
    email: EmailStr
    password: str

class UserOut(UserBase):
    id: int
    is_active: bool
    created_at: datetime

    class Config:
        from_attributes = True

# Chat / Conversation
class ConversationBase(BaseModel):
    title: Optional[str] = "New Chat"

class ConversationCreate(ConversationBase):
    pass

class ConversationOut(ConversationBase):
    id: int
    owner_id: int
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True

class MessageBase(BaseModel):
    role: str
    content: str

class MessageCreate(MessageBase):
    pass

class MessageOut(MessageBase):
    id: int
    conversation_id: int
    token_count: Optional[int] = None
    created_at: datetime

    class Config:
        from_attributes = True

class ChatRequest(BaseModel):
    content: str
    # model params you might want to pass to your LLM
    temperature: float = 0.2
    max_tokens: int = 256

class ChatResponse(BaseModel):
    message: MessageOut