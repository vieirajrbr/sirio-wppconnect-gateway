FROM node:22.15.0-alpine AS builder

WORKDIR /usr/src/app

RUN apk add git \
    && git clone https://github.com/wppconnect-team/wppconnect-server.git . \
    && yarn install \
    && yarn build

FROM node:22.15.0-alpine

RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY --from=builder /usr/src/app/package.json ./package.json
COPY --from=builder /usr/src/app/yarn.lock ./yarn.lock
COPY --from=builder /usr/src/app/dist ./dist

EXPOSE 21465

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser \
    PUPPETEER_CACHE_DIR=/usr/src/app/userDataDir \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    NODE_ENV=production

CMD ["yarn", "start"]
