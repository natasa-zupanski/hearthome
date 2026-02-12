FROM alpine:3.20

WORKDIR /app

# Dependencies needed to run JavaScript/TypeScript tooling in this container.
RUN apk add --no-cache bash ca-certificates git nodejs npm \
    && npm install -g pnpm

COPY . .

# Default interactive shell for local dev containers.
CMD ["sh"]
