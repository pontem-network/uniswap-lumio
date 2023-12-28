#!/bin/bash

set -ex

# Check environment
ENV_LIST=(
    # "VUE_APP_STATS_API_URL"
)
for variable in ${ENV_LIST[@]}; do
    eval ": \"\${$variable:?\"Need to set $variable from .env\"}\""
    sed -i "s|--${variable}--|${!variable}|g;" ./js/*.js
done

# ENV_LIST_NGINX=(
#     "NGINX_MAP_DOMAIN"
# )
# for variable in ${ENV_LIST_NGINX[@]}; do
#     eval ": \"\${$variable:?\"Need to set $variable from .env\"}\""
#     sed -i "s|--${variable}--|${!variable}|g;" /etc/nginx/conf.d/default.conf
# done

# sed -i "
#     s/--VUE_APP_DATA_SERVER_API_URL--//g;
#     s/--VUE_APP_CHAIN_API_URL--//g;
#     " ./js/*.js

# Create policy.conf for nginx from template
mkdir -p /etc/nginx/conf.d/csp
/create_csp.sh > /etc/nginx/conf.d/csp/10_policy.conf


exec "$@"
