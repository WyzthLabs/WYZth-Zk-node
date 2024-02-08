#!/bin/sh

set -eou pipefail

if [ "$ENABLE_PROPOSER" == "true" ]; then
    wyzth_zkevm-client proposer \
      --l1.ws ${L1_ENDPOINT_WS} \
      --l2.http http://l2_execution_engine:8545 \
      --wyzth_zkevmL1 ${WYZTH_ZKEVM_L1_ADDRESS} \
      --wyzth_zkevmL2 ${WYZTH_ZKEVM_L2_ADDRESS} \
      --l1.proposerPrivKey ${L1_PROPOSER_PRIVATE_KEY} \
      --l2.suggestedFeeRecipient ${L2_SUGGESTED_FEE_RECIPIENT} \
      --minimalBlockGasLimit "5000000"
else
    sleep infinity
fi
