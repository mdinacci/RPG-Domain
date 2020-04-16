(define (problem pb1) (:domain dungeon)
(:objects
    player - hero
    r0 r1 r2 r3 r4 r5 - room
    m1 m2 - monster
)

(:init
    ;; STATES OF THE HERO
    ( hero-alive player )
    ( hero-in-room player r0 )
    ( hero-empty-handed player )
    
    ;; STATES OF THE MONSTERS
    ( monster-in-room m1 r1 )
    (not ( monster-away player m1 ))
    ( monster-in-room m2 r4 )
    (not ( monster-afraid player m2 ))


    ;; STATE OF THE ROOMS
    (not (room-destroyed r0) )
    (not (room-destroyed r1) )
    (not (room-destroyed r2) )
    (not (room-destroyed r3) )
    (not (room-destroyed r4) )
    (not (room-destroyed r5) )

    ( room-cleared player r0 )
    (not (room-cleared player r1))
    ( room-cleared player r2 )
    (room-cleared player r3)
    (not (room-cleared player r4))
    (room-cleared player r5)


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
(:goal (and ( hero-in-room player r5 ) ( hero-alive player ) ) )
)
