#!/usr/bin/env bash
set -euo pipefail

COMMANDS_FILE="${1:-.codex/verify.commands}"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/../.." && pwd)"

if [[ ! -f "$COMMANDS_FILE" ]]; then
  echo "Missing $COMMANDS_FILE" >&2
  exit 2
fi

source "$REPO_ROOT/.codex/actions/_artifact_env.sh"
cd "$REPO_ROOT"

total=0
passed=0

while IFS= read -r cmd || [[ -n "$cmd" ]]; do
  [[ -z "${cmd//[[:space:]]/}" ]] && continue
  [[ "$cmd" =~ ^[[:space:]]*# ]] && continue

  total=$((total + 1))
  echo "[$total] $cmd"

  if bash -lc "$cmd"; then
    passed=$((passed + 1))
    echo "PASS [$total]"
  else
    echo "FAIL [$total]"
    echo "Summary: ${passed}/${total} commands passed"
    exit 1
  fi
done < "$COMMANDS_FILE"

echo "Summary: ${passed}/${total} commands passed"
