/*
 * Copyright (c) 2015, The CyanogenMod Project. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telephony;

import android.content.Context;
import android.os.Message;
import android.os.Parcel;
import android.os.SystemProperties;
import android.telephony.Rlog;

import java.util.Arrays;

/**
 * RIL customization for HTC One M8 Dual SIM
 *
 * {@hide}
 */
public class M8dRIL extends RIL {
    private static final int MAX_RILS = 2;
    private static final int[] RIL_NETWORK_TYPE = new int[MAX_RILS];

    private static final String HTCRIL_LOG_TAG = "M8dRIL";
    private static final boolean HTCRIL_LOGD = false;

    public M8dRIL(Context context, int networkMode, int cdmaSubscription) {
        super(context, networkMode, cdmaSubscription, null);
    }

    public M8dRIL(Context context, int preferredNetworkType,
            int cdmaSubscription, Integer instanceId) {
        super(context, preferredNetworkType, cdmaSubscription, instanceId);

        processRILPreferredNetworkType(mInstanceId, preferredNetworkType);
    }

    @Override
    protected Object responseGetPreferredNetworkType(Parcel p) {
        Object o = super.responseGetPreferredNetworkType(p);

        processRILPreferredNetworkType(mInstanceId, mPreferredNetworkType);

        return o;
    }

    @Override
    public void setPreferredNetworkType(int networkType, Message response) {
        super.setPreferredNetworkType(networkType, response);

        processRILPreferredNetworkType(mInstanceId, networkType);
    }

    private void m8dRilLog(String msg) {
        Rlog.d(HTCRIL_LOG_TAG, msg
                + (mInstanceId != null ? (" [SUB" + mInstanceId + "]") : ""));
    }

    private void logNetworkType() {
        if (!HTCRIL_LOGD) return;

        m8dRilLog("responseGetPreferredNetworkType: networkType=" +
                String.valueOf(mPreferredNetworkType));

        m8dRilLog("responseGetPreferredNetworkType: RIL_NETWORK_TYPE=" +
                Arrays.toString(RIL_NETWORK_TYPE));

        m8dRilLog("gsm.network.type=" +
                Arrays.toString(RIL_NETWORK_TYPE));
    }

    private void processRILPreferredNetworkType(Integer instanceId, int type) {
        if (instanceId != null) {
            RIL_NETWORK_TYPE[instanceId] = type;
        }

        SystemProperties.set("persist.radio.prefer.network", String.valueOf(RIL_NETWORK_TYPE[0]));
        SystemProperties.set("persist.radio.prefer.nw.sub", String.valueOf(RIL_NETWORK_TYPE[1]));

        logNetworkType();
    }
}
