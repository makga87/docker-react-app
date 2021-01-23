FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx

COPY --from=builder /usr/src/app/build /usr/share/nginx/html

# --from-builder : 다른 Stage에 있는 파일을 복사할 때 다른 Stage 이름을 명시
# /usr/src/app/build : 복사할 파일이 있는 경로
# /usr/share/nginx/html : 복사할 경로