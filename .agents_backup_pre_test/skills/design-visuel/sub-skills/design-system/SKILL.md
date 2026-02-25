---
name: design-system
description: >
  Définit le design system complet (tokens CSS) avant toute implémentation.
  Palette de couleurs HSL, système typographique distinctif, grille spacing 4px,
  radius cohérent, stratégie d'ombres. Tout en CSS variables.
---

# Design System — Tokens CSS

## Objectif

Définir TOUS les tokens de design avant d'écrire le moindre composant.
Le design system est le socle de la cohérence visuelle.

## Process

### 1. Palette de couleurs

Créer une palette de 5-7 couleurs en HSL avec CSS variables :

```css
:root {
  /* Couleurs principales */
  --color-primary-h: ;
  --color-primary-s: ;
  --color-primary-l: ;
  --color-primary: hsl(var(--color-primary-h) var(--color-primary-s) var(--color-primary-l));

  /* Surface / Background */
  --color-surface: ;
  --color-surface-raised: ;
  --color-surface-overlay: ;

  /* Texte */
  --color-text-primary: ;
  --color-text-secondary: ;
  --color-text-muted: ;

  /* Accent */
  --color-accent: ;

  /* Neutral */
  --color-border: ;
  --color-border-subtle: ;
}
```

**Règles palette :**
- JAMAIS de noir pur (`#000`) ni blanc pur (`#fff`) — utiliser des teintes
- Une couleur dominante avec un accent fort qui POP
- Tester le contraste WCAG AA minimum (4.5:1 texte, 3:1 grands éléments)
- HSL permet de créer des variantes facilement (+/- lightness)

### 2. Typographie

Choisir des polices **distinctives** depuis Google Fonts :

```css
:root {
  --font-display: 'Outfit', sans-serif;     /* Titres — exemples : Outfit, Space Grotesk, Sora, Bricolage Grotesque, DM Serif Display */
  --font-body: 'Source Sans 3', sans-serif;  /* Corps — exemples : Source Sans 3, Nunito Sans, Lora, Libre Baskerville */
  --font-mono: 'JetBrains Mono', monospace;  /* Code/données — optionnel */

  /* Échelle typographique */
  --text-xs: clamp(0.75rem, 0.7rem + 0.25vw, 0.8rem);
  --text-sm: clamp(0.875rem, 0.8rem + 0.35vw, 0.95rem);
  --text-base: clamp(1rem, 0.9rem + 0.5vw, 1.125rem);
  --text-lg: clamp(1.125rem, 1rem + 0.6vw, 1.3rem);
  --text-xl: clamp(1.25rem, 1.1rem + 0.75vw, 1.5rem);
  --text-2xl: clamp(1.5rem, 1.2rem + 1.5vw, 2rem);
  --text-3xl: clamp(2rem, 1.5rem + 2.5vw, 3rem);
  --text-4xl: clamp(2.5rem, 1.8rem + 3.5vw, 4rem);

  /* Line-heights */
  --leading-tight: 1.15;
  --leading-normal: 1.5;
  --leading-relaxed: 1.7;

  /* Font weights */
  --weight-regular: 400;
  --weight-medium: 500;
  --weight-semibold: 600;
  --weight-bold: 700;
}
```

**POLICES INTERDITES** (AI slop) :
- ❌ Inter, Roboto, Arial, Helvetica, system-ui, sans-serif seul
- ❌ Open Sans (trop commun)
- ❌ Poppins (surexploité par l'IA)

**Sources pour choisir :**
- [Typewolf](https://www.typewolf.com/) — classements et inspiration
- [Fonts In Use](https://fontsinuse.com/) — polices en contexte réel
- Google Fonts filtrées par popularité faible + qualité haute

### 3. Spacing (grille 4px)

```css
:root {
  --space-1: 0.25rem;  /* 4px */
  --space-2: 0.5rem;   /* 8px */
  --space-3: 0.75rem;  /* 12px */
  --space-4: 1rem;     /* 16px */
  --space-5: 1.25rem;  /* 20px */
  --space-6: 1.5rem;   /* 24px */
  --space-8: 2rem;     /* 32px */
  --space-10: 2.5rem;  /* 40px */
  --space-12: 3rem;    /* 48px */
  --space-16: 4rem;    /* 64px */
  --space-20: 5rem;    /* 80px */
  --space-24: 6rem;    /* 96px */
  --space-32: 8rem;    /* 128px */
}
```

### 4. Borders & Radius

```css
:root {
  --radius-sm: 0.25rem;   /* 4px — chips, tags */
  --radius-md: 0.5rem;    /* 8px — boutons, inputs */
  --radius-lg: 0.75rem;   /* 12px — cards */
  --radius-xl: 1rem;      /* 16px — modals, sections */
  --radius-full: 9999px;  /* pills */
}
```

**UN SEUL système de radius par projet.** Pas de radii aléatoires.

### 5. Ombres & Profondeur

Choisir UNE stratégie :
- **Borders-only** : séparation par bordures, pas d'ombres (minimaliste)
- **Subtle shadow** : ombres légères, presque imperceptibles (Stripe-like)
- **Layered shadow** : ombres multi-couches pour la profondeur (Apple-like)
- **Surface tint** : pas d'ombres, couleurs de surface différentes (Material-like)

```css
:root {
  --shadow-xs: 0 1px 2px rgba(0, 0, 0, 0.05);
  --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.1), 0 1px 2px rgba(0, 0, 0, 0.06);
  --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.07), 0 2px 4px rgba(0, 0, 0, 0.06);
  --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1), 0 4px 6px rgba(0, 0, 0, 0.05);
  --shadow-xl: 0 20px 25px rgba(0, 0, 0, 0.1), 0 8px 10px rgba(0, 0, 0, 0.04);
}
```

### 6. Transitions defaults

```css
:root {
  --transition-fast: 150ms ease;
  --transition-base: 200ms ease;
  --transition-slow: 300ms ease;
  --transition-enter: 200ms cubic-bezier(0.22, 1, 0.36, 1);
}
```

## Livrable

Un fichier `design-system.css` ou `variables.css` à inclure dans le projet,
contenant TOUS les tokens ci-dessus, adaptés au projet.
