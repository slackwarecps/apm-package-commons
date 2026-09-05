---
name: projeto-grill-me
description: Entrevista técnica rigorosa e sem piedade para afiar planos, designs e propostas de arquitetura no contexto APM
---

# Projeto Grill-me 🔥

Uma entrevista técnica **relentless** (sem piedade) para questionar, desafiar e refinar seus planos, designs e propostas de arquitetura.

## Como usar

Quando tiver um **plano, design, proposta ou decisão arquitetural** que quer afiar:

```
Descreva seu plano/design/proposta com:
- O que você quer fazer
- Por que está fazendo assim
- Quais são as alternativas consideradas
- Quais são as preocupações/riscos
```

## O que será questionado

### 1. **Problema & Requisitos** ❓
- O problema está realmente bem definido?
- Há requisitos funcionais não documentados?
- Quais são os requisitos não-funcionais (performance, escala, segurança)?
- Qual é o critério de sucesso?

### 2. **Alternativas & Trade-offs** 🔄
- Quais eram as outras abordagens consideradas?
- Por que essa foi escolhida?
- Qual é o custo de implementar cada alternativa?
- Quais são os trade-offs aceitos e rejeitados?

### 3. **Arquitetura & Design** 🏗️
- Segue os padrões de engenharia do projeto?
- Como isso se integra com a arquitetura existente?
- Qual é o nível de acoplamento?
- Há componentes genéricos que poderiam ser reutilizados?
- Como isso escala quando os requisitos mudarem?

### 4. **Resiliência & Observabilidade** 📊
- Como o sistema se comporta quando uma dependência falha?
- Há timeouts, retries, circuit breakers definidos?
- Como será diagnosticada uma falha em produção?
- Há logs estruturados, métricas e traces suficientes?
- Como se faz rollback se algo der errado?

### 5. **Segurança & Dados Sensíveis** 🔐
- Dados sensíveis estão protegidos?
- Onde estão os segredos e como são gerenciados?
- Há validação de entrada nas fronteiras?
- Há tratamento explícito de erros?
- Logs não expõem informações sensíveis?

### 6. **Implementação & Testes** ✅
- Como isso será desenvolvido em mudanças pequenas e verificáveis?
- Há critérios de aceite claros?
- Como o comportamento será validado (testes unitários, integração, ponta-a-ponta)?
- Como garante cobertura de testes?

### 7. **Operação & Documentação** 📝
- Há documentação clara para o time operacional?
- Ownership está bem definido?
- Dependências estão documentadas?
- Há runbooks para incidentes?
- Qual é o plano de mitigação de riscos?

### 8. **Custo & Viabilidade** 💰
- Qual é o custo estimado (tempo, infraestrutura)?
- Vale a pena investir nessa abordagem?
- Há dependências críticas ou bloqueadores?
- Qual é o prazo realista?

## Exemplo de uso

**Seu plano:**
> "Vou criar um novo microserviço de autenticação centralizado que todas as aplicações vão usar"

**Grill-me vai questionar:**
- ❓ O problema atual com a autenticação distribuída é tão grave que justifica essa mudança?
- 🔄 Considerou federação via OAuth2 ou ID provider externo?
- 🏗️ Como um serviço centralizado de autenticação escala para N aplicações?
- 📊 Se o serviço cai, tudo para ou há fallback?
- 🔐 Onde os tokens são armazenados? Sessões? Cookies?
- ✅ Qual é o plano de migração de usuários antigos?
- 📝 Como o time de operações monitorará esse serviço crítico?
- 💰 Quanto tempo vai levar pra implementar bem?

## Dicas para aproveitar melhor

1. **Seja específico**: Quanto mais detalhe você der, mais afiadoras serão as perguntas
2. **Documente decisões**: Se já respondeu uma pergunta, deixa claro
3. **Cite restrições**: Orçamento, tempo, pessoal, arquitetura existente
4. **Esteja aberto**: O objetivo é melhorar o plano, não defendê-lo a todo custo
5. **Registre insights**: Anote as perguntas que te fizeram pensar, foram valiosas

## Checklist final (após o grilling)

- [ ] Problema e critérios de aceite estão MUITO claros
- [ ] Alternativas foram consideradas e trade-offs documentados
- [ ] A solução segue padrões existentes ou documenta exceção
- [ ] Resiliência, observabilidade e rollback foram planejados
- [ ] Segurança e dados sensíveis foram considerados
- [ ] Testes e validação têm plano
- [ ] Documentação, ownership e runbooks foram previstos
- [ ] Estimativas de custo/prazo são realistas

---

**Uso:** `/projeto-grill-me <seu plano ou design>`

Boa sorte, Fabão! 🚀
