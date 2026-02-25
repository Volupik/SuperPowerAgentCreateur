---
name: design-icons-images
description: >
  Gestion des assets visuels. Interdiction formelle des emojis comme icônes.
  Utilisation de SVG inline pour les icônes (Phosphor, Tabler, Heroicons).
  Utilisation de generate_image pour les hero/illustrations sur mesure,
  et Unsplash pour la photographie lifestyle.
---

# Design Images & Icons — Assets Visuels

## 🚨 RÈGLE ABSOLUE SUR LES EMOJIS

**L'utilisation d'emojis (🚀, ⭐, ✅, 💻, etc.) comme éléments de design, puces de liste, ou icônes de cards est FORMELLEMENT INTERDITE.**

C'est la marque de fabrique numéro 1 d'un site généré par IA "low-effort".
Tout emoji décoratif doit être remplacé par une icône SVG propre.

## Process pour les Icônes

Toujours utiliser des SVG inline (ou via composant React/Vue) depuis une bibliothèque professionnelle cohérente.

### Bibliothèques recommandées :
1. **Phosphor Icons** (ph-*) — Net, professionnel, très complet (SaaS, Admin)
2. **Tabler Icons** (ti-*) — Doux, lisible, parfait pour les interfaces
3. **Heroicons** — Classique Tailwind, efficace (Landing pages)
4. **Lucide** — Clean et moderne

### Format d'intégration HTML
```html
<!-- Exemple SVG inline typique (taille 24x24, currentColor) -->
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-check">
  <polyline points="20 6 9 17 4 12"></polyline>
</svg>
```

**Ne jamais mélanger les bibliothèques d'icônes.** Choisir une famille et s'y tenir pour garantir la cohérence d'épaisseur de trait (stroke-width).

## Process pour les Images

### 1. Photos Lifestyle & Réelles (Unsplash)
Pour tout ce qui doit montrer des vrais gens, de la vraie nourriture, de l'immobilier, ou des paysages.
- Format : `https://source.unsplash.com/1600x900/?keyword` (pour les placeholders)
- Filtrer finement le keyword (`?modern-architecture`, pas juste `?house`)

### 2. Images Héro & Illustrations Custom (`generate_image`)
Pour les visuels abstraits, les illustrations 3D, les blobs, les textures, ou les concepts uniques qu'on ne trouve pas libres de droits.

**Prompting pour l'IA générative :**
- Toujours inclure la direction esthétique (ex: "minimalist vector art", "3d glassmorphism", "cinematic photography with moody lighting")
- Préciser la palette de couleurs à utiliser pour s'accorder au CSS
- Demander des arrière-plans propres (ou transparent/blanc pour détourage facile)
- Préciser "no text, no watermark"

*Exemple de prompt : "3D rendering of a glowing geometric sphere, glassmorphism style, dark background, accented with neon purple and cyan, high resolution, minimalist composition, no text"*

### 3. Textures et Patterns (CSS/SVG)
Ne pas utiliser d'images pour ce qui peut être fait en code.
- Utiliser des SVG en `background-image` pour les grids, dots, waves.
- Utiliser des générateurs de noise en base64 pour les textures.

## Livrable
Toutes les icônes du HTML doivent être des balises `<svg>`.
Les images importantes doivent soit utiliser une source Unsplash précise, soit être générées via le tool `generate_image` et sauvegardées dans un dossier `/assets/images/`.
