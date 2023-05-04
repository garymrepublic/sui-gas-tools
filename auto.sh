#!/bin/bash
date >> gas_price_update.log
sh update_validators.sh
ts-node stats.ts >> gas_price_update.log
gas_price=$(ts-node stats.ts | grep -oP 'Estimated Next Reference Gas Price: \K\d+')
sui validator update-gas-price "$gas_price" >> gas_price_update.log
