FROM node:alpine as builder
WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN npm i -g yarn
RUN yarn
COPY . .
RUN yarn build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html