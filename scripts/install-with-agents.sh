#!/bin/bash
# install-with-agents.sh - Instala pacote commons + copia agentes automaticamente
# Uso: bash ./scripts/install-with-agents.sh

set -e

COMMONS_PATH="${1:-.}"
TARGET="${2:-agent-skills,claude}"

echo "🚀 Iniciando instalação do commons com agentes..."
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

# 3. Copiar agentes
echo "🔧 Copiando agentes..."
mkdir -p .agents

# Copiar agentes diretamente do source
if [ -d "$COMMONS_PATH/.agents" ]; then
  cp "$COMMONS_PATH/.agents"/*.md .agents/ 2>/dev/null || true
  echo "✅ Agentes copiados de $COMMONS_PATH"
fi

# Ou de apm_modules se instalados
if [ -d "apm_modules" ]; then
  find apm_modules -path "*/.agents/*.md" -exec cp {} .agents/ \; 2>/dev/null || true
  echo "✅ Agentes sincronizados de apm_modules"
fi

echo ""
echo "✨ Instalação completa!"
echo "📋 Componentes instalados:"
echo "   Skills: .claude/skills/"
ls -1 .claude/skills/ 2>/dev/null | sed 's/^/     - /' || echo "     (nenhuma)"
echo "   Agentes: .agents/"
ls -1 .agents/*.md 2>/dev/null | sed 's/^/     - /' || echo "     (nenhum)"
echo ""
echo "🎯 Próximos passos:"
echo "   - Usar skill: apm run [script-name]"
echo "   - Usar agente: claude-code --agent grill-me-agent"
