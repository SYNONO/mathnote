# Tesseract OCR 安装和使用指南

## 📋 安装 Tesseract

### Windows 安装步骤

1. **下载安装包**
   - 访问: https://github.com/UB-Mannheim/tesseract/wiki
   - 下载最新版本的 Windows 安装包（例如: tesseract-ocr-w64-setup-5.x.x.exe）

2. **安装**
   - 运行安装包
   - **重要**: 记住安装路径（默认: `C:\Program Files\Tesseract-OCR`）
   - 安装时勾选"Add to PATH"选项

3. **安装中文语言包**
   - 在安装过程中，选择"Additional language data"
   - 勾选"Chinese (Simplified)"和"Chinese (Traditional)"
   - 或者手动下载：
     ```bash
     # 下载中文语言数据
     https://github.com/tesseract-ocr/tessdata/blob/main/chi_sim.traineddata
     # 放到 C:\Program Files\Tesseract-OCR\tessdata\ 目录
     ```

4. **验证安装**
   ```cmd
   tesseract --version
   tesseract --list-langs
   ```

### Mac 安装步骤

```bash
# 使用 Homebrew
brew install tesseract
brew install tesseract-lang  # 安装所有语言包

# 验证
tesseract --version
```

### Linux 安装步骤

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install tesseract-ocr
sudo apt install tesseract-ocr-chi-sim  # 中文简体
sudo apt install tesseract-ocr-chi-tra  # 中文繁体

# 验证
tesseract --version
```

## 🔧 配置 Python

### 1. 安装 Python 包

```bash
pip install pytesseract pdf2image Pillow
```

### 2. 配置路径（Windows）

如果 Tesseract 不在 PATH 中，需要在 Python 代码中指定：

```python
import pytesseract

# Windows
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

# 或者设置环境变量
import os
os.environ['TESSERACT_CMD'] = r'C:\Program Files\Tesseract-OCR\tesseract.exe'
```

## 📊 Tesseract vs 其他方案对比

| 特性 | Tesseract | pix2tex | MathPix | EasyOCR |
|------|-----------|---------|---------|---------|
| **中文支持** | ✅ 优秀 | ❌ 不支持 | ✅ 优秀 | ✅ 良好 |
| **数学公式** | ⚠️ 一般 | ✅ 专门设计 | ✅ 最佳 | ⚠️ 一般 |
| **准确率** | 85% | 20%（中文PDF） | 95% | 80% |
| **速度** | 快 | 快 | 快 | 慢 |
| **免费** | ✅ 完全免费 | ✅ 免费 | ❌ 付费 | ✅ 免费 |
| **离线** | ✅ 完全离线 | ✅ 离线 | ❌ 在线API | ✅ 离线 |
| **安装难度** | 中等 | 简单 | 简单 | 简单 |

## 🚀 使用已创建的 OCR 服务器

### 1. 更新 MCP 配置

编辑 `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "pdf-reader-ocr": {
      "command": "python",
      "args": [
        "E:\\MathExamVault\\notebranch\\mathnote\\mathnote\\pdf-reader-local\\server_ocr.py"
      ],
      "env": {}
    }
  }
}
```

### 2. 使用工具

在 Claude 中可以使用以下命令：

- `ocr_pdf` - 对 PDF 进行 OCR
- `ocr_image` - 对图像进行 OCR
- `check_ocr_status` - 检查 OCR 状态

## 💡 预期效果

### Tesseract OCR 对李永乐全书的效果

**优点：**
- ✅ 中文文本识别准确率高（85%+）
- ✅ 能保持文档布局
- ✅ 速度快，资源占用少
- ✅ 完全免费和离线

**缺点：**
- ⚠️ 数学公式识别一般（需要后处理）
- ⚠️ 复杂排版可能错位
- ⚠️ 需要单独安装 Tesseract 程序

**实际效果预估：**
- 文字内容：90% 准确
- 简单公式：60% 准确
- 复杂公式：30% 准确
- 整体可用性：75%

## 🎯 推荐方案

### 对于李永乐全书这类数学教材

**最佳组合方案：**

1. **文本提取**: Tesseract OCR（准确率高）
2. **公式处理**: 
   - 简单公式：Tesseract + 后处理
   - 复杂公式：MathPix API 或手动输入
3. **工作流程**:
   ```python
   # 1. 使用 Tesseract 提取全文
   text = tesseract_ocr(pdf_page)
   
   # 2. 识别公式区域
   formula_regions = detect_formulas(text)
   
   # 3. 对公式区域特殊处理
   for region in formula_regions:
       if is_simple_formula(region):
           formula = postprocess_tesseract(region)
       else:
           formula = use_mathpix_or_manual(region)
   
   # 4. 生成最终 Markdown
   markdown = combine_text_and_formulas(text, formulas)
   ```

## 📝 快速测试

安装 Tesseract 后，运行测试：

```bash
# 测试 Tesseract 安装
tesseract --version

# 测试 Python 集成
python test_tesseract_ocr.py

# 查看结果
cat tesseract_ocr_report.md
```

## 🔍 其他替代方案

如果不想安装 Tesseract，可以考虑：

1. **EasyOCR**（纯 Python，无需额外安装）
   ```bash
   pip install easyocr
   ```

2. **PaddleOCR**（百度开源，中文效果好）
   ```bash
   pip install paddlepaddle paddleocr
   ```

3. **在线 API**
   - 百度 OCR API
   - 腾讯 OCR API
   - 阿里云 OCR API

## 总结

**Tesseract 适合：**
- ✅ 需要离线处理
- ✅ 处理大量中文文档
- ✅ 预算有限
- ✅ 对公式准确率要求不高

**不适合：**
- ❌ 需要高精度数学公式识别
- ❌ 处理手写内容
- ❌ 需要即插即用（需要安装配置）

对于你的需求，Tesseract 可以解决 70-80% 的问题，剩余的数学公式可以结合其他工具或手动处理。