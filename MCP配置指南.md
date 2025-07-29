# MCP 配置指南

## 一、安装 Obsidian MCP Server

### 方法1：使用 Smithery CLI（推荐）

1. 安装 Node.js（如果还没有）
2. 安装 Smithery CLI：
   ```bash
   npm install -g @smithery/cli
   ```

3. 安装 Obsidian MCP Server：
   ```bash
   smithery install @Rwb3n/obsidian-mcp
   ```

### 方法2：手动安装

1. 克隆或下载 MCP Server 代码
2. 在项目目录运行：
   ```bash
   npm install
   npm run build
   ```

## 二、配置 Claude Desktop

1. 找到 Claude Desktop 的配置文件：
   - Windows: `%APPDATA%\Claude\claude_desktop_config.json`
   - Mac: `~/Library/Application Support/Claude/claude_desktop_config.json`

2. 添加 MCP 配置：
   ```json
   {
     "mcpServers": {
       "obsidian": {
         "command": "node",
         "args": ["C:/path/to/obsidian-mcp/dist/index.js"],
         "env": {
           "VAULT_PATH": "E:\\MathExamVault\\notebranch\\mathnote"
         }
       }
     }
   }
   ```

3. 重启 Claude Desktop

## 三、测试连接

在 Claude 中输入以下命令测试：

1. **列出所有笔记**
   ```
   "列出我的所有数学笔记"
   ```

2. **搜索笔记**
   ```
   "搜索关于函数的笔记"
   ```

3. **创建新笔记**
   ```
   "帮我创建关于极限定义的笔记"
   ```

## 四、常见问题

### 1. 连接失败
- 检查 VAULT_PATH 路径是否正确
- 确保 Obsidian 没有独占文件
- 查看 Claude Desktop 日志

### 2. 权限问题
- 确保 MCP Server 有读写 Vault 的权限
- Windows 用户可能需要管理员权限

### 3. 中文乱码
- 确保文件编码为 UTF-8
- 检查系统语言设置

## 五、进阶配置

### 1. 自定义模板路径
```json
{
  "TEMPLATE_PATH": "E:\\MathExamVault\\notebranch\\mathnote\\模板"
}
```

### 2. 启用高级功能
```json
{
  "ENABLE_GRAPH": true,
  "ENABLE_SEARCH": true,
  "MAX_SEARCH_RESULTS": 20
}
```

## 六、使用技巧

1. **智能创建笔记**
   - "根据今天学的内容创建笔记"
   - "整理第二章的所有知识点"

2. **关联题库**
   - "找出所有关于导数的笔记和题目"
   - "这道题涉及哪些知识点？"

3. **复习辅助**
   - "生成本周的复习计划"
   - "哪些知识点需要加强？"

---
更新时间：2025-01-28
