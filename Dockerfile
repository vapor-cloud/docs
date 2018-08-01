# build stage
FROM node:9.11.1-alpine as build-stage
WORKDIR /app
RUN npm install -g vuepress
COPY . .
RUN npm install
RUN vuepress build

# production stage
FROM nginx:1.13.12-alpine as production-stage
COPY --from=build-stage /app/.vuepress/dist/ /usr/share/nginx/html/
RUN chown -R nginx:nginx /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]