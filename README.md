# n8n-nodes-builder

## Introduction

This repository aims to provide a simple way to get into developing nodes for n8n.

I am making it because the documentation on building custom nodes is currently [outdated](https://github.com/n8n-io/n8n-nodes-starter/issues/62), and left many [wondering how to get started](https://community.n8n.io/t/n8n-nodes-starter-example-switched-to-pnpm-does-not-match-tutorial/59031).

It is outdated because :
- It uses `npm` whereas `pnpm` is [now](https://github.com/n8n-io/n8n/pull/4429) the recommended package manager for n8n.
- It uses `npm link` to link nodes but making it work with `pnpm` is [undocumented](https://community.n8n.io/t/issues-creating-custom-nodes/81250/4) and people seems to rather [use docker](https://community.n8n.io/t/need-help-with-testing-custom-node-in-dev-container/57520/5) to make it work flawlessly.

Let's add that n8n itself is [using devcontainers](https://github.com/n8n-io/n8n/tree/master/.devcontainer) to help maintainers make contributions easier, so why not use it to develop custom nodes as well?

And this is exactly what this repository is all about.

## Overview

```text
.
├── .devcontainers/
│   ├── .env.example                        # Environment variables template file for docker-compose and odoo.conf variables
│   ├── Dockerfile                          # Dev container Dockerfile
│   ├── devcontainer.json                   # Dev container configuration
│   ├── docker-compose.extends.yaml         # Project specific docker-compose configuration (volume mounts for custom nodes...)
│   ├── docker-compose.devcontainer.yaml    # Devcontainer specific docker-compose configuration (volume mount for workspace folder)     
│   └── docker-compose.yaml                 # Main docker-compose configuration
├── .vscode/
│   └── launch.json                         # VSCode launch configuration
├── custom-nodes/
│   ├── custom-node-1/
│   │   ├── dist/                           # Custom node 1 build folder
│   │   └── ...
│   └── custom-node-2/
│       ├── dist/                           # Custom node 2 build folder
│       └── ...
├── .gitignore
├── LICENSE
└── README.md
```

## How to use

1. Clone this repository and navigate to the root folder.
2. Clone the [n8n-nodes-starter](https://github.com/n8n-io/n8n-nodes-starter) repository in the `custom-nodes` folder.
3. Create a `docker-compose.extends.yaml` file in the `.devcontainers` folder to extend the main `docker-compose.yaml` file. This file could contain the volume mounts for your n8n nodes for example.

    ```yaml
    services:
    n8n_web:
        volumes:
        - ../custom-nodes/n8n-nodes-starter/dist:/home/node/.n8n/custom/node_modules/n8n-nodes-starter
    ```	

4. Create a `.env` file in the `.devcontainers` folder. You can use `.env.example` as a template.
   - Used for docker-compose [variable interpolation](https://docs.docker.com/compose/how-tos/environment-variables/variable-interpolation/#interpolation-syntax)
   - Used as [`.env` file for the n8n container](https://docs.docker.com/reference/compose-file/services/#env_file)
5. Just use `F1` and select `Dev Containers: Reopen in Container` in VSCode.
6. Then press `F5` to start the n8n server in debug mode using `Launch n8n with debug` launch config, add breakpoint and start debugging.
7. Use the terminal to navigate to your custom node folder and run `pnpm run build` to build your custom node.

## Inspirations

- [How to setup a dev environment for node building](https://community.n8n.io/t/how-to-setup-a-dev-environment-for-node-building/77150)
- [Need help with testing custom node in dev container](https://community.n8n.io/t/need-help-with-testing-custom-node-in-dev-container/57520)
- [Developing Custom Nodes for n8n with Docker](https://dev.to/hubschrauber/developing-custom-nodes-for-n8n-with-docker-3poj)