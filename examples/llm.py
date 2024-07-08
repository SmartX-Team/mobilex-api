from openai import OpenAI

client = OpenAI(
    base_url='https://api.mobilex.kr',
)

chat_completion = client.chat.completions.create(
    messages=[
        {
            "role": "user",
            "content": "Say this is a test",
        }
    ],
    model="tgi",
)

print(chat_completion)
