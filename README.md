# MobileX API Hub

## Usage

- LLM
  - [cURL (CLI)](/examples/llm.sh)
  - [Python (OpenAI)](/examples/llm.py)

## Deployment

### LLM

```bash
# Create an API namespace
kubectl apply -f "templates/namespace.yaml"

# Create a HuggingFace Hub token
vim "templates/huggingface-hub.yaml"  # and, replace all TODOs into your own ones
kubectl apply -f "templates/huggingface-hub.yaml"

# Deploy a model
kubectl apply -f "templates/llm.yaml"
```
