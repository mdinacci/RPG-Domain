(define (problem pb2) (:domain rpg)
(:objects
    thor - hero
    r0 r1 r2 r3 r4 r5 r6 - room
    s1 - sword
    t1 - trap
    m1 m2 - monster
)

(:init
    ;; STATES OF THE HERO
    ( alive thor )
    ( at thor r0 )
    ( empty-hand thor )
    
    ;; STATES OF THE MONSTERS
    ( monster-at m1 r2 )
    (not ( monster-away thor m1 ))
    ( monster-at m2 r3 )
    (not ( monster-away thor m2 ))


    ;; STATES OF THE SWORDS
    (sword-at s1 r1)
    (not (sword-destroyed s1))
    (not (sword-holding thor s1))

    ;; STATES OF THE TRAPS
    (trap-at t1 r5)
    (trap-armed t1 r5)
    (not (trap-disarmed t1 r5))

    ;; STATE OF THE ROOMS
    (not (destroy-room r0) )
    (not (destroy-room r1) )
    (not (destroy-room r2) )
    (not (destroy-room r3) )
    (not (destroy-room r4) )
    (not (destroy-room r5) )
    (not (destroy-room r6) )

    (free-to-go thor r0)
    (free-to-go thor r1)
    (not (free-to-go thor r2))
    (not (free-to-go thor r3))
    (free-to-go thor r4)
    (not (free-to-go thor r5))
    (free-to-go thor r6)


    ( corridor r0 r1 )
    ( corridor r0 r2 )
    ( corridor r1 r0 )
    ( corridor r1 r3 )
    ( corridor r2 r0 )
    ( corridor r2 r3 )
    ( corridor r2 r4 )
    ( corridor r3 r1 )
    ( corridor r3 r2 )
    ( corridor r3 r5 )
    ( corridor r4 r2 )
    ( corridor r4 r5 )
    ( corridor r5 r4 )
    ( corridor r5 r3 )
    ( corridor r5 r6 )
    ( corridor r6 r5 )


)
(:goal (and ( at thor r6 ) ( alive thor ) ) )
)