# pup_hiera

LSST Shared Hiera Data Store

Intended to be used with the following lookup order:
```YAML
- node/%{fqdn}.yaml
- site/%{site}/cluster/%{cluster}/role/%{role}.yaml
- site/%{site}/cluster/%{cluster}.yaml
- cluster/%{cluster}/role/%{role}.yaml
- cluster/%{cluster}.yaml
- site/%{site}/role/%{role}.yaml
- site/%{site}.yaml
- role/%{role}.yaml
- common.yaml
```

Hiera lookup order is defined in `control/hiera.yaml`.
