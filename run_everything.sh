#!/usr/bin/env bash

set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting client..."
(cd "${root_dir}/client" && npm run start) &
client_pid=$!

cleanup() {
  echo "Stopping client (PID: ${client_pid})..."
  kill "${client_pid}" 2>/dev/null || true
}

trap cleanup EXIT

echo "Starting root app..."
(cd "${root_dir}" && npm run start)
