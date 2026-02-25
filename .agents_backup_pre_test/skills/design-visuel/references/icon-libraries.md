# Bibliothèques d'Icônes SVG Recommandées

**Règle absolue : PAS D'EMOJIS DÉCORATIFS.**
Utiliser des icônes SVG vectorielles professionnelles qui s'intègrent dans le flux de texte via `fill="currentColor"` ou `stroke="currentColor"`.

L'agent de design doit s'assurer que toutes les icônes du HTML/JSX utilisent l'une de ces bibliothèques, afin de maintenir une épaisseur de trait et un style unifié.

## 1. Lucide / Feather Icons (Classique, Épuré)
Icônes au trait (stroke), 2px d'épaisseur par défaut. Excellent pour les SaaS, interfaces d'administration, blocs de texte clean.

```html
<!-- Exemple SVG Inline Lucide -->
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right">
  <path d="M5 12h14"/><path d="m12 5 7 7-7 7"/>
</svg>
```

## 2. Phosphor Icons (SaaS, Technique, Moderne)
Excellente lisibilité. Disponible en Stroke (Light, Regular, Bold) et Fill. Idéal pour de grandes interfaces avec beaucoup de fonctionnalités.

```html
<!-- Exemple SVG Inline Phosphor (Regular) -->
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 256 256">
  <path d="M221.66,133.66l-72,72a8,8,0,0,1-11.32-11.32L196.69,136H40a8,8,0,0,1,0-16H196.69L138.34,61.66a8,8,0,0,1,11.32-11.32l72,72A8,8,0,0,1,221.66,133.66Z" fill="currentColor"/>
</svg>
```

## 3. Tabler Icons (Doux, Dense)
Très riche (plus de 5000 icônes). Style outline avec des coins plus arrondis que Lucide. Parfait pour les applications web, CRM, et outils internes.

```html
<!-- Exemple SVG Inline Tabler -->
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-check">
  <path stroke="none" d="M0 0h24v24H0z" fill="none" />
  <path d="M5 12l5 5l10 -10" />
</svg>
```

## 4. Heroicons (Tailwind Ecosystem)
Le standard créé par l'équipe Tailwind. Disponible en Outline (24x24) et Solid (20x20 et 16x16). Très efficace pour les boutons, alertes, landing pages rapides.

```html
<!-- Exemple SVG Inline Heroicons Outline -->
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
  <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5 21 12m0 0-7.5 7.5M21 12H3" />
</svg>
```

## Intégration Recommandée
Plutôt que d'inclure des scripts CDN lourds pour charger la font, **privilégier l'injection de SVG inline** directement dans le code HTML. Cela réduit le poids de la page, évite les Flash of Unstyled Text (FOUT) avec les WebFonts, et permet de styliser l'icône directement via CSS (`text-primary`, `hover:text-accent`, etc.).
