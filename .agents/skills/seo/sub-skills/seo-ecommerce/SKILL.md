---
name: seo-ecommerce
description: "Sous-skill concernant le SEO spécifique aux boutiques en lignes (Catégories, Produits, Filtres)."
---

# SEO E-commerce — Référence Complète

Le trafic SEO sur un E-commerce se joue principalement sur les pages de **Collections/Catégories**.

## 1. Pages Catégorie / Collection
Ces pages rankent sur des mots-clés volumineux ("chaussures de running").
*   Faire une description de 150 à 300 mots au-dessus des produits pour expliquer la catégorie.
*   Inclure des H2 types "Comment choisir..." sous les produits.
*   Un maillage fort avec les sous-catégories et les guides d'achat du blog.

## 2. Pages Produit
Le plus grand piège du E-commerce : le copier-coller de la description fournisseur. Ceci entraîne du Content Duplicate massif.
*   Rédiger des descriptions 100% uniques (a minima sur les top 20% des produits générant 80% du CA).
*   URL unique.
*   Schema Markdown `Product`, `Offer`, `AggregateRating` impératifs.
*   Titre : `Nom Produit - Bénéfice Principal | Marque`

## 3. Navigation Facettée et Filtres
⚠️ Les filtres peuvent générer des milliers d'URLs vides/redondantes.
*   `Noindex` sur les combinaisons complexes (Ex: `?couleur=rouge&taille=41&marque=nike`).
*   Créer de **véritables landing pages statiques** pour les filtres très recherchés (Ex: `/chaussures-running-femme/` a lieu d'exister en tant que page avec sa propre balise Title et description, ce n'est pas juste un paramètre URL dynamique).

## 4. Gestion des Ruptures de Stock
*   Temporaire : Garder la page, afficher "Rupture", proposer d'être prévenu par mail.
*   Définitive : Redirection 301 vers le produit similaire le plus proche, ou à défaut vers la catégorie parente. Jamais de 404 pure si le produit générait du trafic !
