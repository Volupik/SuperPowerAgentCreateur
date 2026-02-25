---
name: design-animation
description: >
  Directives et exemples pour le motion design UI. Gère le timing, le séquençage,
  les easings, et le comportement prefers-reduced-motion. Basé sur mblode/ui-animation.
---

# Design Animation — Motion Guidelines

Le motion design doit clarifier la fonction, guider l'œil, et ajouter du "delight" délibéré sans surcharger l'interface.

## Règles Fondamentales

1. **Vitesse** : Les interactions doivent être rapides (200-300ms). Les effets d'entrée peuvent aller jusqu'à 600-800ms grand max.
2. **Propriétés performantes** : N'animer QUE `transform` (scale, translate) et `opacity`. Ne jamais animer la `width`, `height`, le `margin` ou le layout.
3. **Discipline** : Ne jamais utiliser `transition: all`. Spécifier les propriétés (`transition: opacity 200ms ease, transform 200ms ease`).
4. **Accessibilité** : Respecter TOUJOURS `prefers-reduced-motion`.

## Easing Defaults (Fonctions de transition)

Ne pas se contenter des mots-clés de base (sauf `ease` pour les choses simples). Utiliser les courbes de Bézier pour un rendu "premium" :

```css
:root {
  /* Entrées fluides (modals, dropdowns, hero reveals) - démarre vite, décélère en douceur */
  --ease-out-expo: cubic-bezier(0.16, 1, 0.3, 1);
  --ease-out-back: cubic-bezier(0.34, 1.56, 0.64, 1); /* Pour un léger rebond */

  /* Mouvements spatiaux (drag, swipe) - symétrique */
  --ease-in-out-cubic: cubic-bezier(0.65, 0, 0.35, 1);

  /* Hover simples (couleur, opacité) */
  --ease-standard: ease;
}
```

## Séquençage & Révélation (Staggered Reveals)

Plutôt que de tout faire apparaître d'un coup, introduire les éléments séquentiellement :

```css
.reveal-item {
  opacity: 0;
  transform: translateY(20px);
  animation: revealUp 600ms var(--ease-out-expo) forwards;
}

/* Stagger delay */
.reveal-item:nth-child(1) { animation-delay: 100ms; }
.reveal-item:nth-child(2) { animation-delay: 200ms; }
.reveal-item:nth-child(3) { animation-delay: 300ms; }

@keyframes revealUp {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
```

## Hover States Memorables

Un bon hover fait plus que changer la couleur du texte.

### Hover Cards (Élévation)
```css
.card {
  transition: transform 300ms var(--ease-out-expo), box-shadow 300ms var(--ease-out-expo);
}
.card:hover {
  transform: translateY(-4px);
  box-shadow: var(--shadow-lg); /* Si on utilise un système d'ombre */
}
```

### Hover Boutons (Micro-interaction scale)
```css
.button {
  transition: transform 150ms ease, background-color 200ms ease;
}
.button:active {
  transform: scale(0.97); /* Feedback tactile */
}
```

## Prefers Reduced Motion (Obligatoire)

Ajouter ce snippet à la fin de la stylesheet ou config Tailwind :

```css
@media (prefers-reduced-motion: reduce) {
  *,
  ::before,
  ::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

## Anti-Patterns (Interdit)

- ❌ Animations infinies "pulse" sur des boutons statiques
- ❌ Spinners surchargés — préférer des loaders minimalistes
- ❌ Délais au moment du hover — le feedback au survol doit être immédiat
- ❌ Animer les couleurs avec des effets "arc-en-ciel" continus
