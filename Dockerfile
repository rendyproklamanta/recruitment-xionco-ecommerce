FROM node:lts

WORKDIR /app

COPY package.json ./

RUN npm install

RUN echo "npm install completed successfully!"

COPY . .

EXPOSE 3000

CMD ["npm","run","start"]