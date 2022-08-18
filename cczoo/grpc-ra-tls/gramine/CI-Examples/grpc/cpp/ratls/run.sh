#
# Copyright (c) 2022 Intel Corporation
#
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

set -ex

unset http_proxy https_proxy

if [ "$1" == "server" ]; then
    cd runtime/server
        gramine-sgx grpc ./server
    cd -
elif [ "$1" == "client" ]; then
    cd runtime/client
        gramine-sgx grpc ./client
    cd -
fi