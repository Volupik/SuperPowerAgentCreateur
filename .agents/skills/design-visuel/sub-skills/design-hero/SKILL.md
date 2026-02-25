---
name: design-hero
description: >
  Guide spécifique pour le design des Hero Sections. Définit les patterns,
  la typographie H1, la composition et les appels à l'action.
---

# Design Hero Sections

La hero section est l'élément le plus important du site. C'est la première impression (Above The Fold).
Elle DOIT être mémorable et correspondre à la direction esthétique choisie.

## Processus de Création

### 1. Choisir un Pattern de Composition

**A. Split Screen (50/50 ou 60/40)**
- Gauche : Texte, H1, sous-titre, CTA successifs
- Droite : Visuel fort (produit, interface, photo générée)
- *Très courant en SaaS, e-commerce direct*

**B. Center Aligned (Hero centré)**
- Texte centré, largeur maximale contrainte (max-w-3xl)
- Visuel en dessous (dashboard dépassant de l'écran bas) ou en fond (background-image avec overlay)
- *Idéal pour les lancements, les concepts forts*

**C. Asymétrique / Organique**
- Éléments imbriqués, grille cassée
- *Idéal pour les agences créatives, mode, portfolios*

### 2. Typographie & Hiérarchie (L'Essentiel)

Le `<h1>` n'est pas juste un gros texte, c'est le design lui-même.

```html
<!-- Pattern Premium : Badge + H1 + Body + Div CTA -->
<header class="relative ...">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-24 text-center">
    <!-- Badge -->
    <a href="#" class="inline-flex items-center rounded-full px-3 py-1 text-sm font-medium bg-primary/10 text-primary mb-8 hover:bg-primary/20 transition-colors">
      <span>Nouveau : Découvrez notre service V2</span>
      <svg class="ml-2 w-4 h-4" ...><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
    </a>

    <!-- H1 Imposant -->
    <h1 class="text-5xl md:text-7xl font-display font-bold tracking-tight text-slate-900 leading-[1.1]">
      <span class="block">Design Mémorable.</span>
      <span class="block text-transparent bg-clip-text bg-gradient-to-r from-accent to-primary">Impact Immédiat.</span>
    </h1>

    <!-- Sous-titre lisible -->
    <p class="mt-6 max-w-2xl mx-auto text-xl text-slate-600 leading-relaxed">
      Créez des sites web qui marquent les esprits. Pas de templates génériques.
    </p>

    <!-- CTAs avec hiérarchie claire -->
    <div class="mt-10 flex flex-col sm:flex-row gap-4 justify-center">
      <button class="px-8 py-4 bg-primary text-white font-medium rounded-lg hover:bg-primary/90 transition-all hover:-translate-y-1 shadow-lg hover:shadow-xl">
        Commencer maintenant
      </button>
      <button class="px-8 py-4 bg-white text-slate-700 font-medium rounded-lg border border-slate-200 hover:bg-slate-50 transition-all flex items-center justify-center">
        <svg class="mr-2 w-5 h-5" ...><polygon points="5 3 19 12 5 21 5 3"></polygon></svg>
        Voir la démo
      </button>
    </div>
  </div>
</header>
```

### 3. Atmosphère & Background (Anti-Flat)

Ne JAMAIS laisser un fond `#FFFFFF` ou `#F8FAFC` uni sans rien d'autre. Ajouter de la profondeur :

- **Grid/Dots Pattern** : Répétition subtile d'un motif géométrique en SVG (opacité très faible)
- **Gradient Mesh** : Taches de couleurs floutées (Blur > 100px) positionnées en absolut (top-left, bottom-right)
- **Noise / Grain** : Texture subtile par-dessus le fond
- **Gradient Overlay** : Sur une image de fond, dégradé de la couleur de surface (opacité 90% à 0%) pour assurer la lisibilité du texte
- **SVG Dividers** : Pour la transition avec la section suivante (vague courte, angle précis)

### 4. Checklist Hero Section

- [ ] L'élément H1 a une police distinctive (`font-display`) et une taille massive (`text-5xl` à `text-7xl`)
- [ ] Le `line-height` du H1 est très serré (`1.1` ou `1.2`)
- [ ] Il y a une hiérarchie visuelle claire entre les 2 CTAs (Bouton plein + Bouton outline/ghost)
- [ ] Le fond n'est pas plat (présence de texture, mesh, image, ou pattern)
- [ ] La hauteur de la section remplit bien l'écran (min-h-[80vh] ou paddings généreux `py-24 md:py-32`)
- [ ] Les icônes utilisées dans les badges/boutons sont des SVG premium (Phospor, Tabler)

## Inspiration
[supahero.io](https://supahero.io/) — Référence absolue pour la composition.
