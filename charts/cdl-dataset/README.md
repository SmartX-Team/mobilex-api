# Connected Data Lake Dataset instance Helm Chart

## Usage

```bash
# Register the MobileX API repository
helm repo add mobilex "https://smartx-team.github.io/mobilex-api"

# Deploy a Connected Data Lake Dataset instance
NAME="my-dataset-hoya-123"  # TODO: Change it to your unique app name
helm install $NAME "mobilex/cdl-dataset" \
    --namespace "name-twin"
```

## Uninstall

```bash
NAME="my-dataset-hoya-123"  # TODO: Change it to your app name
helm uninstall $NAME --namespace "name-twin"
```

## Validating

```bash
# Install json schema generator
helm plugin install "https://github.com/losisin/helm-values-schema-json.git"

# Create a json schema
helm schema
```
