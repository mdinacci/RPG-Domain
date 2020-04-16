(define (problem pb2) (:domain dungeon)
(:objects
    player - hero
    r0 r1 r2 r3 r4 r5 - room
    s1 - sword
    m1 m2 - monster
)

(:init
    ( hero-alive player )
    ( hero-in-room player r2 )
    ( hero-empty-handed player )
    
    ( monster-in-room m1 r0 )
    (not ( monster-afraid player m1 ))
    ( monster-in-room m2 r3 )
    (not ( monster-afraid player m2 ))

    (sword-in-room s1 r5)
    (not (sword-destroyed s1))
    (not (sword-holding player s1))

    (not (room-destroyed r0) )
    (not (room-destroyed r1) )
    (not (room-destroyed r2) )
    (not (room-destroyed r3) )
    (not (room-destroyed r4) )
    (not (room-destroyed r5) )

    (not (room-cleared player r0))
    (room-cleared player r1)
    (room-cleared player r2)
    (not (room-cleared player r3))
    (room-cleared player r4)
    (room-cleared player r5)

    (room-corridor r0 r1)
    (room-corridor r0 r2)
    (room-corridor r1 r0)
    (room-corridor r1 r3)
    (room-corridor r2 r0)
    (room-corridor r2 r3)
    (room-corridor r2 r4)
    (room-corridor r3 r1)
    (room-corridor r3 r2)
    (room-corridor r3 r5)
    (room-corridor r4 r2)
    (room-corridor r4 r5)
    (room-corridor r5 r4)
    (room-corridor r5 r3)
)
(:goal (and (hero-in-room player r1) (hero-alive player) ) )
)
