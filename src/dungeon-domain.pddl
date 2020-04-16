(define (domain dungeon)

(:requirements :strips :typing :conditional-effects :negative-preconditions :equality)

(:types
    hero
    room
    monster
    trap
    sword
)


(:predicates

    ;; HERO PREDICATES
    (at ?h - hero ?x - room) ;hero h is in room x
    (empty-hand ?h - hero) ;hero is holding nothing
    (alive ?x - hero) ; the hero h is alive

    ;; ROOM PREDICATES
    (destroy-room ?x - room) ;room x is destroyed
    (free-to-go ?h - hero ?x - room) ;if the hero h can leave room x (traps are disarmed and monsters are away)
    (corridor ?x ?y - room) ;there is a path between x and y 

    ;; MONSTER PREDICATES
    (monster-at ?x - monster ?r - room) ;there is a monster x in room r
    (monster-away ?h - hero ?x - monster) ;Monster x is afraid of hero h


    ;; TRAP PREDICATES
    (trap-at ?t - trap ?x - room) ;there is a trap t in room x
    (trap-armed ?x - trap ?y - room) ;trap x in room y is armed
    (trap-disarmed ?x - trap ?y - room) ;trap x in room y is disarmed

    ;; SWORD PREDICATES
    (sword-at ?s - sword ?x - room) ;there is a sword in room x
    (sword-destroyed ?x - sword) ;sword x destroyed
    (sword-holding ?h - hero ?x - sword) ;hero h is holding the sword x
)

(:action go
    :parameters (?h - hero ?from - room ?to - room)
    :precondition (and
        (not (destroy-room ?to)) 
        (at ?h ?from)
        (alive ?h)
        (corridor ?from ?to)
        (free-to-go ?h ?from)
    )
    :effect (and 
        (alive ?h)
        (at ?h ?to)
        (not (at ?h ?from))
        (destroy-room ?from)
    )
)

(:action pick-sword
    :parameters (?r - room ?h - hero ?s - sword)
    :precondition (and
        (alive ?h)
        (at ?h ?r)
        (empty-hand ?h)
        (sword-at ?s ?r)
        (not ( sword-holding ?h ?s))
    )
    :effect (and
        (alive ?h)
        (at ?h ?r)
        (not (empty-hand ?h))
        (not ( sword-at ?s ?r ))
        (not ( sword-destroyed ?s ))
        (sword-holding ?h ?s)
        (free-to-go ?h ?r)
    )
)

(:action destroy-sword
    :parameters (?h - hero ?s - sword)
    :precondition (and
        (alive ?h)
        (sword-holding ?h ?s)
    )
    :effect (and
        (alive ?h)
        (sword-destroyed ?s)
        ( empty-hand ?h )
    )
)

(:action disarm-trap
    :parameters (?h - hero ?r - room ?t - trap)
    :precondition (and
        ( alive ?h )
        ( at ?h ?r )
        ( empty-hand ?h )
        ( trap-at ?t ?r )
        ( trap-armed ?t ?r )
        (not ( trap-disarmed ?t ?r ) )
    )
    :effect (and
        ( alive ?h )
        ( at ?h ?r )
        ( empty-hand ?h )
        ( trap-at ?t ?r )
        (not ( trap-armed ?t ?r ) )
        ( trap-disarmed ?t ?r )
        ( free-to-go ?h ?r )
    )
)

(:action face-monster
    :parameters (?h - hero ?s - sword ?r - room ?m - monster)
    :precondition (and
        ( alive ?h )
        ( at ?h ?r )
        ( sword-holding ?h ?s)
        ( monster-at ?m ?r )
        (not (monster-away ?h ?m))
    )
    :effect (and
        ( alive ?h )
        ( at ?h ?r )
        ( sword-holding ?h ?s)
        ( monster-at ?m ?r )
        ( monster-away ?h ?m )
        ( free-to-go ?h ?r )
    )
)

)
