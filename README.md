# Quick Claude

一键在当前文件夹启动 Claude Code 的 Windows 右键菜单工具。

## 功能

在 Windows 文件资源管理器中添加右键菜单项 **"Open Claude Here"**，点击后会：

1. 在当前文件夹打开 Git Bash 终端
2. 自动执行 `claude --dangerously-skip-permissions` 命令

## 前置要求

- [Git for Windows](https://git-scm.com/download/win)（包含 Git Bash）
- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code)

## 安装

1. 双击运行 `open-claude-here.reg`
2. 在弹出的对话框中点击 **"是"** 确认
3. 点击 **"确定"** 完成安装

## 使用方法

- **在文件夹空白处右键** → 选择 "Open Claude Here"
- **在文件夹上右键** → 选择 "Open Claude Here"

## 卸载

双击运行 `uninstall-claude-menu.reg` 即可移除右键菜单项。

## 文件说明

| 文件 | 说明 |
|------|------|
| `open-claude-here.reg` | 安装脚本，添加右键菜单 |
| `uninstall-claude-menu.reg` | 卸载脚本，移除右键菜单 |

## 注意事项

- 需要以当前用户权限运行注册表文件
- 如果 Git 安装路径不是 `C:\Program Files\Git`，请手动修改 `.reg` 文件中的路径
