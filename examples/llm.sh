curl 'https://api.mobilex.kr/v1/chat/completions' \
    -X 'POST' \
    -H 'accept: application/json' \
    -H 'Content-Type: application/json' \
    -d '{
  "model": "tgi",
  "messages": [{"role": "user", "content": "제로콜라가 일반 콜라보다 몸에 더 나은 이유"}]}
}'
