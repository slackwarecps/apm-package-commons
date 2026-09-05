# 📦 Guia de Instalação - Commons Package

## Instalação Completa (Skills + Agentes Encapsulados)

### Opção 1: Instalação Local (Recomendado para Desenvolvimento)

```bash
# No projeto que vai usar os componentes
cd ~/seu-projeto

# Inicializar APM com suporte a agent-skills e claude
apm init -y --target agent-skills,claude

# Instalar o pacote commons
apm install ../caminho/para/commons --target agent-skills,claude
```

**Pronto!** Todas as skills (incluindo agentes encapsulados) estão instaladas.

### Opção 2: Instalação via GitHub (quando publicado)

```bash
# Inicializar APM
apm init -y --target agent-skills,claude

# Instalar do GitHub
apm install owner/apm-package-commons --target agent-skills,claude
```

### Opção 3: Script All-in-One

```bash
bash ./commons/scripts/install-with-agents.sh ./commons
```

---

## Componentes Instalados

### ✅ Skills - Agentes Especializados
- `grill-me-agent/` → Entrevista técnica rigorosa (instalado como skill encapsulada)
- `bmad-agent-tech-lead/` → Marina, Tech Lead (instalado como skill encapsulada)

### ✅ Skills - Referência
- `engineering-standards/SKILL.md` → em `.claude/skills/` e `.agents/skills/`
- `example-skill/SKILL.md` → em `.claude/skills/` e `.agents/skills/`

**Nota:** A partir desta versão, o Grill-me e BMad Tech Lead são skills estruturadas (não agentes simples). Isso permite customização via `customize.toml` e melhor integração com o APM CLI.

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
