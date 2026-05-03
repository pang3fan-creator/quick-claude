# Quick Claude

一键在当前文件夹启动 Claude Code。

- **Windows**：文件资源管理器右键菜单
- **macOS**：AppleScript 应用，可拖到 Finder 工具栏或 Dock 中一键启动

## Windows 安装

### 前置要求

- [Git for Windows](https://git-scm.com/download/win)（包含 Git Bash）
- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code)

### 安装

1. 双击运行 `open-claude-here.reg`
2. 在弹出的对话框中点击 **"是"** 确认
3. 点击 **"确定"** 完成安装

### 使用方法

- **在文件夹空白处右键** → 选择 "Open Claude Here"
- **在文件夹上右键** → 选择 "Open Claude Here"

### 卸载

双击运行 `uninstall-claude-menu.reg` 即可移除右键菜单项。

---

## macOS 安装

### 前置要求

- [iTerm2](https://iterm2.com/)
- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code)

### 安装

```bash
chmod +x install.sh && ./install.sh
```

### 使用方法

安装后，`Open Claude Here.app` 会出现在 `~/Applications/` 目录中。你可以在 Finder 中以两种方式使用：

**方法一：Finder 工具栏（推荐）**
1. 打开一个 Finder 窗口
2. 按住 **Cmd 键**，将 `~/Applications/` 中的 `Open Claude Here` 
   拖拽到 Finder 窗口顶部的工具栏区域
3. 以后在任何 Finder 窗口中，**点击工具栏图标**即可打开 Claude

**方法二：Dock**
1. 将 `~/Applications/Open Claude Here` 拖到 Dock 中
2. 点击 Dock 图标即可在当前 Finder 窗口位置打开 Claude

两种方法可以同时使用。

### 如何工作

点击应用后，会自动：
1. 获取当前 Finder 窗口的目录路径
2. 打开 iTerm2（未运行时自动启动）
3. 创建新标签页
4. 在该目录下启动 `claude`

### 卸载

```bash
chmod +x uninstall.sh && ./uninstall.sh
```

然后从 Finder 工具栏或 Dock 中移除图标。

---

## 文件说明

| 文件 | 说明 |
|------|------|
| `open-claude-here.reg` | Windows：注册右键菜单 |
| `uninstall-claude-menu.reg` | Windows：移除右键菜单 |
| `install.sh` | macOS：安装脚本 |
| `uninstall.sh` | macOS：卸载脚本 |
| `macos/open-claude-here.applescript` | macOS：AppleScript 源码 |
| `macos/build-app.sh` | macOS：编译脚本 |
| `macos/Open Claude Here.app/` | macOS：编译后的应用 |

## 注意事项

- **Windows**：需要以当前用户权限运行注册表文件；如果 Git 安装路径不是 `C:\Program Files\Git`，请手动修改 `.reg` 文件中的路径
- **macOS**：安装脚本会自动检测 claude 路径；如果 iTerm2 未安装，请先安装 iTerm2
