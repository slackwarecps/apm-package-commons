# Changelog

Todas as mudanças notáveis deste projeto estão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
e este projeto segue [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2026-09-05

### ✨ Added

#### Grill-me Agent — Entrevista Técnica Rigorosa
- Skill encapsulada com estrutura BMAD completa
- 8 dimensões de análise: Problema, Alternativas, Arquitetura, Resiliência, Segurança, Implementação, Operação, Custo
- Documentação completa:
  - `SKILL.md` — 8 dimensões de análise detalhadas
  - `README.md` — Overview e quando usar
  - `EXEMPLOS.md` — 4 exemplos reais de use cases
  - `WORKFLOWS.md` — 6 workflows diferentes de interação
  - `customize.toml` — Configuração e customização de persona
- Persona ajustável via `customize.toml`
- Suporta análise iterativa de propostas

#### Marina — Tech Lead Agent (bmad-agent-tech-lead)
- Especialista em code review, validação de arquitetura e mentoria
- Focado em qualidade técnica e desenvolvimento de pessoas
- Documentação profissional com exemplos
- Customizável para diferentes contextos de time

#### Engineering Standards
- Padrões de engenharia da Fabao Corp
- Referência para manutenção de qualidade
- Consistência técnica entre projetos

#### Installation & Tooling
- Script `install-with-agents.sh` — Instalação all-in-one
- Suporte completo para APM CLI v0.28.0+
- Compatibilidade com múltiplos targets (claude, copilot, agent-skills)
- `apm.yml` com metadados completos

#### Documentation
- `README.md` — Documentação profissional v1.0.0
- `INSTALL-GUIDE.md` — Guia detalhado de instalação
- `CHANGELOG.md` — Este arquivo

### 🔧 Changed

- Refatorou grill-me-agent de arquivo simples (`.agents/grill-me-agent.md`) para skill estruturada (`skills/grill-me-agent/`)
- Alinhado com padrão BMAD usado em bmad-agent-tech-lead
- Removido script `post-install.sh` (não mais necessário)
- Simplificado script de instalação

### 📚 Documentation

- Criada documentação completa de uso
- Exemplos reais de entrevista técnica (4 cenários)
- Documentação de workflows (6 tipos diferentes)
- Customização via TOML

### 🎯 Compatibilidade

- **APM CLI**: v0.28.0+
- **Claude**: Opus 5, Sonnet 5, Haiku 4.5
- **Targets**: claude, copilot, agent-skills, all
- **OS**: macOS, Linux, Windows (via WSL)

---

## Roadmap Futuro

### v1.1.0 (Planejado)
- [ ] Suporte a customização via UI
- [ ] Integração com GitHub Actions
- [ ] Métricas de uso
- [ ] Export de findings para formatos estruturados

### v1.2.0 (Planejado)
- [ ] Novos workflows especializados
- [ ] Mais exemplos por domínio
- [ ] Integração com ferramentas de documentação

### v2.0.0 (Vision)
- [ ] Comunidade de skills extensível
- [ ] Marketplace de templates
- [ ] AI-powered skill composition

---

## Notas de Publicação

### Como Instalar

```bash
apm init -y --target agent-skills,claude
apm install slackwarecps/apm-package-commons --target agent-skills,claude
```

### Suporte

- Documentação: Veja `skills/[skill-name]/README.md`
- Exemplos: Veja `skills/[skill-name]/EXEMPLOS.md`
- Issues: https://github.com/slackwarecps/apm-package-commons/issues

### Contribuindo

1. Fork o repositório
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

---

**v1.0.0** é a primeira versão estável e recomendada para uso em produção. 🚀
