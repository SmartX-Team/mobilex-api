# NVIDIA ISAAC-SIM Helm Chart

## Usage

```bash
# Register the MobileX API repository
helm repo add mobilex "https://smartx-team.github.io/mobilex-api"

# Deploy a NVIDIA ISAAC-SIM instance
NAME="my-ssh-hoya-123"  # TODO: Change it to your unique app name
helm install $NAME "mobilex/mobilex-ssh" \
    --namespace "name-twin"
```

## Uninstall

```bash
NAME="my-ssh-hoya-123"  # TODO: Change it to your app name
helm uninstall $NAME --namespace "name-twin"
```

## Validating

```bash
# Install json schema generator
helm plugin install "https://github.com/losisin/helm-values-schema-json.git"

# Create a json schema
helm schema
```
