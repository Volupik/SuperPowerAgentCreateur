#!/usr/bin/env bash
# Script pour déployer tous les skills superpowers en rules plates dans un workspace
# Usage normal via lien : bash <(curl -sL https://raw.githubusercontent.com/Volupik/SuperPowerAgentCreateur/main/deploy-rules.sh)

TARGET_DIR=".agents/skills"
echo "🚀 Nettoyage de l'ancien dossier s'il existe..."
rm -rf "$TARGET_DIR"
rm -rf ".agents/rules" # Clean up the old flattened rules if they exist
mkdir -p "$TARGET_DIR"

TMP_DIR=$(mktemp -d)
echo "📥 Clonage du repository obra/superpowers..."
git clone --depth 1 https://github.com/obra/superpowers.git "$TMP_DIR" > /dev/null 2>&1

echo "⚙️  Installation des skills natifs Antigravity..."
# We just copy the folders directly! Antigravity natively supports SKILL.md inside folders
cp -r "$TMP_DIR"/skills/* "$TARGET_DIR"/

rm -rf "$TMP_DIR"

# === SEO Skills (from AgriciDaniel/claude-seo) ===
SEO_TMP=$(mktemp -d)
echo "🔍 Clonage du repository claude-seo..."
git clone --depth 1 https://github.com/AgriciDaniel/claude-seo.git "$SEO_TMP" > /dev/null 2>&1

SEO_DIR="$TARGET_DIR/seo"
mkdir -p "$SEO_DIR/references" "$SEO_DIR/agents" "$SEO_DIR/scripts" "$SEO_DIR/schema" "$SEO_DIR/sub-skills"

# Copy custom SKILL.md from our repo (includes niche/locality identification + competitor analysis)
curl -sL https://raw.githubusercontent.com/Volupik/SuperPowerAgentCreateur/main/.agents/skills/seo/SKILL.md -o "$SEO_DIR/SKILL.md"

# Copy references, agents, scripts, schema from claude-seo
cp "$SEO_TMP"/seo/references/* "$SEO_DIR/references/" 2>/dev/null
cp "$SEO_TMP"/agents/* "$SEO_DIR/agents/" 2>/dev/null
cp "$SEO_TMP"/scripts/* "$SEO_DIR/scripts/" 2>/dev/null
cp "$SEO_TMP"/schema/* "$SEO_DIR/schema/" 2>/dev/null

# Copy sub-skills
cp -r "$SEO_TMP"/skills/* "$SEO_DIR/sub-skills/" 2>/dev/null

rm -rf "$SEO_TMP"
echo "🔍 SEO skill installé avec $(find "$SEO_DIR" -type f | wc -l | tr -d ' ') fichiers"

WF_DIR=".agents/workflows"
echo "📥 Téléchargement du Workflow standard..."
mkdir -p "$WF_DIR"
curl -sL https://raw.githubusercontent.com/Volupik/SuperPowerAgentCreateur/main/.agents/workflows/the-basic-workflow.md -o "$WF_DIR/the-basic-workflow.md"

echo "📄 Création de memory.md et README.md..."
if [ ! -f "memory.md" ]; then
  curl -sL https://raw.githubusercontent.com/Volupik/SuperPowerAgentCreateur/main/memory.md -o memory.md
fi

if [ ! -f "readme.md" ]; then
  curl -sL https://raw.githubusercontent.com/Volupik/SuperPowerAgentCreateur/main/readme.md -o readme.md
fi

echo "✅ Fait ! $(ls "$TARGET_DIR" | wc -l | tr -d ' ') rules créées dans $TARGET_DIR/ et The Basic Workflow ajouté dans $WF_DIR/"
echo "Les fichiers readme et memory ont été vérifiés/initialisés !"
echo "Redémarrez Antigravity ou ouvrez l'interface Customize > Workspace pour les voir."
