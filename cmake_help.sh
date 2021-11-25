# Pass an associative array name as first arg
# Pass the source dir as second
function run_cmake {
    local -n _D=$1

    # Build command line
    local cmd="cmake -S $2"
    local vname
    for vname in "${!_D[@]}"; do
	cmd="$cmd -D${vname}=${_D[$vname]}"
    done
    echo $cmd
    eval $cmd
}

function get_cache_var {
    cmake -N -LA . 2>/dev/null | grep $vname | cut -d '=' -f2
}
