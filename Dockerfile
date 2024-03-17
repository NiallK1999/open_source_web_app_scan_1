FROM node:alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.25.4-alpine3.18 AS deploy
COPY --from=build /app/dist /usr/share/nginx/html