---
name: seo-audit
description: "Sous-skill détaillant la méthodologie stricte pour mener un audit SEO complet avec Antigravity."
---

# Audit SEO — Méthodologie & Checklist Complète

Si l'utilisateur demande d'auditer un site existant ou vient de brancher un repo, voici le workflow en 8 phases pour obtenir un bilan clair :

## Phase 1 : Crawl Technique
Analyser l'état de la plateforme :
□ Présence de pages en 404 ou de chaînes de redirection.
□ Certificat SSL/HTTPS valide et non mixte.
□ Titles ou H1 dupliqués ou manquants systématiques.

## Phase 2 : Architecture & Maillage
□ Toutes les pages sont-elles accessibles en moins de 3 clics depuis la page d'accueil ?
□ Les pages orphelines (existant dans le sitemap mais sans lien cliquable via le menu/site).
□ La navigation locale est-elle pertinente (liens vers les zones desservies dans le footer) ?

## Phase 3 : Indexation et Robots.txt
□ Le `robots.txt` bloque-t-il accidentellement le bot sur des ressources utiles ?
□ Un sitemap.xml existe-t-il à la racine et est-il propre ?
□ Balises `canonical` présentes sur tous les templates de base.

## Phase 4 : Contenu On-Page et Cannibalisation
□ Cannibalisation : Plusieurs pages se battent-elles pour les mêmes mots-clés localisés ? (Ex: "Plombier Paris" vs "Intervention Plomberie Paris").
□ Contenu "thin" : Pages ayant moins de 200 mots sans aucune valeur.
□ Balisage Schema.org LocalBusiness ou FAQPage validé ?

## Phase 5 : L'enfer PAA / Featured Snippets
Y a t'il de belles opportunités manquées sur des questions que se posent les clients ? Une FAQ exhaustive a-t-elle été intégrée ?

## Phase 6 : Backlinks et Concurrents
Si les APIs le permettent, utiliser les tools pour chercher le volume des mots clés, la puissance des concurrents sur ces mots locaux.

## Phase 7 : Performance & UX (CWV)
Core Web Vitals : LCP sous 2.5s, INP sous 200ms, Images sous formats web (WebP), pas de CLS à cause d'iframes mal chargées.

## Phase 8 : Recommandations Priorisées (LIVRABLE)
Restituer les résultats sous forme de matrice "Impact x Effort" :
1. **Quick Wins** (Effort faible / Impact élevé) : Meta description locales, H1 dupliqués.
2. **Backlog** (Effort moyen) : Re-rédaction de pages locales génériques.
3. **Projets lourds** : Refonte du maillage, SSG si SPA client-side.
