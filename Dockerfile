FROM node:alpine as builder
WORKDIR /app
COPY package.json /app
RUN npm install
COPY ./ /app
CMD ["npm","run","start"]

### 2 step ###
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
