#!/usr/bin/env bash
# Script pour déployer tous les skills superpowers en rules plates dans un workspace
# Usage normal via lien : bash <(curl -sL https://raw.githubusercontent.com/Volupik/SuperPowerAgentCreateur/main/deploy-rules.sh)

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

# Split large files (> 11500 bytes)
echo "✂️  Vérification de la taille des fichiers (limite Antigravity à 12k caractères)..."
python3 -c "
import os, glob

target_dir = '$TARGET_DIR'
max_chars = 11500

for file_path in glob.glob(os.path.join(target_dir, '*.md')):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    if len(content) > max_chars:
        print(f'Découpage de {os.path.basename(file_path)}...')
        part = 1
        start = 0
        while start < len(content):
            end = start + max_chars
            if end < len(content):
                last_newline = content.rfind('\n', start, end)
                if last_newline != -1 and last_newline > start + (max_chars // 2):
                    end = last_newline
            
            chunk = content[start:end]
            part_name = f\"{file_path[:-3]}-pt{part}.md\"
            with open(part_name, 'w', encoding='utf-8') as out:
                # Add a mention of the part for context
                if part > 1:
                    out.write(f'# Suite de la rule {os.path.basename(file_path)}\n\n')
                out.write(chunk)
            
            start = end
            part += 1
        os.remove(file_path)
"

rm -rf "$TMP_DIR"

WF_DIR=".agents/workflows"
echo "📥 Téléchargement du Workflow standard..."
mkdir -p "$WF_DIR"
curl -sL https://raw.githubusercontent.com/Volupik/SuperPowerAgentCreateur/main/workflows/the-basic-workflow.md -o "$WF_DIR/the-basic-workflow.md"

echo "📄 Création de memory.md et README.md..."
if [ ! -f "memory.md" ]; then
  curl -sL https://raw.githubusercontent.com/Volupik/SuperPowerAgentCreateur/main/memory.md -o memory.md
fi

if [ ! -f "readme.md" ]; then
  curl -sL https://raw.githubusercontent.com/Volupik/SuperPowerAgentCreateur/main/readme.md -o readme.md
fi

echo "✅ Fait ! $(ls \"$TARGET_DIR\" | wc -l | tr -d ' ') rules créées dans $TARGET_DIR/ et The Basic Workflow ajouté dans $WF_DIR/"
echo "Les fichiers readme et memory ont été vérifiés/initialisés !"
echo "Redémarrez Antigravity ou ouvrez l'interface Customize > Workspace pour les voir."