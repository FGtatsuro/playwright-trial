# Use same version to the one Playwright image uses.
#   FYI: https://github.com/microsoft/playwright/blob/main/utils/docker/Dockerfile.focal#L9-L20
FROM node:16-alpine AS builder

WORKDIR /opt/app

COPY package.json package-lock.json .
RUN npm install


FROM mcr.microsoft.com/playwright:v1.23.1-focal AS runner

WORKDIR /opt/app

# To suppress npm notice about npm version
RUN npm install -g npm@latest

COPY --from=builder /opt/app/node_modules /opt/app/node_modules
COPY main.spec.ts /opt/app
#COPY main.ts /opt/app

ENTRYPOINT ["npx", "playwright", "test"]
CMD ["/opt/app/main.spec.ts"]
#ENTRYPOINT ["npx", "ts-node"]
#CMD ["/opt/app/main.ts"]
