FROM node:12.2.0-alpine

WORKDIR /app

COPY . .

RUN apt update -y
RUN npm install -y
RUN npm run test

EXPOSE 8000

CMD ["node", "app.js" ]









