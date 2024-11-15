# Connected Data Lake instance Helm Chart

## Usage

```bash
# Register the MobileX API repository
helm repo add mobilex "https://smartx-team.github.io/mobilex-api"

# Deploy a Connected Data Lake endpoint instance instance
NAME="object-storage"  # NOTE: the name is fixed per namespace!
helm install $NAME "mobilex/cdl-endpoint" \
    --namespace "name-twin"
```

## Uninstall

```bash
NAME="object-storage"  # NOTE: the name is fixed per namespace!
helm uninstall $NAME --namespace "name-twin"
```

## Validating

```bash
# Install json schema generator
helm plugin install "https://github.com/losisin/helm-values-schema-json.git"

# Create a json schema
helm schema
```
