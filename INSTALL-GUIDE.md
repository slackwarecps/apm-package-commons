# 📦 Guia de Instalação - Commons Package

## Instalação Completa (Agentes + Skills)

### Opção 1: Instalação Local (Recomendado para Desenvolvimento)

```bash
# No projeto que vai usar os componentes
cd ~/seu-projeto

# Inicializar APM com suporte a agents e claude
apm init -y --target agent-skills,claude

# Instalar o pacote commons
apm install ../caminho/para/commons --target agent-skills,claude

# Copiar agentes manualmente (até APM v1.0 suportar)
cp ../commons/.agents/*.md .agents/ 2>/dev/null || mkdir -p .agents && cp ../commons/.agents/*.md .agents/
```

### Opção 2: Instalação via GitHub (quando publicado)

```bash
# Inicializar APM
apm init -y --target agent-skills,claude

# Instalar do GitHub
apm install owner/apm-package-commons --target agent-skills,claude

# Copiar agentes
curl -s https://raw.githubusercontent.com/owner/apm-package-commons/main/.agents/grill-me-agent.md > .agents/grill-me-agent.md
```

---

## Componentes Instalados

### ✅ Skills (via APM)
- `engineering-standards/SKILL.md` → em `.claude/skills/` e `.agents/skills/`
- `example-skill/SKILL.md` → em `.claude/skills/` e `.agents/skills/`

### ⚠️ Agentes (Cópia Manual)
- `grill-me-agent.md` → deve ser copiado para `.agents/`

**Nota:** O APM CLI v0.28.0 ainda não copia agentes Claude Code automaticamente. Isso será suportado em v1.0. Por enquanto, use `cp` ou `curl` para trazer os agentes.

---

## Verificar Instalação

```bash
# Verificar skills instaladas
ls -la .claude/skills/

# Verificar agentes
ls -la .agents/grill-me-agent.md

# Usar o agente Grill-me
claude-code --agent grill-me-agent
```

---

## Atualizar Componentes

```bash
# Atualizar dependências APM
apm update

# Re-copiar agentes (quando houver atualizações)
cp ../commons/.agents/*.md .agents/
```
