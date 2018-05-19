;;;;;;;;;;;;;;;;
;; RPG DOMAIN ;;
;;;;;;;;;;;;;;;;


(define (domain rpg)

(:requirements :strips :typing :conditional-effects :negative-preconditions :equality)

(:types
    hero
    room
    monster
    trap
    sword
)


(:predicates
    (at ?h - hero ?x - room) ;hero h is in room x
    (destroy-room ?x - room) ;room x is destroyed

    (sword-destroyed ?x - sword) ;sword x destroyed
    (sword-holding ?h - hero ?x - sword) ;hero h is holding the sword x
    (sword-at ?s - sword ?x - room) ;there is a sword in room x

    (empty-hand ?h - hero) ;hero is holding nothing
    
    (trap-at ?t - trap ?x - room) ;there is a trap t in room x
    (trap-armed ?x - trap ?y - room) ;trap x in room y is armed
    (trap-disarmed ?x - trap ?y - room) ;trap x in room y is disarmed
    
    (monster-at ?x - monster ?r - room) ;there is a monster t in room r
    (monster-away ?h - hero ?x - monster) ;Monster x is afraid of hero h
    
    (alive ?x - hero)
   
    (corridor ?x ?y - room)
    
    ;if the hero h can leave room x (traps are disarmed and monsters are away)
    (free-to-go ?h - hero ?x - room)
)

(:action go
    :parameters (?h - hero, ?from - room, ?to - room)
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
    :parameters (?r - room, ?h - hero, ?s - sword)
    :precondition (and
        (alive ?h)
        (at ?h ?r)
        (empty-hand ?h)
        (sword-at ?s ?r)

    )
    :effect (and
        (not (destroy-room ?r))
        (alive ?h)
        (at ?h ?r)
        (sword-holding ?h ?s)
        (not (empty-hand ?h))
    )
)

(:action destroy-sword
    :parameters (?h - hero, ?s - sword)
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
    :parameters (?h - hero, ?r - room, ?t - trap)
    :precondition (and
        ( alive ?h )
        ( at ?h ?r )
        ( empty-hand ?h )
        ( trap-at ?t ?r )
        ( trap-armed ?t ?r )
    )
    :effect (and
        ( alive ?h )
        ( at ?h ?r )
        ( empty-hand ?h )
        ( trap-at ?t ?r )
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