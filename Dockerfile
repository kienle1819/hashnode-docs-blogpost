FROM node:16.15.1 as build
WORKDIR /src
ADD . .
RUN npm install
RUN npm run build

FROM  nginx:alpine
LABEL demonstration.by Tony Kien <@tonykien2012>
COPY  nginx/config/nginx.conf /etc/nginx/nginx.conf
COPY  nginx/config/app.conf /etc/nginx/conf.d/app.conf
COPY  --from=build /src/public /usr/share/nginx/app
