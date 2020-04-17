(define (domain dungeon)

;;(:requirements :strips :typing :conditional-effects :negative-preconditions :equality)

(:types
    hero
    sword
    monster
    trap
    room
)

(:predicates

    (hero-in-room ?h - hero ?r - room) ; is the hero in room ?
    (hero-empty-handed ?h - hero) ; is the hero empty-handed ? i.e. does he not have a sword ?
    (hero-alive ?h - hero) ; is the hero alive ?

    (sword-in-room ?s - sword ?r - room) ; is there a sword in room ?
    (sword-destroyed ?s - sword) ; has the sword been destroyed ?
    (sword-holding ?h - hero ?x - sword) ; is the hero holding the sword ?

    (monster-in-room ?m - monster ?r - room) ; is there a monster in room ?
    (monster-afraid ?h - hero ?m - monster) ; is monster afraid of hero ? (yes if hero holds a sword)

    (trap-in-room ?t - trap ?r - room) ; is there a trap in the room ?
    (trap-armed ?t - trap ?r - room) ; is the trap armed ?
    (trap-disarmed ?t - trap ?r - room) ; is the trap disarmed ?

    (room-destroyed ?r - room) ; is the room destroyed ?
    (room-cleared ?h - hero ?r - room) ; has the room being cleared ? (i.e. no monsters, all traps disarmed)
    (room-corridor ?c ?r - room) ; is there a corridor to an adjacent room ?

)

;; Hero actions

(:action move
    :parameters (?h - hero ?from - room ?to - room)
    :precondition (and
        (not (room-destroyed ?to)) 
        (hero-in-room ?h ?from)
        (hero-alive ?h)
        (room-corridor ?from ?to)
        (room-cleared ?h ?from)
    )
    :effect (and 
        (hero-alive ?h)
        (hero-in-room ?h ?to)
        (not (hero-in-room ?h ?from))
        (room-destroyed ?from)
    )
)

(:action pickup-sword
    :parameters (?r - room ?h - hero ?s - sword)
    :precondition (and
        (hero-alive ?h)
        (hero-in-room ?h ?r)
        (hero-empty-handed ?h)
        (sword-in-room ?s ?r)
        (not ( sword-holding ?h ?s))
    )
    :effect (and
        (hero-alive ?h)
        (hero-in-room ?h ?r)
        (not (hero-empty-handed ?h))
        (not ( sword-in-room ?s ?r ))
        (not ( sword-destroyed ?s ))
        (sword-holding ?h ?s)
        (room-cleared ?h ?r)
    )
)

(:action destroy-sword
    :parameters (?h - hero ?s - sword)
    :precondition (and
        (hero-alive ?h)
        (sword-holding ?h ?s)
    )
    :effect (and
        (hero-alive ?h)
        (sword-destroyed ?s)
        (hero-empty-handed ?h )
    )
)

(:action disarm-trap
    :parameters (?h - hero ?r - room ?t - trap)
    :precondition (and
        (hero-alive ?h)
        (hero-in-room ?h ?r)
        (hero-empty-handed ?h)
        (trap-in-room ?t ?r)
        (trap-armed ?t ?r)
        (not (trap-disarmed ?t ?r))
    )
    :effect (and
        (hero-alive ?h)
        (hero-in-room ?h ?r)
        (hero-empty-handed ?h)
        (trap-in-room ?t ?r)
        (not (trap-armed ?t ?r))
        (trap-disarmed ?t ?r)
        (room-cleared ?h ?r)
    )
)

(:action face-monster
    :parameters (?h - hero ?s - sword ?r - room ?m - monster)
    :precondition (and
        (hero-alive ?h)
        (hero-in-room ?h ?r)
        (sword-holding ?h ?s)
        (monster-in-room ?m ?r)
        (not (monster-afraid ?h ?m))
    )
    :effect (and
        (hero-alive ?h)
        (hero-in-room ?h ?r)
        (sword-holding ?h ?s)
        (monster-in-room ?m ?r)
        (monster-afraid ?h ?m)
        (room-cleared ?h ?r)
    )
)

)
