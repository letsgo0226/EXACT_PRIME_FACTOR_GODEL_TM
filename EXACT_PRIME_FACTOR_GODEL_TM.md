# EXACT_PRIME_FACTOR_GODEL_TM

Exact ℤ/ℚ prime-factor Gödel TM. Seed **zero vector** `a=[0,0,0,0,0,0]` (`G₀=30030=∏P`). Halt on repeated state (9-cycle returning to zero).

- Script: `EXACT_PRIME_FACTOR_GODEL_TM.sh`
- Model: `EXACT_PRIME_FACTOR_GODEL_TM`
- Flags: `exact`, `halted=1`, `final=1`

## Run

```sh
bash EXACT_PRIME_FACTOR_GODEL_TM.sh
curl -fsSL https://raw.githubusercontent.com/letsgo0226/EXACT_PRIME_FACTOR_GODEL_TM/main/EXACT_PRIME_FACTOR_GODEL_TM.sh | bash
```

## Resident

- Daemon: `EXACT_PRIME_FACTOR_GODEL_TM_DAEMON.sh` (default **1s**)
- Actions: `.github/workflows/exact_prime_factor_godel_tm.yml` (`*/5`)

## Bound

Formal cycle certificate only — not RH/TOE/physical field.
