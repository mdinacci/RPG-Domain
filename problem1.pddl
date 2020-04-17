(define (problem pb1) (:domain dungeon)
(:objects
    player - hero
    m0 m1 - monster
    t0 - trap
    s0 - sword
    r0 r1 r2 r3 r4 r5 r6 r7 - room
)

(:init
    (hero-alive player)
    (hero-in-room player r0)
    (hero-empty-handed player)
    
    (monster-in-room m0 r2)
    (not (monster-afraid player m0))
    (monster-in-room m1 r3)
    (not (monster-afraid player m1))

    (trap-in-room t0 r5)
    (trap-armed t0 r5)
    (not (trap-disarmed t0 r5))

    (sword-in-room s0 r1)
    (not (sword-destroyed s0))
    (not (sword-holding player s0))

    (not (room-destroyed r0))
    (not (room-destroyed r1))
    (not (room-destroyed r2))
    (not (room-destroyed r3))
    (not (room-destroyed r4))
    (not (room-destroyed r5))
    (not (room-destroyed r6))
    (not (room-destroyed r7))

    (room-cleared player r0)
    (not (room-cleared player r1))
    (not (room-cleared player r2))
    (not (room-cleared player r3))
    (room-cleared player r4)
    (not (room-cleared player r5))
    (room-cleared player r6)
    (not (room-cleared player r7))

    (room-corridor r0 r1)
    (room-corridor r0 r2)
    (room-corridor r1 r0)
    (room-corridor r1 r2)
    (room-corridor r1 r3)
    (room-corridor r2 r0)
    (room-corridor r2 r1)
    (room-corridor r2 r4)
    (room-corridor r3 r1)
    (room-corridor r3 r4)
    (room-corridor r3 r5)
    (room-corridor r4 r2)
    (room-corridor r4 r3)
    (room-corridor r4 r7)
    (room-corridor r5 r3)
    (room-corridor r5 r6)
    (room-corridor r5 r7)
    (room-corridor r6 r4)
    (room-corridor r6 r5)
    (room-corridor r7 r6)
)
(:goal (and (hero-in-room player r7) (hero-alive player)))
)
