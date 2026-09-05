#!/bin/bash
# install-with-agents.sh - Instala pacote commons com skills e agentes
# Uso: bash ./scripts/install-with-agents.sh

set -e

COMMONS_PATH="${1:-.}"
TARGET="${2:-agent-skills,claude}"

echo "🚀 Iniciando instalação do commons..."
echo "   Pacote: $COMMONS_PATH"
echo "   Targets: $TARGET"
echo ""

# 1. Inicializar APM se não tiver
if [ ! -f "apm.yml" ]; then
  echo "📝 Inicializando APM..."
  apm init -y --target "$TARGET"
fi

# 2. Instalar dependências
echo "📦 Instalando dependências APM..."
apm install "$COMMONS_PATH" --target "$TARGET"

echo ""
echo "✨ Instalação completa!"
echo "📋 Componentes instalados:"
echo "   Skills: .claude/skills/ e .agents/skills/"
ls -1 .claude/skills/ 2>/dev/null | sed 's/^/     - /' || echo "     (nenhuma)"
echo ""
echo "🎯 Próximos passos:"
echo "   - Usar skill: /grill-me-agent (entrevista técnica)"
echo "   - Usar skill: /bmad-agent-tech-lead (Marina - code review)"
echo "   - Ver skills: ls -la .claude/skills/"
