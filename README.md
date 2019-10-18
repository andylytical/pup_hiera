# pup_hiera

Sample hiera setup intended to be used with the following lookup order:
```
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
