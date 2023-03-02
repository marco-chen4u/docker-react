#[1/2]Build Phase: builder step
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#[2/2]Run Phase: 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
