#!/usr/bin/env bash
# Allows perf to read CPU counters and kernel symbols.
# WSL resets these after every restart, so run this once per session.
set -euo pipefail
sudo sysctl -w kernel.perf_event_paranoid=-1
sudo sysctl -w kernel.kptr_restrict=0
perf --version
