---
name: design-aesthetics
description: >
  Direction esthétique et anti-patterns. Définit un tone visuel fort et distinctif.
  Interdit les patterns "AI slop" (emojis, gradients génériques, fonts communes).
  Guide la composition, les backgrounds, les hero sections et les cards.
---

# Design Aesthetics — Direction & Anti-Patterns

## Objectif

Garantir que chaque site ait une identité visuelle **distinctive et mémorable**.
Pas de design générique. Pas d'AI slop.

## Choisir une direction

Avant de coder, engager une direction esthétique FORTE :

### Directions disponibles (non-exhaustif)

| Direction | Signature | Quand l'utiliser |
|-----------|-----------|-----------------|
| **Minimaliste brutal** | Espace blanc massif, typo bold, très peu d'éléments | Sites premium, architectes, agences |
| **Editorial/Magazine** | Colonnes, grande typographie, layouts asymétriques | Blogs, médias, portfolios |
| **Luxe/Raffiné** | Animations subtiles, serif élégant, couleurs sourdes | Restaurants haut de gamme, immobilier premium |
| **Organique/Naturel** | Couleurs terre, radius généreux, textures bois/papier | Paysagistes, bien-être, bio, artisanat |
| **Industriel/Utilitarian** | Sans-serif condensé, grille serrée, palette froide | Services techniques, industrie, BTP |
| **Rétro-futuriste** | Gradients vifs, typo géométrique, animations fluides | Tech, startups, apps |
| **Brutaliste/Raw** | Bordures noires, mono typo, mise en page brute | Galeries, artistes, expérimental |
| **Soft/Pastel** | Couleurs douces, radius doux, illustrations | Santé, enfants, éducation, apps douces |
| **Art Déco/Géométrique** | Patterns géométriques, doré, symétrie forte | Événementiel, hôtels, bars premium |
| **Chaleureux/Local** | Couleurs chaudes, photos réelles, témoignages | Artisans locaux, commerces de proximité |

**IMPORTANT** : La direction choisie influence TOUT — typo, couleurs, spacing, animations, photos.

## Anti-Patterns : Ce qui est INTERDIT

Voir `references/anti-patterns.md` pour la liste complète.

### Résumé des interdictions :

1. **❌ Emojis comme icônes** — Utiliser Phosphor/Tabler/Heroicons SVG inline
2. **❌ Polices génériques** — Pas de Inter, Roboto, Arial, Open Sans, Poppins
3. **❌ Gradients violet-bleu sur fond blanc** — Le cliché AI #1
4. **❌ Cards identiques avec fond plat** — Varier les traitements visuels
5. **❌ Même logo/icône partout** — Créer de la variété visuelle
6. **❌ Backgrounds solid color flat** — Ajouter de la texture et de l'atmosphère
7. **❌ Layout prévisible** — Sortir de la grille systématique 3 colonnes
8. **❌ Composants copiés/collés** — Adapter chaque section à son contenu

## Guidelines positives

### Hero sections
- Créer de l'**atmosphère** : overlay gradient, noise texture, SVG patterns
- Photo réelle ou illustration générée avec `generate_image` en background
- Texte avec hiérarchie claire : badge → H1 → sous-titre → CTA
- Animation d'entrée (stagger reveal, pas tout d'un coup)

### Cards / Services
- Pas de fond uni identique partout — varier les traitements :
  - Bordure colorée sur un côté
  - Background avec gradient très subtil (HSL ±5 de lightness)
  - Icône SVG personnalisée par service (pas d'emoji)
  - Hover state significatif (translateY, shadow, border color)
- Taille et padding proportionnels au contenu

### Sections
- Alterner les traitements visuels entre sections
- Utiliser des séparateurs visuels intéressants (SVG wave, angle, overlap)
- Background alterné clair/teinté/sombre pour le rythme

### Typographie en contexte
- H1 : très grand (`text-4xl`), police display, `leading-tight`
- H2 : distinctif, accent couleur ou weight, séparateur visuel
- Body : lisible, `leading-relaxed`, contraste suffisant
- Labels/badges : uppercase, letter-spacing, taille réduite

### Couleur en contexte
- Couleur dominante couvre 60% de l'UI
- Couleur secondaire couvre 30%
- Accent couvre 10% — réservé aux CTA et éléments clés
- Les accents POP car ils sont rares

## Livrable

Un paragraphe de direction esthétique documenté dans `docs/plans/DESIGN-DIRECTION.md` :
- Direction choisie et pourquoi
- Signature mémorable
- 3 mots qui décrivent le mood
- Références visuelles associées (de l'inspiration)
