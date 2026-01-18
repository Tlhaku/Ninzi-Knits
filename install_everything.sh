#!/usr/bin/env bash

set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing root dependencies..."
(cd "${root_dir}" && npm install)

echo "Installing client dependencies..."
(cd "${root_dir}/client" && npm install)

cleanup() {
  echo "Stopping client (PID: ${client_pid})..."
  kill "${client_pid}" 2>/dev/null || true
}

trap cleanup EXIT
