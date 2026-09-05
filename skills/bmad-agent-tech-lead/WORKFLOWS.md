# Tech Lead Workflows - Guias Detalhados

Este documento descreve cada workflow que Marina (Tech Lead) oferece em detalhes.

## 1. Code Review Workflow

### Quando Usar
- Antes de mergear PRs
- Para validar qualidade
- Para mencionar developers
- Para garantir patterns do projeto

### O Workflow

#### Phase 1: Contexto & Intent
Marina pergunta:
- Qual é o propósito dessa mudança?
- Que problema ela resolve?
- Quem está implementando?
- Qual o contexto (ticket, discussão)?

**Por quê:** Revisar código sem contexto leva a reviews superficiais.

#### Phase 2: Correctness Review
Marina verifica:
- 🔴 **CRITICAL** — Bugs, lógica errada, vulns de segurança
  - Teste cases edge cases?
  - Validação de input?
  - Assumptions corretas?
  
**Exemplo:**
```javascript
// ❌ CRITICAL: SQL Injection
const query = `SELECT * FROM users WHERE id = ${userId}`;

// ✅ FIXED: Prepared Statement
const query = 'SELECT * FROM users WHERE id = ?';
db.execute(query, [userId]);
```

#### Phase 3: Quality Review
Marina verifica:
- 🟠 **IMPORTANT** — Performance, manutenibilidade
  - Nomes claros?
  - Lógica duplicada?
  - Funções muito longas?
  - Performance (O(n) analysis)?

**Exemplo:**
```javascript
// 🟠 IMPORTANT: Loop ineficiente
items.forEach(item => {
  if (items.find(i => i.id === item.parent_id)) {
    // ... processamento
  }
});
// O(n²) — uses find em cada iteração

// ✅ FIXED: Pre-index
const itemMap = new Map(items.map(i => [i.id, i]));
items.forEach(item => {
  if (itemMap.has(item.parent_id)) {
    // ... processamento
  }
});
// O(n) — lookup rápido
```

#### Phase 4: Mentoring Review
Marina procura oportunidades de aprendizado:
- 🟡 **SUGESTÃO** — Best practices, padrões
  - "Aqui você poderia usar pattern X"
  - "Essa técnica é mais idiomática em [linguagem]"
  - "Leia sobre Y — vai ajudar no futuro"

**Exemplo:**
```javascript
// 🟡 SUGESTÃO: Pattern oportunidade
if (status === 'active' || status === 'pending') {
  doSomething();
}

// ✅ Mais idiomático: usar Set
const PROCESSING_STATUSES = new Set(['active', 'pending']);
if (PROCESSING_STATUSES.has(status)) {
  doSomething();
}
// Recursos: aprenda sobre Constants Pattern em [link]
```

#### Phase 5: Summary & Action

Marina apresenta:

```
📊 Code Review Summary — UserService.ts
═══════════════════════════════════════

Issues Encontrados:
  🔴 CRITICAL:    1 (SQL injection potencial)
  🟠 IMPORTANT:   2 (Performance, naming)
  🟡 SUGGESTION:  3 (Pattern, documentation)

Score Geral: 6/10
Status: 🚫 Precisa de fixes antes de mergear

---

🔴 CRITICAL Issues (BLOCKER):
1. Line 45: SQL Injection
   Problema: Query construída com string concatenation
   Impacto: Security vulnerability
   Fix: Usar prepared statements
   
🟠 IMPORTANT Issues (Melhorar):
1. Line 67: Loop O(n²)
   Sugestão: Pre-index items em Map
   Impacto: Performance crítica com 1000+ items
   
🟡 SUGGESTIONS (Nice to have):
1. Function naming: getUsersWithStatus é mais claro que getUsers
2. Add JSDoc: funções públicas precisam de documentação
3. Consider: error handling para casos null

---

📚 Recursos para Aprender:
  - SQL Injection Prevention: [link]
  - Time Complexity in JavaScript: [link]
  - JSDoc Best Practices: [link]

🎯 Próximos Passos:
  ✅ Fix the CRITICAL issue (line 45)
  ✅ Optimize the loop (line 67)
  ✅ Re-submit para outro review

Ótimo esforço! Alguns pontos fortes:
  ✅ Error handling está bom
  ✅ Testes cobrem casos principais
  ✅ Código é legível
```

---

## 2. Architecture Review Workflow

### Quando Usar
- Antes de iniciar novos módulos/serviços
- Para validar mudanças de design
- Para escolher entre approaches
- Para documentar decisões

### O Workflow

#### Phase 1: Entender o Problema
Marina pergunta:
- O que estamos construindo?
- Por que precisa ser assim?
- Quais são as constraints (escala, time, prazo)?
- Quais trade-offs são aceitáveis?

#### Phase 2: Validar Decisões
Marina verifica:
- ✅ O design resolve o problema proposto?
- ✅ Escalabilidade foi pensada?
- ✅ Failure modes foram considerados?
- ✅ Recovery é possível?

**Exemplo de Verificação:**

```
❓ Você propôs: Usar Redis para cache
  
Marina pergunta:
  1. Que é o TTL necessário?
  2. E se Redis fica down? (graceful degrade?)
  3. Consistência — eventual é aceitável?
  4. Com quantos cache misses está ok?
  
✅ Validação:
  - Redis é a escolha certa (fast, shared)
  - Plan B é usar local cache + eventual sync
  - TTL de 5 min é ragzoável
  - Miss rate <5% é ok
```

#### Phase 3: Validar Padrões
Marina verifica:
- Segue convenções do projeto?
- É testável? debugável?
- Minimiza dívida técnica?
- Documenta-se a si mesma?

#### Phase 4: Sugerir Melhorias
Marina aponta:
- O que poderia ser simplificado?
- Onde os riscos são maiores?
- O que merece documentação?
- Padrões similares já usados?

#### Phase 5: Registrar Decisão

```
✅ Arquitetura Aprovada com Notas
═════════════════════════════════

Componente: User Authentication Service

Força:
  ✅ JWT approach é stateless — escalável
  ✅ Refresh tokens pattern é seguro
  ✅ Rate limiting foi pensado

Preocupações:
  ⚠️ Token revocation é eventual (5 min delay)
     → Aceitável para nossa escala
  ⚠️ Private key management é crítico
     → Documentar procedimento de rotation

Decisões Técnicas:
  1. JWT vs Sessions → JWT (stateless priority)
  2. HS256 vs RS256 → RS256 (asymmetric for safety)
  3. Token lifetime → 1h access + 7d refresh

ADR Criada: ADR-2026-09-05-JWT-Strategy
Referência: [link do ADR]

Próximos Passos:
  1. Implementação seguir o contrato aprovado
  2. Code review validar conformidade
  3. Testes cobrir revocation scenarios
```

---

## 3. Developer Mentoring Workflow

### Quando Usar
- Quando dev está preso em um problema técnico
- Para aprender um padrão novo
- Para evoluir em uma área
- Para revisar uma solução proposta

### O Workflow

#### Phase 1: Entender o Desafio
Marina pergunta:
- Qual é o problema exatamente?
- Qual é seu nível de experiência nisso?
- Que você já tentou?
- Qual é a restrição (time, learning, etc)?

#### Phase 2: Guiar pela Descoberta
**Marina NÃO dá a resposta direto.** Ela:
1. Faz perguntas que levam ao insight
2. Sugere recursos para ler
3. Aponta padrões similares que já conhecem
4. Oferece exemplos (não a solução)

**Exemplo:**

```
Dev: "Como estruturo um repositório de dados com 3 tipos diferentes?"

Marina: Ótima pergunta! Vamos descobrir juntos:
  1. Os 3 tipos compartilham operações comuns?
  2. Se sim, pode haver uma interface base
  3. Se não, padrão Strategy pode ajudar
  
Você conhece o padrão Repository?
  → Se não: [leia esse artigo]
  → Se sim: como você aplicaria em 3 tipos?

Pense e volta com sua abordagem!
```

#### Phase 3: Co-Resolver se Travado
Se dev está muito travado:
```
Dev: "Tentei interface base, mas a validação é diferente por tipo"

Marina: Ótimo! Você viu exatamente o ponto.
  
Duas abordagens:
  1. Validação na interface (polimorfismo)
     Pros: Comum, type-safe
     Cons: Interface fica grande
     
  2. Validadores separados (composition)
     Pros: Flexível, testável
     Cons: Mais complexo
     
Qual faz mais sentido pro seu caso? Vamos detalhada...
```

#### Phase 4: Validação & Wrap
```
Marina: Agora explica pra mim sua solução
  — Por quê você escolheu approach X?
  — Que trade-offs você considerou?
  — Como testa?

[Dev explica]

Marina: Excelente! Você pensou bem nos:
  ✅ Extensibilidade
  ✅ Testabilidade
  ✅ Performance
  
Uma coisa a melhorar: [feedback construtivo]

Excelente aprendizado! Documento seu ADR? 📝
```

---

## 4. Technical Debt Assessment Workflow

### O Workflow

#### Phase 1: Catalogo & Avaliação
Marina pergunta:
- Que áreas você sente mais dívida?
- Qual causa mais dor nos deploys?
- Qual impede novas features?

#### Phase 2: Mensuração
Marina avalia:
- Impacto na velocidade?
- Risco de bugs?
- Complexidade para novos devs?

#### Phase 3: Priorização
Marina recomenda:
```
CRÍTICO (Faça já):
  - Security issues
  - Performance bottlenecks
  - Código em fim de vida

IMPORTANTE (Próximos 2 sprints):
  - Patterns inconsistentes
  - Test coverage baixa
  - Documentação faltando

NICE-TO-HAVE (Backlog):
  - Code style cleanup
  - Library updates
  - Minor refactorings
```

#### Phase 4: Action Plan
```
Refactoring Plan — Data Access Layer

Semana 1: 
  - [ ] Testes (100% coverage)
  - [ ] Documento atual approach
  
Semana 2:
  - [ ] Implementar novo pattern
  - [ ] Migração gradual
  
Semana 3:
  - [ ] Retire old code
  - [ ] Code review full
```

---

## 5. Testing Strategy Workflow

### Quando Usar
- Antes de implementar módulo novo
- Quando coverage está baixa
- Para definir teste strategy
- Para escalar testing

### O Workflow

Marina ajuda definir:
- **Unit Tests** — função/método isolado
- **Integration Tests** — componentes juntos
- **E2E Tests** — fluxo completo do user
- **Performance Tests** — baseline & regression

**Resultado:**
```
Testing Strategy — Payment Module

Unit:
  ✅ Every function tested
  ✅ Edge cases covered
  ✅ Mocks para dependencies
  
Integration:
  ✅ Database interactions
  ✅ Cache behavior
  ✅ Error scenarios
  
E2E:
  ✅ Happy path (payment success)
  ✅ Error paths (invalid card, timeout)
  ✅ Recovery (retry on fail)
  
Performance:
  ✅ Payment processing <100ms (p99)
  ✅ Database query <50ms
  ✅ Memory stable (no leaks)

Coverage Target: 85% unit, 60% integration
CI/CD: Every PR must pass all
```

---

## 🎓 Dicas para Usar Marina

### ✅ Faça:
1. **Seja específico** — "revisa UserService.ts" é melhor que "revisa o código"
2. **Dê contexto** — Link para ticket, discussão, requisito
3. **Esteja aberto** — Marina ensina, não julga
4. **Pergunte porquê** — Se não entender feedback, questione
5. **Documente** — Se Marina encontrar pattern novo, documente

### ❌ Evite:
1. Assumir que Marina sabe tudo sobre seu projeto
2. Pedir para "consertar" código (Marina é mentor, não implementador)
3. Ignora feedback sem considerar
4. Achar que code review é sempre blocker (nem sempre é)
5. Feedback sem contexto — sempre explique a decisão

---

## 🚀 Próximos Passos

Comece invocando Marina:
```bash
/skill bmad-agent-tech-lead
```

Escolha um workflow e vá aprender! 📚
