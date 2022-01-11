Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5589D48B42A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:42:38 +0100 (CET)
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7LAL-0004K2-FH
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:42:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfm-0005CN-Et
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:03 -0500
Received: from [2a00:1450:4864:20::332] (port=34403
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kff-0007Is-N2
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:02 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so999427wmb.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BFQHZs/9RH00d4p+SGa4ONXVkeFMreYGGrbWyj+yUJQ=;
 b=sRGzxppK0CVZpo3DwmGDhKmGqTyklwhik1ijePBdJL9knV6Q/qcRZgIRZbYsKwEosK
 JiCq+aM6rrHA5g7vsf+3FqRoRqAM+6FPa/gr9KssacX9iObim8ao088I0rEV1s5v/TC2
 2b4++e+HcTeE6i7YWJpouLqhhaoOER2Vn2PNLaZ7vsrMEpQo/n7k7xt27RWrMA6qFK0Z
 +idhF1AQNfr6IFrHfereaTrvjb8qawUTl7YBQh41PMiw9yefnDXlrsbs/tRCoKjIV3NX
 reIyrgQlgEmXFvL5fQN6vrXmpVzG1l4lUg4nivC6BCnBDxQzm/uH7V/zsg2SZSwMtNUk
 6GNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BFQHZs/9RH00d4p+SGa4ONXVkeFMreYGGrbWyj+yUJQ=;
 b=e1Ca7BXXMrQuFct6Zcr0d5WzcoatMAl3C0BSNfE638HUl6YPcGz/ySxZmYys0E+W8z
 5MQ2f7T+NV4Bs7KUNNrxqWMTI27+nWYOUOw3ShPXRV3YiCtjK2ht1KVn1D3D6obz0IsG
 9OA3Z2p7FzBrWzEUTcNcO0bpI/GJcVv4gBOVj2DcEGj1dxeh/lpde7P2Z2K8Yisn8Z8T
 IH0M0P7Y3jxY6AW84x8xBNDgmJX8bGx+V6ax84UzVVuVNd8Lz11JXC3BMv0rQKGmS8Qe
 s2uPGlqAI81mDZ3h7ZglkuAHWEgG/ZGTD0TstSSqZnlluAb3GvzSn7svadyiIFnf8V6A
 c4uw==
X-Gm-Message-State: AOAM530X/r+gAatS0yIVULZq5nm4tjReP5z3jy5Hfp2PcnYqKx065oFi
 x5Vpz55LPxAo48ADoCku2MZHxkfileOD6w==
X-Google-Smtp-Source: ABdhPJyvPn/YOova4KWHZdwJdW/qIXMbFBhuOvb6W9+JLB38UL/OmCq5TO5Dagz85dVYdLqfj6vffQ==
X-Received: by 2002:a05:600c:1f18:: with SMTP id
 bd24mr3260908wmb.174.1641921054326; 
 Tue, 11 Jan 2022 09:10:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:10:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/13] hw/intc/arm_gicv3_its: Use enum for return value of
 process_* functions
Date: Tue, 11 Jan 2022 17:10:40 +0000
Message-Id: <20220111171048.3545974-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When an ITS detects an error in a command, it has an
implementation-defined (CONSTRAINED UNPREDICTABLE) choice of whether
to ignore the command, proceeding to the next one in the queue, or to
stall the ITS command queue, processing nothing further.  The
behaviour required when the read of the command packet from memory
fails is less clearly documented, but the same set of choices as for
command errors seem reasonable.

The intention of the QEMU implementation, as documented in the
comments, is that if we encounter a memory error reading the command
packet or one of the various data tables then we should stall, but
for command parameter errors we should ignore the queue and continue.
However, we don't actually do this.  To get the desired behaviour,
the various process_* functions need to return true to cause
process_cmdq() to advance to the next command and keep processing,
and false to stall command processing.  What they mostly do is return
false for any kind of error.

To make the code clearer, replace the 'bool' return from the process_
functions with an enum which may be either CMD_STALL or CMD_CONTINUE.
In this commit no behaviour changes; in subsequent commits we will
adjust the error-return paths for the process_ functions one by one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/arm_gicv3_its.c | 59 ++++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index c1f76682d04..10901a5e709 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -45,6 +45,23 @@ typedef struct {
     uint64_t itel;
 } IteEntry;
 
+/*
+ * The ITS spec permits a range of CONSTRAINED UNPREDICTABLE options
+ * if a command parameter is not correct. These include both "stall
+ * processing of the command queue" and "ignore this command, and
+ * keep processing the queue". In our implementation we choose that
+ * memory transaction errors reading the command packet provoke a
+ * stall, but errors in parameters cause us to ignore the command
+ * and continue processing.
+ * The process_* functions which handle individual ITS commands all
+ * return an ItsCmdResult which tells process_cmdq() whether it should
+ * stall or keep going.
+ */
+typedef enum ItsCmdResult {
+    CMD_STALL = 0,
+    CMD_CONTINUE = 1,
+} ItsCmdResult;
+
 static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
 {
     uint64_t result = 0;
@@ -217,8 +234,8 @@ static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
  * 3. handling of ITS CLEAR command
  * 4. handling of ITS DISCARD command
  */
-static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
-                            ItsCmdType cmd)
+static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
+                                    uint32_t offset, ItsCmdType cmd)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
@@ -231,7 +248,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     bool ite_valid = false;
     uint64_t cte = 0;
     bool cte_valid = false;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
     uint64_t rdbase;
 
     if (cmd == NONE) {
@@ -324,15 +341,15 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
         if (cmd == DISCARD) {
             IteEntry ite = {};
             /* remove mapping from interrupt translation table */
-            result = update_ite(s, eventid, dte, ite);
+            result = update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
         }
     }
 
     return result;
 }
 
-static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
-                          bool ignore_pInt)
+static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
+                                  uint32_t offset, bool ignore_pInt)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
@@ -343,7 +360,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
     uint64_t dte = 0;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
     offset += NUM_BYTES_IN_DW;
@@ -404,7 +421,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
         ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
 
-        result = update_ite(s, eventid, dte, ite);
+        result = update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
     }
 
     return result;
@@ -472,14 +489,14 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
     }
 }
 
-static bool process_mapc(GICv3ITSState *s, uint32_t offset)
+static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint16_t icid;
     uint64_t rdbase;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
     uint64_t value;
 
     offset += NUM_BYTES_IN_DW;
@@ -509,7 +526,7 @@ static bool process_mapc(GICv3ITSState *s, uint32_t offset)
          * command in the queue
          */
     } else {
-        result = update_cte(s, icid, valid, rdbase);
+        result = update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
     }
 
     return result;
@@ -578,7 +595,8 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
     }
 }
 
-static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
+static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
+                                 uint32_t offset)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid;
@@ -586,7 +604,7 @@ static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
     uint64_t itt_addr;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
 
@@ -623,7 +641,7 @@ static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
          * command in the queue
          */
     } else {
-        result = update_dte(s, devid, valid, size, itt_addr);
+        result = update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
     }
 
     return result;
@@ -641,7 +659,6 @@ static void process_cmdq(GICv3ITSState *s)
     uint64_t data;
     AddressSpace *as = &s->gicv3->dma_as;
     MemTxResult res = MEMTX_OK;
-    bool result = true;
     uint8_t cmd;
     int i;
 
@@ -668,6 +685,8 @@ static void process_cmdq(GICv3ITSState *s)
     }
 
     while (wr_offset != rd_offset) {
+        ItsCmdResult result = CMD_CONTINUE;
+
         cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
         data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
                                     MEMTXATTRS_UNSPECIFIED, &res);
@@ -726,18 +745,16 @@ static void process_cmdq(GICv3ITSState *s)
         default:
             break;
         }
-        if (result) {
+        if (result == CMD_CONTINUE) {
             rd_offset++;
             rd_offset %= s->cq.num_entries;
             s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
         } else {
-            /*
-             * in this implementation, in case of dma read/write error
-             * we stall the command processing
-             */
+            /* CMD_STALL */
             s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
             qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: %x cmd processing failed\n", __func__, cmd);
+                          "%s: 0x%x cmd processing failed, stalling\n",
+                          __func__, cmd);
             break;
         }
     }
-- 
2.25.1


