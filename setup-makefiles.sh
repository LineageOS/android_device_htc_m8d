#!/bin/bash

set -e

export DEVICE=m8d
export DEVICE_COMMON=m8-common
export VENDOR=htc

./../$DEVICE_COMMON/setup-makefiles.sh $@
