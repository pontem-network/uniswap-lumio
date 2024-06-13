FROM node:16.20.2 as build
WORKDIR /opt/app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN apk add --no-cache bash jq curl
RUN for ip in `curl -s https://www.cloudflare.com/ips-v4` ; do echo "set_real_ip_from $ip;" >> /etc/nginx/conf.d/20_cf-ip.conf;done && \
    for ip in `curl -s https://www.cloudflare.com/ips-v6` ; do echo "set_real_ip_from $ip;" >> /etc/nginx/conf.d/20_cf-ip.conf;done && \
    echo "real_ip_header CF-Connecting-IP;" >> /etc/nginx/conf.d/20_cf-ip.conf
COPY --from=build /opt/app/build /usr/share/nginx/html
COPY ./.build/nginx/default.conf ./.build/nginx/json-logs.conf /etc/nginx/conf.d/
COPY ./.build/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./.build/entrypoint.sh /
COPY ./.build/create_csp.sh /

# ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["nginx", "-g", "daemon off;"]
