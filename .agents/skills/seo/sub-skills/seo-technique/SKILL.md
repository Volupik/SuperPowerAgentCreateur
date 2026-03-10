---
name: seo-technique
description: "Sous-skill détaillant l'architecture et le SEO technique (Crawl, Indexation, Robots.txt, Sitemap XML, Balises Canonical, Redirections, HTTPS)."
---

# SEO Technique — Référence Complète

## Table des matières
1. Crawl & Indexation
2. Robots.txt
3. Sitemap XML
4. Balises Canonical
5. Redirections
6. Sécurité & HTTPS
7. Pages Erreur

---

## 1. Crawl & Indexation

### Comment Googlebot crawle un site
Googlebot découvre les pages via :
*   Liens internes et externes
*   Sitemap XML
*   Google Search Console (inspection d'URL)
*   Découverte de liens dans les flux RSS, sitemaps de news

### Contrôler l'indexation
```html
<!-- Indexer (défaut) -->
<meta name="robots" content="index, follow">

<!-- Ne pas indexer mais suivre les liens -->
<meta name="robots" content="noindex, follow">

<!-- Ne pas indexer ni suivre les liens -->
<meta name="robots" content="noindex, nofollow">

<!-- Header HTTP (pour les fichiers non-HTML) -->
X-Robots-Tag: noindex
```

### Quand utiliser noindex
✅ Pages de résultats de recherche interne
✅ Pages de filtres/tri dupliquées
✅ Pages de login/inscription
✅ Pages de remerciement après formulaire
✅ Pages de politique de cookies
✅ Pages de tags/archives peu qualitatives
✅ Pages en staging/préproduction

❌ Ne JAMAIS noindex : pages catégorie, produits actifs, articles de blog indexés, pages d'accueil

---

## 2. Robots.txt

### Template robots.txt optimisé
```text
User-agent: *
Allow: /

# Bloquer les ressources non-SEO
Disallow: /admin/
Disallow: /cart/
Disallow: /checkout/
Disallow: /account/
Disallow: /search?
Disallow: /*?sort=
Disallow: /*?filter=
Disallow: /*?page=*&sort=
Disallow: /api/

# Autoriser les ressources nécessaires au rendu
Allow: /assets/
Allow: /*.css$
Allow: /*.js$
Allow: /*.jpg$
Allow: /*.png$
Allow: /*.webp$

# Sitemap
Sitemap: https://www.example.com/sitemap.xml
```

### Erreurs courantes robots.txt
❌ Bloquer `/assets/`, `/css/`, `/js/` (empêche le rendu)
❌ Bloquer des pages qui ont des backlinks
❌ Utiliser robots.txt pour cacher du contenu sensible (ce n'est PAS une mesure de sécurité)
❌ Mettre `Disallow: /` par erreur (bloque tout le site)
❌ Oublier de mettre à jour après une migration

---

## 3. Sitemap XML

### Structure sitemap optimale
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://www.example.com/</loc>
    <lastmod>2025-01-15</lastmod>
    <changefreq>daily</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://www.example.com/categorie/</loc>
    <lastmod>2025-01-14</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
  </url>
</urlset>
```

### Index de sitemaps (pour les gros sites)
```xml
<?xml version="1.0" encoding="UTF-8"?>
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <sitemap>
    <loc>https://www.example.com/sitemap-pages.xml</loc>
    <lastmod>2025-01-15</lastmod>
  </sitemap>
  <sitemap>
    <loc>https://www.example.com/sitemap-products.xml</loc>
    <lastmod>2025-01-15</lastmod>
  </sitemap>
</sitemapindex>
```

### Règles sitemap
*   Max 50 000 URLs par sitemap
*   Max 50 Mo par fichier
*   Uniquement les URLs canoniques
*   Uniquement les URLs indexables (pas de noindex)
*   lastmod = date réelle de dernière modification
*   Soumettre via Google Search Console
*   Référencer dans robots.txt
*   Mettre à jour automatiquement

---

## 4. Balises Canonical

### Implémentation correcte
```html
<!-- Sur chaque page indexable -->
<link rel="canonical" href="https://www.example.com/page-exacte/" />
```

### Cas d'usage canonical
1. **Page accessible via plusieurs URLs** : `/produit?color=red` → canonical vers `/produit`
2. **Paramètres de tracking** : `/page?utm_source=newsletter` → canonical vers `/page`
3. **HTTP vs HTTPS** : `http://example.com/page` → canonical vers `https://example.com/page`
4. **Avec et sans www** : `example.com/page` → canonical vers `www.example.com/page`
5. **Pagination** : `/blog?page=2` → canonical vers **ELLE-MÊME** (pas vers page 1)
6. **Version mobile vs desktop** : `m.example.com/page` → canonical vers `www.example.com/page`
7. **Contenu syndiqué** : Le site republiant → canonical vers la source originale

### Erreurs canonical courantes
❌ Canonical pointant vers une page 404
❌ Canonical pointant vers une page redirigée
❌ Canonical pointant vers une page noindex
❌ Chaînes de canonicals (A→B→C)
❌ Canonical différent dans le sitemap et le HTML
❌ Canonical relatif au lieu d'absolu
❌ Pages très différentes se canonicalisant l'une vers l'autre

---

## 5. Redirections

### Types de redirections
*   **301 — Redirection permanente** : Transfert ~90-99% du PageRank. Utiliser pour : migration d'URL, suppression de page, changement de domaine.
*   **302 — Redirection temporaire** : Ne transfère PAS le PageRank à long terme. Utiliser pour : maintenance temporaire, tests A/B, redirection géographique.
*   **307 / 308** : Équivalents stricts pour les requêtes POST.
*   **Meta refresh / JavaScript redirect** : À ÉVITER pour le SEO (lent, pas fiable).

### Chaînes de redirections
*   **MAUVAIS** : A → B → C → D (chaîne de redirections)
*   **CORRIGER** : A → D, B → D, C → D (chaque URL pointe directement vers la finale)

**Règle** : Maximum 1 redirection entre l'URL source et la destination.

---

## 6. Sécurité & HTTPS

### Headers de sécurité bénéfiques pour le SEO
```http
Strict-Transport-Security: max-age=31536000; includeSubDomains
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
Content-Security-Policy: [adapté au site]
Referrer-Policy: strict-origin-when-cross-origin
```

---

## 7. Pages d'Erreur

### Page 404 optimisée
Une bonne page 404 :
✅ Design cohérent avec le reste du site
✅ Message clair ("page non trouvée")
✅ Barre de recherche
✅ Liens vers les pages principales
✅ Lien vers l'accueil
✅ Code HTTP 404 réel (pas un soft 404)

### Soft 404 (problème fréquent)
Un soft 404 = une page qui affiche un contenu d'erreur mais renvoie un code HTTP 200.
Google les détecte et les signale dans Search Console.
**Solution** : Renvoyer un vrai code 404 ou 410, ou rediriger 301 vers une page pertinente.
