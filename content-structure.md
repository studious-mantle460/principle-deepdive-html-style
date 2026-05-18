# Content Structure Recipes

Section-by-section HTML structure for the standard deepdive layout. Each recipe is **copy-paste ready** — paste into the `<main>` of `template.html` and fill in the TODO placeholders.

## Section order

The canonical order:

```
nav  (sticky · always present)
↓
hero  (always present)
↓
[optional] problem-statement section  (only if the article frames a specific failure/limitation)
↓
principle 1  (required · at least 1)
principle 2  (recommended · 2-5 principles total)
principle 3+
↓
[optional] solutions section  (if there are concrete fixes/methods to present)
↓
[optional] combo / roadmap section  (if there is a recommended engineering combination)
↓
[optional] stack-overview section  (if the article culminates in a final synthesis diagram)
↓
footer  (always present)
```

A minimum deepdive has: nav + hero + 2-3 principles + footer. Everything else is opt-in based on the topic.

## Recipe 1: Hero with full chrome (most common)

```html
<header class="hero">
  <div class="hero-bg"></div>
  <div class="hero-content">
    <span class="hero-eyebrow">EYEBROW · subtopic / project association</span>
    <h1>Main title <small>· subtitle</small></h1>
    <p class="lede">
      One lede paragraph · max 820px · explains what this page covers · with <strong>cross-disciplinary keywords</strong> · lists <strong>core conclusions or engineering implications</strong>. About 100-160 chars.
    </p>

    <div class="hero-meta">
      <span class="chip"><strong>论文</strong> <a href="https://arxiv.org/abs/TODO" target="_blank" rel="noopener">arXiv TODO</a></span>
      <span class="chip"><strong>团队</strong> TODO</span>
      <span class="chip"><strong>基座</strong> TODO</span>
      <span class="chip"><strong>训练</strong> TODO</span>
    </div>

    <div class="principle-toc">
      <a href="#p1">
        <span class="toc-num">PRINCIPLE 01</span>
        <span class="toc-name">原理一</span>
        <span class="toc-discipline">学科 · 年份</span>
      </a>
      <!-- 重复每个 principle -->
    </div>
  </div>
</header>
```

## Recipe 2: Hero with stat grid (presentation/benchmark style)

When the deepdive frames around concrete numbers (benchmark results, ablation, metrics):

```html
<header class="hero">
  <div class="hero-bg"></div>
  <div class="hero-content">
    <span class="hero-eyebrow">EYEBROW · benchmark / problem framing</span>
    <h1>主标题<br><small>· 副标题</small></h1>
    <p class="lede">...</p>

    <div class="hero-meta">...</div>

    <div class="hero-stat-grid">
      <div class="hero-stat">
        <div class="hero-stat-label">实测值</div>
        <div class="hero-stat-value bad">50.00%</div>
        <div class="hero-stat-sub">vs target ≥85% · gap 35pp</div>
      </div>
      <div class="hero-stat">
        <div class="hero-stat-label">命中数</div>
        <div class="hero-stat-value">5 / 10</div>
        <div class="hero-stat-sub">说明</div>
      </div>
      <!-- 重复 2-4 张卡 -->
    </div>

    <div class="framing-box">
      🎯 立场说明 · 本页讨论的是<strong>已知 X limitation</strong> · 不是<strong>Y 失败</strong> · 学界 2024-2025 已经...
    </div>

    <div class="principle-toc">...</div>
  </div>
</header>
```

## Recipe 3: Problem statement section (optional · between hero and principles)

When the deepdive frames around a specific concrete problem:

```html
<section class="principle" id="problem">
  <div class="principle-head">
    <span class="principle-num">⓪</span>
    <div class="principle-head-text">
      <span class="principle-discipline" style="background:var(--red-bg);color:var(--red)">SECTION 01 · 问题陈述</span>
      <h2 class="principle-title">问题标题 · 真数字</h2>
      <p class="principle-tagline">tagline · 数据来源 + 失败 mode 分布</p>
    </div>
  </div>

  <!-- 4-up 数据卡（参考 .problem-grid · 自定义） -->
  <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:14px;margin-bottom:24px">
    <div style="background:var(--bg-card);border:1px solid var(--border);border-radius:var(--radius);padding:18px 20px">
      <div style="font-size:11px;color:var(--text-dim);letter-spacing:.06em;text-transform:uppercase;font-weight:600;margin-bottom:6px">标签</div>
      <div style="font-size:24px;font-weight:700;color:var(--accent-soft);font-family:var(--mono);line-height:1.1">50% / 50%</div>
      <div style="font-size:12px;color:var(--text-soft);margin-top:6px">副注</div>
    </div>
    <!-- 重复 -->
  </div>

  <div class="essence-box">
    <strong>核心 finding</strong>：一句话总结这个数据揭露了什么。
  </div>
</section>
```

## Recipe 4: Standard principle section (the core building block)

```html
<section class="principle" id="p1">
  <div class="principle-head">
    <span class="principle-num">①</span>
    <div class="principle-head-text">
      <span class="principle-discipline cogsci">学科中文 / Discipline EN</span>
      <h2 class="principle-title">原理标题</h2>
      <p class="principle-tagline">一句 tagline</p>
    </div>
  </div>

  <div class="principle-body">
    <div class="principle-text">
      <div class="essence-box">
        一句话精髓 · 用 <strong>strong</strong> 包关键术语。
      </div>

      <h3>历史脉络 · 子标题</h3>
      <p>1-2 段总述...</p>

      <div class="citation">
        <span class="year">YEAR</span> <span class="author">Author</span>：<em>Title.</em> Venue · 简短介绍。
      </div>
      <div class="citation">
        <span class="year">YEAR</span> <span class="author">Author</span>：<em>Title.</em> (<a href="https://arxiv.org/abs/TODO" target="_blank" rel="noopener">arXiv TODO</a>) · 关键 backing。
      </div>

      <h3>真实应用例子</h3>
      <div class="apply-list">
        <h4>应用领域</h4>
        <ul>
          <li><strong>领域 A</strong>：案例</li>
          <li><strong>领域 B</strong>：案例</li>
        </ul>
      </div>

      <div class="framework-use">
        这条原理在工程栈里怎么用 · 改了哪个 file · 改成什么样。
      </div>

      <div class="disclaim">
        <strong>cite 提示</strong>：论文状态备注（preprint / 出版状态）。
      </div>
    </div>

    <div class="principle-visual">
      <!-- 复制 svg-patterns.md 里某个模式 · 填入数据 -->
      <svg viewBox="0 0 420 400" role="img" aria-label="图示意">
        <!-- ... -->
      </svg>
      <div class="visual-caption">图说明 · 1 行 italic</div>
    </div>
  </div>
</section>
```

## Recipe 5: Solution card (collapsible · in a `.sol-grid`)

For when there are concrete methods/fixes to present (often after the principles section).

```html
<section class="principle" id="solutions">
  <div class="principle-head">
    <span class="principle-num">②</span>
    <div class="principle-head-text">
      <span class="principle-discipline" style="background:var(--green-bg);color:var(--green)">SECTION · SOLUTIONS</span>
      <h2 class="principle-title">N 个 solutions · 原理 + 适合度 + 工时</h2>
      <p class="principle-tagline">简短 tagline</p>
    </div>
  </div>

  <div class="sol-grid">

    <!-- data-fit: "3" 绿 ⭐⭐⭐ · "2" 黄 ⭐⭐ · "1" 灰 ⭐ -->
    <details class="sol-card" data-fit="3" open>
      <summary>
        <span class="sol-num">①</span>
        <div class="sol-head-text">
          <h3 class="sol-name">Solution 名称 <small>(论文 venue · 年份)</small></h3>
          <p class="sol-tagline">一句话讲它是什么 · 怎么解决问题。</p>
        </div>
        <div class="sol-meta">
          <span class="chip fit3">⭐⭐⭐ 适合</span>
          <span class="chip eta">1-2h</span>
          <span class="chip">直接解 LX</span>
        </div>
      </summary>
      <div class="sol-body">
        <p>详细解释...</p>

        <div class="citation">
          <span class="year">YEAR</span> <span class="author">Authors</span>：<em>Title.</em> Venue (<a href="...">arXiv</a>)
        </div>

        <h4>核心机制</h4>
        <p>工作原理。</p>

        <h4>对 N 层 limitation 的映射</h4>
        <div class="layer-map">
          <p><span class="layer-tag">L1 ✓</span>主要解</p>
          <p><span class="layer-tag l2">L2 ✓</span>主要解</p>
          <p><span class="layer-tag l3">L3 半解</span>部分解</p>
        </div>

        <h4>工程实施 mini-plan</h4>
        <ul>
          <li>新增 <code>scripts/X.py</code></li>
          <li>预期效果 · 数字</li>
        </ul>
      </div>
    </details>

    <!-- 重复 N 张 -->

  </div>
</section>
```

## Recipe 6: Combo / Roadmap section

When the deepdive ends with a recommended engineering combination:

```html
<section class="principle" id="combo">
  <div class="principle-head">
    <span class="principle-num">③</span>
    <div class="principle-head-text">
      <span class="principle-discipline" style="background:var(--pink-bg);color:var(--pink)">SECTION · RECOMMENDED</span>
      <h2 class="principle-title">三件套 · 总 X-Yh · 把 50% 推到 ~85%</h2>
      <p class="principle-tagline">三步流水线 · 每步解一个 layer · 互补不冲突。</p>
    </div>
  </div>

  <div class="essence-box">
    <strong>核心组合逻辑</strong>·一句话讲三件套怎么互补。
  </div>

  <div class="combo-grid">
    <div class="combo-card">
      <div class="combo-step">step 1 · 1-2h</div>
      <h4>步骤一</h4>
      <p>描述</p>
      <p style="margin-top:10px"><span class="combo-file">scripts/foo.py</span> (新建)</p>
      <p><span class="combo-file">scripts/bar.py</span> (加 hook)</p>
    </div>
    <div class="combo-card">...</div>
    <div class="combo-card">...</div>
  </div>

  <div class="roadmap-box">
    <h3>工程实施 roadmap · X-Yh 全闭环</h3>
    <p>按依赖顺序实施 · 每步独立可验证 · 不互相阻塞：</p>
    <ol>
      <li><strong>Step 1 · 最易 · 1-2h</strong>——TODO</li>
      <li><strong>Step 2 · 中等 · 1-2h</strong>——TODO</li>
      <li><strong>Step 3 · 最难 · 2-3h</strong>——TODO</li>
      <li><strong>Step 4 · 重新验证</strong>——跑 benchmark · 看新数字</li>
    </ol>
    <p style="margin-top:14px">
      <strong>预期增益</strong>·step 1 单独 +X-Ypp · step 1+2 +Z-Wpp · 全套 50% → 80-85%。
    </p>
  </div>

  <div class="disclaim">
    <strong>为什么不上 X / Y</strong>·TODO scope 解释。
  </div>
</section>
```

## Recipe 7: Footer

```html
<footer class="footer">
  <p>页面标题 · 副标题（内部使用 · 非公开发布）</p>
  <p>
    <span class="badge">关键标签 1</span>
    <span class="badge">关键标签 2</span>
    <span class="badge">关键标签 3</span>
  </p>
  <div class="nav-prev-next">
    <a href="../index.html">🏠 Home</a>
    <a href="../survey.html">📚 Related survey</a>
    <a href="adjacent-deepdive.html">Adjacent deepdive →</a>
  </div>
  <p style="margin-top:18px;color:var(--text-dim);font-size:12px;line-height:1.75">
    Data sources · TODO list specific files / databases / notes / commits consulted<br>
    Reference list · TODO complete bibliography (each entry with arXiv ID / DOI / year)
  </p>
</footer>
```

## Inline term tooltip (optional · sprinkled throughout)

For inline jargon that benefits from a hover tooltip:

```html
<span class="term" data-tip="把文字转成定长数字向量·两段意思相近的文字向量距离近。bge-m3 是 BAAI 出的多语言 embedding · 1024 维 · 中文优化。">Embedding 模型</span>
```

The dotted underline + hover popup is part of the visual language. Use sparingly (3-8 terms per article) for the most important domain-specific terms.

## When to use which `.principle-discipline` class

Existing semantic chip classes (defined in `template.html`):

| Class | Topic | Color |
|---|---|---|
| `.psychology` | 人格 / 临床 / 社会心理学 | purple |
| `.cogsci` | 认知科学 / 记忆模型 | indigo |
| `.signal` | 信号处理 / 时序 / 滤波 | amber |
| `.dl` | 深度学习 / 神经网络 | green |
| `.rl` | 强化学习 / RLHF / GRPO | pink |
| `.logic` | 逻辑 / 时态 / 哲学 | indigo |
| `.db` | 数据库 / 系统工程 | amber |
| `.linguistics` | 语言学 / 语用学 / 叙事学 | purple |

If the topic doesn't match any existing class, add one with a fresh semantic name (e.g. `.repr` for representation learning · `.pragmatics` for conversational pragmatics · `.narrative` for narratology). Reuse one of the 11 existing semantic colors — don't introduce a new hex value, since that breaks the light-mode mapping.

Example of adding new discipline color classes:

```css
.principle-discipline.repr{background:var(--primary-bg);color:var(--primary-soft)}
.principle-discipline.pragmatics{background:var(--purple-bg);color:var(--purple)}
.principle-discipline.narrative{background:var(--accent-bg);color:var(--accent-soft)}
.principle-discipline.solutions{background:var(--green-bg);color:var(--green)}
.principle-discipline.combo{background:var(--pink-bg);color:var(--pink)}
.principle-discipline.problem{background:var(--red-bg);color:var(--red)}
```
