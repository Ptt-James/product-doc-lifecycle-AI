# product-doc-lifecycle

> **产品开发全过程文件管理** Skill for WorkBuddy  
> 根据项目复杂度和阶段，自动决定"该建什么文档、放哪里、什么时候更新"，避免过度文档化。

[![Version](https://img.shields.io/badge/version-v3.1.0-blue)](https://github.com/Ptt-James/product-doc-lifecycle-AI) [![License](https://img.shields.io/badge/license-MIT-green)](LICENSE) [![Install](https://img.shields.io/badge/install-one--click-brightgreen)](#installation)

---

## 为什么需要这个 Skill

大多数项目的文档要么缺失、要么过度——初期建了一堆空文档没人维护，或者到了交付才发现什么都没写。

这个 Skill 让 AI Agent（WorkBuddy）根据**项目复杂度**和**当前阶段**动态决定文档范围：

```
简单项目（1-3人）→ 4份文档
中等项目（3-8人）→ 7份文档
复杂项目（8+人，微服务）→ 完整集 + 子项目文档
```

---

## 安装

<details>
<summary>📦 一键安装（推荐）</summary>

**Linux / macOS:**
```bash
curl -fsSL https://raw.githubusercontent.com/Ptt-James/product-doc-lifecycle-AI/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
iwr -useb https://raw.githubusercontent.com/Ptt-James/product-doc-lifecycle-AI/main/install.ps1 | iex
```

</details>

### 方式一：从 GitHub 克隆并安装

#### Linux / macOS

```bash
# 1. 克隆仓库
git clone https://github.com/Ptt-James/product-doc-lifecycle-AI.git
cd product-doc-lifecycle-AI

# 2. 复制 Skill 到 CodeBuddy skills 目录
cp -r product-doc-lifecycle ~/.codebuddy/skills/

# 3. 清理（可选）
cd ..
rm -rf product-doc-lifecycle-AI
```

#### Windows (PowerShell)

```powershell
# 1. 克隆仓库
git clone https://github.com/Ptt-James/product-doc-lifecycle-AI.git
cd product-doc-lifecycle-AI

# 2. 复制 Skill 到 CodeBuddy skills 目录
Copy-Item -Recurse product-doc-lifecycle "$env:USERPROFILE\.codebuddy\skills\"

# 3. 清理（可选）
cd ..
Remove-Item -Recurse -Force product-doc-lifecycle-AI
```

### 方式二：手动下载

1. 访问 [GitHub Releases](https://github.com/Ptt-James/product-doc-lifecycle-AI/releases)
2. 下载最新版本的 `product-doc-lifecycle.zip`
3. 解压到 `~/.codebuddy/skills/` 目录（macOS/Linux）或 `%USERPROFILE%\.codebuddy\skills\`（Windows）

### 方式三：复制现有 Skill

如果你已经在本地有 `product-doc-lifecycle` 文件夹：

```bash
# Linux / macOS
cp -r product-doc-lifecycle ~/.codebuddy/skills/

# Windows PowerShell
Copy-Item -Recurse product-doc-lifecycle "$env:USERPROFILE\.codebuddy\skills\"
```

### 验证安装

安装后，在 CodeBuddy 中对 AI 说：
> "列出可用的 skills"

你应该能看到 `product-doc-lifecycle` 在列表中。

### 卸载

```bash
# Linux / macOS
rm -rf ~/.codebuddy/skills/product-doc-lifecycle

# Windows PowerShell
Remove-Item -Recurse -Force "$env:USERPROFILE\.codebuddy\skills\product-doc-lifecycle"
```

---

## 快速开始

安装后，直接对 AI 说：

| 你说的话 | Skill 做什么 |
|----------|----------------|
| "帮我初始化文档体系" | 评估复杂度，建立最小必要文档集 |
| "检查文档完整性" | 对照当前阶段，报告缺失文档 |
| "这个项目该写什么文档？" | 根据复杂度和阶段给出建议 |
| "建立子项目文档" | 为子项目生成独立文档集 |

---

## Skill 包含什么

```
product-doc-lifecycle/
├── SKILL.md              ← 核心规则（决策树、复杂度分级、触发时机）
└── references/
    ├── doc-spec.md      ← 各文档详细规范（内容边界、检查清单）
    └── templates.md    ← 所有文档完整模板（复制即用）
```

### 支持的文档（8 份核心 + 子项目集）

| # | 文档 | 简单 | 中等 | 复杂 | 说明 |
|---|------|------|------|------|------|
| 01 | requirements | ✅ | ✅ | ✅ | 需求规格 |
| 02 | architecture | - | ✅ | ✅ | 系统架构 |
| 03 | database | - | △ | ✅ | 数据库设计 |
| 04 | api | ✅ | ✅ | ✅ | API 接口文档 |
| 05 | feature-guide | △ | ✅ | ✅ | 功能指南（面向开发者）|
| 06 | deployment | - | ✅ | ✅ | 部署运维手册 |
| 07 | release-notes | - | - | ✅ | 版本发布说明 |
| 08 | user-guide | △ | ✅ | ✅ | 产品使用说明（面向最终用户）|

△ = 按需建立

---

## 复杂度评估

Skill 会自动评估，也可以手动对照：

| 评估维度 | 简单 | 中等 | 复杂 |
|---------|------|------|------|
| 团队规模 | 1-3人 | 3-8人 | 8+人 |
| 架构形态 | 单应用 | 前后端分离 | 微服务/多仓库 |
| 项目周期 | <3个月 | 3-12个月 | >12个月 |

**总分 0-3 → 简单，4-7 → 中等，8-12 → 复杂**

---

## 分阶段建设（防止空文档）

| 阶段 | 触发条件 | 建立文档 |
|------|---------|---------|
| S0 初始化 | 仓库创建 | README + CHANGELOG |
| S1 需求 | 需求评审通过 | +01-requirements |
| S2 架构 | 技术方案确定 | +02-architecture |
| S3 接口 | API 第一稿完成 | +04-api |
| S4 开发 | 首个功能完成 | +05-feature-guide |
| S5 部署 | 首次部署 | +06-deployment +08-user-guide |
| S6 发布 | 首次发布 | +07-release-notes |

---

## 适用场景

- ✅ Web 应用 / 移动端 / 桌面应用
- ✅ 微服务架构 / Monorepo
- ✅ B2C SaaS / 内部工具
- ❌ 一次性脚本（不需要文档）
- ❌ 纯算法研究（无交付对象）

---

## 贡献与反馈

欢迎贡献！你可以：

1. **报告 Bug**：在 [Issues](https://github.com/Ptt-James/product-doc-lifecycle-AI/issues) 提交问题
2. **提出建议**：在 [Discussions](https://github.com/Ptt-James/product-doc-lifecycle-AI/discussions) 分享想法
3. **提交 PR**：Fork 仓库，修改后提交 Pull Request

## 团队

- **黄益群（益群）** - 项目负责人
- **陈黄琳娜**
- **李雪艳**

## 相关链接

- 📖 [完整文档（中文）](产品文档全过程管理技能.md)
- 📖 [完整文档（英文）](Product-Doc-Lifecycle%20Project%20Description%20Document.md)
- 🐛 [问题反馈](https://github.com/Ptt-James/product-doc-lifecycle-AI/issues)
- 💬 [讨论区](https://github.com/Ptt-James/product-doc-lifecycle-AI/discussions)

---

## CHANGELOG

见 [CHANGELOG.md](CHANGELOG.md)

---

## License

MIT License — 可自由使用、修改、分发。

