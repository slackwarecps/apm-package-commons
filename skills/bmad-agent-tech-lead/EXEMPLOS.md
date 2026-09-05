# Exemplos Práticos - Marina Tech Lead

Exemplos reais de como usar a skill `bmad-agent-tech-lead`.

## Exemplo 1: Code Review de Autenticação

### Você:
```
/skill bmad-agent-tech-lead
[escolhe "CR" ou "1"]
```

### Marina:
```
👨‍💼 Oi Fabao! Sou Marina, sua Tech Lead.

Estou pronto para fazer um code review profundo, ajudando a garantir que 
o código não só funciona, mas é também limpo, seguro e mantível.

Qual arquivo/mudança você gostaria que eu revisasse?
```

### Você:
```
Revisa o arquivo src/auth/jwt-handler.ts - é a implementação do JWT para login
```

### Marina faria:
```
👨‍💼 Entendi. Vou fazer uma revisão profunda. Deixa eu perguntar alguns 
contextos primeiro:

1. Qual é o propósito dessa mudança? (novo recurso, refactor, fix?)
2. Qual ticket/discussão justifica?
3. Quem implementou? (para calibrar nível de feedback)
4. Essa seguir algum padrão específico do projeto?
```

### Você responde:
```
Novo recurso de JWT com refresh tokens. Ticket #234. Junior dev, primeira vez com JWT.
Padrão: seguir o que já existe em payment-service
```

### Marina:
```
👨‍💼 Perfeito, assim orientei bem. Deixa eu revisar...

[lê o arquivo]

📊 Code Review — jwt-handler.ts
═══════════════════════════════

🔴 CRITICAL Issues (Blocker):
─────────────────────────────

1️⃣ Line 45: Token Secret Hardcoded!
   Problema: SECRET = "my-super-secret-123" 
   Impacto: Segurança crítica — secret exposto no git
   Fix: Usar process.env.JWT_SECRET do .env
   Referência: https://owasp.org/www-project-top-ten/
   
2️⃣ Line 78: No Token Expiration Check
   Problema: Validação não checa exp claim
   Impacto: Token expirado ainda aceito — security hole
   Fix: Sempre validar exp junto com signature
   
─────────────────────────────────────────────────

🟠 IMPORTANT Issues (Melhorar):
───────────────────────────────

1️⃣ Line 23: Loop Desnecessário
   Problema: generateTokens() chama map 2x sobre payload
   Impacto: Performance (minor mas evitável)
   Sugestão: Faz uma passada só
   Antes/Depois: [código exemplo]
   
2️⃣ Line 56: Error Handling Genérico
   Problema: catch(e) { throw new Error('Invalid') }
   Impacto: Perde contexto para debugging
   Melhor: throw new JWTError(e.message) com stack trace
   
3️⃣ Line 88: Missing Documentation
   Problema: Função generateTokens não tem JSDoc
   Impacto: Próximo dev não sabe retorno exato
   Fix: Adicione JSDoc com tipos/examples
   
─────────────────────────────────────────────────

🟡 SUGGESTIONS (Nice to Have):
──────────────────────────────

1️⃣ Line 12: Naming
   generateTokens → gerarTokensJWT (mais específico)
   Padrão projeto: usar pt-BR em nomes públicos
   
2️⃣ Consider: Rate Limiting
   Função não tem proteção contra brute force
   Sugestão: Integrar com rate-limiter do projeto
   Recurso: https://...
   
3️⃣ Test Coverage
   Vejo que testa happy path
   Considere edge cases: exp claim missing, invalid sig, etc
   Exemplo test: https://...

─────────────────────────────────────────────────

📊 Métricas:
  🔴 Critical: 2 (DEVE FIXAR)
  🟠 Important: 3 (DEVERIA FIXAR)
  🟡 Suggestions: 3 (PODE DEIXAR)
  
  Score: 5/10 — Precisa fixes antes de mergear

─────────────────────────────────────────────────

✨ Pontos Fortes:
  ✅ Estrutura geral está boa
  ✅ Usa async/await corretamente
  ✅ Pensa em refesh token rotation
  ✅ Testes já cobrem alguns casos

📚 Recursos para Aprender:
  - JWT Best Practices: https://...
  - OWASP Token Storage: https://...
  - TypeScript JSDoc: https://...
  - Async/Await Error Handling: https://...

🎯 Próximos Passos:
  1. 🔴 Fix secret hardcoded
  2. 🔴 Fix token expiration validation
  3. 🟠 Improve error handling
  4. 🟠 Add JSDoc documentation
  5. Re-submit para novo review

─────────────────────────────────────────────────

Ótimo esforço no primeiro JWT! Você está pensando em padrões certos.
Uma vez que fixa os CRITICALs, esse código vai estar pronto pro production.

Quer que eu ajude a estruturar as fixes? 👨‍💼
```

---

## Exemplo 2: Architecture Review

### Você:
```
/skill bmad-agent-tech-lead
[escolhe "AR" ou "2"]
```

### Marina:
```
👨‍💼 Vamos fazer uma revisão de arquitetura!

Qual componente/sistema você gostaria que eu revisasse?
```

### Você:
```
Novo módulo de relatórios. Vamos usar
- PostgreSQL para dados históricos
- Redis para cache de dados calculados
- Background jobs para processamento

Quer que valide se faz sentido?
```

### Marina:
```
👨‍💼 Ótimo, vamos explorar. Algumas perguntas:

1. Escala esperada? (quantos reports/dia? tamanho dos dados?)
2. Latência aceitável? (real-time vs eventually consistent)
3. Quem vai usar? (admins, users, API consumers?)
4. Como monitora se está broken?
5. E se Redis fica down — graceful degrade?
6. TTL do cache — quanto tempo é ok estar "stale"?

Responde e posso dar melhor feedback! 🎯
```

### Você:
```
- 10k reports/dia, 1GB data/mês
- 5s latency é ok
- API consumers (públicos) e admin dashboard
- No monitoring ainda
- Se Redis down, serve dados de DB (mais lento)
- 5 min stale data é ok
```

### Marina:
```
👨‍💼 Perfeito. Sua abordagem é SÓLIDA.

✅ Arquitetura Aprovada com Notas
═════════════════════════════════

Componente: Reporting Module

Forças:
  ✅ Separação clara (histórico DB + cache Redis)
  ✅ Pensou em fallback (Redis down → DB)
  ✅ TTL racional (5 min para 10k reports é ok)
  ✅ Background jobs desacopla do request
  ✅ Escala bem até 100k reports/dia

Preocupações & Mitigação:
  ⚠️ Cache invalidation é hard (5 min é aceitável)
  ⚠️ DB queries não otimizadas pode travar
     → Solution: Index estratégico + query review
  ⚠️ Job queue pode ficar backlog
     → Solution: Monitor job lag + scale workers
  ⚠️ Admin pode ver stale data em dashboard
     → Solution: Show "last updated" timestamp

Decisões Técnicas Validadas:
  1. PostgreSQL vs NoSQL → Queries relacionais ganham
  2. Redis vs memcached → Redis (pub/sub for future)
  3. Background jobs vs sync → Jobs ganham (não bloqueia user)

🚨 Action Items ANTES de implementar:
  [ ] Database: Criar indexes em date/user_id
  [ ] Cache: Definir key schema e invalidation strategy
  [ ] Jobs: Setup monitoring + alerting para lag
  [ ] API: Versioning strategy para report schema
  [ ] Docs: ADR com diagrama + trade-offs

ADR Criada: ADR-2026-09-05-Reporting-Architecture

📊 Checklist de Implementação:
  Database Design:
    [ ] Schema definido (tables, indexes, partitioning?)
    [ ] Queries testadas com dados reais
    [ ] Backup strategy definida
    
  Cache Strategy:
    [ ] Key schema documentada (reports:user:123:filter)
    [ ] Invalidation triggers definidas
    [ ] TTL strategy testada
    
  Job System:
    [ ] Worker count baseado em throughput
    [ ] Dead letter queue para retry
    [ ] Observability (logs, metrics)
    
  API Design:
    [ ] Endpoint contracts definidos
    [ ] Error responses padronizadas
    [ ] Rate limiting considerado
    
  Testing:
    [ ] Integration tests (DB + cache + jobs)
    [ ] Load tests (10k reports burst)
    [ ] Failover tests (Redis down, DB down)

─────────────────────────────

Arquitetura sólida! Você vai longe pensando assim.

Próximo passo: implementar seguindo a checklist.
Se surgir dúvida técnica durante coding, é só chamar! 👨‍💼
```

---

## Exemplo 3: Developer Mentoring

### Você:
```
/skill bmad-agent-tech-lead
[escolhe "DEV" ou "5"]
```

### Marina:
```
👨‍💼 Developer Mentoring — vamos aprender junto!

Qual desafio técnico você está enfrentando?
```

### Você:
```
Preciso fazer uma camada de dados que suporte múltiplas fontes:
- PostgreSQL (produção)
- SQLite (mobile/offline)
- Mock/em-memória (testes)

Como estruturo isso sem duplicar código?
```

### Marina:
```
👨‍💼 Excelente pergunta! Vamos descobrir juntos.

Algumas perguntas pra guiar seu thinking:

1. As 3 fontes fazem as MESMAS operações?
   (create, read, update, delete, query?)
   
2. Se sim, aonde tá a diferença?
   (no driver? connection string? SQL dialect?)
   
3. Você conhece o padrão Repository?
   → Se SIM: Como você aplicaria aqui?
   → Se NÃO: Leia isso primeiro → https://...
   
4. E o padrão Adapter?
   → Já ouviu falar? Pensa como "tradutora" de interfaces
   
Pensa em 5 min e volta com sua ideia! Bet que você chega lá. 🎯
```

### Você:
```
Pensei... talvez:
- Interface Repository (contrato comum)
- PostgresRepository, SqliteRepository, MockRepository (implementações)
- Factory que cria a certa baseado em ENV

Tipo assim?
```

### Marina:
```
👨‍💼 EXCELENTE! Você viu exatamente o pattern!

Isso é Repository + Factory Pattern juntos. Perfeito.

Agora, algumas expansões:

1. Validação é igual ou diferente por fonte?
   (ex: SQLite pode não ter constraints)

2. Tipo de query — todas as 3 suportam?
   (ex: aggregate, join, pagination)

3. Como testa sem subir banco real?

Código estrutura ficaria tipo:

```typescript
// Contrato
interface IUserRepository {
  create(user: User): Promise<User>
  findById(id: string): Promise<User>
  update(user: User): Promise<void>
  delete(id: string): Promise<void>
  findByEmail(email: string): Promise<User>
}

// Postgres Implementation
class PostgresUserRepository implements IUserRepository {
  // ... implementação
}

// SQLite Implementation
class SqliteUserRepository implements IUserRepository {
  // ... implementação (pode ter alguns trade-offs)
}

// Mock for Tests
class MockUserRepository implements IUserRepository {
  private users = new Map<string, User>()
  // ... super simples, em memória
}

// Factory
function createUserRepository(): IUserRepository {
  if (process.env.DB === 'postgres') {
    return new PostgresUserRepository()
  } else if (process.env.DB === 'sqlite') {
    return new SqliteUserRepository()
  } else {
    return new MockUserRepository()
  }
}

// Usage
const repo = createUserRepository()
await repo.create(newUser)
```

Você topa estruturar assim e depois me passa pra code review?
Acho que você tá pronto pra implementar! 

Dúvidas? 👨‍💼
```

### Você:
```
Gostei! Mas e se a query é complexa — tipo filtrar por múltiplos campos?
Como padroniza entre SQL e mock?
```

### Marina:
```
👨‍💼 Ótima pergunta! Você tá pensando certo.

Opção 1: Query Builder (tipo Knex, Prisma)
  Pros: Unifica queries, type-safe
  Cons: Adds dependency, curva de aprendizado
  
Opção 2: Criterion Pattern
  Pros: Agnóstico, composável
  Cons: Mais verboso
  Exemplo:
    repo.find([
      new Criterion('age', '>', 18),
      new Criterion('status', 'eq', 'active')
    ])

Opção 3: Keep it Simple (Por enquanto)
  findByEmailAndStatus(email, status)?
  findActiveByAge(age)?
  Pros: Simples, funciona pro MVP
  Cons: Pode ficar muitos métodos
  
Qual é seu caso de uso? (quantidade de queries, complexidade?)

Acho que Opção 1 (Query Builder) ou Opção 3 (Métodos) 
são realistas pro seu level. Opção 2 é mais avançada.

Qual faz sentido pro seu projeto? 👨‍💼
```

---

## Exemplo 4: Query Performance Analysis

### Você:
```
/skill bmad-agent-tech-lead
[escolhe "QI" ou "3"]
```

### Marina:
```
👨‍💼 Query Insights — vamos otimizar!

Qual query/banco você quer que eu analise?
```

### Você:
```
SELECT u.*, p.*, o.* 
FROM users u
LEFT JOIN profiles p ON u.id = p.user_id
LEFT JOIN orders o ON u.id = o.user_id
WHERE u.created_at > NOW() - INTERVAL 30 DAY
ORDER BY u.created_at DESC
LIMIT 100
```

### Marina:
```
👨‍💼 Achei alguns pontos!

🟠 PERFORMANCE ISSUES:
1. SELECT u.*, p.*, o.*
   Problem: Traz MUITA data desnecessária
   Fix: SELECT u.id, u.name, p.bio, o.total
   Impact: -80% data transfer

2. LEFT JOIN sem filtro em p ou o
   Problem: Explosive join (1 user → N profiles → M orders)
   Fix: Adicione WHERE ou mude pra 2 queries
   Impact: resultado pode ter 10x+ linhas que users

3. Sem índice em users.created_at
   Problem: Full table scan nos 30 days
   Fix: CREATE INDEX idx_users_created DESC
   Impact: 1000x mais rápido

💡 REFACTORED:
CREATE INDEX idx_users_created ON users(created_at DESC);

SELECT 
  u.id, u.name, u.email,
  COUNT(p.id) as profile_count,
  SUM(o.total) as total_spent
FROM users u
LEFT JOIN profiles p ON u.id = p.user_id
LEFT JOIN orders o ON u.id = o.user_id
WHERE u.created_at > NOW() - INTERVAL 30 DAY
GROUP BY u.id
ORDER BY u.created_at DESC
LIMIT 100

Performance esperado:
Before: 5000ms
After: 45ms

🎯 Test com: EXPLAIN ANALYZE
```

---

## 🎓 Dicas Finais

1. **Marina é um mentor** — não um implementador
2. **Sempre explique seu thinking** — Marina vai guiar, não vai te dar resposta pronta
3. **Documente as decisões** — Use ADRs para registrar por quê
4. **Celebre os aprendizados** — Cada bug found = learning opportunity
5. **Volta com dúvidas** — Nenhuma pergunta é boba

Invoque Marina quando precisar! 👨‍💼
