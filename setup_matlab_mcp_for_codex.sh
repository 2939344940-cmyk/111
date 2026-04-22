#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="${HOME}/.local/bin"
SERVER_BIN="${INSTALL_DIR}/matlab-mcp-core-server"
DOWNLOAD_URL="https://github.com/matlab/matlab-mcp-core-server/releases/latest/download/matlab-mcp-core-server-glnxa64"

mkdir -p "${INSTALL_DIR}"

echo "[1/3] Downloading MATLAB MCP Core Server..."
curl -fL "${DOWNLOAD_URL}" -o "${SERVER_BIN}"
chmod +x "${SERVER_BIN}"

echo "[2/3] Registering MCP server in Codex CLI..."
/opt/codex/bin/codex mcp remove matlab >/dev/null 2>&1 || true
/opt/codex/bin/codex mcp add matlab -- "${SERVER_BIN}" --matlab-display-mode=nodesktop --initialize-matlab-on-startup=true

echo "[3/3] Done. Verifying configuration:"
/opt/codex/bin/codex mcp get matlab

echo
echo "NOTE: You still need a local MATLAB (R2020b+) installed and on PATH,"
echo "or pass --matlab-root=/path/to/MATLAB/R20xx to the command above."
