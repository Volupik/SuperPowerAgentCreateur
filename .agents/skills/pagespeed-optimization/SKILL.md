---
name: pagespeed-optimization
description: >
  Playbook "PageSpeed 100/100" obligatoire.
  S'active en fin d'implémentation pour optimiser techniquement le site
  (cache, tailles/formats d'images WebP obligatoires, preloads,
  polices auto-hébergées, defer JS).
---

# PageSpeed Optimization — Playbook 100/100

Ce skill garantit que le site web généré obtiendra un score Lighthouse proche de 100/100 sur mobile dès la mise en ligne. Il doit être respecté **strictement** lors de l'intégration HTML/CSS/JS et avant le déploiement.

## 1. Architecture Serveur & Cache (.htaccess)

Créer ou mettre à jour le fichier `.htaccess` à la racine pour :
- **Activer la compression GZIP** (`mod_deflate`).
- **Activer le cache navigateur** (`mod_expires` / Cache-Control) :
  - 1 an pour les images, polices et médias.
  - 1 mois pour CSS et JS.
  - 1 heure (ou pas de cache forcé) pour le HTML.

## 2. Images : Format & Dimensions (LCP & Poids)

**Zéro JPEG/PNG** : Absolument TOUTES les images (hero, portraits, galeries, logos) doivent être converties en WebP.
- Commande `cwebp` : `cwebp -q 82 image.jpg -o image.webp`

**Dimensions rationnelles** : Ne jamais envoyer une image de 2000px si elle est affichée en 500px maximum. Redimensionner l'image source avant de l'intégrer au projet (ex: logo max 250px, portrait max 640px).

**Attributs HTML obligatoires :**
1.  Toujours inclure `width` et `height` sur les balises `<img>` (même le logo du header) pour éliminer le CLS (Cumulative Layout Shift).
2.  Utiliser `loading="lazy"` sur TOUTES les images de la page.
3.  **EXCEPTION LCP** : L'image principale du Hero (ou la première image visible au-dessus de la ligne de flottaison) NE DOIT PAS être en lazy loading.
4.  Ajouter un `<link rel="preload" as="image" href="hero.webp" type="image/webp">` dans le `<head>` pour l'image principale afin de déclencher son chargement instantanément.

## 3. Polices d'écriture (Le Tueur de LCP/FCP)

**Fuir le CDN Google Fonts** : Les liens `<link>` ou `@import` vers `fonts.googleapis.com` créent une chaîne critique bloquante (HTML → CSS → API Google → Téléchargement police).
- **Self-hosting obligatoire** : Télécharger les fichiers `.woff2` (les plus légers) localement dans un dossier `fonts/` ou `assets/fonts/`.

**Preload Critique** :
Ajouter une balise de preload dans le `<head>` pour chaque police **avant** l'appel au fichier CSS :
```html
<link rel="preload" href="fonts/ma-police.woff2" as="font" type="font/woff2" crossorigin>
```

**CSS @font-face** :
Déclarer les polices via `@font-face` dans le CSS avec `font-display: swap` pour que le texte soit immédiatement lisible avec une police système le temps que le fichier `.woff2` arrive.

## 4. JavaScript

**Jamais dans le `<head>` sans defer** : Tout fichier script (comme les traducteurs `i18n.js` ou les sliders) placé dans le `<head>` ou en plein milieu du `<body>` met en pause le rendu HTML (render-blocking).

**Solution universelle** : Toujours utiliser l'attribut `defer` sur tous les scripts.
```html
<script src="script.js" defer></script>
```

## Validation
L'agent doit parcourir chaque page HTML (et le fichier .htaccess) et cocher toutes ces conditions avant de déclarer la tâche d'optimisation terminée.
