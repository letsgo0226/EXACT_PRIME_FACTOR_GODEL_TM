# EXACT_PRIME_FACT_OR_GODEL_TM

Exact ℤ/ℚ prime-factor Gödel TM with seed `a = P = [2,3,5,7,11,13]`, halt on repeated state.

| Artifact | Role |
|----------|------|
| `EXACT_PRIME_FACT_OR_GODEL_TM.sh` | One-liner (~1362B) |
| `EXACT_PRIME_FACT_OR_GODEL_TM_DAEMON.sh` | Resident loop (default 1s) |
| `.github/workflows/exact_prime_fact_or_godel_tm.yml` | Actions `*/5` |

```sh
curl -fsSL https://raw.githubusercontent.com/letsgo0226/EXACT_PRIME_FACT_OR_GODEL_TM/main/EXACT_PRIME_FACT_OR_GODEL_TM.sh | bash
nohup bash EXACT_PRIME_FACT_OR_GODEL_TM_DAEMON.sh 1 >> exact_prime_fact_or_godel_tm_daemon.log 2>&1 &
```

Bound: formal cycle certificate (`open=0`, `final=1` = halted on repeat) — not RH/TOE/physical field.
