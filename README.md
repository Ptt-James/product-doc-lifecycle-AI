# product-doc-lifecycle

> **产品开发全过程文件管理** Skill for WorkBuddy  
> 根据项目复杂度和阶段，自动决定"该建什么文档、放哪里、什么时候更新"，避免过度文档化。

[![Version](https://img.shields.io/badge/version-v3.1.0-blue)](https://github.com/your-repo/product-doc-lifecycle) [![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

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

### 方式一：复制到 WorkBuddy（本地安装）

```bash
# 把 product-doc-lifecycle/ 文件夹复制到 WorkBuddy skills 目录
cp -r product-doc-lifecycle ~/.workbuddy/skills/
```

### 方式二：Skill Hub 一键安装（待发布）

```
/workbuddy install product-doc-lifecycle
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

## 发布到 Skill Hub

1. Fork 本仓库
2. 确保 `product-doc-lifecycle/SKILL.md` 的 `description` 字段完整
3. 提交 PR 到 Skill Hub 仓库
4. 或联系维护者上传

---

## CHANGELOG

见 [CHANGELOG.md](CHANGELOG.md)

---

## License

MIT License — 可自由使用、修改、分发。

