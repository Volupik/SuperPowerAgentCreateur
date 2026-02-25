---
name: design-audit
description: >
  Audit de la qualité visuelle et de l'accessibilité de l'UI.
  S'exécute avant de finaliser un design. Basé sur mblode/audit-ui.
---

# Design Audit — QA Visuelle Finale

## Objectif

Vérifier que le design implémenté correspond à la direction choisie,
respecte le design system, et passe les critères d'accessibilité de base.

## Processus d'Audit

1. Inspecter le code HTML/CSS généré
2. Utiliser `browser_subagent` pour regarder concrètement l'interface
3. Parcourir la check-list ci-dessous
4. Apporter les corrections (fixes concrets) avant de déclarer la tâche terminée.

## Check-list Obligatoire

### 1. Cohérence Visuelle (Anti-slop check)
- [ ] Y a-t-il des **emojis** utilisés comme éléments de design ? (Si oui, remplacer par des `<svg>`)
- [ ] Les typographies utilisées sont-elles celles du design system ? (Vérifier qu'aucune fallback `Arial/sans-serif` générique n'est visuellement dominante)
- [ ] Le design system des couleurs (variables CSS) est-il strictement respecté ?
- [ ] Les cards et boutons utilisent-ils un système de `border-radius` cohérent et unique ?
- [ ] L'espacement (padding/margin) utilise-t-il la grille de 4px de manière consistante ?

### 2. Typographie & Lisibilité
- [ ] Le contraste texte/fond est-il suffisant (WCAG AA - minimum 4.5:1 pour le corps du texte) ?
- [ ] La hiérarchie H1 > H2 > H3 est-elle évidente visuellement (taille + graisse) ?
- [ ] Les longueurs de lignes (max-width / ch) sont-elles confortables (45-75 caractères pour le body text) ?
- [ ] La hauteur de ligne (line-height) est-elle adaptée (plus serrée sur les titres, plus aérée sur le corps) ?

### 3. Accessibilité & Interactions
- [ ] Tous les boutons et liens ont-ils un état `:hover`, `:focus-visible`, et `:active` défini ?
- [ ] Le focus ring au clavier (`:focus-visible`) est-il clairement visible et non caché par un `outline: none` global ?
- [ ] Les zones cliquables (hit targets) sur mobile font-elles au minimum 44x44px ?
- [ ] Les icônes cliquables (sans texte visible) ont-elles une étiquette accessible (`aria-label` ou `sr-only` text) ?

### 4. Layout & Contraintes
- [ ] Le design casse-t-il proprement sur mobile ? (Pas de débordement horizontal, flex/grid adaptatifs)
- [ ] Le padding des conteneurs empêche-t-il le texte de toucher les bords de l'écran sur mobile ?
- [ ] Les images ont-elles `max-width: 100%; height: auto;` pour éviter les déformations ?

### 5. Qualité Perçue (Delight & Motion)
- [ ] La transition initiale (page load hero reveal) s'exécute-t-elle avec fluidité ?
- [ ] Les transitions de hover utilisent-elles uniquement opacité, transform, couleurs (et non width/margin) ?
- [ ] La page fait-elle "premium" ou apparaît-elle comme un template Bootstrap daté de 2015 ?

## Format de Rapport

Si des problèmes sont trouvés, les documenter (sous forme de commentaire ou en modifiant les fichiers) et corriger le code immédiatement. L'agent ne s'arrête que quand la checklist est au VERT entierement.
