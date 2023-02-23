FROM node:12-alpine

WORKDIR /app/

COPY . /app/

CMD ["node", "index.js"]

EXPOSE 8080