# Principle Deepdive HTML Style

[English](README.md) | **中文**

> 一套可复用的视觉模板·用于生成 **单文件分析型 HTML 文章** —— 深色/浅色双主题·indigo/amber 主色·inline SVG 手绘图·可折叠卡片·零外部依赖·offline 可读·体积 < 300KB。

打包为 [**agent skill**](https://docs.anthropic.com/en/docs/claude-code/skills)·适配 [Claude Code](https://docs.anthropic.com/en/docs/claude-code) 和 [Cursor](https://cursor.sh/)。安装到 agent skill 目录后·当你向 agent 提"原理深拆 HTML / single-file 分析文章"等需求时·skill 会自动加载。

---

## 你能得到什么

生成长这样的文章（支持浅色 + 深色双主题）：

- **玻璃态 sticky nav** —— brand icon + 章节锚点 + 主题切换按钮
- **Hero 块** —— gradient eyebrow + 主标题 + lede + 元数据 chip + 响应式 stat grid + 跳转链接 TOC
- **Principle sections** —— 两栏布局（左侧文字 + 右侧 sticky inline-SVG 图）
- **学术引用卡片**（📖 前缀·年份 + 作者 + venue）· **essence box**（💡 前缀）· **framework-use callout**（🔧 前缀）· **disclaim 面板**（⚠️ 前缀）
- **可折叠 solution cards**（`<details>/<summary>`）·包含 layer-mapping 面板·适合度评分·工时 chip
- **Combo / roadmap section** —— 3-up step cards + 工程实施计划
- **Footer** —— badge 栏 · 互链 tile · 引用列表
- 一切 100% offline —— 无 CDN · 无字体导入 · 无图片资源 · 无 JS framework

**适合做**：研究笔记 · 框架深拆 · 跨学科原理讲解 · 技术 postmortem · benchmark 报告。

**不适合做**：营销 landing page · 短索引页 · 图表密集的 dashboard。

---

## 一键安装

### Linux / macOS

```bash
curl -fsSL https://raw.githubusercontent.com/Misakakuroko/principle-deepdive-html-style/main/install.sh | bash
```

### Windows PowerShell

```powershell
irm https://raw.githubusercontent.com/Misakakuroko/principle-deepdive-html-style/main/install.ps1 | iex
```

两个脚本都会：

1. 自动检测你装的是 Claude Code（`~/.claude/skills/`）还是 Cursor（`~/.cursor/skills/`）—— 两个都装则两边都安装
2. Clone（或更新）skill 目录
3. 打印安装路径确认

如需覆盖默认安装位置：

```bash
INSTALL_DIR=~/my-skills/principle-deepdive bash <(curl -fsSL https://raw.githubusercontent.com/Misakakuroko/principle-deepdive-html-style/main/install.sh)
```

### 手动安装

```bash
# Claude Code
git clone https://github.com/Misakakuroko/principle-deepdive-html-style.git ~/.claude/skills/principle-deepdive-html-style

# Cursor
git clone https://github.com/Misakakuroko/principle-deepdive-html-style.git ~/.cursor/skills/principle-deepdive-html-style
```

或者下载 [最新 release zip](https://github.com/Misakakuroko/principle-deepdive-html-style/archive/refs/heads/main.zip)·解压·重命名文件夹为 `principle-deepdive-html-style`·放到 `~/.claude/skills/` 或 `~/.cursor/skills/`。

---

## 使用方法

安装后·直接告诉你的 agent（Claude Code / Cursor / 任何能读 SKILL.md 的 agent）：

> "用 principle-deepdive 风格·生成一篇关于 [topic] 的深拆 HTML 文章。"

Agent 会：

1. 读 `SKILL.md`（根据 description 里的关键词自动加载）
2. 从 `color-palettes.md` 挑选一套配色
3. 复制 `template.html` 作为骨架
4. 按 `content-structure.md` 的结构 recipe 填充你的主题内容
5. 用 `svg-patterns.md` 的 cookbook 模式画 inline SVG 图

### 触发关键词

Agent 看到下面任一关键词·应自动加载这个 skill：

- "principle deep-dive HTML"
- "single-file analytical HTML article"
- "原理深拆 HTML"
- "和 deepdive 同风格"
- "documentation HTML with citations and diagrams"

如果你的 agent 没自动加载·显式指明 skill 名字：`Use the principle-deepdive-html-style skill to...`

---

## 文件清单

| 文件 | 用途 |
|---|---|
| `SKILL.md` | Agent 主指引 · 组件契约 · checklist · 186 行 |
| `template.html` | **直接复制使用的骨架** · 完整 CSS + 2 个 principle 示例 + 2 个可折叠 solution card · 725 行 / 38KB |
| `color-palettes.md` | 12 套现成的 hero gradient 配色 · light mode 处理 · 学科 chip 映射 |
| `content-structure.md` | 7 个 section 的 HTML 结构 recipe（hero · problem · principle · solution · combo · footer · tooltip） |
| `svg-patterns.md` | 6 套可复用的 inline-SVG 图模板（向量空间 · pipeline · 嵌套结构 · 双栏对比 · trace 表 · timeline） |
| `install.sh` | POSIX 一键安装 |
| `install.ps1` | Windows PowerShell 一键安装 |
| `LICENSE` | MIT |

---

## 这个 skill 明确禁止

- ❌ Tailwind / Bootstrap / Bulma / 任何 CSS framework
- ❌ Chart.js / D3 / Mermaid / Plotly / 任何 chart library
- ❌ Google Fonts / Adobe Fonts 字体导入 —— 只用系统字体栈
- ❌ 外部图标库（Font Awesome / Lucide / Heroicons）—— 只用 emoji 或手绘 SVG
- ❌ `<img>` 图片标签 —— 单文件 offline 硬约束
- ❌ Build step —— 输出必须能直接 `file://` 打开
- ❌ React / Vue / 任何 JS framework —— 只用 vanilla JS（主题切换 + 平滑滚动而已）

这些约束让输出 portable / archive-friendly / 在多 agent 多页面跨时间复用时保持一致。这个 skill 服务于内容密度和长期可读性·不是视觉花活。

---

## 样例展示

> 样例展示页即将上线。如果你用这个 skill 发布了页面·欢迎 PR 加到这一节。

---

## 为什么有这个 skill

现代技术文档站（Vercel / Linear / Stripe / Notion）有一套视觉 idiom —— 深色 + amber 主色 · 玻璃 nav · mono 字体引用 chip · inline SVG 图 —— 视觉辨识度高但手写复刻很烦。这个 skill 把这套 idiom 封装成一个 template + 一组结构 recipe·让 agent 能在 2-3 小时内产出一篇视觉一致的文章·不用从零写 CSS。

设计约束（offline · 单文件 · 零依赖 · < 300KB）来自使用场景：长篇分析内容需要跟代码一起进 version control · 直接 `file://` 渲染 · 多年后还能读·不会因为 CDN 挂掉或 library 弃用而 bit-rot。

---

## License

[MIT](LICENSE) —— 任何项目（商业 / 个人）都可自由使用·欢迎署名但不强制。

---

## 贡献

欢迎 PR。可能有用的增量：

- 更多配色组合
- 更多 SVG 模式（如 tree / graph / matrix 可视化）
- 更多内容 recipe（如 comparison table · changelog · FAQ）
- `SKILL.md` body 翻译到其他语言（frontmatter `description` 保留英文·确保英文训练的 agent 能识别）

请保持改动与设计哲学一致：**零外部依赖**·**单文件输出**·**系统字体栈**·**只用 inline SVG**。
