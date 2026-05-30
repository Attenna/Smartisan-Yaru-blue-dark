# Smartisan-Yaru-blue-dark 图标主题

> 一个基于 Ubuntu Yaru 主题深度定制的图标包，融合锤子科技 Smartisan 设计风格
## 图标包适配是个漫长的过程，欢迎自定义你的图标包并pr！

## 📸 预览

![主题预览](screenshot.png)

## ✨ 特性

- 🎨 **深度定制**：重绘了应用中心、安全中心等核心应用图标
- 📦 **Snap 支持**：完美覆盖 Snap 版应用的图标（Firefox、应用中心、安全中心）
- 🔧 **一键安装**：提供自动化安装脚本
- 🎯 **兼容性好**：基于 Yaru 主题，完整保留原有风格

## 📦 覆盖的应用

| 应用 | 类型 | 图标文件 |
|------|------|----------|
| QQ | deb 包 | `snap/qq.png` |
| Firefox | Snap | `snap/firefox.png` |
| 应用中心 (App Center) | Snap | `snap/software_store.png` |
| 安全中心 (Security Center) | Snap | `snap/security.png` |
| 微信 (WeChat) | deb 包 | `snap/weixin.png` |

## 🚀 快速开始

### 安装

```bash
# 克隆仓库
git clone https://github.com/Attenna/Smartisan-Yaru-blue-dark.git
cd Smartisan-Yaru-blue-dark

# 一键安装
bash install.sh
```

### 切换主题

1. 安装 `Gnome Tweaks`：
   ```bash
   sudo apt install gnome-tweaks
   ```

2. 打开 Tweaks，选择 **外观** → **图标**

3. 选择 **Smartisan-Yaru-blue-dark**

4. **注销并重新登录** 使所有图标生效

### 卸载

```bash
bash uninstall.sh
```

## 🛠️ 手动配置

如果部分图标未生效（特别是 Snap 应用），可以手动运行配置脚本：

```bash
bash ~/.local/share/icons/Smartisan-Yaru-blue-dark/snap/op_set.sh
```

## 📁 目录结构

```
Smartisan-Yaru-blue-dark/
├── install.sh              # 一键安装脚本
├── uninstall.sh            # 卸载脚本
├── README.md               # 说明文档
├── index.theme             # 主题定义文件
├── 16x16/                  # 16x16 尺寸图标
├── 22x22/                  # 22x22 尺寸图标
├── 24x24/                  # 24x24 尺寸图标
├── 32x32/                  # 32x32 尺寸图标
├── 48x48/                  # 48x48 尺寸图标
├── 256x256/                # 256x256 尺寸图标
├── 8x8/                    # 8x8 尺寸图标
├── scalable/               # SVG 矢量图标
└── snap/                   # Snap 应用图标覆盖
    ├── qq.png
    ├── firefox.png
    ├── thunderbird.png
    ├── software_store.png
    ├── security.png
    ├── weixin.png
    └── op_set.sh           # 启动器配置脚本
```

## 📋 系统要求

- Ubuntu 22.04 LTS 或更高版本
- GNOME 桌面环境
- `gnome-tweaks`（用于切换主题）

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

如果你有其他应用的图标需要适配，可以：
1. Fork 本项目
2. 将图标放入 `snap/` 目录
3. 在 `op_set.sh` 中添加对应的 `.desktop` 覆盖逻辑
4. 提交 Pull Request

## 📄 许可证

MIT License

## 🙏 致谢

- [Ubuntu Yaru](https://github.com/ubuntu/yaru) 主题团队
- 锤子科技 Smartisan OS 设计团队（设计灵感来源）
- [【图标分享】锤子科技SmartisanOS拟物图标 ](https://bbs.deepin.org.cn/zh/post/194268) Deepin 论坛帖子
- [smartisan-icon](https://github.com/ali-pay/smartisan-icon) Github 项目
- [DtkSmartisanosLogo]https://gitee.com/thegodofhou/DtkSmartisanosLogo 来自houyawei的开源项目

## 📞 联系方式

- GitHub: [Attenna](https://github.com/Attenna)
- 项目地址: [Smartisan-Yaru-blue-dark](https://github.com/Attenna/Smartisan-Yaru-blue-dark)

---

## ⭐ 如果觉得有用，请给个 Star！
## 图标包适配是个漫长的过程，欢迎自定义你的图标包并pr！
```
