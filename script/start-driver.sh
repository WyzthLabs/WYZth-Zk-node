#!/bin/sh

set -eou pipefail

if [ "$DISABLE_P2P_SYNC" == "false" ]; then
    wyzth_zkevm-client driver \
        --l1.ws ${L1_ENDPOINT_WS} \
        --l2.ws ws://l2_execution_engine:8546 \
        --l2.auth http://l2_execution_engine:8551 \
        --wyzth_zkevmL1 ${WYZTH_ZKEVM_L1_ADDRESS} \
        --wyzth_zkevmL2 ${WYZTH_ZKEVM_L2_ADDRESS} \
        --jwtSecret /data/wyzth_zkevm-geth/geth/jwtsecret \
        --p2p.syncVerifiedBlocks \
        --p2p.checkPointSyncUrl https://rpc.test.wyzth_zkevm.xyz \
        --p2p.syncTimeout "5000"
else
    wyzth_zkevm-client driver \
        --l1.ws ${L1_ENDPOINT_WS} \
        --l2.ws ws://l2_execution_engine:8546 \
        --l2.auth http://l2_execution_engine:8551 \
        --wyzth_zkevmL1 ${WYZTH_ZKEVM_L1_ADDRESS} \
        --wyzth_zkevmL2 ${WYZTH_ZKEVM_L2_ADDRESS} \
        --jwtSecret /data/wyzth_zkevm-geth/geth/jwtsecret
fi
