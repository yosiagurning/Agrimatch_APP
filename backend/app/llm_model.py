"""
Adapter to your Python LLM. Replace the dummy implementation below
with a call into your actual model.
"""
from typing import Tuple

# Example: a simple echo model with trivial token counter
def _count_tokens(text: str) -> int:
    # naive token approximation
    return max(1, len(text.split()))

def generate_reply(prompt: str, temperature: float = 0.2, max_tokens: int = 256) -> Tuple[str, int]:
    """
    Produce an assistant reply for the given prompt.
    Return (reply_text, token_count).
    Replace with your real model call.
    """
    reply = f"Saya menerima: {prompt[:max_tokens]}"
    tokens = _count_tokens(reply)
    return reply, tokens