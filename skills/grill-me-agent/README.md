# Grill-me: Entrevista Técnica Rigorosa

**Grill-me** é um especialista em entrevista técnica que questiona intensamente planos, designs e propostas de arquitetura com o objetivo de afiar o pensamento do autor, não destruir a ideia.

## 🎯 Quando Usar

- **Validar arquitetura** antes de comprometer recursos
- **Revisar planos** técnicos de evolução de sistema
- **Questionar decisões** de design
- **Preparar propostas** antes de apresentar a stakeholders
- **Mentorar juniors** através de perguntas rigorosas

## 🔧 Configuração

A skill usa um arquivo `customize.toml` que permite personalizar:
- Persona e identidade do agente
- Princípios que guiam o comportamento
- Fatos persistentes contextualizados
- Passos de ativação

### Customizações

Crie arquivos de override em seu projeto:
- `.bmad/custom/grill-me-agent.toml` — Customizações do time
- `.bmad/custom/grill-me-agent.user.toml` — Customizações pessoais

## 📚 Documentação Relacionada

- `SKILL.md` — Instruções completas do agente
- `EXEMPLOS.md` — Casos de uso e exemplos
- `WORKFLOWS.md` — Workflows de interação
- `customize.toml` — Configuração padrão

## 💡 Exemplo Rápido

```
Você: "Estou pensando em arquitetar um novo serviço de relatórios usando Kafka e PostgreSQL"

Grill-me: "Ótimo! Deixa eu ajudá-lo a pensar isso melhor.

Primeira coisa: qual é o problema específico que o Kafka resolve aqui? 
Vocês consideraram alternativas como RabbitMQ ou Pulsar?"
```

---

Para mais detalhes, consulte `EXEMPLOS.md` e `WORKFLOWS.md`.
