# EXACT_PRIME_FACT_OR_GODEL_TM

Exact ℤ/ℚ prime-factor Gödel TM (`a=P`), halt on repeated state.

- Script: `EXACT_PRIME_FACT_OR_GODEL_TM.sh`
- Model: `EXACT_PRIME_FACTOR_GODEL_TM`
- Flags: `exact`, `halted=1`, `open=0`, `final=1`, `omega_attained=0`

## Run

```sh
bash EXACT_PRIME_FACT_OR_GODEL_TM.sh
curl -fsSL https://raw.githubusercontent.com/letsgo0226/EXACT_PRIME_FACT_OR_GODEL_TM/main/EXACT_PRIME_FACT_OR_GODEL_TM.sh | bash
```

## Resident

- Daemon: `EXACT_PRIME_FACT_OR_GODEL_TM_DAEMON.sh` (default **1s**)
- Actions: `.github/workflows/exact_prime_fact_or_godel_tm.yml` (`*/5`)

## Bound

Formal cycle certificate only — not RH/TOE/physical field. `final=1` = this TM halted on a repeated state.
