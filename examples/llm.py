from openai import OpenAI

client = OpenAI(
    base_url='https://api.mobilex.kr',  # NOTE: OpenAI 객체를 만들 때 반드시 이 base_url 값을 다음과 같이 작성해주세요!
)

chat_completion = client.chat.completions.create(
    messages=[
        {
            "role": "system",
            "content": "안녕하세요. 저는 무엇이든 물어보면 답을 해주는 로봇이에요. 무엇이든 물어보세요!",
        },
        {
            "role": "user",
            "content": "요즘 날씨 많이 덥다.. 삼계탕 한번 먹을까 생각이 드는데 문득 한국의 초복 풍습이 궁금해졌어.",
        },
    ],
    model="tgi",  # NOTE: 모델 값은 아무렇게나 넣어도 상관없습니다. (내장된 llama-3 모델이 서비스함)
    max_tokens=128,  # NOTE: 너무 많은 토큰값을 받으려 하면 결과 수신이 늦어질 수 있습니다. 적당한 값을 찾는 것을 추천드립니다!
)

print('Response:', chat_completion.choices[0].message.content)
