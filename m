Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1678E54472A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:18:39 +0200 (CEST)
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEJJ-00078E-RG
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6v-0001Ov-5P
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:50 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6t-0005xd-8W
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:48 -0400
Received: by mail-wr1-x435.google.com with SMTP id u8so27137707wrm.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=815PqLyO6+Q2xJdxQZlA76V7TTOTcj2SZ6F7/EiLTo0=;
 b=zhjXtb+TnQRYQTfulh//qntXvpj6PXAqQQ2mn31XIawjv9WtorBmvM5GQFk3d0HTFI
 lah41ldMiLnJBAf42J7toiOBxje0NiRGKvgWmCgaP0+vZnoiGOu0A1j3tCOaW1DZ6Zlu
 bAoK0VjfPCGiYtPyG35jWUrrs4kufWN2nBzZyTXwFi62k6MLWA69pU/cwORT8S18ArjC
 mY0Vk0Oj52hvsc0CaDioKutP+25wr1sqfcoKYjduZkIRuGS9qm5NOXLhQQ6PES3yWLbs
 108P+8VwvAzjwyBFMmor0jy5B+a3Eeboq1oDTxGUmL2G/2yV5wCS3r3gB8MyZaetMn5S
 oX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=815PqLyO6+Q2xJdxQZlA76V7TTOTcj2SZ6F7/EiLTo0=;
 b=duFyBLNzIogCoaaWnVoqVmhlgyhtBhy74CL/PfyH8bQVGACc7XSLx+tvgLkYb9HZFj
 1+Cv4pyjIjaX6uOU5WM/pU1GvKhURRNc0iEZLDFXenlCbqWJvCfMOiwM3FIDfn4UpbOI
 Rqu7hViM5dOM2rRJG4cMqRsQAKG7hLrRFcQ9WQmy2C2sJfjkTF5eCuAbVRNHAve4AzTw
 QqopOlramslBz9f82/nvjduuLsyCthBw+JzVvzvCytZGQBcCHtVWykN/dgaIPZFBpl67
 dvmQfhJceALBy2/WvBcqehcQqJKklcPrOBknNFqSAgTC81eshgJEjzxAA5udgaLXmsVE
 6wOw==
X-Gm-Message-State: AOAM532jd3KpjEcYQ8mLdijmlogrFfHVZrx6DZmltcAggYTQBDvK/HJC
 CHfR8yslN6/9tIHHY+rIvKbsAJrdJwibvA==
X-Google-Smtp-Source: ABdhPJyqh8wPZ2i6KtAjNeG0lAaJg173vR95N380obJrfkhR06UKpPwoE9aK7AaUwaik6fWo9dxCJg==
X-Received: by 2002:a5d:59a6:0:b0:218:49ff:2712 with SMTP id
 p6-20020a5d59a6000000b0021849ff2712mr16631531wrr.106.1654765545792; 
 Thu, 09 Jun 2022 02:05:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/55] xlnx_dp: Introduce a vblank signal
Date: Thu,  9 Jun 2022 10:04:47 +0100
Message-Id: <20220609090537.1971756-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Add a periodic timer which raises vblank at a frequency of 30Hz.

Note that this is a migration compatibility break for the
xlnx-zcu102 board type.

Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Frederic Konrad <fkonrad@amd.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220601172353.3220232-3-fkonrad@xilinx.com
Changes by fkonrad:
  - Switched to transaction-based ptimer API.
  - Added the DP_INT_VBLNK_START macro.
Signed-off-by: Frederic Konrad <fkonrad@amd.com>
[PMM: bump vmstate version, add commit message note about
 compat break]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/display/xlnx_dp.h |  3 +++
 hw/display/xlnx_dp.c         | 30 ++++++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index 1ef5a89ee74..e86a87f235e 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -35,6 +35,7 @@
 #include "hw/dma/xlnx_dpdma.h"
 #include "audio/audio.h"
 #include "qom/object.h"
+#include "hw/ptimer.h"
 
 #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
 #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
@@ -107,6 +108,8 @@ struct XlnxDPState {
      */
     DPCDState *dpcd;
     I2CDDCState *edid;
+
+    ptimer_state *vblank;
 };
 
 #define TYPE_XLNX_DP "xlnx.v-dp"
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 0378570459d..ed856b596da 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -114,6 +114,7 @@
 #define DP_TX_N_AUD                         (0x032C >> 2)
 #define DP_TX_AUDIO_EXT_DATA(n)             ((0x0330 + 4 * n) >> 2)
 #define DP_INT_STATUS                       (0x03A0 >> 2)
+#define DP_INT_VBLNK_START                  (1 << 13)
 #define DP_INT_MASK                         (0x03A4 >> 2)
 #define DP_INT_EN                           (0x03A8 >> 2)
 #define DP_INT_DS                           (0x03AC >> 2)
@@ -260,7 +261,7 @@ typedef enum DPVideoFmt DPVideoFmt;
 
 static const VMStateDescription vmstate_dp = {
     .name = TYPE_XLNX_DP,
-    .version_id = 1,
+    .version_id = 2,
     .fields = (VMStateField[]){
         VMSTATE_UINT32_ARRAY(core_registers, XlnxDPState,
                              DP_CORE_REG_ARRAY_SIZE),
@@ -270,10 +271,15 @@ static const VMStateDescription vmstate_dp = {
                              DP_VBLEND_REG_ARRAY_SIZE),
         VMSTATE_UINT32_ARRAY(audio_registers, XlnxDPState,
                              DP_AUDIO_REG_ARRAY_SIZE),
+        VMSTATE_PTIMER(vblank, XlnxDPState),
         VMSTATE_END_OF_LIST()
     }
 };
 
+#define DP_VBLANK_PTIMER_POLICY (PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD | \
+                                 PTIMER_POLICY_CONTINUOUS_TRIGGER |    \
+                                 PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)
+
 static void xlnx_dp_update_irq(XlnxDPState *s);
 
 static uint64_t xlnx_dp_audio_read(void *opaque, hwaddr offset, unsigned size)
@@ -773,6 +779,13 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
         break;
     case DP_TRANSMITTER_ENABLE:
         s->core_registers[offset] = value & 0x01;
+        ptimer_transaction_begin(s->vblank);
+        if (value & 0x1) {
+            ptimer_run(s->vblank, 0);
+        } else {
+            ptimer_stop(s->vblank);
+        }
+        ptimer_transaction_commit(s->vblank);
         break;
     case DP_FORCE_SCRAMBLER_RESET:
         /*
@@ -1177,9 +1190,6 @@ static void xlnx_dp_update_display(void *opaque)
         return;
     }
 
-    s->core_registers[DP_INT_STATUS] |= (1 << 13);
-    xlnx_dp_update_irq(s);
-
     xlnx_dpdma_trigger_vsync_irq(s->dpdma);
 
     /*
@@ -1275,6 +1285,14 @@ static void xlnx_dp_finalize(Object *obj)
     fifo8_destroy(&s->rx_fifo);
 }
 
+static void vblank_hit(void *opaque)
+{
+    XlnxDPState *s = XLNX_DP(opaque);
+
+    s->core_registers[DP_INT_STATUS] |= DP_INT_VBLNK_START;
+    xlnx_dp_update_irq(s);
+}
+
 static void xlnx_dp_realize(DeviceState *dev, Error **errp)
 {
     XlnxDPState *s = XLNX_DP(dev);
@@ -1309,6 +1327,10 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
                                            &as);
     AUD_set_volume_out(s->amixer_output_stream, 0, 255, 255);
     xlnx_dp_audio_activate(s);
+    s->vblank = ptimer_init(vblank_hit, s, DP_VBLANK_PTIMER_POLICY);
+    ptimer_transaction_begin(s->vblank);
+    ptimer_set_freq(s->vblank, 30);
+    ptimer_transaction_commit(s->vblank);
 }
 
 static void xlnx_dp_reset(DeviceState *dev)
-- 
2.25.1


