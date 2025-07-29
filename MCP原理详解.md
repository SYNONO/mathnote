# MCP (Model Context Protocol) 原理详解

## 什么是 MCP？

MCP 是 Anthropic 开发的开放协议，让 AI 模型（如 Claude）能够与外部工具和数据源进行标准化通信。

## 🔄 MCP 的工作原理

### 1. 基本架构
```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Claude    │     │ MCP Server  │     │  External   │
│   (客户端)  │◄───►│  (服务器)   │◄───►│   Tool      │
│             │ MCP │             │     │ (Obsidian)  │
└─────────────┘     └─────────────┘     └─────────────┘
```

### 2. 通信流程

1. **用户请求**：你对 Claude 说："帮我创建一个关于导数的笔记"

2. **Claude 解析**：Claude 理解你的意图，需要创建文件

3. **MCP 调用**：
   ```json
   {
     "method": "create_note",
     "params": {
       "title": "导数的定义",
       "content": "笔记内容...",
       "path": "高等数学/第2章_导数与微分"
     }
   }
   ```

4. **MCP Server 处理**：
   - 接收 Claude 的请求
   - 调用 Obsidian API 或直接操作文件系统
   - 在指定路径创建 .md 文件

5. **返回结果**：
   ```json
   {
     "success": true,
     "file_path": "高等数学/第2章_导数与微分/导数的定义.md",
     "message": "笔记创建成功"
   }
   ```

6. **Claude 回复**：告诉你笔记已创建

## 🎯 MCP 的核心概念

### 1. **标准化协议**
- 统一的通信格式（JSON-RPC）
- 标准的方法调用（tools）
- 一致的错误处理

### 2. **工具（Tools）**
MCP Server 提供的功能，比如：
- `search_notes`：搜索笔记
- `create_note`：创建笔记
- `update_note`：更新笔记
- `get_note_content`：读取笔记内容

### 3. **资源（Resources）**
MCP Server 管理的数据，比如：
- 笔记文件
- 配置信息
- 元数据

## 🔍 具体到 Obsidian MCP

### 工作方式
1. **文件系统访问**：直接读写 Vault 中的 .md 文件
2. **元数据处理**：解析 frontmatter、标签等
3. **链接管理**：处理 [[双向链接]]
4. **搜索功能**：全文搜索和标签搜索

### 实际例子
当你说："搜索所有关于函数的笔记"

1. Claude 调用 MCP：
   ```javascript
   mcp.call("search_notes", {
     query: "函数",
     type: "content"
   })
   ```

2. MCP Server：
   - 遍历 Vault 中的所有 .md 文件
   - 搜索包含"函数"的内容
   - 返回匹配的文件列表

3. Claude 整理结果并回复你

## 🚀 MCP 的优势

1. **解耦合**：Claude 不需要知道 Obsidian 的具体实现
2. **标准化**：任何支持 MCP 的 AI 都能使用
3. **安全性**：通过 MCP Server 控制权限
4. **扩展性**：容易添加新功能

## 🔐 安全机制

1. **权限控制**：只能访问指定的 Vault
2. **操作限制**：可以限制某些危险操作
3. **日志记录**：所有操作都可以被记录

## 📊 与直接文件操作的对比

| 特性 | 直接操作 | 通过 MCP |
|------|---------|----------|
| 标准化 | ❌ | ✅ |
| 安全性 | 低 | 高 |
| 可扩展 | 难 | 易 |
| 维护性 | 差 | 好 |

简单来说，MCP 就是 Claude 和 Obsidian 之间的"翻译官"和"守门员"！
