#!/bin/bash

NGINX_MAP_DOMAIN

# Using global envinroment:
#  NGINX_MAP_DOMAIN     - Url for head domain (example: "devops.mom")



function defaultSrc {
    src_list=()
    echo "default-src 'self' ${src_list[@]};"
}
function connectSrc {
    src_list=(
        "https://*.${NGINX_MAP_DOMAIN}"
        "https://*.aptoslabs.com"
        "https://api.etherscan.io"
        "https://goerli.infura.io"
        "https://optimism-mainnet.infura.io"
        "https://main-rpc.linkpool.io"
        "https://rpc.goerli.mudit.blog"
        "https://*.layerzero-scan.com"
        "https://stargate.finance"
        "https://bscrpc.com"
        "https://binance.nodereal.io"
        "https://mainnet.optimism.io"
        "https://arb1.arbitrum.io"
        "https://api.avax.network"
        "https://polygon-rpc.com"
        "https://*.binance.org"
        "https://ethereumnodelight.app.runonflux.io"
        "https://*.alchemy.com"
        "https://*.alchemyapi.io"
        "https://avalanche--mainnet--rpc.datahub.figment.io"
        "https://poly-rpc.gateway.pokt.network"
        "https://*.gateway.pokt.network"
        "https://cloudflare-eth.com"
        "https://matic-mainnet.chainstacklabs.com"
        "https://www.google-analytics.com"
    )
    echo "connect-src 'self' ${src_list[@]};"
}
function scriptSrc {
    src_list=(
        "https://www.googletagmanager.com"
        "https://embed.typeform.com"
        "https://unpkg.com"
    )
    echo "script-src 'self' 'unsafe-inline' 'unsafe-eval' ${src_list[@]};"
}
function imgSrc {
    src_list=(
      "https://icons-ckg.pages.dev"
    )
    echo "img-src 'self' data: ${src_list[@]};"
}
function styleSrc {
    src_list=(
        "https://fonts.googleapis.com"
        "https://use.typekit.net"
        "https://p.typekit.net"
        "https://unpkg.com"
        "https://embed.typeform.com"
    )
    echo "style-src 'self' 'unsafe-inline' ${src_list[@]};"
}
function fontSrc {
    src_list=(
        "https://fonts.gstatic.com"
        "https://use.typekit.net"
        "https://p.typekit.net"
    )
    echo "font-src 'self' data: ${src_list[@]};"
}
function frameSrc {
    src_list=(
        "https://form.typeform.com"
    )
    echo "frame-src ${src_list[@]};"
}
function objectSrc {
    src_list=()
    echo "object-src 'self' blob: ${src_list[@]};"
}



# CSP - Content-Security-Policy
function createCSP {
     cat << EOF
add_header X-Frame-Options SAMEORIGIN;
add_header X-Content-Type-Options nosniff;
add_header X-XSS-Protection "1; mode=block";
add_header Referrer-Policy "strict-origin";
add_header Content-Security-Policy "$(defaultSrc) $(connectSrc) $(scriptSrc) $(imgSrc) $(styleSrc) $(fontSrc) $(frameSrc) $(objectSrc)";
EOF
}

# Start
createCSP
