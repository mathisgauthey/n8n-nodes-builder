# ---------------------------------------------------------------------------- #
#                              Pulling Base Image                              #
# ---------------------------------------------------------------------------- #

ARG N8N_VERSION
FROM n8nio/n8n:${N8N_VERSION}

# ---------------------------------------------------------------------------- #
#                       Setting Up The Build Environment                       #
# ---------------------------------------------------------------------------- #

USER root
RUN apk add --no-cache --update sudo bash
RUN echo node ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/node && chmod 0440 /etc/sudoers.d/node
RUN mkdir /workspaces && chown node:node /workspaces
ENV NODE_ENV=development 
USER node
RUN mkdir -p ~/.pnpm-store && pnpm config set store-dir ~/.pnpm-store --global