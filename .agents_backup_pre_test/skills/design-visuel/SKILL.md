---
name: design-visuel
description: >
  Skill design obligatoire pour tout site web. S'active après le brainstorming/SEO
  et avant le git-worktree. Scrape l'inspiration (supahero.io, Dribbble, Awwwards,
  concurrents), définit la direction esthétique, crée le design system (tokens CSS,
  typo, palette), génère les assets visuels (images hero, icônes SVG), et valide
  le tout avant implémentation. Interdit les emojis comme icônes, les polices
  génériques (Inter/Roboto/Arial), et les designs "AI slop".
  Fusionne anthropics/frontend-design, mblode/agent-skills, vercel/web-design-guidelines.
---

# Design Visuel — Skill Design Obligatoire pour Tout Site Web

Chaque site construit via ce workspace **DOIT** passer par ce skill design.
Il produit un design distinctif, mémorable, et humain — jamais générique.

## 🚨 RÈGLE ABSOLUE

**Ce skill s'active AUTOMATIQUEMENT pour tout projet web.**
Il se déclenche entre le SEO (1.5) et le git-worktree (2) dans le workflow basic.

Triggers : "site web", "website", "landing page", "page", "HTML", "construire un site",
"créer un site", "refonte", "redesign", tout projet impliquant du HTML/CSS/JS.

---

## Process en 5 Étapes (Obligatoire)

### Étape 1 — Recherche d'Inspiration
**Sous-skill : `sub-skills/design-inspiration/SKILL.md`**

Avant de toucher au design :
1. **Browser supahero.io** — chercher des hero sections pertinentes au secteur client
2. **Browser Dribbble/Awwwards** — chercher le type de site (landing, SaaS, local service, etc.)
3. **Analyser visuellement le concurrent #1** — celui déjà identifié par le skill SEO
4. **Capturer 3 screenshots** minimum des meilleures références
5. **Documenter** dans `docs/plans/DESIGN-INSPIRATION.md`

### Étape 2 — Direction Esthétique
**Sous-skill : `sub-skills/design-aesthetics/SKILL.md`**

Choisir UNE direction forte et distinctive :
- **Tone** : minimaliste brutal, maximaliste, rétro-futuriste, organique, luxe, editorial,
  brutaliste, art déco, soft/pastel, industriel, utilitaire...
- **Signature** : quel est l'élément mémorable que le visiteur retiendra ?
- **Mood** : clair, sombre, ou teinté ? Chaud ou froid ?

**INTERDICTIONS AI SLOP** — Voir `references/anti-patterns.md`

### Étape 3 — Design System (Tokens)
**Sous-skill : `sub-skills/design-system/SKILL.md`**

Définir les tokens CSS avant de coder :
- **Palette** : 5-7 couleurs HSL avec CSS variables
- **Typographie** : police display + body depuis Google Fonts (JAMAIS Inter/Roboto/Arial)
- **Spacing** : grille 4px
- **Radius** : un seul système cohérent partout
- **Shadows** : une seule stratégie (borders-only, subtle, layered, ou tint)

### Étape 4 — Assets Visuels
**Sous-skill : `sub-skills/design-icons-images/SKILL.md`**

Générer ou sourcer les visuels :
- **Images hero** : utiliser `generate_image` avec prompts contextuels au secteur
- **Icônes** : SVG inline depuis Phosphor/Tabler/Heroicons/Lucide — **JAMAIS d'emojis**
- **Illustrations** : SVG décoratifs codés ou générés
- **Photos** : Unsplash pour lifestyle, `generate_image` pour custom

### Étape 5 — Validation Design
**Sous-skill : `sub-skills/design-audit/SKILL.md`**

Avant le merge/release :
- Audit visuel via `browser_subagent` avec screenshots
- Checklist accessibilité (contraste, hit targets, focus visible)
- Vérification cohérence design system
- Rapport avec fixes concrètes

---

## Quick Reference — Sous-Skills

| Sous-skill | Ce que ça fait | Fichier |
|------------|---------------|---------|
| design-inspiration | Scrape inspi (supahero, Dribbble, Awwwards, concurrents) | `sub-skills/design-inspiration/SKILL.md` |
| design-system | Tokens CSS, palettes, typographies | `sub-skills/design-system/SKILL.md` |
| design-aesthetics | Direction esthétique, anti-patterns AI slop | `sub-skills/design-aesthetics/SKILL.md` |
| design-icons-images | SVG icônes, banque images, generate_image | `sub-skills/design-icons-images/SKILL.md` |
| design-animation | Motion guidelines, easing, timing | `sub-skills/design-animation/SKILL.md` |
| design-hero | Hero sections patterns et templates | `sub-skills/design-hero/SKILL.md` |
| design-audit | QA visuelle finale, accessibilité | `sub-skills/design-audit/SKILL.md` |

## Références (charger à la demande)

- `references/inspiration-sources.md` — Sources d'inspiration curées
- `references/anti-patterns.md` — Tout ce qui est INTERDIT
- `references/icon-libraries.md` — Bibliothèques d'icônes SVG + CDN

## Philosophie

> **Delete aggressively; clarity over decoration.**
> **Restraint plus hierarchy beats noise.**
> **Distinctive, contextual, refined, and memorable.**

### Sites de référence pour la qualité visuelle
Linear, Stripe, Notion, Raycast, ElevenLabs, Zed, Vercel, Arc Browser

### Sources :
- [anthropics/frontend-design](https://github.com/anthropics/skills/tree/main/skills/frontend-design)
- [mblode/agent-skills](https://github.com/mblode/agent-skills)
- [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills)
- [supahero.io](https://supahero.io/)
