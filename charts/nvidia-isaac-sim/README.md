# NVIDIA ISAAC-SIM Helm Chart

## Usage

```bash
# Register the MobileX API repository
helm repo add mobilex "https://smartx-team.github.com/mobilex-api"

# Deploy a NVIDIA ISAAC-SIM instance
helm install "my-sim" "mobilex/nvidia-isaac-sim" \
    --namespace "name-twin"
```
