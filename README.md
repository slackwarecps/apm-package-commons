# Commons — pacote APM

Pacote com componentes comuns para agentes da Fabao Corp: agentes, skills e
servidores MCP.

## 🚀 Quick Start (Recomendado)

Instale o pacote **com agentes automaticamente**:

```bash
cd seu-projeto

# Opção 1: Script all-in-one (mais fácil)
bash ../commons/scripts/install-with-agents.sh ../commons

# Opção 2: Manual (mais controle)
apm init -y --target agent-skills,claude
apm install ../commons --target agent-skills,claude
bash ../commons/scripts/post-install.sh
```

Pronto! ✅ Agentes e skills instalados automaticamente.

---

## 1. Instalar o pacote pelo repositório GitHub

No projeto que receberá os componentes, inicialize o APM CLI com o target
desejado:

```bash
cd meu-projeto
apm init -y --target agent-skills,claude
```

Instale o pacote informando o repositório GitHub no formato `owner/repository`:

```bash
apm install slackwarecps/apm-package-commons --target agent-skills,claude

# Depois copie os agentes
bash ./scripts/post-install.sh
```

Para instalar para o GitHub Copilot:

```bash
apm install slackwarecps/apm-package-commons --target copilot
```

Para instalar nos dois targets:

```bash
apm init -y --target claude,copilot
apm install slackwarecps/apm-package-commons --target claude,copilot
```

Se o ambiente exigir autenticação SSH, acrescente `--ssh`:

```bash
apm install slackwarecps/apm-package-commons --target claude --ssh
```

O APM registra a dependência no projeto e baixa o conteúdo do pacote. Para
verificar os targets disponíveis, execute:

```bash
apm targets
```

## 2. Baixar o código-fonte para editar o pacote

Para desenvolver ou alterar este pacote, clone o repositório diretamente:

```bash
git clone git@github.com:slackwarecps/apm-package-commons.git
cd apm-package-commons
```

Edite os componentes nas pastas correspondentes:

```text
.agents/       agentes do pacote
skills/        skills do pacote
mcp/           servidores MCP do pacote
apm.yml        metadados do pacote
```

Depois de editar, valide as mudanças e publique uma nova versão no GitHub:

```bash
git diff --check
git add .
git commit -m "Describe the package change"
git push origin main
```

Para testar a cópia local em outro projeto antes de publicar:

```bash
cd ../meu-projeto
apm install ../apm-package-commons --target claude
```

## 📦 Componentes Inclusos

### Agentes

- **grill-me-agent** — Entrevista técnica rigorosa para validar planos, designs e arquitetura. Questiona intensamente com objetivo de melhorar propostas.

### Skills

- **bmad-agent-tech-lead** — Marina, o Tech Lead especializado em revisão de código, validação de arquitetura e mentoria de desenvolvedores. Use quando precisar de validação técnica, code reviews ou orientação arquitetural.

- **engineering-standards** — Padrões de engenharia da FabaoCorp para manter consistência técnica.

- **example-skill** — Skill de exemplo para referência.

### MCP Servers

- **example-server** — Servidor MCP placeholder (sem transporte configurado ainda).

---

## 🎯 Fluxo de Uso Recomendado

1. **Validar Arquitetura** → Use `grill-me-agent` para entrevista técnica
2. **Code Review** → Invoque a skill `bmad-agent-tech-lead` (Marina) para revisão
3. **Padronização** → Consulte `engineering-standards` para manter qualidade

---

## Metadados

- Nome: `commons`
- Versão: `1.0.0`
- Repositório: `git@github.com:slackwarecps/apm-package-commons.git`
- Última atualização: 2026-09-05
