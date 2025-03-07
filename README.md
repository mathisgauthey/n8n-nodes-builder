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
│   ├── .env.example                        # Environment variables template file
│   ├── Dockerfile                          # Dev container Dockerfile
│   ├── devcontainer.json                   # Dev container configuration
│   ├── docker-compose.devcontainer.yaml    # Devcontainer specific docker-compose
│   ├── docker-compose.yaml                 # Main docker-compose configuration
│   ├── init.sh                             # Init script to clone repos
│   └── link_custom_nodes.sh                # Script to link custom nodes to n8n 
├── .vscode/
│   └── launch.json                         # VSCode launch configuration
├── custom-nodes/
│   ├── custom-node-1/
│   │   ├── dist/                           # Custom node 1 build folder
│   │   └── ...
│   └── custom-node-2/
│       ├── dist/                           # Custom node 2 build folder
│       └── ...
├── n8n/                                    # n8n source code             
│   └── ...
├── .gitignore
├── LICENSE
└── README.md
```

## How to use

1. Clone this repository and navigate to the root folder.
2. **[Optionnal (done during the dev container creation process)]** Clone the [n8n repository](https://github.com/n8n-io/n8n) at the workspace root and the [n8n-nodes-starter repository](https://github.com/n8n-io/n8n-nodes-starter) in the `custom-nodes` folder. You could also execute the `.devcontainer/init.sh` script to do it for you.
4. Create a `.env` file in the `.devcontainers` folder. You can use `.env.example` as a template.
   - Used for docker-compose [variable interpolation](https://docs.docker.com/compose/how-tos/environment-variables/variable-interpolation/#interpolation-syntax)
   - Used as [`.env` file for the n8n container](https://docs.docker.com/reference/compose-file/services/#env_file)
5. Use `F1` or `Ctrl+Shift+P` and select `Dev Containers: Reopen in Container` in VSCode. The first start it long (5m on my end) because it builds up n8n from source, but subsequent starts are a matter of seconds.
6. Go to your custom node folder and run `pnpm install` to install dependencies.
7. Still inside your custom node folder, run `pnpm build` to build your custom node.
6. Then press `F5` to start the n8n server in debug mode using `Launch n8n with debug` launch config. 
7. Add breakpoint to your custom node Typescript or n8n source code and start debugging !

If you want to see changes in your custom nodes, you can run `pnpm run dev` in your custom node folder to watch for changes and rebuild automatically. You'll still need to restart the n8n server to see the changes thought, this is tracked in issue [#5](https://github.com/mathisgauthey/n8n-nodes-builder/issues/5).

## Inspirations

- [How to setup a dev environment for node building](https://community.n8n.io/t/how-to-setup-a-dev-environment-for-node-building/77150)
- [Need help with testing custom node in dev container](https://community.n8n.io/t/need-help-with-testing-custom-node-in-dev-container/57520)
- [Developing Custom Nodes for n8n with Docker](https://dev.to/hubschrauber/developing-custom-nodes-for-n8n-with-docker-3poj)