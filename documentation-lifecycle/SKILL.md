---
name: documentation-lifecycle
description: >
  产品开发文档体系管理。根据用户意图触发：建立文档体系、初始化文档结构、
  检查文档完整性、询问"该写什么文档/文档放哪里/什么时候更新文档"。
  触发前先评估项目复杂度和当前阶段，只建立最小必要文档集，避免过度文档化。
  支持核心文档、子项目文档、AI Agent 协作规范。
  规范详解见 references/doc-spec.md，模板见 references/templates.md。
agent_created: true
version: "3.1.0"
---

# 产品开发全过程文件管理 v3.1

## 一、触发条件

用户提到以下意图时触发：
- 文档初始化 / 建立文档体系
- 检查文档完整性 / 缺失哪些文档
- 该写什么文档 / 文档放哪里 / 什么时候更新文档
- 子项目文档建立

**不触发**：纯代码问题、一次性脚本、用户明确说"不需要文档"

---

## 二、快速决策

### 2.1 复杂度分级（一次评估，决定最小集）

| 级别 | 判断标准 | 必须文档 |
|------|---------|---------|
| **简单** | 1-3人 / 单仓库 / 无微服务 
| **中等** | 3-8人 / 前后端分离 / ≤2子项目 
| **复杂** | 8+人 / 微服务 / 多仓库 / ≥3子项目 

| 文档 | 简单 | 中等 | 复杂 | 说明 |
|------|------|------|------|------|
| README.md | ✅ | ✅ | ✅ | 项目简介、快速开始、文档入口 |
| CHANGELOG.md | ✅ | ✅ | ✅ | 版本变更列表 |
| 01-requirements | ✅ | ✅ | ✅ | 功能需求、验收标准 |
| 02-architecture | - | ✅ | ✅ | 组件图、技术栈、端口规划 |
| 03-database | - | △ | ✅ | 表结构、索引、ER图 |
| 04-api | ✅ | ✅ | ✅ | 端点清单、请求/响应格式 |
| 05-feature-guide | △ | ✅ | ✅ | 功能使用说明、配置项 |
| 06-deployment | - | ✅ | ✅ | 环境要求、安装步骤、故障排查 |
| 07-release-notes | - | - | ✅ | 版本摘要、升级指引 |
| 08-user-guide | △ | ✅ | ✅ | 面向最终用户的使用说明 |

✅=必须  △=按需（有终端用户时建）  - =不需要

### 2.2 分阶段建立（逐步建立，不提前占位）

| 阶段 | 触发条件 | 建立文档 |
|------|---------|---------|
| **S0 初始化** | 仓库创建 / 项目立项 | README + CHANGELOG + DOCUMENTATION_INDEX |
| **S1 需求** | 需求评审通过 | +01-requirements |
| **S2 架构** | 技术方案确定 | +02-architecture（+03-database 如用数据库） |
| **S3 接口** | API 第一稿完成 | +04-api（+ openapi.yaml 推荐） |
| **S4 开发** | 首个功能完成 | +05-feature-guide |
| **S5 部署** | 首次部署 | +06-deployment（+08-user-guide 如有终端用户） |
| **S6 发布** | 首次正式发布 | +07-release-notes（后续每次发布更新） |

**原则：文档跟随代码进度，不提前建空文档。**

---

## 三、目录结构

```
{project-root}/
├── README.md
├── CHANGELOG.md
├── docs/
│   ├── DOCUMENTATION_INDEX.md
│   ├── api/
│   │   └── openapi.yaml          ← 推荐，与 04-api.md 同步
│   ├── core/                     ← 核心文档
│   │   ├── 01-requirements.md
│   │   ├── 02-architecture.md
│   │   ├── 03-database.md
│   │   ├── 04-api.md
│   │   ├── 05-feature-guide.md
│   │   ├── 06-deployment.md
│   │   ├── 07-release-notes.md
│   │   └── 08-user-guide.md
│   └── {subproject}/             ← 子项目文档
│       ├── {sp}-01-requirements.md
│       └── ...
└── .workbuddy/memory/            ← AI Agent 工作记忆
```

**命名规则**：
- 文件名：kebab-case，全小写 + 连字符
- 核心文档：`{序号}-{英文名}.md`
- 子项目文档：`{子项目ID}-{序号}-{英文名}.md`
- 版本号在**文件内容头部**维护，不出现在文件名中

---

## 四、子项目文档

### 4.1 判断标准（满足任一即为子项目）

独立部署单元 / 独立代码库 / 独立团队负责 / 纯前端模块 / 微服务

### 4.2 子项目文档命名

```
{子项目ID}-{两位序号}-{英文名}.md
例：admin-01-requirements.md   ai-services-04-api.md
```

序号映射：01=requirements  02=architecture  03=api  04=feature-guide  05=ui-design  06=deployment

### 4.3 微服务专属章节（02-architecture 必须包含）

服务发现与注册 / 服务间通信 / 数据一致性策略 / 容错与降级 / 服务依赖拓扑

> 详细模板见 `references/doc-spec.md` §五。

---

## 五、文档同步规则

### 5.1 代码变更 → 文档同步（强制绑定）

> **规则：代码变更与文档更新在同一 commit / PR 中完成。**

| 代码变更 | 同步更新 |
|---------|---------|
| 增加/修改功能 | 01-requirements + README |
| 修改架构/端口 | 02-architecture + README |
| 修改表结构 | 03-database |
| 新增/修改API | 04-api + openapi.yaml |
| 修改核心逻辑 | 05-feature-guide |
| 修改部署步骤 | 06-deployment |
| 版本发布（打tag） | 07-release-notes + CHANGELOG + README |
| UI/交互变更影响用户操作 | 08-user-guide（如有） |

### 5.2 版本号同步

发布版本时，所有核心文档头部版本号必须同步更新。

---

## 六、AI Agent 协作规则

### 6.1 读取优先级

1. `README.md` → 2. `02-architecture` → 3. `04-api` → 4. `03-database` → 5. 子项目文档按需

### 6.2 写入规则

- 修改代码后**同一 turn** 更新对应文档（先 Read 再 Edit，禁止直接覆写）
- 文档版本号、日期字段**必须**同步更新
- 工作记忆（`.workbuddy/memory/`）**不替代**正式文档
- 子项目文档使用作用域编号（`{sp}-{NN}-{type}.md`）

### 6.3 接手新项目时检查文档完整性

1. 列出 `docs/` 目录结构
2. 对照当前复杂度级别的最小集，报告缺失文档
3. 询问用户是否立即创建（**不自动创建**）

---

## 七、必须遵守

1. CHANGELOG.md 的 `[Unreleased]` 在开发过程中持续积累，发布前归档
2. 版本号所有核心文档同步（禁止只改 README）
3. 旧版文档移入 `docs/_archived/`，不删除
4. 跨文档不复制内容，使用相对路径引用

**禁止行为**：
- ❌ 在项目初期创建空文档占位
- ❌ 简单项目强制要求完整 7 份文档
- ❌ 文档版本号落后于代码版本号
- ❌ 跨文档复制内容而非引用
