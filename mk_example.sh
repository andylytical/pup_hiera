CLUSTERS=( oracle k8s_prod k8s_test comcam auxtel lsstcam )
ROLES=( default )
SITES=( npcf ncsa tucson bdc summit )

mkyaml() {
    echo "---" >"${1}.yaml"
}

rm -rf site cluster role node

for si in "${SITES[@]}"; do
    mkdir -p site
    mkyaml site/$si

    for cl in "${CLUSTERS[@]}"; do
        mkdir -p site/$si/cluster
        mkyaml site/$si/cluster/$cl
        mkdir -p cluster
        mkyaml cluster/$cl

        for rl in "${ROLES[@]}"; do
            mkdir -p site/$si/cluster/$cl/role
            mkyaml site/$si/cluster/$cl/role/$rl
            mkdir -p site/$si/role
            mkyaml site/$si/role/$rl
            mkdir -p cluster/$cl/role
            mkyaml cluster/$cl/role/$rl
            mkdir -p role
            mkyaml role/$rl

        done
    done
done

mkyaml common
mkdir -p node
mkyaml node/puppet.internal

# Add classes to default role
>role/default.yaml cat <<ENDHERE
---
classes:
  - profile::baseline_cfg
ENDHERE
