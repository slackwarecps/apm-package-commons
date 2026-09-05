# Exemplos de Uso - Grill-me

## Exemplo 1: Validar Arquitetura de Microserviços

**Você apresenta:**
"Estou planejando migrar a aplicação monolítica para microserviços. Vou dividir por domínios: User, Product, Order, Payment."

**Grill-me questiona:**

1. **Problema & Requisitos**
   - "Qual é o problema específico que o monólito tem agora?"
   - "Qual é o critério de sucesso? Latência? Escalabilidade? Time de deployment?"
   - "Alguém mediu o tamanho do monólito? Onde estão os gargalos reais?"

2. **Alternativas**
   - "Por que microserviços e não modularização no monólito primeiro?"
   - "Vocês consideraram separar apenas os serviços críticos? Por que tudo?"

3. **Arquitetura**
   - "Como vocês vão lidar com transações distribuídas?"
   - "Como Order vai se comunicar com Payment? Síncrono ou assíncrono?"
   - "Qual é a estratégia de versionamento de API?"

4. **Resiliência**
   - "Se Payment fica down, o que acontece? Order trava ou falha gracefully?"
   - "Vocês têm circuit breakers configurados?"
   - "Como diagnosticam problemas distribuídos?"

5. **Implementação**
   - "Como vocês vão fazer o rollout? Migram tudo ou gradualmente?"
   - "Como testam interações entre serviços?"
   - "Qual é o plano se descobrirem que a divisão de domínios estava errada?"

---

## Exemplo 2: Validar Escolha Tecnológica

**Você apresenta:**
"Vamos usar PostgreSQL com Redis para cache e Elasticsearch para busca."

**Grill-me questiona:**

1. **Problema**
   - "Por que essa stack resolve o problema?"
   - "Qual é a taxa de read vs. write?"
   - "Qual é o tamanho esperado dos dados?"

2. **Alternativas**
   - "Por que não MongoDB ou DynamoDB?"
   - "Redis é melhor que Memcached para seu caso?"
   - "Elasticsearch é necessário ou buscas em SQL resolvem?"

3. **Arquitetura**
   - "Como vocês sincronizam dados entre PostgrSQL e Redis?"
   - "O que acontece se Redis perde dados?"
   - "Como garante consistência entre PostgreSQL e Elasticsearch?"

4. **Operação**
   - "Qual é o custo de manutenção dessa stack?"
   - "Vocês têm expertise com esses três sistemas?"
   - "Qual é a curva de aprendizado do time?"

---

## Exemplo 3: Validar Plano de Deployment

**Você apresenta:**
"Vamos fazer blue-green deployment com Kubernetes, canary de 10% no primeiro dia."

**Grill-me questiona:**

1. **Problema**
   - "Qual é a métrica de sucesso do canary?"
   - "Quanto tempo vocês deixam em 10%?"
   - "Como vocês detectam problemas em produção?"

2. **Alternativas**
   - "Por que não feature flags ao invés de canary?"
   - "Por que 10% e não 5%?"
   - "Vocês consideraram shadow traffic?"

3. **Resiliência**
   - "Se algo dá errado em 10%, qual é o plano de rollback?"
   - "Quanto tempo para rolar back? Vocês testaram?"
   - "Como vocês monitora durante o canary?"

4. **Operação**
   - "Quem é chamado se algo dá errado 3am?"
   - "Vocês têm runbook para problemas comuns?"
   - "Como vocês documentam o que aprenderam?"

---

## Exemplo 4: Validar Abordagem de Segurança

**Você apresenta:**
"Vamos usar OAuth2 para autenticação e JWT para autorização."

**Grill-me questiona:**

1. **Segurança**
   - "JWT é stateless — como vocês revogam permissões?"
   - "Qual é o tempo de expiração do token?"
   - "E se a chave de assinatura for comprometida?"

2. **Alternativas**
   - "Por que não usar Session + Cookie?"
   - "Vocês consideraram mTLS?"
   - "Qual é o nível de segurança que vocês precisam realmente?"

3. **Operação**
   - "Como vocês rotacionam chaves?"
   - "Há auditoria de quem acessou o quê?"
   - "Vocês têm plano de recuperação de uma violação?"

---

## Padrão de Resposta Esperado

Grill-me sempre fecha com:

```markdown
# Grill-me Findings: [Nome do Plano]

## ✅ Forças
- A arquitetura de microserviços é bem pensada
- Divisão de domínios faz sentido para o time

## ⚠️ Riscos
- Transações distribuídas não estão planejadas
- Falta estratégia de comunicação entre serviços
- Rollout gradual não está mapeado

## 🎯 Ações Recomendadas
- [ ] Documentar padrão de transação distribuída
- [ ] Definir timeouts e retry policies
- [ ] Criar plano de migration do monólito

## 📊 Escores
- Clareza do Problema: 4/5
- Solidez da Arquitetura: 3/5
- Resiliência: 2/5
- Segurança: 3/5
- Viabilidade: 4/5

**Próximos Passos:** Prototipe communication pattern antes de migração
```

---

## Dicas para Melhor Resultado

1. **Seja específico** — "Vamos usar X para Y porque Z"
2. **Traga dados** — "Nossa latência é XYZms, precisamos reduzir para ABCms"
3. **Liste alternativas que considerou** — Facilita a conversa
4. **Indique stakeholders** — "Isso foi decidido com o PO"
5. **Tenha um "por quê?" preparado** — Grill-me vai perguntar 10x
