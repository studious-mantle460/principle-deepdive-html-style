# Color Palettes · Hero Gradient Reference

This document lists ready-to-use `--hero-grad` color combinations for the deepdive style. When you produce multiple linked pages, pick a different gradient for each so they stay visually distinct.

## How `--hero-grad` is used

The gradient appears in 4 places automatically (you only set it once in `:root`):

1. **`.brand-icon`** — top-left nav square
2. **`.hero-bg`** — large faded color wash behind hero (8% opacity)
3. **`.principle-num`** — circular badge to the left of every principle title (50×50px · 14px radius)
4. **Implicit cross-references** — used by light mode mapping (see below)

## Recommended gradients

Twelve hand-picked combinations using only the project's semantic colors. Each is visually distinct from the others — when you produce a series of linked pages, pick a different one per page.

| Name | Gradient (dark mode) | Suggested topic |
|---|---|---|
| indigo → purple | `linear-gradient(135deg, #6366f1 0%, #a855f7 100%)` | Foundational / main / overview |
| purple → indigo | `linear-gradient(135deg, #a855f7 0%, #6366f1 100%)` | Cross-disciplinary stacks |
| green → teal | `linear-gradient(135deg, #10b981 0%, #14b8a6 100%)` | Linguistics / narratology / temporal logic |
| amber → red | `linear-gradient(135deg, #f59e0b 0%, #ef4444 100%)` | Systems / OS-inspired / memory hierarchy |
| cyan → teal | `linear-gradient(135deg, #06b6d4 0%, #14b8a6 100%)` | Agents / simulations / generative |
| pink → red | `linear-gradient(135deg, #ec4899 0%, #ef4444 100%)` | Vector databases / knowledge graphs |
| amber → pink | `linear-gradient(135deg, #f59e0b 0%, #ec4899 100%)` | Cognitive psychology / forgetting curves |
| indigo → amber | `linear-gradient(135deg, #6366f1 0%, #f59e0b 100%)` | Engineering / benchmark / problem-solving |
| pink → purple | `linear-gradient(135deg, #ec4899 0%, #a855f7 100%)` | Emotion / cognition / creative |
| teal → indigo | `linear-gradient(135deg, #14b8a6 0%, #6366f1 100%)` | Signal / data flow / networks |
| red → purple | `linear-gradient(135deg, #ef4444 0%, #a855f7 100%)` | Warnings / deep failures / postmortems |
| green → purple | `linear-gradient(135deg, #10b981 0%, #a855f7 100%)` | Ecosystems / synthesis / integration |

## Picking a gradient

Three rules of thumb:

1. **Match the topic emotionally**: indigo (foundational/analytical) vs amber (energy/warning) vs green (calm/balanced) vs red (urgency/danger) vs purple (creative/cognitive)
2. **Don't reuse within a linked series**: if you're producing 3 pages that cross-link, pick 3 different gradients
3. **Test in both themes**: bright gradients can look pastel-washed in light mode (see strategy below)

## Light mode considerations

The gradient itself does **not** auto-darken in light mode. If your dark gradient is very bright (e.g. neon yellow + neon green), the light-mode `.hero-bg` at 8% opacity will look pastel and washed out. Two strategies:

### Strategy 1: Keep the same gradient (simplest)

Just set `--hero-grad` once in `:root` and don't override in `html[data-theme="light"]`. The 8% opacity hero-bg becomes a subtle pastel band — usually looks fine.

### Strategy 2: Provide a darker light-mode gradient

If the dark gradient is too bright for light mode, add an override:

```css
html[data-theme="light"]{
  /* ... other light-mode vars ... */
  --hero-grad: linear-gradient(135deg, #4f46e5 0%, #d97706 100%);  /* slightly darker */
}
```

Strategy 1 (no override) works in 95% of cases. Only use Strategy 2 if a visual check in light mode shows the gradient is illegible against the off-white background.

## Discipline chip colors (separate from hero-grad)

The `.principle-discipline` chips have their own per-class color palette, independent of `--hero-grad`. Pick from these existing semantic mappings — match the topic to an existing class rather than inventing new ones:

| Class | Color | Used for |
|---|---|---|
| `.psychology` | purple | personality / clinical / social psychology |
| `.cogsci` | indigo | cognitive science / memory models / cognition |
| `.signal` | amber | signal processing / filtering / time series |
| `.dl` | green | deep learning / neural networks |
| `.rl` | pink | reinforcement learning / RLHF |
| `.logic` | indigo | logic / temporal / philosophy |
| `.db` | amber | databases / systems / engineering |
| `.linguistics` | purple | linguistics / pragmatics / narratology |

If your topic doesn't map cleanly to any of these, you can add a new class with one of the unused semantic colors (e.g. `.repr` for representation learning · `.pragmatics` for conversational pragmatics · `.narrative` for narratology). See the example below.

```css
/* Adding a new discipline color class */
.principle-discipline.repr{background:var(--primary-bg);color:var(--primary-soft)}
.principle-discipline.pragmatics{background:var(--purple-bg);color:var(--purple)}
.principle-discipline.narrative{background:var(--accent-bg);color:var(--accent-soft)}
```

Always reuse one of the 11 existing semantic colors. Don't introduce a new color hex — that breaks the light-mode mapping.
