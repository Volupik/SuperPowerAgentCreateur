---
name: design-inspiration
description: >
  Recherche d'inspiration visuelle automatique avant tout travail de design.
  Scrape supahero.io, Dribbble, Awwwards et les concurrents du secteur client.
  Capture des screenshots et documente la direction dans un fichier dédié.
---

# Design Inspiration — Recherche Automatique

## Objectif

Trouver 3+ références visuelles pertinentes au secteur/type de site du client
AVANT de choisir une direction esthétique. L'inspiration guide tout le design.

## Process

### 1. Identifier le contexte

Détermine à partir du brainstorming/SEO :
- **Type de site** : landing page, SaaS, portfolio, service local, e-commerce, blog
- **Secteur** : restauration, tech, santé, artisanat, immobilier, mode, etc.
- **Audience** : B2B, B2C, premium, populaire, technique, grand public
- **Ton souhaité** : professionnel, chaleureux, audacieux, minimaliste, luxueux

### 2. Scraper les sources d'inspiration

Utiliser `browser_subagent` pour parcourir ces sources dans cet ordre :

#### a) supahero.io (Hero sections)
```
URL : https://supahero.io/
Action : parcourir les hero sections, filtrer par style pertinent au secteur
Capturer : screenshot des 2-3 hero sections les plus pertinentes
```

#### b) Dribbble (Design complet)
```
URL : https://dribbble.com/search/{secteur}-website-design
Action : parcourir les résultats de recherche
Capturer : screenshot des 2-3 designs les plus pertinents
```

#### c) Awwwards (Sites primés)
```
URL : https://www.awwwards.com/websites/{catégorie}/
Action : parcourir les sites récompensés dans le secteur
Capturer : screenshot si pertinent
```

#### d) Concurrent #1 (déjà identifié par SEO)
```
URL : le site concurrent identifié dans l'analyse SEO
Action : parcourir le design complet (hero, services, footer, couleurs, typo)
Capturer : screenshot de la homepage + 1 page intérieure
```

### 3. Documenter les findings

Créer `docs/plans/DESIGN-INSPIRATION.md` avec :

```markdown
# Inspiration Design — [Nom du projet]

## Références visuelles

### Référence 1 : [Nom/Source]
- URL : ...
- Ce qui est pertinent : (composition, palette, typo, animation, atmosphère)
- Ce qu'on retient : (l'élément clé à adapter)

### Référence 2 : [Nom/Source]
- ...

### Référence 3 : [Nom/Source]
- ...

## Screenshots
(Lien vers les captures)

## Direction recommandée
- Tone : ...
- Palette inspirée de : ...
- Typographie inspirée de : ...
- Composition inspirée de : ...
```

### 4. Transition

Passer au sous-skill `design-aesthetics` avec les références en main.

## Sources additionnelles

Voir `references/inspiration-sources.md` pour la liste complète des sources.

## Règles

- **Minimum 3 références** avant de choisir une direction
- **Toujours capturer des screenshots** — ne pas se fier à la mémoire
- **Mixer les sources** — ne pas tout prendre du même site
- **Pertinence au secteur** — chercher dans le bon secteur, pas du design générique
