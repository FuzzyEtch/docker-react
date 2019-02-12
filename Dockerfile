FROM node:alpine as builder
WORKDIR /app
COPY package.json /app
RUN npm install
COPY ./ /app
RUN npm run build

### 2 step ###
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

