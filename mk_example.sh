DATACENTERS=( ncsa_npcf ncsa_3003 tucson bdc summit )
CLUSTERS=( k8s_prod k8s_test comcam auxtel lsstcam )
ROLES=( default )

mkyaml() {
    echo "---" >"${1}.yaml"
}

mkdir 10node

for dc in "${DATACENTERS[@]}"; do

    for cl in "${CLUSTERS[@]}"; do

        for rl in "${ROLES[@]}"; do

            _20="20datacenter_cluster_role/$dc/$cl"
            mkdir -p "$_20"
            mkyaml "$_20/$rl"

            _30="30datacenter_role"
            mkdir -p "$_30/$dc"
            mkyaml "$_30/$rl"

            _50="50role"
            mkdir -p "$_50"
            mkyaml "$_50/$rl"

        done

        _40="40datacenter_cluster/$dc"
        mkdir -p "$_40"
        mkyaml "$_40/$cl"

        _60="60cluster"
        mkdir -p "$_60"
        mkyaml "$_60/$cl"

    done

    _70="70datacenter"
    mkdir -p "$_70"
    mkyaml "$_70/$dc"

done

mkyaml "80common"
