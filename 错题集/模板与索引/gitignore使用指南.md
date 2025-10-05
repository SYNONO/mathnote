# .gitignore 完整使用指南

## 📘 什么是 .gitignore？

`.gitignore` 文件告诉 Git 哪些文件或文件夹**不需要版本控制**。

### 常见排除的内容：
- ✅ 临时文件（`.tmp`, `.log`）
- ✅ 系统文件（`.DS_Store`, `Thumbs.db`）
- ✅ 依赖文件夹（`node_modules/`）
- ✅ 敏感信息（密码、密钥）
- ✅ 编译产物（`.pyc`, `.class`）
- ✅ 个人配置（IDE 设置）

---

## 🔧 如何更新 .gitignore

### 方法1：用文本编辑器（最简单）

1. 打开文件：
   ```
   E:\MathExamVault\notebranch\mathnote\mathnote\.gitignore
   ```

2. 添加要排除的文件规则：
   ```gitignore
   # 排除所有日志文件
   *.log
   
   # 排除临时文件夹
   temp/
   
   # 排除特定文件
   secret.txt
   ```

3. 保存文件

4. 提交更新：
   - 双击桌面"推送错题集"图标

### 方法2：让 Claude 帮你更新

直接告诉 Claude：
```
"帮我在 .gitignore 中排除所有 .log 文件"
```

---

## 📚 .gitignore 语法规则

### 基础语法

```gitignore
# 井号开头是注释

# 排除具体文件
secret.txt
config.json

# 排除某个文件夹（末尾加 /）
temp/
cache/

# 排除所有某类文件（通配符 *）
*.log
*.tmp
*.bak

# 排除某个模式开头的文件
test_*
debug_*

# 排除某个模式结尾的文件
*_backup
*_old

# 排除所有子目录中的某类文件（双星号 **）
**/node_modules/
**/*.pyc

# 例外：保留某个文件（叹号 !）
*.log
!important.log  # 虽然排除了所有 .log，但保留这个
```

### 高级用法

```gitignore
# 只排除当前目录的文件，不包括子目录
/temp.txt

# 排除文件夹但保留其中某个文件
temp/
!temp/keep.txt

# 排除特定深度的目录
docs/*/temp/
```

---

## ⚠️ 重要：处理已追踪的文件

### 问题：.gitignore 不生效？

**原因**：如果文件已经被 Git 追踪（之前推送过），只更新 `.gitignore` 不会自动忽略它！

### 解决方案（三步走）

#### 步骤1：更新 .gitignore
添加要排除的规则

#### 步骤2：从 Git 移除（保留本地文件）

```powershell
cd "E:\MathExamVault\notebranch\mathnote\mathnote"

# 移除单个文件
git rm --cached "文件名.txt"

# 移除整个文件夹
git rm --cached -r "文件夹名/"

# 移除所有符合模式的文件
git rm --cached *.log
```

⚠️ 注意：`--cached` 参数表示**只从 Git 移除，保留本地文件**

#### 步骤3：提交并推送

```powershell
git add .gitignore
git commit -m "更新.gitignore并移除已追踪文件"
git push origin main
```

---

## 🎯 常见场景示例

### 场景1：排除所有日志文件

**在 .gitignore 中添加**：
```gitignore
# 日志文件
*.log
logs/
```

**如果之前已推送过日志文件**：
```powershell
git rm --cached *.log
git rm --cached -r logs/
git commit -m "移除日志文件追踪"
git push origin main
```

### 场景2：排除测试文件

**在 .gitignore 中添加**：
```gitignore
# 测试文件
test_*.py
test_*.js
*_test.py
__pycache__/
```

### 场景3：排除个人配置

**在 .gitignore 中添加**：
```gitignore
# 个人配置
.vscode/
.idea/
*.local
.env
```

### 场景4：排除大文件

**在 .gitignore 中添加**：
```gitignore
# 大文件
*.pdf
*.mp4
*.zip
data/
dataset/
```

---

## 🔍 检查 .gitignore 是否生效

### 方法1：查看 Git 状态
```powershell
cd "E:\MathExamVault\notebranch\mathnote\mathnote"
git status
```
被 `.gitignore` 排除的文件**不会出现**在未追踪文件列表中。

### 方法2：测试特定文件
```powershell
git check-ignore -v "文件名.txt"
```
会显示是哪条规则匹配了这个文件。

---

## 💡 最佳实践

### ✅ 推荐做法：

1. **项目初期就配置好** `.gitignore`
2. **定期检查**是否有新的文件类型需要排除
3. **不要追踪**：
   - 敏感信息（密码、API密钥）
   - 自动生成的文件
   - 依赖包（可通过包管理器重新安装）
   - 大型二进制文件

4. **应该追踪**：
   - 源代码
   - 配置模板（不含敏感信息）
   - 文档
   - 错题集笔记 ✅

### ❌ 避免：

1. 不要把 `.gitignore` 本身排除
2. 不要排除重要的项目文件
3. 不要在推送后频繁修改 `.gitignore`

---

## 🛠️ 实用工具

### 在线生成 .gitignore

访问：https://www.toptal.com/developers/gitignore

选择你的开发环境，自动生成配置。

### 查看 Git 忽略了哪些文件

```powershell
git status --ignored
```

---

## 📝 当前项目的 .gitignore 配置

### 已排除的内容：

```gitignore
# Obsidian 配置
.obsidian/workspace*
.obsidian/workspaces.json

# 临时文件
*.tmp
*.log
.DS_Store

# 测试文件
test_*.py
test_*.js

# Node.js
node_modules/

# PDF 实验
pdf-reader-local/
pdf-tools-mcp/

# 推送脚本（本地工具）
push*.bat
push*.ps1
*推送*.bat
*推送*.ps1
```

### 保留追踪的内容：

```gitignore
# 错题集文件夹（核心内容）
!错题集/
```

---

## 🆘 常见问题

### Q1: 为什么 .gitignore 不生效？

**A**: 文件可能已经被追踪。使用：
```powershell
git rm --cached "文件名"
```

### Q2: 如何撤销 git rm --cached？

**A**: 如果还没提交：
```powershell
git reset HEAD "文件名"
```

### Q3: 能否只忽略文件夹内的文件，但保留文件夹结构？

**A**: 可以，在文件夹中放一个 `.gitkeep` 文件：
```gitignore
temp/*
!temp/.gitkeep
```

### Q4: .gitignore 能否用正则表达式？

**A**: 不完全是正则，是 glob 模式匹配：
- `*` 匹配任意字符
- `?` 匹配单个字符
- `[abc]` 匹配括号内任意字符
- `**` 匹配任意层级目录

---

## 🔗 快速参考

### 常用命令

```powershell
# 查看当前 .gitignore
cat .gitignore

# 测试文件是否被忽略
git check-ignore -v "文件名"

# 查看所有被忽略的文件
git status --ignored

# 从追踪中移除但保留本地
git rm --cached "文件名"

# 从追踪和本地都删除
git rm "文件名"
```

---

## 📞 需要帮助？

如果遇到问题，可以：
1. 检查 `.gitignore` 语法是否正确
2. 运行 `git check-ignore` 测试
3. 询问 Claude 帮忙诊断

**记住：.gitignore 是你的好朋友，帮你保持仓库整洁！** 🌟
