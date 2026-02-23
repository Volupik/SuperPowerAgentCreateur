#!/usr/bin/env bash
# Script pour déployer tous les skills superpowers en rules plates dans un workspace
# Usage normal via lien : bash <(curl -sL https://ton-lien-gist/deploy-rules.sh)

TARGET_DIR=".agents/rules"
echo "🚀 Nettoyage de l'ancien dossier s'il existe..."
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

TMP_DIR=$(mktemp -d)
echo "📥 Clonage du repository obra/superpowers..."
git clone --depth 1 https://github.com/obra/superpowers.git "$TMP_DIR" > /dev/null 2>&1

echo "⚙️  Génération des rules à plat..."
for SKILL_DIR in "$TMP_DIR"/skills/*; do
  if [ -d "$SKILL_DIR" ]; then
    SKILL_NAME=$(basename "$SKILL_DIR")
    for FILE in "$SKILL_DIR"/*; do
      if [ -f "$FILE" ]; then
        FILE_NAME=$(basename "$FILE")
        # Si c'est le SKILL.md principal, on le nomme juste avec le nom du skill
        if [ "$FILE_NAME" == "SKILL.md" ]; then
          TARGET_FILE="$TARGET_DIR/${SKILL_NAME}.md"
          # On ajoute un titre clair en haut du fichier pour savoir d'où ça vient
          echo "# Rule: ${SKILL_NAME}" > "$TARGET_FILE"
          echo "" >> "$TARGET_FILE"
          cat "$FILE" >> "$TARGET_FILE"
        else
          # Extraire l'extension
          EXTENSION="${FILE_NAME##*.}"
          BASENAME="${FILE_NAME%.*}"
          
          # Pour les dossiers qui ont d'autres fichiers (ex: scripts, tests)
          # On change l'extension en .md pour qu'Antigravity le lise
          TARGET_FILE="$TARGET_DIR/${SKILL_NAME}-${BASENAME}.md"
          
          echo "# Rule Complement: ${SKILL_NAME} - ${FILE_NAME}" > "$TARGET_FILE"
          echo "" >> "$TARGET_FILE"
          
          if [ "$EXTENSION" != "md" ]; then
            echo "\`\`\`${EXTENSION}" >> "$TARGET_FILE"
            cat "$FILE" >> "$TARGET_FILE"
            echo "\`\`\`" >> "$TARGET_FILE"
          else
            cat "$FILE" >> "$TARGET_FILE"
          fi
        fi
      fi
    done
    
    # Gérer les sous-dossiers (comme le dossier examples/ dans writing-skills)
    for SUBDIR in "$SKILL_DIR"/*; do
      if [ -d "$SUBDIR" ]; then
        SUBDIR_NAME=$(basename "$SUBDIR")
        for FILE in "$SUBDIR"/*; do
          if [ -f "$FILE" ]; then
            FILE_NAME=$(basename "$FILE")
            EXTENSION="${FILE_NAME##*.}"
            BASENAME="${FILE_NAME%.*}"
            
            TARGET_FILE="$TARGET_DIR/${SKILL_NAME}-${SUBDIR_NAME}-${BASENAME}.md"
            echo "# Rule Complement: ${SKILL_NAME} - ${SUBDIR_NAME}/${FILE_NAME}" > "$TARGET_FILE"
            echo "" >> "$TARGET_FILE"
            if [ "$EXTENSION" != "md" ]; then
              echo "\`\`\`${EXTENSION}" >> "$TARGET_FILE"
              cat "$FILE" >> "$TARGET_FILE"
              echo "\`\`\`" >> "$TARGET_FILE"
            else
              cat "$FILE" >> "$TARGET_FILE"
            fi
          fi
        done
      fi
    done
  fi
done

rm -rf "$TMP_DIR"

WF_DIR=".agents/workflows"
echo "📥 Téléchargement des Workflows standards..."
mkdir -p "$WF_DIR"
curl -sL https://raw.githubusercontent.com/Volupik/antigravity-workspace-rules/main/workflows/the-basic-workflow.md -o "$WF_DIR/the-basic-workflow.md"

echo "✅ Fait ! $(ls \"$TARGET_DIR\" | wc -l | tr -d ' ') rules créées dans $TARGET_DIR/ et The Basic Workflow ajouté dans $WF_DIR/"
echo "Redémarrez Antigravity ou ouvrez l'interface Customize > Workspace pour les voir."
