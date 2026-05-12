---
name: "product-doc-lifecycle"
description: "产品开发文档体系管理。根据用户意图触发：建立文档体系、初始化文档结构、检查文档完整性、询问\"该写什么文档/文档放哪里/什么时候更新文档\"。触发前先评估项目复杂度和当前阶段，只建立最小必要文档集，避免过度文档化。支持核心文档、子项目文档、AI Agent 协作规范。"
---

# 产品开发全过程文件管理 v3.2

## 快速决策树

触发性问题：`文档初始化` `检查文档完整性` `该写什么文档` `文档放哪里`

```
项目复杂度？
├── 简单（1-3人，单仓库，无微服务）→ 最小集：README + DELIVERY-PLAN + CHANGELOG + 01 + 04
├── 中等（3-8人，前后端分离，≤2子项目）→ 标准集：最小集 + 02 + 05 + 06
└── 复杂（8+人，微服务/多仓库，≥3子项目）→ 完整集：标准集 + 03 + 07 + 子项目文档

有终端用户（有 UI/面向非开发者）？
├── 是 → 建议建 08-user-guide（中等/复杂必建，简单可选）
└── 否（纯API/后台/库）→ 不建 08-user-guide

项目当前阶段？
├── 立项/初始化 → 只建 README + DELIVERY-PLAN + CHANGELOG + DOCUMENTATION-INDEX
├── 需求确定 → +01-requirements
├── 架构确定 → +02-architecture（+03-database 如用数据库）
├── API 设计完成 → +04-api
├── 首个功能完成 → +05-feature-guide
├── 首次部署 → +06-deployment
└── 首次发布 → +07-release-notes
```

**原则：文档跟随代码进度，不提前建空文档。**

## 核心文档清单

| # | 文档 | 简单 | 中等 | 复杂 | 内容边界 |
|---|------|------|------|------|----------|
| - | README.md | ✅ | ✅ | ✅ | 项目简介、快速开始、文档入口 |
| - | CHANGELOG.md | ✅ | ✅ | ✅ | 版本变更列表 |
| - | DELIVERY-PLAN.md | ✅ | ✅ | ✅ | 阶段划分、时间线、分工、验收标准、风险跟踪 |
| 1 | 01-requirements | ✅ | ✅ | ✅ | 功能需求、用户故事、验收标准 |
| 2 | 02-architecture | - | ✅ | ✅ | 组件图、技术栈、端口规划 |
| 3 | 03-database | - | △ | ✅ | 表结构、索引、ER图 |
| 4 | 04-api.md | ✅ | ✅ | ✅ | 端点清单、请求/响应格式 |
| 5 | 05-feature-guide | △ | ✅ | ✅ | 功能使用说明、配置项 |
| 6 | 06-deployment | - | ✅ | ✅ | 环境要求、安装步骤、故障排查 |
| 7 | 07-release-notes | - | - | ✅ | 版本摘要、升级指引 |
| 8 | 08-user-guide | △ | ✅ | ✅ | 面向最终用户的使用说明 |

## 目录结构

```
{project-root}/
├── README.md
├── DELIVERY-PLAN.md
├── CHANGELOG.md
├── docs/
│   ├── DOCUMENTATION_INDEX.md
│   ├── api/
│   │   └── openapi.yaml
│   ├── core/
│   │   ├── 01-requirements.md
│   │   ├── 02-architecture.md
│   │   ├── 03-database.md
│   │   ├── 04-api.md
│   │   ├── 05-feature-guide.md
│   │   ├── 06-deployment.md
│   │   ├── 07-release-notes.md
│   │   └── 08-user-guide.md
│   └── {subproject}/
└── .workbuddy/memory/
```

## 命名规则

- 所有文件名：kebab-case，全小写 + 连字符
- 核心文档：`{序号}-{英文名}.md`（无版本号）
- 子项目文档：`{子项目ID}-{序号}-{英文名}.md`
- 版本号在文件内容头部维护

## 更新触发

| 代码变更 | 同步更新文档 |
|---------|-------------|
| 增加/修改功能 | 01-requirements + README + DELIVERY-PLAN |
| 修改架构/端口 | 02-architecture + README + DELIVERY-PLAN |
| 修改表结构 | 03-database |
| 新增/修改API | 04-api + openapi.yaml |
| 修改核心逻辑 | 05-feature-guide |
| 修改部署步骤 | 06-deployment |
| 版本发布（打tag） | 07-release-notes + CHANGELOG + README |
| UI/交互变更影响用户操作 | 08-user-guide |

## 禁止行为

- ❌ 在项目初期创建空文档占位
- ❌ 简单项目强制要求完整7份文档
- ❌ 文档版本号落后于代码版本号
- ❌ 跨文档复制内容而非引用
