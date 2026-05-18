# SVG Diagram Cookbook

All diagrams in the deepdive series are **hand-drawn inline SVG** — no charting library, no exported images. This file gives 6 reusable patterns with copy-paste blocks.

## Conventions

- **viewBox**: typically `0 0 420 400-540` (aspect ratio fits the right-column sticky `principle-visual` container at ~320px wide)
- **Text classes**: use the shared `.svg-text` / `.svg-text-dim` / `.svg-text-mono` / `.svg-text-accent` / `.svg-text-green` / `.svg-text-red` defined in `template.html` — they inherit color from CSS variables and auto-adapt to light/dark theme
- **Node classes**: `.svg-node` (default neutral) · `.svg-node.primary` / `.accent` / `.green` / `.red` / `.purple` for colored variants
- **Arrows**: use the shared `<defs>` markers in `template.html`: `marker-end="url(#ar)"` (neutral gray) · `url(#ar-a)` (amber) · `url(#ar-p)` (indigo) · `url(#ar-r)` (red) · `url(#ar-g)` (green)
- **Caption**: always add `<div class="visual-caption">...</div>` below `</svg>` with one italic line

## Pattern 1: Vector / Embedding Space

For showing points in a 2D space with cosine distance or clusters.

```html
<svg viewBox="0 0 420 280" role="img" aria-label="向量空间示意图">
  <text x="210" y="22" text-anchor="middle" class="svg-text" font-size="13" font-weight="600">标题</text>
  <text x="210" y="38" text-anchor="middle" class="svg-text-dim" font-size="10">副标题</text>

  <rect x="20" y="58" width="380" height="200" rx="10" fill="var(--bg-card-2)" stroke="var(--border)" stroke-width="1"/>
  <text x="210" y="78" text-anchor="middle" class="svg-text-mono" font-size="10" fill="var(--text-dim)">1024 维 cosine 空间</text>

  <!-- Two close points -->
  <circle cx="160" cy="140" r="8" fill="var(--primary)" opacity=".85"/>
  <text x="160" y="160" text-anchor="middle" class="svg-text" font-size="10" font-weight="600">vec_A</text>
  <text x="160" y="173" text-anchor="middle" class="svg-text-dim" font-size="9">说明文本 1</text>

  <circle cx="208" cy="138" r="8" fill="var(--accent)" opacity=".85"/>
  <text x="208" y="118" text-anchor="middle" class="svg-text" font-size="10" font-weight="600">vec_B</text>
  <text x="208" y="106" text-anchor="middle" class="svg-text-dim" font-size="9">说明文本 2</text>

  <line x1="160" y1="140" x2="208" y2="138" stroke="var(--text-dim)" stroke-width="1" stroke-dasharray="3 3"/>
  <text x="184" y="134" text-anchor="middle" class="svg-text-mono" font-size="9" fill="var(--text-dim)">cos ≈ 0.85</text>

  <!-- Far point -->
  <circle cx="320" cy="200" r="8" fill="var(--gray)" opacity=".6"/>
  <text x="320" y="218" text-anchor="middle" class="svg-text-dim" font-size="9">无关 chunk</text>
  <text x="320" y="230" text-anchor="middle" class="svg-text-dim" font-size="9">cos ≈ 0.45</text>
</svg>
```

## Pattern 2: Flow / Pipeline

For showing data flow between processing stages (linear or branching).

```html
<svg viewBox="0 0 420 240" role="img" aria-label="处理流程图">
  <text x="210" y="22" text-anchor="middle" class="svg-text" font-size="13" font-weight="600">Pipeline 标题</text>

  <!-- Stage 1 -->
  <rect x="20" y="60" width="110" height="60" rx="10" class="svg-node primary"/>
  <text x="75" y="85" text-anchor="middle" class="svg-text" font-size="12" font-weight="600">输入</text>
  <text x="75" y="105" text-anchor="middle" class="svg-text-dim" font-size="10">原始数据</text>

  <path d="M 130 90 L 155 90" stroke="var(--text-dim)" stroke-width="1.5" fill="none" marker-end="url(#ar)"/>

  <!-- Stage 2 -->
  <rect x="155" y="60" width="110" height="60" rx="10" class="svg-node accent"/>
  <text x="210" y="85" text-anchor="middle" class="svg-text" font-size="12" font-weight="600">处理</text>
  <text x="210" y="105" text-anchor="middle" class="svg-text-dim" font-size="10">中间产物</text>

  <path d="M 265 90 L 290 90" stroke="var(--text-dim)" stroke-width="1.5" fill="none" marker-end="url(#ar)"/>

  <!-- Stage 3 -->
  <rect x="290" y="60" width="110" height="60" rx="10" class="svg-node green"/>
  <text x="345" y="85" text-anchor="middle" class="svg-text" font-size="12" font-weight="600">输出</text>
  <text x="345" y="105" text-anchor="middle" class="svg-text-dim" font-size="10">结果</text>

  <!-- Annotations below -->
  <text x="75" y="150" text-anchor="middle" class="svg-text-mono" font-size="9" fill="var(--text-dim)">注释 1</text>
  <text x="210" y="150" text-anchor="middle" class="svg-text-mono" font-size="9" fill="var(--text-dim)">注释 2</text>
  <text x="345" y="150" text-anchor="middle" class="svg-text-mono" font-size="9" fill="var(--text-dim)">注释 3</text>
</svg>
```

## Pattern 3: Nested Structure (Reported Speech / Hierarchy)

For showing an outer container with an inner labeled element (used in reported speech / nested attribution / wrapper patterns).

```html
<svg viewBox="0 0 420 240" role="img" aria-label="嵌套结构图">
  <text x="210" y="22" text-anchor="middle" class="svg-text" font-size="13" font-weight="600">外层 vs 内层</text>

  <!-- Outer box -->
  <rect x="20" y="60" width="380" height="140" rx="10" fill="var(--purple-bg)" stroke="var(--purple)" stroke-width="2"/>
  <text x="40" y="80" class="svg-text" font-size="11" fill="var(--purple)" font-weight="700">outer speaker = A</text>
  <text x="40" y="98" class="svg-text-mono" font-size="10" fill="var(--text-soft)">外层 narrative voice</text>

  <!-- Inner quoted box -->
  <rect x="50" y="110" width="320" height="60" rx="6" fill="var(--accent-bg)" stroke="var(--accent)" stroke-width="2"/>
  <text x="210" y="132" text-anchor="middle" class="svg-text-accent" font-size="11" font-weight="700">"内层引语原话第一行"</text>
  <text x="210" y="150" text-anchor="middle" class="svg-text-accent" font-size="11" font-weight="700">"内层引语原话第二行"</text>
  <text x="210" y="186" text-anchor="middle" class="svg-text-mono" font-size="9" fill="var(--accent-soft)">↑ inner speaker = B (真正源)</text>
</svg>
```

## Pattern 4: Comparison Columns (A vs B / PPO vs GRPO)

For side-by-side comparison of two methods/approaches.

```html
<svg viewBox="0 0 420 360" role="img" aria-label="方法 A vs B 对比">
  <text x="210" y="22" text-anchor="middle" class="svg-text" font-size="13" font-weight="600">A 与 B 对比</text>

  <!-- Left column header -->
  <text x="105" y="50" text-anchor="middle" class="svg-text" font-size="12" font-weight="600">方法 A</text>

  <rect x="14" y="64" width="180" height="42" rx="6" class="svg-node primary"/>
  <text x="104" y="82" text-anchor="middle" class="svg-text" font-size="11">步骤 1</text>
  <text x="104" y="98" text-anchor="middle" class="svg-text-dim" font-size="9">描述</text>

  <rect x="14" y="116" width="180" height="42" rx="6" class="svg-node accent"/>
  <text x="104" y="134" text-anchor="middle" class="svg-text" font-size="11">步骤 2</text>
  <text x="104" y="150" text-anchor="middle" class="svg-text-dim" font-size="9">描述</text>

  <rect x="14" y="168" width="180" height="50" rx="6" fill="var(--red-bg)" stroke="var(--red)" stroke-width="2"/>
  <text x="104" y="186" text-anchor="middle" class="svg-text" font-size="11" font-weight="600" fill="var(--red)">问题点</text>
  <text x="104" y="200" text-anchor="middle" class="svg-text-mono" font-size="9">cost / 缺点</text>

  <!-- Right column header -->
  <text x="316" y="50" text-anchor="middle" class="svg-text" font-size="12" font-weight="600" fill="var(--green)">方法 B</text>

  <rect x="226" y="64" width="180" height="42" rx="6" class="svg-node primary"/>
  <text x="316" y="82" text-anchor="middle" class="svg-text" font-size="11">步骤 1</text>
  <text x="316" y="98" text-anchor="middle" class="svg-text-dim" font-size="9">描述</text>

  <rect x="226" y="116" width="180" height="42" rx="6" class="svg-node accent"/>
  <text x="316" y="134" text-anchor="middle" class="svg-text" font-size="11">步骤 2</text>
  <text x="316" y="150" text-anchor="middle" class="svg-text-dim" font-size="9">描述</text>

  <rect x="226" y="168" width="180" height="50" rx="6" fill="var(--green-bg)" stroke="var(--green)" stroke-width="2"/>
  <text x="316" y="186" text-anchor="middle" class="svg-text" font-size="11" font-weight="600" fill="var(--green)">改进点</text>
  <text x="316" y="200" text-anchor="middle" class="svg-text-mono" font-size="9">advantage</text>

  <!-- Stats comparison row -->
  <rect x="40" y="240" width="340" height="100" rx="8" fill="var(--bg-card-2)" stroke="var(--border)" stroke-width="1"/>
  <text x="56" y="262" class="svg-text" font-size="11" font-weight="600">指标 1</text>
  <text x="120" y="262" class="svg-text-mono" font-size="10">A: 值 / B: 值</text>
  <text x="56" y="282" class="svg-text" font-size="11" font-weight="600">指标 2</text>
  <text x="120" y="282" class="svg-text-mono" font-size="10">A: 值 / B: 值</text>
  <text x="56" y="302" class="svg-text" font-size="11" font-weight="600">指标 3</text>
  <text x="120" y="302" class="svg-text-mono" font-size="10">A: 值 / B: 值</text>
</svg>
```

## Pattern 5: Trace Table / Top-K Results

For showing retrieval ranking traces or benchmark results.

```html
<svg viewBox="0 0 420 200" role="img" aria-label="top-K trace 表">
  <text x="210" y="22" text-anchor="middle" class="svg-text" font-size="12" font-weight="600">top-K 召回结果</text>

  <rect x="20" y="34" width="380" height="150" rx="8" fill="var(--bg-card-2)" stroke="var(--border)" stroke-width="1"/>

  <!-- Header row -->
  <text x="34" y="54" class="svg-text-mono" font-size="10" fill="var(--text-soft)">rank  speaker     score</text>
  <line x1="34" y1="62" x2="386" y2="62" stroke="var(--border-soft)" stroke-width="1"/>

  <!-- Data rows -->
  <text x="34" y="82" class="svg-text-mono" font-size="11" fill="var(--red)">  1   A           0.8203 ❌</text>
  <text x="34" y="100" class="svg-text-mono" font-size="11" fill="var(--text-dim)">  2   event       0.7493</text>
  <text x="34" y="118" class="svg-text-mono" font-size="11" fill="var(--green)">  3   B           0.7369 ✓ (真源)</text>
  <text x="34" y="136" class="svg-text-mono" font-size="11" fill="var(--text-dim)">  4   C           0.7187</text>
  <text x="34" y="154" class="svg-text-mono" font-size="11" fill="var(--text-dim)">  5   D           0.6534</text>
</svg>
```

## Pattern 6: Timeline / Historical Lineage

For showing chronological development of a concept across years.

```html
<svg viewBox="0 0 420 130" role="img" aria-label="历史时间线">
  <text x="210" y="22" text-anchor="middle" class="svg-text" font-size="13" font-weight="600">历史脉络 · YEAR_A → YEAR_E</text>
  <line x1="40" y1="58" x2="400" y2="58" stroke="var(--text-dim)" stroke-width="2"/>

  <g>
    <circle cx="60" cy="58" r="6" fill="var(--accent)" stroke="var(--accent)" stroke-width="2"/>
    <text x="60" y="46" text-anchor="middle" class="svg-text-mono" font-size="10" fill="var(--accent)">YEAR_A</text>
    <text x="60" y="80" text-anchor="middle" class="svg-text" font-size="10">事件 A</text>
    <text x="60" y="92" text-anchor="middle" class="svg-text-dim" font-size="9">里程碑</text>

    <circle cx="145" cy="58" r="6" fill="var(--accent)" stroke="var(--accent)" stroke-width="2"/>
    <text x="145" y="46" text-anchor="middle" class="svg-text-mono" font-size="10" fill="var(--accent)">YEAR_B</text>
    <text x="145" y="80" text-anchor="middle" class="svg-text" font-size="10">事件 B</text>
    <text x="145" y="92" text-anchor="middle" class="svg-text-dim" font-size="9">里程碑</text>

    <circle cx="230" cy="58" r="6" fill="var(--accent)" stroke="var(--accent)" stroke-width="2"/>
    <text x="230" y="46" text-anchor="middle" class="svg-text-mono" font-size="10" fill="var(--accent)">YEAR_C</text>
    <text x="230" y="80" text-anchor="middle" class="svg-text" font-size="10">事件 C</text>

    <circle cx="315" cy="58" r="6" fill="var(--accent)" stroke="var(--accent)" stroke-width="2"/>
    <text x="315" y="46" text-anchor="middle" class="svg-text-mono" font-size="10" fill="var(--accent)">YEAR_D</text>
    <text x="315" y="80" text-anchor="middle" class="svg-text" font-size="10">事件 D</text>

    <circle cx="385" cy="58" r="8" fill="var(--accent)" stroke="var(--accent)" stroke-width="2"/>
    <text x="385" y="46" text-anchor="middle" class="svg-text-mono" font-size="10" fill="var(--accent)" font-weight="700">YEAR_E</text>
    <text x="385" y="80" text-anchor="middle" class="svg-text" font-size="10" font-weight="600">事件 E</text>
    <text x="385" y="92" text-anchor="middle" class="svg-text-dim" font-size="9">现在</text>
  </g>
</svg>
```

## SVG drawing tips

- **Keep it readable, not pretty**: hand-drawn = readable > visually polished. Don't over-decorate.
- **Use the existing CSS classes**: never hardcode colors like `fill="#aab1bf"` — use `fill="var(--text-dim)"` so light mode works
- **Text alignment**: prefer `text-anchor="middle"` for centered labels · `start` (default) for left-aligned · `end` for right
- **Font sizes**: 13px for titles · 11-12px for body labels · 9-10px for annotations
- **Connecting lines**: use `stroke-dasharray="3 3"` for inferred / dashed relationships · solid for hard arrows
- **Group with `<g>`**: when several shapes share a `transform="translate(x y)"` or styling
- **Avoid `<image>`, `<foreignObject>`, raster effects**: not all browsers handle them well in `file://` mode
- **Add `role="img"` + `aria-label`**: accessibility · screen reader compatibility
