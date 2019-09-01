FROM node:alpine AS builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# the nginx container automatically starts nginx, so no run command requried
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html