# ---------------------------------------------------------------------------- #
#                              Pulling Base Image                              #
# ---------------------------------------------------------------------------- #

ARG NODE_VERSION
FROM n8nio/base:${NODE_VERSION}

# ---------------------------------------------------------------------------- #
#                       Setting Up The Build Environment                       #
# ---------------------------------------------------------------------------- #

RUN apk add --no-cache --update openssh sudo shadow bash
RUN echo node ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/node && chmod 0440 /etc/sudoers.d/node
RUN mkdir /workspace && chown node:node /workspace
RUN mkdir /home/node/.n8n && chown node:node /home/node/.n8n
USER node
RUN mkdir -p ~/.pnpm-store && pnpm config set store-dir ~/.pnpm-store --global