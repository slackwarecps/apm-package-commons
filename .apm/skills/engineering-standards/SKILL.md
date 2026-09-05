---
name: engineering-standards
description: Padrões de engenharia para planejar, implementar, revisar e operar software em diferentes stacks e disciplinas.
---

# Padrões de engenharia

Use estas diretrizes como baseline para qualquer projeto. Adapte os detalhes à
stack e ao contexto do produto, mas registre explicitamente toda exceção.

## 1. Antes de implementar

- Entenda o problema, o usuário afetado e o resultado esperado.
- Identifique requisitos funcionais, não funcionais, restrições e dependências.
- Procure padrões, componentes e decisões existentes antes de criar algo novo.
- Divida o trabalho em mudanças pequenas e verificáveis.
- Defina critérios de aceite e como o comportamento será validado.
- Para mudanças relevantes, registre a decisão, as alternativas consideradas e
  os trade-offs em uma ADR ou documento equivalente.

## 2. Durante a implementação

- Preserve as interfaces e comportamentos existentes, exceto quando a mudança
  for intencional e documentada.
- Prefira soluções simples, coesas e fáceis de testar.
- Mantenha responsabilidades bem definidas e evite duplicação.
- Valide entradas nas fronteiras do sistema e trate erros de forma explícita.
- Não esconda falhas com valores padrão silenciosos ou capturas genéricas.
- Proteja dados sensíveis: não registre segredos, tokens ou dados pessoais em
  logs, testes ou mensagens de erro.
- Considere acessibilidade, internacionalização, performance e segurança quando
  forem relevantes para a experiência ou o risco do produto.

## 3. Qualidade e testes

- Teste o comportamento observável, priorizando regras de negócio e cenários
  de falha.
- Mantenha testes determinísticos, isolados e fáceis de diagnosticar.
- Use o menor nível de teste que ofereça confiança; combine testes unitários,
  integração e ponta a ponta quando necessário.
- Atualize testes junto com a mudança e não reduza cobertura para contornar
  uma falha.
- Execute formatador, lint, type-check, build e testes previstos pelo projeto
  antes de integrar.

## 4. Revisão e integração

- Faça mudanças focadas, com nomes e mensagens que expliquem a intenção.
- Revise segurança, compatibilidade, migrações, observabilidade e impacto
  operacional, além da lógica principal.
- Use commits pequenos e descritivos; não misture refatorações não relacionadas.
- Toda mudança deve ter documentação, configuração e migrações atualizadas
  quando aplicável.
- Pull requests devem explicar o problema, a solução, os riscos e a validação
  realizada.

## 5. Operação

- Inclua logs estruturados, métricas e traces suficientes para diagnosticar o
  fluxo sem expor informações sensíveis.
- Defina timeouts, retries com limites e comportamento de degradação para
  integrações externas.
- Planeje rollback ou uma estratégia segura de reversão para mudanças
  implantáveis.
- Monitore erros e indicadores relevantes após a publicação.
- Documente ownership, dependências, configuração necessária e procedimentos
  de incidente.

## Checklist mínimo

Antes de concluir, confirme:

- [ ] O problema e os critérios de aceite estão claros.
- [ ] A solução segue padrões existentes ou documenta sua exceção.
- [ ] Entradas, erros e dados sensíveis são tratados com segurança.
- [ ] Testes cobrem o caminho principal e os cenários de falha relevantes.
- [ ] As validações disponíveis foram executadas.
- [ ] Documentação, observabilidade e plano de reversão foram considerados.
