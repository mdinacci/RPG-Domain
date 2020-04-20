#!/bin/bash

# The script assumes that the lapkt docker image has been installed and a container running, e.g.
# docker pull lapkt/lapkt-public
# docker run -v /path/to/dungeon/files:/dungeon -it lapkt/lapkt-public
# The -v option mount a local directory containing domain and problem files (and this script) 
# into /dungeon in the container filesystem. The script must then be copied to the default directory
# in the container which is ~/projects/lapkt/compiled_planners

planners=(dfs_plus bfs_f siw siw_plus siw-then-bfsf ff)

for planner in "${planners[@]}" 
do 
    echo -e "Using planner $planner" 

    mkdir -p output/$planner

    for i in 1 2 3
    do
        echo -e "./$planner --domain /dungeon/dungeon-domain.pddl --problem /dungeon/problem$i.pddl"
        ./$planner --domain /dungeon/dungeon-domain.pddl --problem /dungeon/problem$i.pddl --output output/$planner/$i.ipc
        mv execution.details output/$planner/execution_details_$i
    done
done

echo "All done."

