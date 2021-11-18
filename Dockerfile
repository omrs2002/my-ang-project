#fist stage building img:
FROM node:alpine3.14 as build
RUN mkdir -p /app

WORKDIR /app

COPY package.json /app/
RUN npm install

COPY . /app/
RUN npm run build --prod

#second stage
FROM nginx:alpine
COPY --from=build /app/dist/my-ang-project /usr/share/nginx/html






