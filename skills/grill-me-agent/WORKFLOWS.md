# Workflows - Grill-me

## Workflow 1: Entrevista Técnica Completa

```
Início
  ↓
Você descreve o plano/arquitetura
  ↓
Grill-me questiona 8 dimensões (ver SKILL.md)
  ├─ Problema & Requisitos
  ├─ Alternativas & Trade-offs
  ├─ Arquitetura & Design
  ├─ Resiliência & Observabilidade
  ├─ Segurança & Dados Sensíveis
  ├─ Implementação & Testes
  ├─ Operação & Documentação
  └─ Custo & Viabilidade
  ↓
Você responde às perguntas
  ↓
Grill-me aprofunda nos gaps encontrados
  ↓
Gera Findings (forças, riscos, ações recomendadas, escores)
  ↓
Fim
```

### Fluxo Ideal de Pergunta

1. **Escuta** — Grill-me escuta sua descrição sem interromper
2. **Perguntas Clareadoras** — "Deixa eu entender melhor..."
3. **Perguntas Desafiadoras** — "E se X? Por que não Y?"
4. **Aprofundamento** — "Você tem certeza? Como vocês lidam com Z?"
5. **Reconhecimento** — "Isso está bem pensado porque..."
6. **Síntese** — Agrupa riscos e forças

---

## Workflow 2: Quick Check (15 min)

Para quando você só quer validação rápida:

```
Você: "Quero seu feedback rápido em 15 min sobre minha arquitetura"

Grill-me:
  1. Qual é o problema que resolve? (2 min)
  2. Qual é o maior risco? (3 min)
  3. Qual é o maior ponto positivo? (2 min)
  4. Qual é a ação mais importante? (2 min)
  5. Top 3 questões abertas (6 min)
  ↓
  Sumário rápido (≤ 5 findings críticos)
```

---

## Workflow 3: Deep Dive em Uma Dimensão

Para quando você quer detalhe em um aspecto específico:

```
Você: "Grill-me, me grill em segurança"

Grill-me:
  ↓
  Aprofunda na dimensão: Segurança & Dados Sensíveis
  ├─ Encriptação em repouso e trânsito?
  ├─ Gerenciamento de segredos?
  ├─ Validação de entrada?
  ├─ Tratamento de erros?
  ├─ Exposure de logs?
  ├─ Controle de acesso?
  ├─ Auditoria?
  └─ Plano de recuperação?
  ↓
  Findings focados em segurança
```

---

## Workflow 4: Validação Antes de Apresentação

```
Você: "Vou apresentar isso amanhã, me grill agora para estar preparado"

Grill-me:
  1. Faz entrevista técnica completa
  2. Identifica gaps e pontos fracos
  3. Sugere respostas para perguntas esperadas
  4. Aponta argumentos contra
  5. Propõe histórias/exemplos que vendem a ideia
  ↓
  Você pratica respostas
  ↓
  Você está preparado para stakeholders
```

---

## Workflow 5: Pair Grilling (Revisão de Plano em Equipe)

```
Você + Time apresentam plano

Grill-me questiona o time:
  1. Vocês concordam com essa decisão?
  2. Quem mais considerou alternativa X?
  3. Como vocês testam isso?
  4. Quem é o owner quando quebra?
  ↓
  Time alinha entendimento
  ↓
  Grill-me gera findings que refletem consenso
```

---

## Workflow 6: Iterativo - Melhorando Propostas

```
Iteração 1: Você apresenta versão 1
  ↓
Grill-me gera Findings (riscos, gaps)
  ↓
Você incorpora feedback, cria versão 2
  ↓
Você: "Deixa revisar como ficou"
  ↓
Grill-me valida melhorias, aponta gaps novos
  ↓
[Repete até que Escores sejam > 4/5]
  ↓
Plano está pronto
```

---

## Padrões de Comunicação

### Quando Grill-me Encontra um Gap

```
❌ EVITA:
"Você não pensou em transações distribuídas"

✅ PREFERE:
"Como vocês vão garantir consistência entre User e Order?
 Quando Payment falha, User deve ser revertido?"
```

### Quando Reconhece uma Boa Decisão

```
✅ RECONHECE:
"Isso é bem pensado porque você considerou X e Y.
 A razão pela qual Z ainda é arriscado é..."
```

### Quando Questiona Alternativas

```
✅ PERGUNTA ABERTA:
"Vocês consideraram [alternativa]?
 Como ela se compararia em termos de [métrica]?"
```

### Quando Fecha a Conversa

```
✅ SÍNTESE:
"Resumindo: vocês têm um plano sólido em [dimensões],
 mas precisam endereçar [riscos] antes de ir para produção.
 As 3 ações mais críticas são [...]"
```

---

## Checklist: Quando Usar Grill-me

- ✅ Arquitetura de novo serviço
- ✅ Refatoração maior
- ✅ Mudança de stack tecnológico
- ✅ Plano de migração
- ✅ Proposta de evolução de produto
- ✅ Antes de apresentar a C-level
- ✅ Quando você não tem certeza
- ✅ Quando alguém discorda do plano

---

## Timing Recomendado

| Contexto | Timing |
|----------|--------|
| Design Phase | Inicial (ideate + Grill-me) |
| Implementation Phase | Após protótipo funcionar |
| Production Launch | Antes de ir live |
| Post-Launch | 1-2 semanas após go-live |

**Princípio:** Quanto mais cedo Grill-me valida, menos caro corrigir.
