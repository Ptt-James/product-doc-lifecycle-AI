# Changelog

本文件记录 **product-doc-lifecycle Skill** 本身的版本变更。

格式遵循 [Keep a Changelog](https://keepachangelog.com/zh-CN/)

---

## [Unreleased]

### Added
- 新增 `08-user-guide.md`（产品使用说明，面向最终用户）

### Changed
- SKILL.md 决策树增加"有终端用户？"分支
- 核心文档清单增加第 8 行
- 分阶段建设表 S5 阶段增加 `+08-user-guide`
- 创建/更新触发时机表格同步更新

---

## [3.0.0] - 2026-04-30

### Added
- 项目复杂度分级（简单/中等/复杂）决定最小文档集
- 分阶段渐进式文档建设（S0-S6）
- 子项目文档规范（含生命周期管理）
- 微服务专属章节模板
- AI Agent 协作规则
- "何时不触发"边界说明
- `references/doc-spec.md` 详细规范
- `references/templates.md` 完整模板集

### Changed
- SKILL.md 从 ~535 行精简至 ~312 行
- 详细内容迁移至 `references/` 目录
- 版本号机制：文件名不含版本号，版本号在文件内容头部维护

---

## [2.1.0] - 2026-04-15

### Added
- 核心文档 01-07 命名规范（kebab-case，无版本号）
- `DOCUMENTATION_INDEX.md` 文档索引
- CHANGELOG.md 格式规范

---

## [1.0.0] - 2026-04-01

### Added
- 初始版本：核心文档 01-07 基本规范
- README.md / CHANGELOG.md 模板

