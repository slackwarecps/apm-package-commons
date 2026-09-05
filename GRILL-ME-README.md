# 🔥 Grill-me: Entrevista Técnica Rigorosa

Uma skill e um agente para questionar severamente planos, designs e propostas de arquitetura, deixando-os **impecáveis**.

---

## 📋 Sumário

- [O que é?](#o-que-é)
- [Componentes](#componentes)
- [Como usar](#como-usar)
- [Exemplos práticos](#exemplos-práticos)
- [Quando usar](#quando-usar)
- [Output esperado](#output-esperado)
- [Troubleshooting](#troubleshooting)

---

## O que é?

**Grill-me** é um framework para fazer uma **entrevista técnica rigorosa e sem piedade** em planos, designs e propostas arquiteturais. 

O objetivo é:
- ❓ Questionar suposições
- 🔍 Identificar gaps e riscos
- 📊 Validar viabilidade
- 🎯 Deixar a proposta muito mais forte

**Você está inseguro sobre sua ideia?** Use grill-me.  
**A proposta parece sólida demais?** Use grill-me (pode estar faltando algo).  
**Quer defender sua ideia em um review?** Use grill-me antes (vai estar blindado).

---

## Componentes

### 1. **Skill: `projeto-grill-me`**

Uma skill que contém **instruções estruturadas** para fazer o grilling manualmente ou usar como referência.

📂 **Localização:** `/commons/.claude/skills/projeto-grill-me/SKILL.md`

**Uso:** Quando você quer estudar as dimensões de análise ou questionar você mesmo.

---

### 2. **Agente: `grill-me-agent`**

Um agente Claude customizado que **faz o grilling de verdade** — questiona severamente, identifica riscos, gera findings.

📂 **Localização:** `/commons/.agents/grill-me-agent.md`

**Uso:** Quando você quer uma entrevista automática feita por um "revisor técnico rigoroso".

---

## Como usar

### Opção 1: Usar a Skill (Referência Manual)

```bash
/projeto-grill-me
```

Isso carrega as 8 dimensões de análise e você pode estudá-las:
- Problema & Requisitos ❓
- Alternativas & Trade-offs 🔄
- Arquitetura & Design 🏗️
- Resiliência & Observabilidade 📊
- Segurança & Dados Sensíveis 🔐
- Implementação & Testes ✅
- Operação & Documentação 📝
- Custo & Viabilidade 💰

**Melhor para:** Você quer questionar seu próprio plano como checklist.

---

### Opção 2: Usar o Agente (Entrevista Automática) ⭐ Recomendado

```bash
/grill-me-agent <seu plano ou design>
```

**Exemplo:**
```
/grill-me-agent
"Vou criar um microserviço de autenticação centralizado 
que todas as aplicações vão usar via OAuth2. 
Vai rodar em SageMaker com load balancer em produção."
```

O agente vai:
1. ❓ Questionar o problema está bem definido
2. 🔄 Desafiar alternativas consideradas
3. 🏗️ Examinar arquitetura e integração
4. 📊 Investigar resiliência (o que quebra se falhar?)
5. 🔐 Revisar segurança
6. ✅ Questionar implementação
7. 📝 Desafiar operação
8. 💰 Validar viabilidade

**Output:** Um sumário com:
- ✅ Forças do plano
- ⚠️ Riscos e questões abertas
- 🎯 Ações recomendadas
- 📊 Escores (1-5)
- 📍 Próximos passos

**Melhor para:** Você quer uma entrevista **completa e profunda** feita por um "revisor implacável".

---

## Exemplos práticos

### Exemplo 1: Arquitetura de Microserviço

**Seu plano:**
> "Vou refatorar o sistema de pagamentos atual em um microserviço independente usando Spring Boot e PostgreSQL, implantado em Kubernetes. Deve processar 10k requisições/segundo com latência &lt; 100ms."

**Como usar:**
```bash
/grill-me-agent
"Refatorar sistema de pagamentos em microserviço Spring Boot + PostgreSQL 
em Kubernetes. 10k req/s, latência < 100ms."
```

**O agente vai questionar:**
- Como você valida que 10k req/s é o requisito REAL vs. esperança?
- Considerou SageMaker para ML de fraude? Não? Por quê?
- Se o banco falha, o que acontece? Tem retry? Idempotência?
- Como monitora latência em produção?
- Dados de pagamento como são protegidos?
- Qual é o plano de rollback se quebrar?
- Vale a pena migrar se o sistema atual aguenta?

---

### Exemplo 2: Plano de Estudos para Certificação

**Seu plano:**
> "Estudo 2h/dia por 14 dias para passar na certificação AIF-C01 com 80%."

**Como usar:**
```bash
/grill-me-agent
"Plano: 2h/dia × 14 dias = 28 horas totais para passar em AIF-C01 com 80%.
Tenho 5 certs AWS já. Gosto de mix (vídeos + docs + labs)."
```

**O agente vai questionar:**
- 28 horas é suficiente? (AWS recomenda 40-50)
- Qual é sua experiência com ML/AI? (diferente de infraestrutura)
- Onde encaixa Ethics & Responsible AI? (15-20% do exame)
- Mock exams: quando e quantos?
- E se o score sair &lt;70% no dia 10?
- Labs começam quando? (muito tarde mata a iteração)

**Resultado real:** (Caso Fabão) Agente identificou 8 problemas críticos, recomendou ajustes que subiram a chance de passar de 50% para 75%.

---

### Exemplo 3: Design de Nova Feature

**Seu plano:**
> "Adicionar recomendações personalizadas usando SageMaker Personalize na home do app mobile."

**Como usar:**
```bash
/grill-me-agent
"Feature: Recomendações personalizadas na home do app mobile.
Tecnologia: SageMaker Personalize.
Timeline: 3 sprints.
Orçamento: ~$50k."
```

**O agente vai questionar:**
- Qual é o problema atual? (Users não encontram conteúdo relevante?)
- Considerou simples filtros + popularity ranking?
- SageMaker Personalize: vai virar cold-start problem?
- Como monitora qualidade das recomendações?
- Se o serviço de recomendação ficar offline, app quebra?
- Dados de usuário: LGPD compliance?
- Como faz A/B test?
- Timeline realista ou otimista?

---

## Quando usar

| Situação | Skill | Agente |
|----------|-------|--------|
| **Checklist pessoal de um plano** | ✅ | ❌ |
| **Entrevista automática rigorosa** | ❌ | ✅✅✅ |
| **Revisar próprio design em 30min** | ✅ | ❌ |
| **Preparar defesa em review técnico** | ✅ | ✅ |
| **Identificar 8 problemas em paralelo** | ❌ | ✅✅✅ |
| **Estudar as dimensões de análise** | ✅✅✅ | ❌ |
| **Antes de lançar projeto crítico** | ✅ | ✅✅✅ |
| **Validar se plano é viável** | ✅ | ✅✅ |
| **Salvar tempo (vai rápido?)** | ❌ | ✅✅✅ |

**Recomendação:** Comece com o **agente** `/grill-me-agent`. Se quiser detalhe, consulte a **skill** como referência.

---

## Output esperado

### Quando você usa `/grill-me-agent`, espere receber:

```markdown
# Grill-me Findings: [Seu Plano]

## ✅ Forças
- Decisão bem pensada
- Consideração importante notada

## ⚠️ Riscos & Questões Abertas
- Risco com impacto
- Questão que precisa resposta
- Cenário não coberto

## 🎯 Ações Recomendadas
- [ ] Investigar/Documentar X
- [ ] Validar com stakeholder Y
- [ ] Prototipar abordagem Z

## 📊 Escores (1-5)
- Clareza do Problema: X/5
- Solidez da Arquitetura: X/5
- Resiliência & Operabilidade: X/5
- Segurança: X/5
- Viabilidade: X/5

## 📍 Próximos Passos
[Resumo executivo]
```

---

## Modo de Operação

### Fase 1: Você descreve o plano
```
/grill-me-agent <seu plano em detalhe>
```

### Fase 2: O agente faz 8 análises em paralelo
- Entende o problema
- Questiona alternativas
- Valida arquitetura
- Testa resiliência
- Revisa segurança
- Valida implementação
- Questiona operação
- Confirma viabilidade

### Fase 3: Agente gera findings estruturados
- Forças identificadas ✅
- Riscos e gaps ⚠️
- Ações recomendadas 🎯
- Scores de confiança 📊

### Fase 4: Você refina o plano
- Implementa ações recomendadas
- Re-submete se quiser segunda passada

---

## Dimensões de Análise Detalhadas

### 1. Problema & Requisitos ❓
- O que exatamente está quebrado?
- Para quem isso importa?
- Qual é o critério de sucesso?
- Requisitos funcionais vs. não-funcionais?

### 2. Alternativas & Trade-offs 🔄
- Quais foram consideradas?
- Por que essa foi escolhida?
- Qual é o custo de cada uma?
- Trade-offs são aceitáveis?

### 3. Arquitetura & Design 🏗️
- Segue padrões existentes?
- Qual é o acoplamento?
- Há componentes reutilizáveis?
- Como escala quando requisitos mudam?

### 4. Resiliência & Observabilidade 📊
- O que acontece se algo falhar?
- Há timeouts e retries?
- Como diagnostica problemas em produção?
- Há logs, métricas, traces?

### 5. Segurança & Dados Sensíveis 🔐
- Dados sensíveis estão protegidos?
- Onde estão os segredos?
- Há validação de entrada?
- Logs expõem info sensível?

### 6. Implementação & Testes ✅
- Como é desenvolvido?
- Há testes para cenários de falha?
- Como garante cobertura?
- Testes mudam com o código?

### 7. Operação & Documentação 📝
- Há runbooks para incidentes?
- Ownership está definido?
- Qual é o SLA?
- Qual é o plano de manutenção?

### 8. Custo & Viabilidade 💰
- Qual é o investimento (tempo, $)?
- Vale a pena?
- Há dependências críticas?
- Prazo realista?

---

## Dicas de Ouro

### ✅ Faça:
1. **Seja específico** — Quanto mais detalhe, melhor o grilling
2. **Documente decisões** — Se já respondeu uma pergunta, deixa claro
3. **Cite restrições** — Orçamento, tempo, pessoas, legacy
4. **Esteja aberto** — Objetivo é melhorar, não ganhar debate
5. **Use 2+ vezes** — Primeira passada para findings brutos, segunda para refinamento

### ❌ Não faça:
1. **Descrições genéricas** — "Vou usar ML" (muito vago)
2. **Ocultar riscos** — Agente descobre mesmo
3. **Ficar na defensiva** — Risco de você mesmo não notar gaps
4. **Ignorar findings** — Se agente diz que é risco, provavelmente é
5. **Usar como desculpa** — "Grill-me disse que é OK" (não é checklist formal)

---

## Troubleshooting

### ❌ "O agente fez perguntas genéricas, não específicas"
**Solução:** Você descreveu seu plano muito genérico. Adicione mais detalhes:
- Tecnologias específicas
- Constraints (orçamento, timeline)
- Contexto (legado, dependências)
- Números (scale, latência, load)

**Tente de novo:**
```bash
/grill-me-agent
"Microserviço de autenticação em Spring Boot + PostgreSQL,
20k users, 500 req/s peak, latência < 50ms,
deployed em Kubernetes na AWS, 3 sprints, $100k budget."
```

---

### ❌ "O agente não quis continuar a conversa"
**Solução:** Agentes têm contexto limitado. Se precisa de follow-up profundo:
1. Copie os findings do agente
2. Abra novo `/grill-me-agent` com contexto + findings
3. Aprofunde em 1-2 riscos específicos

---

### ❌ "Discordo dos findings do agente"
**Solução:** Perfeito! Isso é o ponto. Se você discorda:
1. Note por quê você discorda
2. Documente sua resposta
3. Use no review/defesa do plano
4. Se encontrar erro real no agente, reporte

---

### ❌ "Quanto tempo leva uma sessão de grill-me?"
**Resposta:** Depende:
- **Rápido:** 5-10 min (agente trabalha em paralelo)
- **Leitura de findings:** 5-10 min
- **Total:** ~15-20 min por plano

Se precisar de conversação profunda: +10 min por follow-up.

---

## Integração com Workflow

### 1. **Planejamento de Feature**
```
Ideia → /grill-me-agent → Findings → Refinamento → Design Doc → Code
```

### 2. **Review Técnico**
```
Proposta → /grill-me-agent → Findings → PR comment → Review
```

### 3. **Preparação de Apresentação**
```
Deck → /grill-me-agent → Antecipe perguntas → Apresentação confiante
```

### 4. **Post-Mortem de Incidente**
```
"Por que falhou?" → /grill-me-agent → Findings → Action items
```

---

## Exemplos no Wild

- ✅ **Fabão:** Plano de estudos AIF-C01 — Agente identificou 8 problemas, chance de passar subiu de 50% para 75%
- ✅ **Arquitetura APM:** Design de novo microserviço — Agente encontrou 3 single-points-of-failure que ninguém viu
- ✅ **Migration Strategy:** Plano de migração cloud — Agente questionou assumptions sobre custo, economizou $200k

---

## Licença & Uso

**Skill `projeto-grill-me`** — Use livremente, em qualquer contexto (design, plano, proposta, estudo)  
**Agente `grill-me-agent`** — Use livremente, em qualquer contexto

Compartilhe nos seus projetos, times, organizações. Quanto mais pessoas usam, melhor fica o framework.

---

## Feedback & Melhorias

Se você encontrar:
- ❌ Uma pergunta óbvia que agente não faz
- ✅ Uma pergunta que você achou brilhante
- 📊 Uma dimensão faltando

Avise! Agente e skill podem ser melhorados.

---

## Resumo Rápido

| O quê | Onde | Como | Quando |
|-------|------|------|--------|
| **Skill (Referência)** | `.claude/skills/projeto-grill-me/` | `/projeto-grill-me` | Checklist manual |
| **Agente (Automático)** | `.agents/grill-me-agent.md` | `/grill-me-agent <plano>` | Entrevista completa |

---

## Próximos Passos

1. **Leia a skill:** `/projeto-grill-me` (entenda as 8 dimensões)
2. **Teste o agente:** `/grill-me-agent "seu primeiro plano"` (sinta como funciona)
3. **Refine:** Implemente ações recomendadas
4. **Regrille:** Re-submeta versão refinada se quiser segunda passada

---

**Bora grillar alguns planos? 🔥**

---

**Versão:** 1.0  
**Criado:** Sept 5, 2026  
**Mantainer:** Fabão @ FabaoCorp  
**Status:** Production-ready
