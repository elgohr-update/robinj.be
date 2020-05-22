FROM node:14 AS build
WORKDIR /app
COPY . .
RUN npm install && \
    npm run build && \
    rm -rf node_modules

FROM nginx:stable
COPY --from=build /app/build/ /usr/share/nginx/html