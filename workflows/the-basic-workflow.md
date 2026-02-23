---
description: Le chemin de développement obligatoire pour toute fonctionnalité
---
1. **`brainstorming`** — S'active avant d'écrire le moindre code. Affine les idées brutes via des questions, explore des alternatives, présente le design par sections pour validation. Sauvegarde le document de design.
2. **`using-git-worktrees`** — S'active après l'approbation du design. Crée un espace de travail isolé sur une nouvelle branche, lance le setup du projet, vérifie que les tests de base passent (clean baseline).
3. **`writing-plans`** — S'active avec le design approuvé. Découpe le travail en petites tâches (2-5 minutes chacune). Chaque tâche a des chemins de fichiers exacts, le code complet et les étapes de vérification.
4. **`subagent-driven-development`** ou **`executing-plans`** — S'active avec le plan complété. Soit on dispatche un nouveau sous-agent par tâche avec une double review (conformité spécifications puis qualité du code), soit on exécute par lots (batches) avec des points de contrôle humains.
5. **`test-driven-development`** — S'active pendant l'implémentation. Impose le RED-GREEN-REFACTOR : écrire un test qui échoue, le voir échouer, écrire le code minimal, le voir passer, commiter. **Le code écrit avant les tests doit être supprimé.**
6. **`requesting-code-review`** — S'active entre les tâches. Compare le travail avec le plan et signale les problèmes par sévérité. Les problèmes critiques bloquent la progression.
7. **`finishing-a-development-branch`** — S'active quand les tâches sont terminées. Vérifie les tests, présente les options (merge/PR/keep/discard) et nettoie le worktree.