# 📋 SuperPowerAgentCreateur — Directives du Chat

> Ce fichier définit les règles et directives pour ce workspace.

---

## 🎯 Objectif

Ce workspace est géré par Antigravity (AI assistant). Toutes les actions doivent suivre les directives ci-dessous pour garantir qualité, traçabilité et rigueur.

---

## ⚠️ Configuration Initale Obligatoire (Customize > Workspace)

Pour que Antigravity comprenne ce système "Superpowers", vous **devez absolument copier/coller cette phrase exacte** dans votre interface Antigravity (`Customize > Workspace > Rules`) :

> **Avant de commencer la moindre tâche, vous DEVEZ lire le workflow dans `.agents/workflows/the-basic-workflow.md` et utiliser nos skills d'ingénierie avancée locaux situés dans `.agents/skills/`.**

*Note : Cette phrase indique à l'IA d'utiliser nativement les dossiers de skills sans avoir besoin de saturer la limite de 12k caractères.*

---

## 📜 Règles fondamentales

### 1. Toujours consulter les Skills

Avant **chaque action** (développement, debugging, planification, review...), l'IA doit vérifier s'il existe une skill applicable dans `.agents/skills/`.

Ces 14 skills sont chargées de manière native (au format dossier avec `SKILL.md`). L'IA les parcourt en arrière-plan.

**Liste des 14 skills utilisés :**

| Skill | Quand l'utiliser |
|-------|-----------------|
| `brainstorming` | Avant tout travail créatif — explorer les idées |
| `dispatching-parallel-agents` | 2+ tâches indépendantes à traiter en parallèle |
| `executing-plans` | Plan d'implémentation écrit à exécuter |
| `finishing-a-development-branch` | Implémentation terminée, intégrer le travail |
| `receiving-code-review` | Recevoir du feedback de code review |
| `requesting-code-review` | Demander des code reviews (+template reviewer) |
| `subagent-driven-development` | Plan avec tâches indépendantes (+prompts) |
| `systematic-debugging` | Bug/comportement inattendu (+techniques, scripts) |
| `test-driven-development` | Avant d'écrire du code (+anti-patterns) |
| `using-git-worktrees` | Travail nécessitant isolation |
| `using-superpowers` | Début de conversation — trouver les skills |
| `verification-before-completion` | Avant de déclarer un travail terminé |
| `writing-plans` | Specs pour tâche multi-étapes |
| `writing-skills` | Créer/éditer des rules (+best practices, tests) |

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
    └── skills/            ← Dossiers natifs gérés par l'IA en back-end
        ├── brainstorming/
        ├── requesting-code-review/
        ├── systematic-debugging/
        └── etc...
```

---

## 🚀 Système de Déploiement

Pour copier instantanément ces directives, le journal, les workflows et les skills superpowers dans n'importe quel autre Workspace, lancez cette commande à la racine :

```bash
bash <(curl -sL https://raw.githubusercontent.com/Volupik/SuperPowerAgentCreateur/main/deploy-rules.sh)
```

---

> Source des skills : [obra/superpowers](https://github.com/obra/superpowers)