FROM node:19.0.0-bullseye

WORKDIR /app/

COPY . /app/

CMD ["node", "index.js"]

EXPOSE 8080