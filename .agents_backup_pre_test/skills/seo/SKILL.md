---
name: seo
description: >
  SEO obligatoire pour tout site web construit. S'active automatiquement pendant
  le brainstorming/planning de tout projet web. Identifie la niche et localité du
  client, analyse le concurrent #1 dans les SERPs, et impose une architecture
  SEO-first. Orchestre 12 sous-skills spécialisés : audit, technical, content (E-E-A-T),
  schema markup, sitemap, images, performance (Core Web Vitals/INP), GEO (AI Overviews),
  competitor pages, hreflang, programmatic SEO, et planification stratégique.
  Basé sur claude-seo (github.com/AgriciDaniel/claude-seo).
---

# SEO — Skill SEO Obligatoire pour Tout Site Web

Chaque site construit via ce workspace **DOIT** être optimisé SEO dès la conception.
Ce skill orchestre 12 sous-skills spécialisés et impose un process SEO-first.

## 🚨 RÈGLE ABSOLUE

**Ce skill s'active AUTOMATIQUEMENT dès qu'un site web est en cours de construction.**
Il se déclenche entre le brainstorming et le git-worktree dans le workflow basic.

Triggers : "site web", "website", "landing page", "page", "HTML", "construire un site",
"créer un site", "refonte", "redesign", tout projet impliquant du HTML/CSS/JS destiné
à être déployé sur un domaine.

---

## Process SEO-First (Obligatoire)

### Étape 1 — Identification Niche & Localité

Avant toute chose, identifier :
- **La niche** : quel secteur ? (restaurant, plombier, avocat, SaaS, e-commerce, etc.)
- **La localité** : quelle zone géographique ? (ville, région, pays)
- **Le public cible** : qui sont les clients ?
- **Les mots-clés principaux** : quelles requêtes les clients tapent ?

Poser ces questions au client si les infos ne sont pas claires.

### Étape 2 — Analyse du Concurrent #1

1. **Rechercher les concurrents** : utiliser `search_web` pour trouver les sites qui rankent #1 sur les mots-clés principaux de la niche + localité
2. **Analyser le site concurrent** avec `read_url_content` :
   - Structure des pages (quelles pages existent, quelle hiérarchie)
   - Titres H1/H2/H3 et mots-clés utilisés
   - Schema markup implémenté (JSON-LD)
   - Nombre de mots par page
   - Méta titres et descriptions
   - Stratégie de contenu (blog, FAQ, témoignages, etc.)
3. **Documenter les findings** dans un fichier `SEO-COMPETITOR-ANALYSIS.md`

### Étape 3 — Plan SEO du Site

Générer un plan SEO qui inclut :
- **Architecture de pages** inspirée du concurrent mais améliorée
- **Mots-clés cibles** par page (principal + secondaires + longue traîne)
- **Schema markup prévu** par page (LocalBusiness, Organization, Service, etc.)
- **Stratégie de contenu** : nombre de mots minimum par page, structure E-E-A-T
- **Méta tags** : titre et description pour chaque page
- **Maillage interne** : liens entre les pages

### Étape 4 — Implémentation SEO pendant la construction

Pendant la construction du site, **chaque page doit inclure** :

#### HTML obligatoire
- `<title>` optimisé avec mot-clé principal (50-60 caractères)
- `<meta name="description">` convaincante (150-160 caractères)
- `<meta name="viewport">` pour mobile-first
- `<link rel="canonical">` pour éviter le duplicate content
- Hiérarchie de titres correcte : un seul `<h1>`, puis `<h2>`, `<h3>`...
- Images avec `alt` descriptif, `width`, `height`, format WebP/AVIF
- Liens internes entre les pages
- Open Graph tags (`og:title`, `og:description`, `og:image`)

#### Schema markup obligatoire (JSON-LD)
```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness", // ou Organization, Service, etc.
  "name": "...",
  "url": "...",
  "telephone": "...",
  "address": { ... },
  "openingHours": "...",
  "image": "..."
}
</script>
```

Voir `schema/templates.json` pour les templates complets.
**NE JAMAIS** recommander HowTo schema (déprécié Sept 2023).
FAQ schema **UNIQUEMENT** pour sites gouvernementaux/santé.

#### Performance (Core Web Vitals)
- LCP < 2.5s : images hero en WebP, preload, critical CSS
- INP < 200ms : pas de JS bloquant, scripts en defer/async
- CLS < 0.1 : dimensions sur images, pas d'injection dynamique

**IMPORTANT** : INP a remplacé FID le 12 mars 2024. Ne JAMAIS référencer FID.

#### Fichiers SEO
- `sitemap.xml` — toutes les URLs du site
- `robots.txt` — directives de crawl
- Fichier `manifest.json` pour PWA (optionnel mais recommandé)

---

## Quick Reference — Sous-Skills

| Commande | Ce que ça fait | Fichier |
|----------|---------------|---------|
| seo-audit | Audit SEO complet avec délégation parallèle | `sub-skills/seo-audit/SKILL.md` |
| seo-page | Analyse approfondie d'une seule page | `sub-skills/seo-page/SKILL.md` |
| seo-technical | SEO technique (8 catégories) | `sub-skills/seo-technical/SKILL.md` |
| seo-content | Qualité contenu E-E-A-T | `sub-skills/seo-content/SKILL.md` |
| seo-schema | Détection/validation/génération Schema.org | `sub-skills/seo-schema/SKILL.md` |
| seo-images | Optimisation images | `sub-skills/seo-images/SKILL.md` |
| seo-sitemap | Analyse et génération sitemaps XML | `sub-skills/seo-sitemap/SKILL.md` |
| seo-geo | AI Overviews / GEO (Generative Engine Optimization) | `sub-skills/seo-geo/SKILL.md` |
| seo-plan | Planification stratégique SEO | `sub-skills/seo-plan/SKILL.md` |
| seo-programmatic | SEO programmatique | `sub-skills/seo-programmatic/SKILL.md` |
| seo-competitor-pages | Pages de comparaison concurrents | `sub-skills/seo-competitor-pages/SKILL.md` |
| seo-hreflang | Audit hreflang / i18n | `sub-skills/seo-hreflang/SKILL.md` |

## Agents Spécialisés

6 agents pour l'analyse parallèle pendant les audits :
- `agents/seo-technical.md` — Crawlabilité, indexabilité, sécurité, CWV
- `agents/seo-content.md` — E-E-A-T, lisibilité, contenu mince
- `agents/seo-schema.md` — Détection, validation, génération
- `agents/seo-sitemap.md` — Structure, couverture, quality gates
- `agents/seo-performance.md` — Mesure Core Web Vitals
- `agents/seo-visual.md` — Screenshots, test mobile, above-the-fold

## Références (charger à la demande)

- `references/cwv-thresholds.md` — Seuils Core Web Vitals actuels
- `references/schema-types.md` — Types schema.org supportés + dépréciés
- `references/eeat-framework.md` — Critères E-E-A-T (Sept 2025 QRG)
- `references/quality-gates.md` — Minimums de contenu, seuils d'unicité

## Détection d'Industrie

Détecter le type de business depuis les signaux de la homepage :
- **SaaS** : page pricing, /features, /integrations, "free trial"
- **Local Service** : téléphone, adresse, zone de service, "à [ville]", Google Maps
- **E-commerce** : /products, /cart, "ajouter au panier", schema Product
- **Publisher** : /blog, /articles, schema Article, pages auteurs
- **Agence** : /case-studies, /portfolio, logos clients

## Scoring SEO (0-100)

| Catégorie | Poids |
|-----------|-------|
| SEO Technique | 25% |
| Qualité Contenu | 25% |
| SEO On-Page | 20% |
| Schema / Données structurées | 10% |
| Performance (CWV) | 10% |
| Images | 5% |
| AI Search Readiness | 5% |

## Quality Gates

- ⚠️ WARNING à 30+ pages de localisation (exiger 60%+ contenu unique)
- 🛑 HARD STOP à 50+ pages de localisation (justification utilisateur requise)

---

> Source : [AgriciDaniel/claude-seo](https://github.com/AgriciDaniel/claude-seo)
