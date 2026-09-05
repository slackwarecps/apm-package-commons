#!/bin/bash
# post-install.sh - Script de pós-instalação para copiar agentes Claude Code
# Uso: ./scripts/post-install.sh
# ou configure no seu package.json: "postinstall": "bash ./scripts/post-install.sh"

set -e

echo "🔧 APM Post-Install: Sincronizando agentes..."

# Encontrar o diretório raiz do projeto (aonde está apm.yml)
PROJECT_ROOT=$(pwd)

# Se estamos em apm_modules/, voltar para o projeto
if [[ "$PROJECT_ROOT" == *"apm_modules"* ]]; then
  PROJECT_ROOT=$(cd "$PROJECT_ROOT" && git rev-parse --show-toplevel 2>/dev/null || echo "$(pwd)/../..")
fi

# Diretório de agentes local
AGENTS_DIR="$PROJECT_ROOT/.agents"
mkdir -p "$AGENTS_DIR"

# Procurar por pacotes commons em apm_modules
if [ -d "$PROJECT_ROOT/apm_modules" ]; then
  echo "📦 Procurando por agentes em apm_modules..."

  # Copiar agentes de cada pacote que contém .agents/
  for package_dir in "$PROJECT_ROOT/apm_modules"/*/*/.agents 2>/dev/null; do
    if [ -d "$package_dir" ]; then
      package_name=$(basename $(dirname $(dirname "$package_dir")))
      echo "  ✅ Encontrado: $package_name"

      # Copiar arquivos .md (agentes)
      if ls "$package_dir"/*.md 1> /dev/null 2>&1; then
        cp "$package_dir"/*.md "$AGENTS_DIR/" 2>/dev/null || true
        echo "     → Agentes copiados para $AGENTS_DIR/"
      fi
    fi
  done

  echo "✨ Sincronização concluída!"
  ls -la "$AGENTS_DIR/" | grep -E "\.md$" || echo "   (nenhum agente encontrado)"
else
  echo "⚠️  Diretório apm_modules/ não encontrado"
  echo "   Execute primeiro: apm install"
fi

echo "🎯 Pronto! Agentes estão em .agents/"
