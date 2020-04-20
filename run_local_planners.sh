#!/bin/bash

planners=(dfs_plus bfs_f siw siw_plus siw-then-bfsf ff)

$ for planner in "${planners[@]}" do 
    printf "Using planner $planner\n" 

    mkdir -p output/$planner

    for i in 1 2 3
    do
        printf "./$planner --domain /dungeon/dungeon-domain.pddl --problem /dungeon/problem$i.pddl"
        ./$planner --domain /dungeon/dungeon-domain.pddl --problem /dungeon/problem$i.pddl --output output/$planner/$i.ipc
        mv execution.details output/$planner/execution_details_$i
    done
done

