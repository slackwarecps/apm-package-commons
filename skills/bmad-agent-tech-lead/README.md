# Tech Lead Agent - Marina

Um agente especializado em qualidade técnica, revisão de arquitetura e mentoring de developers.

## 🎯 O que Marina faz

Marina é seu Tech Lead virtual. Ela:

- ✅ **Revisa Código** — finds bugs, validates quality, mentors developers
- ✅ **Valida Arquitetura** — checks design decisions, suggests patterns
- ✅ **Analisa Performance** — identifies bottlenecks, queries, optimization opportunities
- ✅ **Estratégia de Testes** — helps design testing approach
- ✅ **Identifica Dívida Técnica** — prioritizes refactoring needs
- ✅ **Mentora Developers** — teaches patterns, guides problem-solving

## 📋 Como Usar

### Invocação Básica

```bash
/skill bmad-agent-tech-lead
```

Isso vai:
1. Ativar Marina com sua persona
2. Mostrar um menu de opções
3. Aguardar sua escolha

### Invocações Diretas

```bash
# Code Review direto
/skill bmad-agent-tech-lead
# Menu → seleciona "CR"

# Architecture Review
/skill bmad-agent-tech-lead
# Menu → seleciona "AR"

# Developer Mentoring
/skill bmad-agent-tech-lead
# Menu → seleciona "DEV"
```

## 🎓 Exemplos de Uso

### Exemplo 1: Code Review

```
Você: /skill bmad-agent-tech-lead
Marina: [greet com menu]
Você: 1 (ou "CR" para Code Review)
Marina: Qual arquivo/código você gostaria que eu revisasse?
Você: src/services/UserService.ts
Marina: [inicia review depth...]
```

### Exemplo 2: Architecture Review

```
Você: /skill bmad-agent-tech-lead
Marina: [greet com menu]
Você: 2 (ou "AR" para Architecture Review)
Marina: Que componente/sistema você quer que eu revise?
Você: Nosso auth system — JWT vs Sessions
Marina: [analisa trade-offs, valida decisão...]
```

### Exemplo 3: Mentoring

```
Você: /skill bmad-agent-tech-lead
Marina: [greet com menu]
Você: 5 (ou "DEV" para Developer Mentoring)
Marina: Qual desafio técnico você está enfrentando?
Você: Como estruturar um repositório de dados?
Marina: [guia através da descoberta...]
```

## 📊 Menu Disponível

| Código | O que faz | Integração |
|--------|----------|-----------|
| CR | Code Review | Usa `bmad-code-review` |
| AR | Architecture Review | Conversação direta |
| QI | Query Insights | Conversação direta |
| DR | Design Review | Usa `bmad-agent-ux-designer` |
| DEV | Developer Mentoring | Conversação direta |
| DEBT | Technical Debt Assessment | Conversação direta |
| TEST | Testing Strategy | Conversação direta |

## 🏆 Personas & Princípios

**Nome:** Marina  
**Título:** Tech Lead  
**Icon:** 👨‍💼  
**Expertise:** Code quality, architecture, patterns, testing

### Princípios que guiam Marina:

1. **Code review é um ritual de aprendizado** — não um gate de aprovação
2. **Arquitetura emergente** — melhor que sobre-engenharia upfront
3. **Simplificar é refatorar** — se é difícil testar, é difícil debugar
4. **Documentação viva** — próxima ao código ou morre esquecida
5. **Dívida técnica é juro** — você paga depois com juros

## 🔧 Customização

Marina pode ser customizada editando:

```
{project-root}/_bmad/custom/bmad-agent-tech-lead.toml          # Team overrides
{project-root}/_bmad/custom/bmad-agent-tech-lead.user.toml     # Personal overrides
```

Você pode:
- Alterar seu icon (emoji)
- Adicionar persistent facts (contexto sempre disponível)
- Customizar principles
- Estender o menu com novas opções
- Mudar communication style

## 📚 Integração com BMAD

Marina funciona bem junto com:
- **John (PM Agent)** — para decisions de product, requirements
- **Arquiteto** — para validação arquitetural profunda
- **Desenvolvedor** — para implementação
- **UX Designer** — para design review

Workflow sugerido no BMAD:
```
PRD (John/PM) 
  → Architecture Design (Marina/Tech Lead)
  → Development (Dev Agent + Marina mentoring)
  → Code Review (Marina)
  → Testing (Marina's testing strategy)
```

## 🎯 Casos de Uso Ideais

### ✅ Use Marina para:
- "Revisa esse código antes de mergear?"
- "Que padrão você recomendaria aqui?"
- "Como estruturo um módulo novo?"
- "Que testes eu deveria escrever?"
- "Essa arquitetura escalaria?"
- "Como melhoraria essa query?"

### ❌ Não use Marina para:
- Decidir features do produto (use John/PM)
- UX/Design puro (use UX Designer)
- Planning/timeline (use John/PM)
- Implementação de feature completa (use Dev Agent)

## 📖 Próximos Passos

1. Invoque Marina com `/skill bmad-agent-tech-lead`
2. Escolha uma opção do menu ou converse livremente
3. Marina irá guiar você através do workflow apropriado

**Bem-vindo ao Tech Lead! 👨‍💼**
