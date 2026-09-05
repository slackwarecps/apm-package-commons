# Contribuindo para Commons Package

Obrigado pelo interesse em contribuir! Este documento descreve como fazer isso.

## 🎯 Código de Conduta

Seja respeitoso, construtivo e colaborativo. Focamos em melhorar juntos.

---

## 📝 Como Reportar Bugs

1. **Verifique se o bug já foi reportado** em Issues
2. **Descreva o comportamento atual** e o esperado
3. **Incluir passos para reproduzir** se possível
4. **Screenshots/logs** ajudam muito

Exemplo:
```markdown
**Comportamento Atual:** Grill-me não questiona alternativas
**Esperado:** Grill-me deveria questionar ao menos 3 alternativas

**Passos:**
1. Execute /grill-me-agent
2. Descreva sua ideia
3. Observe que não há perguntas sobre alternativas

**Ambiente:** Claude v5, APM CLI 0.28.0, macOS
```

---

## 🚀 Sugerindo Melhorias

1. Use o template de Issue
2. Descreva o benefício (não apenas a ideia)
3. Exemplos concretos ajudam
4. Discuta trade-offs

---

## 🔨 Desenvolvendo

### Setup Local

```bash
# Clone
git clone git@github.com:slackwarecps/apm-package-commons.git
cd apm-package-commons

# Crie uma branch
git checkout -b feature/sua-feature

# Teste localmente
cd ~/seu-projeto
apm install ../caminho/para/commons --target agent-skills,claude
```

### Estrutura de Skills

Cada skill segue este padrão:

```
skills/skill-name/
├── SKILL.md              # Instruções completas (obrigatório)
├── README.md             # Overview e quando usar
├── EXEMPLOS.md           # Exemplos reais de uso
├── WORKFLOWS.md          # Workflows de interação
└── customize.toml        # Configuração e customização
```

### Adicionando Uma Nova Skill

1. **Crie a pasta:** `skills/nova-skill/`
2. **Implemente os 5 arquivos** (ver estrutura acima)
3. **Documente bem** — exemplos e workflows são críticos
4. **Teste** em um projeto local
5. **Atualize** `apm.yml` e `README.md`

Exemplo de `customize.toml` mínimo:

```toml
[agent]
name = "MeuAgente"
title = "Descrição"
icon = "🎯"

role = "O que faz"
identity = "Como é"
communication_style = "Tom de voz"

principles = [
  "Princípio 1",
  "Princípio 2",
]
```

### Melhorando Uma Skill Existente

1. **Edite o arquivo** (ex: `SKILL.md`)
2. **Atualize documentação** se necessário
3. **Teste** de verdade
4. **Commit com descrição clara**

---

## ✅ Checklist Antes de Fazer PR

- [ ] Código/docs seguem o estilo do projeto
- [ ] Testei localmente
- [ ] Atualizei `apm.yml` se adicionei skill
- [ ] Atualizei `README.md` se necessário
- [ ] Atualizei `CHANGELOG.md`
- [ ] Commits têm mensagens claras
- [ ] Sem quebra de mudanças inesperadas

---

## 📮 Processo de Pull Request

1. **Fork & Clone**
2. **Crie uma branch:** `git checkout -b feature/descricao`
3. **Faça mudanças** e commite
4. **Teste localmente:**
   ```bash
   cd ~/seu-projeto
   apm install ../commons --target agent-skills,claude
   ```
5. **Abra PR com descrição clara**
6. **Responda feedback** do review

### Formato de Commit

Use [Gitmoji](https://gitmoji.dev/):

```bash
✨ feature: descrição breve
🐛 fix: correção
📝 docs: documentação
♻️ refactor: refatoração
🧪 test: testes
🎨 style: estilo
```

---

## 📚 Documentação

Toda feature/skill PRECISA de documentação:

- `SKILL.md` — Implementação
- `README.md` — O que faz
- `EXEMPLOS.md` — Como usar
- `WORKFLOWS.md` — Fluxos
- `customize.toml` — Customização

Qualidade de docs é tão importante quanto qualidade de código.

---

## 🔄 Versionamento

Seguimos [Semantic Versioning](https://semver.org/):

- `v1.0.0` — Versão estável com todas as features
- `v1.1.0` — Nova feature (backwards compatible)
- `v1.1.1` — Bug fix
- `v2.0.0` — Breaking change

---

## 💡 Ideias de Contribuição

Sem ideias? Aqui estão algumas:

- [ ] Novos workflows para Grill-me
- [ ] Mais exemplos por domínio
- [ ] Documentação de casos extremos
- [ ] Integração com outras ferramentas
- [ ] Performance improvements
- [ ] Testes automatizados
- [ ] Tradução de documentação

---

## 🎓 Aprendendo com o Projeto

- Leia `CHANGELOG.md` para ver evolução
- Estude `skills/grill-me-agent/` como exemplo completo
- Veja commits que adicionaram features
- Faça fork e experimente

---

## ❓ Dúvidas?

- Abra uma Discussion em Issues
- Consulte documentação em `skills/*/README.md`
- Veja exemplos em `skills/*/EXEMPLOS.md`

---

**Obrigado por contribuir! 🙏**
