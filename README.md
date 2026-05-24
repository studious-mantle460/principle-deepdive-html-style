# Principle Deepdive HTML Style

**English** | [中文](README.zh-CN.md)

> A reusable visual recipe for **single-file analytical HTML articles** — dark/light dual-theme, indigo/amber accents, inline-SVG diagrams, collapsible cards, zero external dependencies, offline-readable under 300KB.

Packaged as an [**agent skill**](https://docs.anthropic.com/en/docs/claude-code/skills) for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) and [Cursor](https://cursor.sh/). Drop it in your agent skill directory and the agent will use it whenever you ask for a "principle deep-dive HTML" / "single-file analytical HTML article" / similar.

---

## What you get

Generate articles that look like this (light + dark mode):

- **Sticky glass nav** with brand icon + section anchors + theme toggle
- **Hero block** with gradient eyebrow + main title + lede + meta chips + responsive stat grid + jump-link TOC
- **Principle sections** in 2-column layout (text + sticky inline-SVG diagram on the right)
- **Citation cards** (📖 prefix · year + author + venue), **essence boxes** (💡 prefix), **framework-use callouts** (🔧 prefix), **disclaim panels** (⚠️ prefix)
- **Collapsible solution cards** (`<details>/<summary>`) with layer-mapping panels, fit ratings, ETA chips
- **Combo / roadmap section** with 3-up step cards and engineering implementation plans
- **Footer** with badge row, cross-link tiles, reference list
- Everything 100% offline — no CDN, no font import, no image asset, no JS framework

Designed for: research notes · framework deep-dives · cross-discipline explainers · technical postmortems · benchmark reports.

Not designed for: marketing landing pages · short index pages · chart-heavy dashboards.

---

## Quick install (one line)

### Linux / macOS

```bash
curl -fsSL https://raw.githubusercontent.com/Misakakuroko/principle-deepdive-html-style/main/install.sh | bash
```

### Windows PowerShell

```powershell
irm https://raw.githubusercontent.com/Misakakuroko/principle-deepdive-html-style/main/install.ps1 | iex
```

Both scripts:

1. Auto-detect whether you have Claude Code (`~/.claude/skills/`) or Cursor (`~/.cursor/skills/`) installed — and install to both if both exist
2. Clone (or update) the skill directory
3. Print confirmation with the install path

To override the install location:

```bash
INSTALL_DIR=~/my-skills/principle-deepdive bash <(curl -fsSL https://raw.githubusercontent.com/Misakakuroko/principle-deepdive-html-style/main/install.sh)
```

### Manual install

```bash
# For Claude Code
git clone https://github.com/Misakakuroko/principle-deepdive-html-style.git ~/.claude/skills/principle-deepdive-html-style

# For Cursor
git clone https://github.com/Misakakuroko/principle-deepdive-html-style.git ~/.cursor/skills/principle-deepdive-html-style
```

Or download the [latest release zip](https://github.com/Misakakuroko/principle-deepdive-html-style/archive/refs/heads/main.zip), extract, rename the folder to `principle-deepdive-html-style`, and drop it in `~/.claude/skills/` or `~/.cursor/skills/`.

---

## Usage

After installation, just ask your agent (Claude Code / Cursor / any agent that reads SKILL.md):

> "Generate a deep-dive HTML article on [topic] in the principle-deepdive style."

The agent will:

1. Read `SKILL.md` (auto-loaded based on the trigger keywords in the description)
2. Pick a color gradient from `color-palettes.md`
3. Copy `template.html` as scaffolding
4. Fill in your topic content using the structural recipes in `content-structure.md`
5. Draw inline SVG diagrams using the cookbook patterns in `svg-patterns.md`

### Trigger phrases

The agent should auto-load this skill when you say any of:

- "principle deep-dive HTML"
- "single-file analytical HTML article"
- "原理深拆 HTML"
- "和 deepdive 同风格"
- "documentation HTML with citations and diagrams"

If your agent doesn't auto-load it, mention the skill name explicitly: `Use the principle-deepdive-html-style skill to...`

---

## File reference

| File | Purpose |
|---|---|
| `SKILL.md` | Main instructions · component contracts · checklist · 186 lines |
| `template.html` | **Copy this verbatim as starting point** · full working scaffold with all CSS + 2 example principles + 2 collapsible solution cards · 725 lines / 38KB |
| `color-palettes.md` | 12 ready-to-use hero gradient combinations · light-mode considerations · discipline chip mapping |
| `content-structure.md` | 7 section-by-section HTML recipes (hero · problem · principle · solution · combo · footer · tooltip) |
| `svg-patterns.md` | 6 reusable inline-SVG diagram patterns (vector space · pipeline · nested · comparison · trace table · timeline) |
| `install.sh` | POSIX one-line installer |
| `install.ps1` | Windows PowerShell one-line installer |
| `LICENSE` | MIT |

---

## What this skill explicitly forbids

- ❌ Tailwind / Bootstrap / Bulma / any CSS framework
- ❌ Chart.js / D3 / Mermaid / Plotly / any chart library
- ❌ Font imports from Google Fonts / Adobe Fonts — system stack only
- ❌ External icon libraries (Font Awesome, Lucide, Heroicons) — emoji or hand-drawn SVG only
- ❌ Image `<img>` tags — pages must be 100% offline-readable as a single file
- ❌ Build steps — output must work directly opened from `file://`
- ❌ React / Vue / any JS framework — vanilla JS only (just theme toggle + smooth scroll)

These constraints are what make the output portable, archive-friendly, and consistent across many agents writing many pages over time. The skill is designed for content density and longevity, not for visual novelty.

---

## Examples / Showcase

> Showcase examples coming soon. If you publish a page generated with this skill, feel free to open a PR adding it to this section.

---

## Why this exists

Modern technical docs sites (Vercel, Linear, Stripe, Notion) have a visual idiom — dark + amber accents, glass nav, mono-font citation chips, inline SVG diagrams — that's instantly recognizable but tedious to reproduce by hand. This skill bottles the idiom into a single template + a small set of structural recipes, so any agent can produce a consistent-looking article in 2-3 hours of work instead of redoing CSS from scratch.

The design constraints (offline, single-file, zero dependencies, < 300KB) come from the use case: long-form analytical content that needs to live in version control alongside code, get rendered straight from `file://`, and stay readable years later without bit-rot from broken CDNs or deprecated libraries.

---

## License

[MIT](LICENSE) — use it freely in any project, commercial or personal, attribution appreciated but not required.

---

## Contributing

Pull requests welcome. Likely useful additions:

- More color palette combinations
- More SVG diagram patterns (e.g. tree / graph / matrix visualizations)
- More content recipes (e.g. comparison table · changelog · FAQ)
- Translation of `SKILL.md` body to other languages (the frontmatter `description` should stay English so it's picked up by English-trained agents)

Please keep changes consistent with the design philosophy: **no external dependencies**, **single-file output**, **system font stack**, **inline SVG only**.
