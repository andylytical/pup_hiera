# pup_hiera

Sample hiera setup intended to be used with the following lookup order:
```
node/%{fqdn}.yaml
datacenter/%{datacenter}/cluster/%{cluster}/role/%{role}.yaml
datacenter/%{datacenter}/cluster/%{cluster}.yaml
cluster/%{cluster}/role/%{role}.yaml
cluster/%{cluster}.yaml
datacenter/%{datacenter}/role/%{role}.yaml
datacenter/%{datacenter}.yaml
site/%{site}.yaml
role/%{role}.yaml
role/%{role}/type/%{virtual}.yaml
type/%{virtual}.yaml
common.yaml
```
