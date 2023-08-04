#!/bin/bash
#
# Copyright (c) 2022 Intel Corporation
# SPDX-License-Identifier: Apache-2.0
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e


# You can remove no_proxy and proxy_server if your network doesn't need it
no_proxy="localhost,127.0.0.1"
proxy_server="" # your http proxy server


container=$(echo `docker ps -a | grep infer_client`)
if [ -n "${container}" ]; then
    docker stop infer_client && docker rm infer_client
fi
docker run --name infer_client \
    --cap-add=SYS_PTRACE \
    -e no_proxy=${no_proxy} \
    -e http_proxy=${proxy_server} \
    -e https_proxy=${proxy_server} \
    lr_infer_he:latest \
    /lr_infer_he_sgx/build/src/infer_client --data datasets/lrtest_mid_eval.csv