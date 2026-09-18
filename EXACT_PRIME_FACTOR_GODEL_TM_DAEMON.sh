#!/usr/bin/env bash
# EXACT_PRIME_FACTOR_GODEL_TM resident loop — zero seed, halt on cycle — default 1s
set -u
INTERVAL="${1:-${EPFG_INTERVAL:-1}}"
LOG="${EPFG_LOG:-exact_prime_factor_godel_tm_daemon.log}"
DIR="$(cd "$(dirname "$0")" 2>/dev/null && pwd || pwd)"
SCRIPT="${EPFG_SCRIPT:-$DIR/EXACT_PRIME_FACTOR_GODEL_TM.sh}"
RAW_URL="https://raw.githubusercontent.com/letsgo0226/EXACT_PRIME_FACTOR_GODEL_TM/main/EXACT_PRIME_FACTOR_GODEL_TM.sh"
if [[ ! -f "$SCRIPT" ]]; then
  command -v curl >/dev/null || exit 127
  SCRIPT="${TMPDIR:-/tmp}/EXACT_PRIME_FACTOR_GODEL_TM.sh"
  curl -fsSL "$RAW_URL" -o "$SCRIPT" || exit 1
fi
command -v python3 >/dev/null || exit 127
echo "{\"daemon\":\"EXACT_PRIME_FACTOR_GODEL_TM\",\"interval\":$INTERVAL,\"ts\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"}" | tee -a "$LOG"
while true; do
  TS=$(date -u +%Y-%m-%dT%H:%M:%SZ)
  OUT=$(mktemp)
  if bash "$SCRIPT" >"$OUT" 2>"${OUT}.err"; then
    if python3 - "$OUT" <<'PY'
import json,sys
o=json.load(open(sys.argv[1]))
ok=(o.get("model")=="EXACT_PRIME_FACTOR_GODEL_TM" and o.get("exact") is True
    and o.get("halted")==1 and o.get("final")==1
    and o.get("seed_state")==[0,0,0,0,0,0]
    and o.get("initial_godel_number")==30030
    and int(o.get("steps") or 0)==len(o.get("levels") or [])
    and (o.get("levels") or [None])[0][2]==[0,0,0,0,0,0]
    and "no floating point" in str(o.get("arithmetic","")))
sys.exit(0 if ok else 2)
PY
    then echo "{\"ts\":\"$TS\",\"status\":\"pass\"} $(python3 -c 'import json,sys;o=json.load(open(sys.argv[1]));print(json.dumps({k:o[k] for k in ["exact","halted","steps","final","repeated_state","seed_state"]},separators=(",",":")))' "$OUT")" >>"$LOG"
    else echo "{\"ts\":\"$TS\",\"status\":\"assert_fail\"}" >>"$LOG"
    fi
  else echo "{\"ts\":\"$TS\",\"status\":\"run_fail\"}" >>"$LOG"
  fi
  rm -f "$OUT" "${OUT}.err"
  sleep "$INTERVAL"
done
