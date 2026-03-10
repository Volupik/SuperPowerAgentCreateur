---
name: seo-local
description: "Sous-skill ultra-important : SEO Local (Google Business Profile, NAP, Schema LocalBusiness, Pack Local)."
---

# SEO Local — Référence Complète (PRIORITÉ ABSOLUE)

Ce workspace ayant à **95% une approche locale**, cette section est la plus critique. Pour un artisan, un restaurant, un commerçant ou une agence locale, le trafic de proximité est bien plus précieux qu'un trafic national non qualifié.

## Table des matières
1. Google Business Profile — Optimisation Avancée
2. NAP Consistency (Name, Address, Phone)
3. Schema LocalBusiness
4. SEO Local — Pages de zones géographiques (Villes)
5. Pack Local (Map Pack) — Facteurs de ranking

---

## 1. Google Business Profile — Optimisation Complète

Le profil GBP (anciennement Google My Business) est la vitrine n°1 de l'entreprise locale.

### Checklist d'optimisation
□ Nom exact de l'entreprise (pas de keyword stuffing interdit par Google !)
□ Catégorie principale + catégories secondaires pertinentes
□ Adresse complète et cohérente avec le site web
□ Numéro de téléphone local
□ Horaires d'ouverture à jour
□ Description optimisée (750 caractères max)
□ Photos professionnelles (logo, devanture, intérieur, membres de l'équipe, réalisations)
□ Attributs complétés (ex: "Parking", "Accès handicapé", etc.)
□ Services et produits listés systématiquement.

### Posts Google Business
*   Publier 1-2 fois par semaine minimum (Offres, Événements, Articles de blog).
*   Mots-clés locaux dans le texte + CTA clair.

### Gestion des avis
*   **Répondre à TOUS les avis** (positifs comme négatifs) de manière personnalisée.
*   Le volume, la note et la récence des avis agissent comme un signal de classement massif pour la Google Map.

---

## 2. NAP Consistency (Name, Address, Phone)

Littéralement "Nom, Adresse, Téléphone".
**Le NAP doit être strictement identique PARTOUT** : site web (footer/header), Google Business, annuaires locaux (Yelp, Pages Jaunes, Tripadvisor, Chambre de Commerce, etc.), réseaux sociaux.
Une seule incohérence (ex: "Rue de Paris" vs "R. de Paris") peut diluer les signaux de confiance locaux.

---

## 3. Schema LocalBusiness

Toutes les pages locales (ou a minima la page d'accueil et contact pour un business d'une seule ville) doivent inclure le markup JSON-LD de `LocalBusiness`. Ex : 

```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Nom de l'entreprise",
  "image": "https://example.com/photo.webp",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "123 Rue Exemple",
    "addressLocality": "Paris",
    "postalCode": "75001",
    "addressCountry": "FR"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": 48.8566,
    "longitude": 2.3522
  },
  "telephone": "+33-1-23-45-67-89",
  "openingHoursSpecification": [
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
      "opens": "09:00",
      "closes": "18:00"
    }
  ],
  "url": "https://example.com"
}
```
*Note: Il existe des sous-types plus précis que LocalBusiness (ex: `Restaurant`, `Plumber`, `Dentist`, `RealEstateAgent`). Utilisez le plus précis possible.*

---

## 4. SEO Local — Pages de zones géographiques

Si l'entreprise intervient sur plusieurs villes avec un ciblage spécifique :
Créer une structure d'URL du type :
*   `/service/plombier-paris/`
*   `/service/plombier-lyon/`

**⚠️ REGLE D'OR SUR LE CONTENU DES PAGES LOCALES :**
**Ne JAMAIS dupliquer le même contenu en changeant juste le nom de la ville !** Google détectera des "doorway pages" et n'indexera pas la page.

**Chaque page locale doit contenir :**
□ Un H1 unique : `[Service] à [Ville] — [USP]`
□ **Contenu RÉELLEMENT unique de 500+ mots** (parler des particularités de la zone, du contexte urbain, d'interventions réelles réalisées dans tel ou tel quartier).
□ NAP + Google Maps Embed (iframe) de la zone couverte.
□ Avis clients locaux spécifiques à cette zone.
□ Photos d'intervention dans la ville en question.
□ Schema LocalBusiness (pouvant lister un ServiceArea si c'est un artisan mobile).

---

## 5. Pack Local (Map Pack) — Facteurs de ranking

Ce qui classe une entreprise dans les "3 premiers résultats" de la Map sur Google :
1. **Pertinence** : La catégorie Google Business correspond-elle / le site web répond-il bien au besoin local ?
2. **Distance** : La proximité géographique avec l'utilisateur ou la ville tapée dans la recherche.
3. **Proéminence** : Notoriété offline et online (Citations NAP, Backlinks locaux presse/associations).
