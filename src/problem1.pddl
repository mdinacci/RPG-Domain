(define (problem pb1) (:domain dungeon)
(:objects
    thor - hero
    r0 r1 r2 r3 r4 r5 - room
    m1 m2 - monster
)

(:init
    ;; STATES OF THE HERO
    ( hero-alive thor )
    ( hero-in-room thor r0 )
    ( hero-empty-handed thor )
    
    ;; STATES OF THE MONSTERS
    ( monster-in-room m1 r1 )
    (not ( monster-away thor m1 ))
    ( monster-in-room m2 r4 )
    (not ( monster-afraid thor m2 ))


    ;; STATE OF THE ROOMS
    (not (room-destroyed r0) )
    (not (room-destroyed r1) )
    (not (room-destroyed r2) )
    (not (room-destroyed r3) )
    (not (room-destroyed r4) )
    (not (room-destroyed r5) )

    ( room-cleared thor r0 )
    (not (room-cleared thor r1))
    ( room-cleared thor r2 )
    (room-cleared thor r3)
    (not (room-cleared thor r4))
    (room-cleared thor r5)


    ( room-corridor r0 r1 )
    ( room-corridor r0 r2 )
    ( room-corridor r1 r0 )
    ( room-corridor r1 r3 )
    ( room-corridor r2 r0 )
    ( room-corridor r2 r3 )
    ( room-corridor r2 r4 )
    ( room-corridor r3 r1 )
    ( room-corridor r3 r2 )
    ( room-corridor r3 r5 )
    ( room-corridor r4 r2 )
    ( room-corridor r4 r5 )
    ( room-corridor r5 r4 )
    ( room-corridor r5 r3 )


)
(:goal (and ( hero-in-room thor r5 ) ( hero-alive thor ) ) )
)
