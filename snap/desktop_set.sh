#!/bin/bash

# 主题内的图标目录
ICON_DIR="/home/george/.local/share/icons/Smartisan-Yaru-blue-dark/snap"

echo "🔧 开始配置应用图标..."

# 1. QQ (deb 包)
if [ -f /usr/share/applications/qq.desktop ]; then
    cp /usr/share/applications/qq.desktop ~/.local/share/applications/
    sed -i "s|Icon=.*|Icon=$ICON_DIR/qq.png|" ~/.local/share/applications/qq.desktop
    echo "✅ QQ 图标已配置"
fi

# 2. Firefox (Snap)
if [ -f /var/lib/snapd/desktop/applications/firefox_firefox.desktop ]; then
    cp /var/lib/snapd/desktop/applications/firefox_firefox.desktop ~/.local/share/applications/
    sed -i "s|Icon=.*|Icon=$ICON_DIR/firefox.png|" ~/.local/share/applications/firefox_firefox.desktop
    echo "✅ Firefox 图标已配置"
fi

# 3. 应用中心 (Snap Store) - 修正绝对路径
if [ -f /var/lib/snapd/desktop/applications/snap-store_snap-store.desktop ]; then
    cp /var/lib/snapd/desktop/applications/snap-store_snap-store.desktop ~/.local/share/applications/
    sed -i "s|Icon=/snap/snap-store/current/bin/data/flutter_assets/assets/app-center.png|Icon=$ICON_DIR/software_store.png|" ~/.local/share/applications/snap-store_snap-store.desktop
    echo "✅ 应用中心图标已配置"
fi

# 4. Thunderbird (deb 包)
if [ -f /usr/share/applications/thunderbird.desktop ]; then
    cp /usr/share/applications/thunderbird.desktop ~/.local/share/applications/
    sed -i "s|Icon=.*|Icon=$ICON_DIR/thunderbird.png|" ~/.local/share/applications/thunderbird.desktop
    echo "✅ Thunderbird 图标已配置"
fi

# 5. 安全中心 (Snap) - 修正搜索路径和绝对路径
SECURITY_FILE="/var/lib/snapd/desktop/applications/desktop-security-center_desktop-security-center.desktop"
if [ -f "$SECURITY_FILE" ]; then
    cp "$SECURITY_FILE" ~/.local/share/applications/
    sed -i "s|Icon=/snap/desktop-security-center/current/meta/gui/desktop-security-center.png|Icon=$ICON_DIR/security.png|" ~/.local/share/applications/desktop-security-center_desktop-security-center.desktop
    echo "✅ 安全中心图标已配置"
fi

# 6. 微信 - 扩大搜索范围
WECHAT_FILE=$(find /usr/share/applications ~/.local/share/applications /var/lib/snapd/desktop/applications /opt -name "*.desktop" 2>/dev/null | xargs grep -l "微信\|WeChat\|weixin\|Weixin" 2>/dev/null | head -1)
if [ -n "$WECHAT_FILE" ]; then
    cp "$WECHAT_FILE" ~/.local/share/applications/
    BASENAME=$(basename "$WECHAT_FILE")
    sed -i "s|Icon=.*|Icon=$ICON_DIR/weixin.png|" ~/.local/share/applications/"$BASENAME"
    echo "✅ 微信图标已配置 (来自: $WECHAT_FILE)"
else
    echo "⚠️ 未找到微信的 .desktop 文件，请确认微信是否已安装"
fi

# 更新桌面数据库
update-desktop-database ~/.local/share/applications/

# 清除缓存
rm -rf ~/.cache/gnome-shell/ ~/.cache/gtk-* ~/.cache/gnome-control-center 2>/dev/null

echo ""
echo "🎉 全部完成！"
echo "📌 请注销重新登录使所有图标生效"
