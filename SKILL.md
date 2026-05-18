---
name: principle-deepdive-html-style
description: Generate a single-file deep-dive HTML article in the "principle-deepdive" visual style — dark/light dual-theme, indigo/amber accent palette, inline-SVG hand-drawn diagrams, collapsible cards, citation panels, sticky glass nav, zero external dependencies, offline-readable under 300KB. Use when authoring a long-form analytical HTML article that walks through a topic principle-by-principle with academic citations and visualizations, when the user asks for "principle deep-dive HTML" / "single-file analytical HTML" / "documentation HTML in deepdive style", or when migrating a markdown research note into a polished standalone HTML page.
---

# Principle Deepdive HTML Style

A reusable visual recipe for **single-file HTML articles** that explain a topic principle-by-principle with academic citations and inline-SVG visualizations. Designed for long-form analytical content — research notes, framework deep dives, cross-discipline explainers, technical postmortems — that needs to be readable offline and visually polished without any build pipeline.

## Visual identity at a glance

- **Theme**: dark default + light toggle · `localStorage` persisted
- **Palette tokens**: indigo `--primary` + amber `--accent` + 9 semantic colors · each with `-soft` and `-bg` (alpha) variants
- **Layout**: max-width 1200px · `clamp()` responsive typography · CSS grid auto-fit
- **Hero**: gradient eyebrow chip + h1 + lede + meta chips + optional stat grid + principle-toc grid
- **Each principle**: discipline chip + numbered badge + title + tagline + two-column body (text 1.05 · visual 1) · visual is `position:sticky`
- **Cards**: collapsible `<details>/<summary>` for solution cards · citation panels with `📖` prefix · essence boxes with `💡` prefix
- **SVG diagrams**: hand-drawn inline · no charting library · `<rect>+<circle>+<text>+marker-end` only
- **Constraints**: 0 external CDN / 0 npm / 0 image asset · pure inline CSS+JS+SVG · **file size < 300KB**

## When to apply

Apply this skill whenever **any** of the following is true:

- User wants a long-form analytical HTML article (research note · framework breakdown · cross-discipline explainer · postmortem · benchmark report) presented as a single self-contained file
- User says "principle deep-dive HTML" / "deepdive style" / "原理深拆 HTML" / "single-file analytical HTML" / "和现有 deepdive 同风格" (or similar referring to the visual pattern)
- Migrating an existing markdown research note into a polished standalone HTML page with consistent visual language
- A documentation page would benefit from the dark/light toggle + citation cards + inline SVG visuals combination

Do **not** apply for:

- Short presentation-style index pages (use a different layout — this skill is for content-dense articles with 3-7 principle sections)
- Pages that need charting libraries (Chart.js, D3, etc.) — this skill explicitly forbids external deps
- Pages that need server-side rendering or React/Vue mounting
- Marketing landing pages (different design conventions apply)

## Output convention

| Aspect | Value |
|---|---|
| File location | Single `.html` file in the user's chosen directory |
| File size | Aim **< 150KB** · hard cap **< 300KB** |
| Dependencies | **0 external** (no CDN / no font import / no image / no library) |
| Theme support | Both dark and light · toggle button in nav · `localStorage` key (configurable) |
| Font stack | `'PingFang SC','Hiragino Sans GB','Microsoft YaHei','Noto Sans CJK SC',-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif` (covers CJK + Latin with no fallback gap) |
| Mono font | `ui-monospace,SFMono-Regular,Menlo,Consolas,'Liberation Mono',monospace` |
| Language attr | Set `<html lang="...">` to match content language |

## 3-step workflow

### Step 1: Pick a hero gradient palette

The `--hero-grad` CSS variable defines the page's signature color, used in the brand icon, hero background wash, and principle number badges. See [color-palettes.md](color-palettes.md) for ready-to-use color combinations.

The gradient appears in 4 places automatically (you only set it once): `brand-icon` background · `hero-bg` decorative band · `principle-num` badge · `principle-toc a:hover` border.

### Step 2: Copy template.html as scaffolding

Copy [template.html](template.html) verbatim to your target path.

The template is a fully working skeleton with:

- Full `:root` CSS variables (dark + light) — **do not modify variable names**, only swap the `--hero-grad` line and accent-mapping if needed
- All component classes (`.hero`, `.principle`, `.sol-card`, `.citation`, `.essence-box`, `.framework-use`, etc.) — **do not rename**, the visual contract depends on consistent class names if you produce multiple linked pages
- A complete nav + hero + 2 example principle sections + 2 example collapsible solution cards + footer
- Working theme-toggle script
- SVG `<defs>` block with shared arrow markers

### Step 3: Fill in content per the structure recipe

The content structure for a standard deepdive follows this skeleton:

```
nav (sticky · brand-icon + topic-name + section anchors + optional back-link + theme-toggle)
hero (eyebrow chip + h1 + lede + meta chips + optional stat grid + principle-toc grid)
[optional] problem-statement section (if the deepdive frames a specific failure/limitation)
principle 1 (discipline + title + tagline + body grid: text-side + visual-side SVG)
principle 2 (...)
principle 3+ (...)
[optional] solutions section (collapsible card grid · each card with citation + layer-mapping)
[optional] combo/roadmap section (recommendation block + step cards + framing box)
footer (badge row + cross-link prev/next + data-source + reference list)
```

For each principle section, every card type has a fixed recipe — see [content-structure.md](content-structure.md).

For each SVG diagram, pick from the cookbook patterns in [svg-patterns.md](svg-patterns.md) (vector/embedding space · flow diagram · nested structure · comparison columns · trace table · timeline). All patterns use the shared `--svg-text` / `--svg-node` CSS classes already defined in template.html.

## Component contracts (do not rename)

These class names form the visual contract of the style. If you produce multiple linked deepdive pages, downstream agents that read them expect these classes to exist with consistent semantics:

| Class | Semantic role | Always contains |
|---|---|---|
| `.nav` + `.nav-inner` + `.brand` + `.nav-links` | Sticky glass nav bar | brand-icon + section anchor links + optional back-link button + theme-toggle button |
| `.hero` + `.hero-bg` + `.hero-eyebrow` + `.hero h1` + `.lede` | Header block | eyebrow tag + main title + max-820px lede + meta chips |
| `.hero-meta .chip` | Inline metadata chip | mono font · 4×10px padding · key + value |
| `.principle-toc` | Jump grid in hero | each tile has toc-num + toc-name + toc-discipline |
| `section.principle` | Each major section | scroll-margin-top 80px · border-top 1px |
| `.principle-num` | Big numbered badge | `var(--hero-grad)` background · 50×50 · 14px radius |
| `.principle-discipline` | Subject label | mono uppercase · semantic color class |
| `.principle-body` | Two-column layout | grid 1.05fr 1fr · collapses to 1col below 960px |
| `.essence-box` | "💡 一句话精髓" callout | accent-bg gradient · left-border accent · `::before` emoji |
| `.citation` | Academic citation card | mono · bg-soft · `📖` prefix · `.year` accent · `.author` text |
| `.apply-list` | "真实应用" examples list | bg-card-2 · `<h4>` uppercase title · `<ul>` |
| `.framework-use` | "🔧 这一层怎么用" callout | primary-bg gradient · left-border primary · emoji prefix |
| `.principle-visual` | Right-column SVG holder | bg-soft · position:sticky · `<svg viewBox>` + `.visual-caption` below |
| `.disclaim` | "⚠️ cite 提示" panel | yellow-bg · 1px yellow border |
| `.sol-grid` + `.sol-card` (collapsible) | Solution cards | `<details>` · summary has num+name+meta · body has citation+layer-map |
| `.layer-map` + `.layer-tag` | Solution → Layer mapping | bg-card-2 panel · color-coded tags |
| `.combo-grid` + `.combo-card` | 3-up recommendation strip | accent top stripe · step number + name + file refs |
| `.framing-box` | "🎯 立场说明" position statement | gradient bg · accent border · emoji prefix |
| `.footer` + `.footer .nav-prev-next` + `.footer .badge` | Closing footer | badge row + cross-link tiles + reference list |

## Style ingredients (the "why it looks good" checklist)

These are non-negotiable for series consistency:

- **CSS custom properties for everything color-related**: use `var(--text-soft)` not `#aab1bf` — this is what makes light/dark toggle work
- **Mono font for citations / chips / labels**: `font-family:var(--mono)` immediately reads as "engineering/academic"
- **Uppercase + letter-spacing 0.04-0.08em**: for eyebrows / section-num / discipline chips
- **`::before` emoji prefix for callouts**: `💡` essence · `📖` citation · `🔧` framework-use · `⚠️` disclaim · `🎯` framing — *do not skip the emoji, it's part of the visual language*
- **gradient hero-bg with 0.08 opacity + rounded-bottom mask**: subtle color wash behind h1
- **`backdrop-filter:blur(10px)` glass nav**: paired with `rgba(11,13,18,.85)` background
- **hover micro-animation**: `transform:translateY(-2px)` + `border-color` change on cards · 0.15s transition
- **`clamp(28px,4.2vw,42px)` responsive h1**: replaces media queries for headings
- **`grid-template-columns:repeat(auto-fit,minmax(220px,1fr))`**: auto-stacking card grids
- **Inline SVG visuals on the right, sticky**: `position:sticky; top:80px;` so the diagram scrolls with the text it explains
- **No external image / icon font**: all glyphs are emoji (rendered by system) or hand-drawn SVG

## What this skill explicitly forbids

- ❌ Tailwind / Bootstrap / Bulma / any CSS framework
- ❌ Chart.js / D3 / Mermaid / Plotly / any chart library
- ❌ Font imports from Google Fonts / Adobe Fonts — system stack only
- ❌ External icon libraries (Font Awesome, Lucide, Heroicons) — emoji or hand-drawn SVG only
- ❌ Image `<img>` tags — pages must be 100% offline-readable as a single file
- ❌ Build steps — output must work directly opened from `file://`
- ❌ React / Vue / any JS framework — vanilla JS only, minimal (just theme toggle + smooth scroll)
- ❌ Windows-style paths in any reference (`scripts\foo.py` wrong · `scripts/foo.py` right)

## Quick-verify checklist (run before declaring done)

- [ ] File size under 150KB (target) / 300KB (hard cap)
- [ ] `<html lang="...">` set to the content language
- [ ] All `var(--*)` references resolve in both `:root` and `html[data-theme="light"]`
- [ ] No `http://` / `https://` resource URLs in `<head>` (only in `<a href>` for citations)
- [ ] Theme-toggle button works (test by clicking it once in a browser preview)
- [ ] At least one `<svg viewBox>` exists per principle section (hand-drawn, not exported)
- [ ] Footer has reference list with arXiv ID / DOI / year for every cited work
- [ ] Linter passes with 0 errors
- [ ] All `class` names match the contract table above (do not invent new core class names)

## Reference files

For detailed material, read these supporting files only when needed:

- **[template.html](template.html)** — Full working scaffold. **Copy this verbatim as starting point.** Contains all CSS variables, all component classes, working JS, sample structure for 2 principle sections + 2 collapsible solution cards.
- **[color-palettes.md](color-palettes.md)** — Ready-to-use `--hero-grad` color combinations · how to pick · light-mode considerations.
- **[svg-patterns.md](svg-patterns.md)** — 6 reusable inline-SVG diagram patterns (vector space · flow · nested · comparison · trace table · timeline) with copy-paste blocks.
- **[content-structure.md](content-structure.md)** — Section-by-section structural recipes (hero / problem-statement / principle / solution / combo / footer) with HTML blocks.

## Common mistakes (avoid)

1. **Renaming core class names** — `.essence-box` is `.essence-box` everywhere. Don't rename it to `.insight-box` "to be more descriptive". The visual contract depends on consistent names.

2. **Skipping the emoji prefix** in callouts — `::before { content:"💡 ..."` is part of the visual language. Removing the emoji makes the page look generic.

3. **Inventing new color tokens** — use the existing 11 semantic colors (primary/accent/green/yellow/red/purple/teal/pink/gray + text/bg). Adding `--orange` breaks the light-mode mapping.

4. **Importing fonts** — `@import url(https://fonts...)` violates the offline constraint. The system font stack is sufficient for both CJK and Latin scripts.

5. **Using `<img>` for diagrams** — even SVG images must be inline `<svg>...</svg>`, not `<img src="diagram.svg">`. The single-file constraint is hard.

6. **Forgetting `scroll-margin-top: 80px` on sections** — sticky nav covers the anchor target without it. The class `section.principle` already includes this; don't strip it.

7. **Writing 1500-line CSS from scratch** — that's what `template.html` is for. Copy it. Only edit it if a new component genuinely doesn't fit any existing class.
