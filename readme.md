# 📋 SuperPowerAgentCreateur — Directives du Chat

> Ce fichier définit les règles et directives pour ce workspace.

---

## 🎯 Objectif

Ce workspace est géré par Antigravity (AI assistant). Toutes les actions doivent suivre les directives ci-dessous pour garantir qualité, traçabilité et rigueur.

---

## 📜 Règles fondamentales

### 1. Toujours consulter les Rules

Avant **chaque action** (développement, debugging, planification, review...), vérifier s'il existe une rule applicable dans `.agents/rules/`.

Ces 35 rules sont locales au workspace, générées à plat (pas de sous-dossiers). Chaque fichier complémentaire est préfixé par son skill parent (ex: `writing-skills-persuasion-principles.md`).

**Liste des 15 skills couverts (~70 fichiers au total) :**

| Skill | Fichiers | Quand l'utiliser |
|-------|----------|-----------------|
| `brainstorming` | 1 | Avant tout travail créatif — explorer les idées |
| `dispatching-parallel-agents` | 1 | 2+ tâches indépendantes à traiter en parallèle |
| `executing-plans` | 1 | Plan d'implémentation écrit à exécuter |
| `finishing-a-development-branch` | 1 | Implémentation terminée, intégrer le travail |
| `receiving-code-review` | 1 | Recevoir du feedback de code review |
| `requesting-code-review` | 2 | Demander des code reviews (+template reviewer) |
| `seo` | **34** | **🔍 SEO obligatoire pour tout site web** — 12 sous-skills, 6 agents, références, scripts |
| `subagent-driven-development` | 4 | Plan avec tâches indépendantes (+prompts) |
| `systematic-debugging` | 11 | Bug/comportement inattendu (+techniques, scripts) |
| `test-driven-development` | 2 | Avant d'écrire du code (+anti-patterns) |
| `using-git-worktrees` | 1 | Travail nécessitant isolation |
| `using-superpowers` | 1 | Début de conversation — trouver les skills |
| `verification-before-completion` | 1 | Avant de déclarer un travail terminé |
| `writing-plans` | 1 | Specs pour tâche multi-étapes |
| `writing-skills` | 6 | Créer/éditer des rules (+best practices, tests) |

### 2. Toujours mettre à jour memory.md

À **chaque message**, logger dans `memory.md` :
- La demande reçue
- Les actions effectuées
- Les fichiers créés/modifiés
- Les décisions prises

### 3. Toujours lire memory.md au début

Au début de chaque session ou nouveau message, **lire `memory.md`** pour avoir le contexte de ce qui a déjà été fait.

### 4. Vérification avant complétion

Ne jamais déclarer un travail terminé sans avoir vérifié concrètement le résultat (voir rule `verification-before-completion`).

### 5. Debug systématique

En cas de bug, suivre le processus systématique (voir rule `systematic-debugging`). Pas de fixes au hasard.

### 6. TDD quand applicable

Pour tout nouveau code, écrire le test d'abord, le regarder échouer, puis implémenter (voir rule `test-driven-development`).

---

## 🔄 The Basic Workflow (Obligatoire)

Ce workflow n'est pas une suggestion, c'est le **chemin de développement obligatoire**. Antigravity doit évaluer ces skills avant chaque tâche :

1. **`brainstorming`** — S'active avant d'écrire le moindre code. Affine les idées brutes via des questions, explore des alternatives, présente le design par sections pour validation. Sauvegarde le document de design.
1.5. **`seo`** — 🔍 **S'active automatiquement pour tout site web.** Identifie la niche/localité du client, recherche et analyse le concurrent #1 dans les SERPs, définit le plan SEO complet (architecture, mots-clés, schema, méta tags). 12 sous-skills : audit, technical, content (E-E-A-T), schema, sitemap, images, performance (Core Web Vitals/INP), GEO (AI Overviews), competitor pages, hreflang, programmatic SEO, planification.
2. **`using-git-worktrees`** — S'active après l'approbation du design. Crée un espace de travail isolé sur une nouvelle branche, lance le setup du projet, vérifie que les tests de base passent (clean baseline).
3. **`writing-plans`** — S'active avec le design approuvé. Découpe le travail en petites tâches (2-5 minutes chacune). Chaque tâche a des chemins de fichiers exacts, le code complet et les étapes de vérification.
4. **`subagent-driven-development`** ou **`executing-plans`** — S'active avec le plan complété. Soit on dispatche un nouveau sous-agent par tâche avec une double review (conformité spécifications puis qualité du code), soit on exécute par lots (batches) avec des points de contrôle humains.
5. **`test-driven-development`** — S'active pendant l'implémentation. Impose le RED-GREEN-REFACTOR : écrire un test qui échoue, le voir échouer, écrire le code minimal, le voir passer, commiter. **Le code écrit avant les tests doit être supprimé.**
6. **`requesting-code-review`** — S'active entre les tâches. Compare le travail avec le plan et signale les problèmes par sévérité. Les problèmes critiques bloquent la progression.
7. **`finishing-a-development-branch`** — S'active quand les tâches sont terminées. Vérifie les tests, présente les options (merge/PR/keep/discard) et nettoie le worktree.

---

## 📁 Structure

```
SuperPowerAgentCreateur/
├── readme.md              ← Ce fichier (directives)
├── memory.md              ← Journal de bord des actions
├── deploy-rules.sh        ← Script générateur
└── .agents/
    ├── workflows/
    │   └── the-basic-workflow.md
    └── skills/            ← 15 skills natifs Antigravity :
        ├── brainstorming/
        ├── systematic-debugging/
        ├── test-driven-development/
        ├── seo/               ← 🔍 SEO (basé sur claude-seo)
        │   ├── SKILL.md       ← Orchestrateur SEO-first
        │   ├── references/    ← CWV, E-E-A-T, schema, quality gates
        │   ├── agents/        ← 6 agents spécialisés
        │   ├── scripts/       ← Scripts Python utilitaires
        │   ├── schema/        ← Templates JSON-LD
        │   └── sub-skills/    ← 12 sous-skills spécialisés
        └── etc...
```

---

## 🚀 Système de Déploiement

Pour copier instantanément ces directives, le journal, et les skills superpowers dans n'importe quel autre Workspace, lancez cette commande à la racine :

```bash
bash <(curl -sL https://raw.githubusercontent.com/Volupik/SuperPowerAgentCreateur/main/deploy-rules.sh)
```

---

## ⚡ Workflow type

1. **Lire** `readme.md` + `memory.md`
2. **Vérifier** les rules applicables dans `~/.gemini/rules/`
3. **Exécuter** la tâche en suivant les rules
4. **Logger** dans `memory.md`
5. **Vérifier** le résultat avant de déclarer terminé

---

> Source des rules : [obra/superpowers](https://github.com/obra/superpowers)
> Source du skill SEO : [AgriciDaniel/claude-seo](https://github.com/AgriciDaniel/claude-seo)
