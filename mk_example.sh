DATACENTERS=( npcf ncsa3003 tucson bdc summit )
CLUSTERS=( oracle k8s_prod k8s_test comcam auxtel lsstcam )
ROLES=( default )
SITES=( ncsa tucson laserena cerrapachon )
TYPES=( virtual default )

mkyaml() {
    echo "---" >"${1}.yaml"
}

rm -rf datacenter cluster role node

for dc in "${DATACENTERS[@]}"; do
    mkdir -p datacenter
    mkyaml datacenter/$dc

    for cl in "${CLUSTERS[@]}"; do
        mkdir -p datacenter/$dc/cluster
        mkyaml datacenter/$dc/cluster/$cl
        mkdir -p cluster
        mkyaml cluster/$cl

        for rl in "${ROLES[@]}"; do
            mkdir -p datacenter/$dc/cluster/$cl/role
            mkyaml datacenter/$dc/cluster/$cl/role/$rl
            mkdir -p datacenter/$dc/role
            mkyaml datacenter/$dc/role/$rl
            mkdir -p cluster/$cl/role
            mkyaml cluster/$cl/role/$rl
            mkdir -p role
            mkyaml role/$rl

            for typ in "${TYPES[@]}"; do
                mkdir -p role/$rl/type
                mkyaml role/$rl/type/$typ
                mkdir -p type
                mkyaml type/$typ
            done
        done
    done
done

mkdir -p site
for s in "${SITES[@]}"; do
    mkyaml site/$s
done

mkyaml common
mkdir -p node
mkyaml node/puppet.internal
