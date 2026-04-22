# MATLAB MCP Core Server 接入 Codex（本仓库）

已提供自动化脚本：`setup_matlab_mcp_for_codex.sh`。

## 一键安装与接入

```bash
bash setup_matlab_mcp_for_codex.sh
```

脚本会执行：
1. 下载官方 `matlab-mcp-core-server` Linux 二进制到 `~/.local/bin/matlab-mcp-core-server`。
2. 调用 `codex mcp add` 注册为名为 `matlab` 的 MCP server。
3. 打印 `codex mcp get matlab` 结果，确认已接入配置。

## 手动命令（可选）

```bash
curl -fL \
  https://github.com/matlab/matlab-mcp-core-server/releases/latest/download/matlab-mcp-core-server-glnxa64 \
  -o ~/.local/bin/matlab-mcp-core-server
chmod +x ~/.local/bin/matlab-mcp-core-server

codex mcp add matlab -- ~/.local/bin/matlab-mcp-core-server --matlab-display-mode=nodesktop --initialize-matlab-on-startup=true
codex mcp get matlab
```

## 前置要求

- MATLAB R2020b 或更高版本。
- `matlab` 可执行程序在系统 PATH 中，或在 MCP 参数中显式传入：
  - `--matlab-root=/path/to/MATLAB/R2025b`

## 验证

在 Codex 会话里可尝试让模型调用 `detect_matlab_toolboxes` 之类工具来确认链路可用。
