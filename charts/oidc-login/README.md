# OIDC Login

## Usage

```bash
# Register the MobileX API repository
helm repo add mobilex "https://smartx-team.github.io/mobilex-api"

# Deploy authorization rules
NAME="my-user-name"  # TODO: Change it to your oidc username
helm install $NAME "mobilex/oidc-login" \
    --namespace "name-twin"
```

## Uninstall

```bash
NAME="my-user-name"  # TODO: Change it to your oidc username
helm uninstall $NAME --namespace "oidc-login"
```

## Validating

```bash
# Install json schema generator
helm plugin install "https://github.com/losisin/helm-values-schema-json.git"

# Create a json schema
helm schema
```
