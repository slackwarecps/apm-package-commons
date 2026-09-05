# Commons — pacote APM

Pacote com componentes comuns para agentes da Fabao Corp: agentes, skills e
servidores MCP. O pacote pode ser instalado em um projeto preparado para o
APM CLI.

## Pré-requisitos

- APM CLI instalado e disponível como `apm` no terminal;
- um projeto-alvo onde os componentes serão instalados;
- um target configurado, como `claude` ou `copilot`.

## Instalação a partir de uma cópia local

Clone este repositório ao lado do projeto onde deseja instalar o pacote:

```bash
git clone git@github.com:slackwarecps/apm-package-commons.git commons
cd projeto-alvo
```

Inicialize o projeto com o target desejado:

```bash
apm init -y --target claude
```

Instale o pacote informando o caminho para a pasta clonada:

```bash
apm install ../commons --target claude
```

Para instalar para o GitHub Copilot, use:

```bash
apm init -y --target copilot
apm install ../commons --target copilot
```

Também é possível inicializar os dois targets de uma vez:

```bash
apm init -y --target claude,copilot
apm install ../commons --target claude
```

## Instalação via marketplace

Se o pacote estiver publicado em um marketplace registrado no APM, adicione o
marketplace e pesquise o pacote:

```bash
apm marketplace add <caminho-ou-fonte-do-marketplace> --name <nome-do-marketplace>
apm search commons@<nome-do-marketplace>
```

Depois, use o identificador exibido pelo catálogo para instalar o pacote:

```bash
apm install commons@<nome-do-marketplace> --target claude
```

Confira os targets disponíveis com:

```bash
apm targets
```

## Arquivos instalados

Com o target `claude`, os componentes são materializados no projeto-alvo em:

```text
.claude/agents/example-agent.md
.claude/skills/example-skill/SKILL.md
apm_modules/_local/commons/mcp/example-server/server.js
```

Com o target `copilot`, o agente e a skill são materializados em:

```text
.github/agents/example-agent.agent.md
.agents/skills/example-skill/SKILL.md
apm_modules/_local/commons/mcp/example-server/server.js
```

O servidor MCP incluído neste pacote é um placeholder. Ele ainda não possui
transporte ou comando de integração com um cliente MCP.

## Metadados

- Nome: `commons`
- Versão: `1.0.0`
- Descrição: `Primitives comuns para agentes da Fabao Corp`
- Repositório: `git@github.com:slackwarecps/apm-package-commons.git`
