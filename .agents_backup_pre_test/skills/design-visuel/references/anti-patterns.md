# Design Visuel — Anti-Patterns (Ce qui est INTERDIT)

Ce document liste les pratiques visuelles formellement interdites car elles signalent immédiatement un design générique, paresseux, ou "AI-generated" (AI slop). L'agent de design doit s'assurer qu'aucun de ces éléments n'est présent dans le code final.

## 🛑 1. Emojis Décoratifs (Le Péché Capital)
**INTERDIT :** L'utilisation d'emojis Unicode (✅, 🚀, ⭐, 💻, 📈, etc.) pour illustrer des listes de fonctionnalités, des cards de services, ou des boutons.
**REMPLACEMENT OBLIGATOIRE :** Utiliser des icônes SVG inline provenant d'une bibliothèque professionnelle (voir `icon-libraries.md`).

## 🛑 2. Polices Web "Par Défaut"
**INTERDIT :** L'utilisation de polices vues mille fois sans direction réfléchie, particulièrement pour les titres (H1-H3).
- `Inter`, `Roboto`, `Open Sans`, `Arial`, `Helvetica`
- `Poppins` (terriblement cliché pour l'IA)
**REMPLACEMENT OBLIGATOIRE :** Utiliser des polices "Display" avec du caractère (Outfit, Space Grotesk, Bricolage Grotesque, Playfair Display, etc.) pour les titres. Limiter les polices neutres au seul texte de paragraphe.

## 🛑 3. Les Gradients "AI Slop"
**INTERDIT :** Les dégradés violet/bleu (ex: `from-purple-600 to-blue-500`) sur fond blanc, très typiques des premiers sites générés par ChatGPT.
**REMPLACEMENT OBLIGATOIRE :** Utiliser des palettes réfléchies (HSL), basées sur l'image de marque du client. Préférer des gradients asymétriques, très subtils, ou des teintes monochromes profondes.

## 🛑 4. Cards Répétées à l'Infini
**INTERDIT :** Les grilles de 3, 6 ou 9 "cards" identiques (même icône centrée, même taille de titre, fond gris clair) qui ne transmettent aucune hiérarchie.
**REMPLACEMENT OBLIGATOIRE :** Varier les layouts. Utiliser des grilles bento, ajouter des borders colorées spécifiques, varier les backgrounds, ou utiliser des listes asymétriques.

## 🛑 5. Fonds "Plats" et Vides
**INTERDIT :** De vastes sections de couleur unie pure (ex: `#FFFFFF` absolu, ou gris très plat `#F3F4F6`), créant un rendu amateur et vide.
**REMPLACEMENT OBLIGATOIRE :** Créer de l'atmosphère. Ajouter de subtiles textures par CSS (noise, grain), des dot patterns (SVG répétitif), ou des gradients mesh en arrière-plan (blur > 100px).

## 🛑 6. Boutons Sur-Animés (ou Totalement Statiques)
**INTERDIT :** Les boutons avec un hover effect "pulse" infini qui tourne en boucle, ou à l'inverse, des boutons sans aucun retour visuel au survol ou au clic.
**REMPLACEMENT OBLIGATOIRE :** Un feedback net et immédiat : changement de scale (0.97), modification subtile du background (darken/lighten), légère translation Y, et modification du shadow. Interaction rapide (150-200ms).

## 🛑 7. Typographie Molle
**INTERDIT :** Les titres H1/H2 avec un `line-height` trop grand (1.5) qui dilue l'impact visuel, ou un contraste trop faible (gris moyen sur gris clair).
**REMPLACEMENT OBLIGATOIRE :** `line-height: 1.1` ou `1.2` (tight leading) pour les titres. Utilisation du contraste complet (texte sombre/fort sur fond clair, ou blanc pur sur fond sombre).

## 🛑 8. Composants Tailwind "Stock" Non Modifiés
**INTERDIT :** Copier-coller des composants Tailwind UI gratuits ou Flowbite sans changer le border-radius, les ombres, ou les espacements pour qu'ils matchent le design system global du projet.
**REMPLACEMENT OBLIGATOIRE :** Assurer la cohérence. Si le site a un `rounded-xl` et aucune ombre pour ses cards, la modale de contact ne doit pas soudainement avoir un `rounded-sm` et une `shadow-lg` noire immense.
