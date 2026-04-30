# MEMORY.md — product-doc-lifecycle 演示项目

## 项目概述

- **名称**: product-doc-lifecycle 演示工作空间
- **路径**: `D:\ai-places\product-doc-lifecycle-workspace\`
- **用途**: 演示"产品开发全过程文件管理"Skill 的完整文档体系
- **状态**: 演示/参考项目（V1.0.0）

## 文档体系

### 核心文档（7 份）— docs/core/

| # | 文档 | 版本 | 状态 |
|---|------|------|------|
| 1 | 01_requirements_V1.0.0.md | V1.0.0 | ✅ 已创建 |
| 2 | 02_architecture_V1.0.0.md | V1.0.0 | ✅ 已创建 |
| 3 | 03_database_V1.0.0.md | V1.0.0 | ✅ 已创建 |
| 4 | 04_api_V1.0.0.md | V1.0.0 | ✅ 已创建 |
| 5 | 05_feature_guide_V1.0.0.md | V1.0.0 | ✅ 已创建 |
| 6 | 06_deployment_V1.0.0.md | V1.0.0 | ✅ 已创建 |
| 7 | 07_release_notes_V1.0.0.md | V1.0.0 | ✅ 已创建 |

### 子项目文档

#### 管理后台 (admin) — 编号段 08–13
- `docs/admin/08_requirements_V1.0.0.md` ✅
- `docs/admin/09_architecture_V1.0.0.md` ✅
- `docs/admin/10_data_model_V1.0.0.md` ✅
- `docs/admin/11_api_V1.0.0.md` ✅
- `docs/admin/12_feature_guide_V1.0.0.md` ✅
- `docs/admin/13_ui_design_V1.0.0.md` ✅

#### AI 服务 (ai-services) — 编号段 14–17
- `docs/ai-services/14_requirements_V1.0.0.md` ✅
- `docs/ai-services/15_architecture_V1.0.0.md` ✅
- `docs/ai-services/16_api_V1.0.0.md` ✅
- `docs/ai-services/17_feature_guide_V1.0.0.md` ✅

## 配套文件

- `README.md` — 项目门户 ✅
- `CHANGELOG.md` — 变更日志 ✅
- `docs/DOCUMENTATION_INDEX.md` — 文档索引 ✅

## 关联 Skill

- **Skill 路径**: `.workbuddy/skills/product-doc-lifecycle/`
- **Skill 版本**: v1.1.0
- **包含文件**: SKILL.md + doc-spec.md + templates.md

## 使用说明

此工作空间是 Skill 的配套演示项目，供团队参考标准文档体系结构。
如需在新项目中应用：
1. 复制 `docs/core/` 下的文档模板到新项目
2. 根据项目需求调整内容
3. 遵守 SKILL.md 中的命名规范和触发时机规则

---

_最后更新: 2026-04-30_
