# Commons — Pacote APM v1.0.0

**Especialistas técnicos para validação arquitetural, code review e padrões de engenharia.**

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/slackwarecps/apm-package-commons)
[![License](https://img.shields.io/badge/license-UNLICENSED-red.svg)](LICENSE)
[![APM CLI](https://img.shields.io/badge/APM-0.28.0+-green.svg)](https://microsoft.github.io/apm)

---

## 🚀 Quick Start

Instale o pacote commons em 3 linhas:

```bash
cd seu-projeto
apm init -y --target agent-skills,claude
apm install slackwarecps/apm-package-commons --target agent-skills,claude
```

Pronto! ✅ 4 skills especializadas estão disponíveis.

---

## 📦 O Que Você Ganha

### 🔥 Grill-me — Entrevista Técnica Rigorosa
Questiona intensamente planos, designs e propostas de arquitetura com objetivo de **afiar o pensamento**, não destruir a ideia.

- ✅ 8 dimensões de análise (Problema, Alternativas, Arquitetura, Resiliência, Segurança, Implementação, Operação, Custo)
- ✅ Perguntas incisivas e construtivas
- ✅ Sumário de findings com scores (1-5)

**Use quando:** Planejando arquitetura, refatoração, escolha tecnológica, deployment, segurança

### 👨‍💼 Marina — Tech Lead (bmad-agent-tech-lead)
Especialista em revisão de código, validação de arquitetura e mentoria de desenvolvedores.

- ✅ Code review profundo
- ✅ Orientação arquitetural
- ✅ Mentoring com foco em crescimento

**Use quando:** Code reviews, design patterns, evolução de sistema, desenvolvimento de juniors

### 📚 Engineering Standards
Padrões de engenharia da Fabao Corp para manter consistência técnica em todo o projeto.

- ✅ Convenções de código
- ✅ Patterns recomendados
- ✅ Best practices

---

## 📋 Exemplos de Uso

### Validar Arquitetura de Microserviços
```
Você: "Estou planejando migrar para microserviços"
/grill-me-agent

Grill-me: "Qual é o problema específico que o monólito tem agora?
          Vocês consideraram alternativas? Como vão lidar com transações distribuídas?"
```

### Code Review
```
Você: "Revisa meu código de autenticação"
/bmad-agent-tech-lead

Marina: "Ótimo código. Alguns pontos: 
         - Considerar mTLS para serviços internos
         - Adicionar rate limiting
         - Documentar flow de refresh token"
```

### Validar Padrões
```
Você: "Qual é o padrão de erro esperado?"
/engineering-standards

Standards: "Seguimos [padrão X] que define:
           - Response status codes
           - Error response format
           - Logging requirements"
```

---

## 🔧 Instalação

### Local (Desenvolvimento)

```bash
# Clonar o repositório
git clone git@github.com:slackwarecps/apm-package-commons.git
cd apm-package-commons

# No seu projeto, instalar do caminho local
cd ~/seu-projeto
apm init -y --target agent-skills,claude
apm install ../caminho/para/commons --target agent-skills,claude
```

### Via GitHub (Recomendado)

```bash
# Inicializar APM
apm init -y --target agent-skills,claude

# Instalar o pacote
apm install slackwarecps/apm-package-commons --target agent-skills,claude
```

### Para Copilot

```bash
apm install slackwarecps/apm-package-commons --target copilot
```

### Multiple Targets

```bash
apm init -y --target agent-skills,claude,copilot
apm install slackwarecps/apm-package-commons --target agent-skills,claude,copilot
```

---

## 📚 Documentação Completa

Cada skill tem documentação detalhada:

### Grill-me Agent
- `SKILL.md` — Instruções completas e 8 dimensões de análise
- `EXEMPLOS.md` — 4 exemplos reais de uso
- `WORKFLOWS.md` — 6 workflows diferentes
- `customize.toml` — Customização de persona

```bash
cat .claude/skills/grill-me-agent/EXEMPLOS.md      # Ver exemplos
cat .claude/skills/grill-me-agent/WORKFLOWS.md      # Ver workflows
```

### BMad Tech Lead (Marina)
- `SKILL.md` — Sistema de revisão e mentoria
- `README.md` — Documentação
- `EXEMPLOS.md` — Casos de uso
- `WORKFLOWS.md` — Fluxos de interação
- `customize.toml` — Customização

---

## 🛠️ Desenvolvimento

### Estrutura do Pacote

```
.
├── skills/
│   ├── grill-me-agent/          # Entrevista técnica
│   │   ├── SKILL.md
│   │   ├── README.md
│   │   ├── EXEMPLOS.md
│   │   ├── WORKFLOWS.md
│   │   └── customize.toml
│   │
│   ├── bmad-agent-tech-lead/    # Tech Lead
│   │   ├── SKILL.md
│   │   ├── README.md
│   │   ├── EXEMPLOS.md
│   │   ├── WORKFLOWS.md
│   │   └── customize.toml
│   │
│   ├── engineering-standards/   # Padrões
│   └── example-skill/           # Exemplo
│
├── scripts/
│   └── install-with-agents.sh   # Script de instalação
│
├── apm.yml                      # Metadados do pacote
├── README.md                    # Documentação
└── INSTALL-GUIDE.md             # Guia detalhado de instalação
```

### Editar o Pacote

1. **Clone o repositório:**
   ```bash
   git clone git@github.com:slackwarecps/apm-package-commons.git
   cd apm-package-commons
   ```

2. **Edite os componentes:**
   ```bash
   # Editar skill
   vim skills/grill-me-agent/SKILL.md
   
   # Editar exemplos
   vim skills/grill-me-agent/EXEMPLOS.md
   ```

3. **Valide e publique:**
   ```bash
   git add .
   git commit -m "✨ description of changes"
   git push origin main
   ```

4. **Teste localmente antes:**
   ```bash
   cd ~/seu-projeto
   apm install ../apm-package-commons --target agent-skills,claude
   ```

---

## 📊 Componentes

| Skill | Tipo | Descrição | Modelo |
|-------|------|-----------|--------|
| **grill-me-agent** | 🔥 Agente | Entrevista técnica rigorosa | Configurable |
| **bmad-agent-tech-lead** | 👨‍💼 Agente | Marina - Tech Lead specialista | Opus 5 |
| **engineering-standards** | 📚 Referência | Padrões de engenharia FabaoCorp | - |
| **example-skill** | 📖 Exemplo | Skill de exemplo | - |

---

## 🎯 Casos de Uso

| Situação | Skill |
|----------|-------|
| Validar arquitetura | 🔥 Grill-me |
| Revisar código | 👨‍💼 Marina |
| Code review profundo | 👨‍💼 Marina |
| Mentoring | 👨‍💼 Marina |
| Padrões de projeto | 📚 Standards |
| Decisões técnicas | 🔥 Grill-me |
| Migração de sistema | 🔥 Grill-me |
| Escolha tecnológica | 🔥 Grill-me |

---

## 🔐 Customização

Cada skill permite customização via `customize.toml`:

```bash
# Time customizations
mkdir -p .bmad/custom
cp skills/grill-me-agent/customize.toml .bmad/custom/grill-me-agent.toml
# Edite conforme necessário
```

---

## 📝 Changelog

### v1.0.0 (2026-09-05)
- ✅ Grill-me como skill estruturada
- ✅ BMad Tech Lead (Marina) integrado
- ✅ Engineering Standards
- ✅ Documentação completa (EXEMPLOS, WORKFLOWS)
- ✅ Scripts de instalação automática
- ✅ Customização via TOML

---

## 📞 Suporte

- 📚 Documentação: `/skills/[skill-name]/README.md`
- 🎯 Exemplos: `/skills/[skill-name]/EXEMPLOS.md`
- 🔧 Workflows: `/skills/[skill-name]/WORKFLOWS.md`
- 🐛 Issues: https://github.com/slackwarecps/apm-package-commons/issues

---

## 📄 Licença

UNLICENSED — Uso restrito a Fabão Corp

---

## 🚀 Pronto para Usar!

```bash
apm install slackwarecps/apm-package-commons --target agent-skills,claude
/grill-me-agent
```

**Bem-vindo ao futuro da validação técnica!** 🎉

---

**v1.0.0** | [GitHub](https://github.com/slackwarecps/apm-package-commons) | Fabão Corp
