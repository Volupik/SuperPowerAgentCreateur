---
name: seo-expert
description: "Skill SEO expert complet pour Claude Code. Utilise ce skill dès que l'utilisateur mentionne SEO, référencement, optimisation pour les moteurs de recherche, positionnement Google, mots-clés, backlinks, SERP, Core Web Vitals, schema markup, contenu optimisé, maillage interne, audit SEO, migration SEO, indexation, crawl, sitemap, robots.txt, balises meta, title tag, meta description, canonical, hreflang, rich snippets, featured snippets, People Also Ask, E-E-A-T, topical authority, content clusters, ou toute tâche liée à l'amélioration de la visibilité organique d'un site web. Couvre le SEO technique, on-page, off-page, local, e-commerce, international, et la stratégie de contenu. Utilise aussi ce skill quand l'utilisateur demande de créer du contenu pour un site web, d'optimiser des pages, d'analyser la concurrence SEO, de planifier une architecture de site, ou de résoudre des problèmes d'indexation. Ne PAS utiliser pour du SEA/Google Ads pur (sauf synergie SEO/SEA), du développement web sans composante SEO, ou du design UI/UX sans impact sur le référencement."
---

# SEO Expert Skill — Guide Complet

> **APPROCHE LOCALE PRIORITAIRE (95% DES CAS)** : Ce workspace se concentre de manière écrasante sur le SEO Local. Privilégiez TOUJOURS la section [SEO Local](sub-skills/seo-local/SKILL.md). L'optimisation Google Business Profile, la cohérence du NAP (Name, Address, Phone), les pages de villes/zones géographiques (sans contenu dupliqué !) et le Schema `LocalBusiness` sont des priorités absolues avant toute autre considération technique globale. 

## Table des matières
- **Philosophie & Principes fondamentaux** (ci-dessous)
- [Architecture & SEO Technique](sub-skills/seo-technique/SKILL.md)
- [SEO On-Page](sub-skills/seo-on-page/SKILL.md)
- [Stratégie de contenu & E-E-A-T](sub-skills/seo-strategie-contenu/SKILL.md)
- [SEO Off-Page & Autorité](sub-skills/seo-off-page/SKILL.md)
- **[SEO Local (PRIORITÉ ABSOLUE)](sub-skills/seo-local/SKILL.md)**
- [SEO E-commerce](sub-skills/seo-ecommerce/SKILL.md)
- [Audit SEO — Méthodologie](sub-skills/seo-audit/SKILL.md)

---

## 1. Philosophie & Principes Fondamentaux

### Ce que Google veut réellement
Google optimise pour la satisfaction utilisateur à long terme. Toute stratégie SEO doit s'aligner sur ce principe. Les trois piliers de Google sont :

*   **Pertinence** : Le contenu répond-il précisément à l'intention de recherche ?
*   **Qualité** : Le contenu démontre-t-il expertise, expérience, autorité et fiabilité (E-E-A-T) ?
*   **Expérience utilisateur** : Le site est-il rapide, accessible, sécurisé et agréable à utiliser ?

### Les 4 types d'intention de recherche
Toujours identifier l'intention AVANT de créer du contenu :

| Intention | Signal | Exemple | Format optimal |
| :--- | :--- | :--- | :--- |
| **Informationnelle** | comment, pourquoi, qu'est-ce que | "comment choisir un matelas" | Guide long, FAQ, tutoriel |
| **Navigationnelle** | nom de marque, site spécifique | "amazon login" | Page d'accueil, page de marque |
| **Commerciale** | meilleur, comparatif, avis | "meilleur aspirateur 2025" | Comparatif, test, top X |
| **Transactionnelle** | acheter, prix, commander | "acheter iPhone 16 Pro" | Page produit, collection |

### Framework de décision SEO
1. Analyser l'intention de recherche (SERP analysis)
2. Étudier le contenu qui rank (top 10)
3. Identifier le gap de contenu/qualité
4. Créer du contenu 10x meilleur
5. Optimiser techniquement
6. Construire l'autorité (liens, mentions)
7. Mesurer, itérer, améliorer

---

## Workflows Claude Code

### Quand l'utilisateur demande du contenu SEO
1. Identifier le type de page (article, collection, produit, landing)
2. Rechercher le mot-clé principal et analyser la SERP
3. Identifier l'intention de recherche dominante
4. Analyser les top résultats (structure, longueur, format)
5. Créer un outline détaillé avec Hn
6. Rédiger en respectant toutes les optimisations on-page
7. Ajouter le schema markup approprié (surtout LocalBusiness !)
8. Proposer le maillage interne
9. Rédiger la meta description et le title tag

### Quand l'utilisateur demande un audit
1. Demander l'URL du site et l'accès à Google Search Console si possible
2. Lire `sub-skills/seo-audit/SKILL.md` pour la méthodologie détaillée
3. Suivre les 8 phases systématiquement
4. Produire un rapport avec recommandations priorisées
5. Fournir un plan d'action avec estimation d'impact

### Quand l'utilisateur demande une architecture de site
1. Comprendre le secteur et les objectifs business (Local = 95% du temps)
2. Faire une recherche de mots-clés exhaustive
3. Organiser en topic clusters
4. Définir la structure URL
5. Planifier le maillage interne
6. Créer le sitemap préliminaire
7. Lire `sub-skills/seo-technique/SKILL.md` pour les détails techniques

### Quand l'utilisateur demande une stratégie SEO
1. Audit rapide de la situation actuelle
2. Analyse concurrentielle
3. Recherche de mots-clés et priorisation
4. Plan de contenu (topics, formats, fréquence)
5. Stratégie de link building
6. KPIs et objectifs mesurables
7. Roadmap trimestrielle

---

## Règles absolues (TOUJOURS respecter)
*   **Jamais de contenu dupliqué** — Chaque page (et surtout chaque page "Ville") doit avoir un contenu unique et une valeur ajoutée propre.
*   **Jamais de keyword stuffing** — Écrire pour l'humain d'abord, optimiser pour Google ensuite.
*   **Toujours une balise title et meta description uniques par page**
*   **Toujours une seule balise H1 par page**
*   **Toujours un canonical sur chaque page indexable**
*   **Mobile-first** — Toute optimisation doit fonctionner sur mobile.
*   **HTTPS obligatoire** — Sans exception.
*   **Vitesse = ranking** — Chaque milliseconde compte (Core Web Vitals).
*   **L'intention de recherche prime** — Un contenu parfaitement optimisé mais hors-sujet ne rankera jamais.
*   **E-E-A-T n'est pas optionnel** — C'est un facteur de plus en plus déterminant, surtout pour YMYL (Your Money Your Life) et pour gagner la confiance en Local.
