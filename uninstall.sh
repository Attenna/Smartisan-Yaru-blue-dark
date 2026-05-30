#!/bin/bash

# Smartisan-Yaru-blue-dark 主题卸载脚本

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

THEME_NAME="Smartisan-Yaru-blue-dark"
ICON_DIR="$HOME/.local/share/icons/$THEME_NAME"
DESKTOP_DIR="$HOME/.local/share/applications"

echo -e "${BLUE}========================================${NC}"
echo -e "${RED}  卸载 Smartisan-Yaru-blue-dark 主题${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# 确认卸载
read -p "确定要卸载该主题吗? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${GREEN}取消卸载${NC}"
    exit 0
fi

# 删除主题目录
if [ -d "$ICON_DIR" ]; then
    rm -rf "$ICON_DIR"
    echo -e "${GREEN}✓ 已删除主题目录${NC}"
else
    echo -e "${YELLOW}⚠️  主题目录不存在${NC}"
fi

# 删除被修改的 .desktop 文件（可选）
read -p "是否恢复被修改的应用启动器? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # 只删除我们修改过的启动器，保留原始的
    cd "$DESKTOP_DIR"
    for f in qq.desktop firefox_firefox.desktop snap-store_snap-store.desktop thunderbird.desktop desktop-security-center_desktop-security-center.desktop; do
        if [ -f "$f" ]; then
            rm -f "$f"
            echo -e "${GREEN}✓ 已恢复: $f${NC}"
        fi
    done
    update-desktop-database "$DESKTOP_DIR" 2>/dev/null || true
fi

# 清理缓存
rm -rf ~/.cache/gnome-shell/ ~/.cache/gtk-* ~/.cache/gnome-control-center 2>/dev/null || true

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  ✅ 卸载完成！${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${YELLOW}📌 提示：请注销重新登录以恢复默认主题${NC}"

