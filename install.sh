#!/bin/bash

# Smartisan-Yaru-blue-dark 主题一键安装脚本
# 使用方法: bash install.sh

set -e  # 遇到错误立即退出

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_NAME="Smartisan-Yaru-blue-dark"
ICON_DIR="$HOME/.local/share/icons/$THEME_NAME"
DESKTOP_DIR="$HOME/.local/share/applications"

echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}  Smartisan-Yaru-blue-dark 主题安装脚本${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# 1. 检查是否已安装
if [ -d "$ICON_DIR" ]; then
    echo -e "${YELLOW}⚠️  检测到已安装的 $THEME_NAME 主题${NC}"
    read -p "是否覆盖安装? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED}安装已取消${NC}"
        exit 1
    fi
    rm -rf "$ICON_DIR"
    echo -e "${GREEN}✓ 已移除旧版本${NC}"
fi

# 2. 创建主题目录
echo -e "${BLUE}📁 创建主题目录...${NC}"
mkdir -p "$ICON_DIR"
mkdir -p "$DESKTOP_DIR"

# 3. 复制图标文件
echo -e "${BLUE}🎨 复制图标文件...${NC}"
cp -r "$SCRIPT_DIR"/{16x16,22x22,24x24,32x32,48x48,256x256,8x8,scalable,snap} "$ICON_DIR/" 2>/dev/null || true
cp "$SCRIPT_DIR/index.theme" "$ICON_DIR/"

# 修复 snap 目录中的脚本权限
chmod +x "$ICON_DIR/snap/op_set.sh" 2>/dev/null || true

echo -e "${GREEN}✓ 图标文件复制完成${NC}"

# 4. 运行启动器配置脚本
echo -e "${BLUE}🔧 配置应用启动器...${NC}"
if [ -f "$ICON_DIR/snap/op_set.sh" ]; then
    bash "$ICON_DIR/snap/op_set.sh"
else
    echo -e "${YELLOW}⚠️  未找到 op_set.sh，跳过启动器配置${NC}"
fi

# 5. 更新图标缓存
echo -e "${BLUE}🔄 更新系统图标缓存...${NC}"
update-desktop-database "$DESKTOP_DIR" 2>/dev/null || true
rm -rf ~/.cache/gnome-shell/ ~/.cache/gtk-* ~/.cache/gnome-control-center 2>/dev/null || true

# 6. 提示切换主题
echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  ✅ 安装完成！${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${YELLOW}📌 下一步操作：${NC}"
echo -e "  1. 使用 ${BLUE}Gnome Tweaks${NC} 或 ${BLUE}设置${NC} 应用切换图标主题"
echo -e "  2. 在 ${BLUE}主题${NC} 中选择 ${GREEN}Smartisan-Yaru-blue-dark${NC}"
echo -e "  3. ${RED}注销并重新登录${NC} 使所有图标生效"
echo ""
echo -e "${YELLOW}💡 提示：${NC}"
echo -e "  - 如果部分图标未生效，请运行: ${BLUE}bash $ICON_DIR/snap/op_set.sh${NC}"
echo -e "  - 卸载请运行: ${BLUE}bash $SCRIPT_DIR/uninstall.sh${NC}"
echo ""
