(define (problem pb2) (:domain dungeon)
(:objects
    player - hero
    s1 - sword
    t1 - trap
    m1 m2 - monster
    r0 r1 r2 r3 r4 r5 r6 - room
)

(:init
    (hero-alive player)
    (hero-in-room player r0)
    (hero-empty-handed player)
    
    (monster-in-room m1 r2)
    (not ( monster-away player m1))
    (monster-in-room m2 r3)
    (not ( monster-away player m2))

    (sword-in-room s1 r1)
    (not (sword-destroyed s1))
    (not (sword-holding player s1))

    (trap-in-room t1 r5)
    (trap-armed t1 r5)
    (not (trap-disarmed t1 r5))

    (not (room-destroyed r0))
    (not (room-destroyed r1))
    (not (room-destroyed r2))
    (not (room-destroyed r3))
    (not (room-destroyed r4))
    (not (room-destroyed r5))
    (not (room-destroyed r6))

    (room-cleared player r0)
    (room-cleared player r1)
    (not (room-cleared player r2))
    (not (room-cleared player r3))
    (room-cleared player r4)
    (not (room-cleared player r5))
    (room-cleared player r6)

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
    (room-corridor r5 r6)
    (room-corridor r6 r5)
)

(:goal (and ( hero-in-room player r6 ) ( hero-alive player ) ) )
)
