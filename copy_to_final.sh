#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRAFT_DIR="$REPO_DIR/草稿"
FINAL_DIR="$REPO_DIR/终稿"

usage() {
  echo "用法: $0 <草稿中的文件路径> [更多文件路径...]"
  echo "示例: $0 架构图.drawio 子目录/流程图.drawio"
}

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

has_missing_files=0
for rel_path in "$@"; do
  src="$DRAFT_DIR/$rel_path"
  if [[ ! -f "$src" ]]; then
    echo "未找到草稿文件: $rel_path" >&2
    has_missing_files=1
  fi
done

if [[ "$has_missing_files" -eq 1 ]]; then
  exit 1
fi

for rel_path in "$@"; do
  src="$DRAFT_DIR/$rel_path"
  dst="$FINAL_DIR/$rel_path"

  mkdir -p "$(dirname "$dst")"
  cp -f "$src" "$dst"
  echo "已复制: 草稿/$rel_path -> 终稿/$rel_path"
done
