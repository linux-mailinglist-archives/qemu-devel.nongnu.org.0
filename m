Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858D450B4E6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:21:18 +0200 (CEST)
Received: from localhost ([::1]:53936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqPd-0005bL-Hp
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9x-0004m6-If
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:05 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9v-0002f5-NJ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:05 -0400
Received: by mail-wr1-x430.google.com with SMTP id b19so10280649wrh.11
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PX0NLhcQng/vzkYLEUDXWQWxmx/78hsVtwkLTCrl74k=;
 b=zwfq1Es7nurcUCHl/O7JMglGaIgN9lkvHmtImvbdg3RGjxz4LehQHhS/pPeYXzE27l
 PujXVj0//2Fex81DEkrS5tYYMBJxyNk/x5y+Zo47dnaRmUbgA9Nt1F30xSDncjt9rAuJ
 WDBY6gdYKLO6ZKylqN5VF1X6D8pXtZpfF3GlgOY9v991FPbCOwBkol/C3YJvqYmGIU/x
 TYufT1TgYvanddheOzu6chJMhN70/fP3edJzHdJ3TpgUpvwernsHdcJqrM1bvRIesWXJ
 Elgj0CSsyugIAbsPbSeNBbKxfEM5kOS7RwmWmhL7XbqeJmqKuE50xF7JNhMQAnAqpo7v
 fSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PX0NLhcQng/vzkYLEUDXWQWxmx/78hsVtwkLTCrl74k=;
 b=XPExODtDuxmG3Ik2xYuocTlRfiqCrMQWq/P0xX4xSw/GQT+Xu/g4VJtJFFPuMu8drv
 b3FEHHW7y6GsQ1zowxTSYkrDtAqYnd9sVs70x9aePrWrhqBLN94Cr/Pw1QFaiDLUHg5T
 1xJbN2Rahiuu7eoXI+q1P+aa7T7yoZgO1Fy35PZnXaITi4RFmA79ABMBYQJzOTcl+4t0
 7b6J3sir65/QmeAKgGeNTr/gqoZ8kmllZA8RUmZdFyLQFTQpsIlJ5fbXMMblCTzlc4oq
 PIGjESvT9ijKQKiNIBJh4sMe0fEVXvbEDppFu11yL+SGr1NimYxpDShGJQDpbC60d3Wk
 JKmw==
X-Gm-Message-State: AOAM533E7X7CMHP7MTMqv21exSAKo+JYPlOQ3d7zMRp3HkCy6kMyVlLx
 WZRwuyfCkCtRLlPQz3L3jzgfz8LWQZE4fw==
X-Google-Smtp-Source: ABdhPJym6XLQwnB9lZDZMJPcJAjHGbLAUQrrbtj/8upDLeG59Ou4/36gZIhcuT81R4jJPt5CXNWNaQ==
X-Received: by 2002:a5d:6e87:0:b0:206:452:5b87 with SMTP id
 k7-20020a5d6e87000000b0020604525b87mr2987799wrz.473.1650621902288; 
 Fri, 22 Apr 2022 03:05:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/61] hw/intc/arm_gicv3_redist: Factor out "update bit in
 pending table" code
Date: Fri, 22 Apr 2022 11:04:01 +0100
Message-Id: <20220422100432.2288247-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Factor out the code which sets a single bit in an LPI pending table.
We're going to need this for handling vLPI tables, not just the
physical LPI table.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-31-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_redist.c | 49 +++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index bfdde36a206..d54ed9a0332 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -145,6 +145,34 @@ static void update_for_all_lpis(GICv3CPUState *cs, uint64_t ptbase,
     }
 }
 
+/**
+ * set_lpi_pending_bit: Set or clear pending bit for an LPI
+ *
+ * @cs: GICv3CPUState
+ * @ptbase: physical address of LPI Pending table
+ * @irq: LPI to change pending state for
+ * @level: false to clear pending state, true to set
+ *
+ * Returns true if we needed to do something, false if the pending bit
+ * was already at @level.
+ */
+static bool set_pending_table_bit(GICv3CPUState *cs, uint64_t ptbase,
+                                  int irq, bool level)
+{
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t addr = ptbase + irq / 8;
+    uint8_t pend;
+
+    address_space_read(as, addr, MEMTXATTRS_UNSPECIFIED, &pend, 1);
+    if (extract32(pend, irq % 8, 1) == level) {
+        /* Bit already at requested state, no action required */
+        return false;
+    }
+    pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);
+    address_space_write(as, addr, MEMTXATTRS_UNSPECIFIED, &pend, 1);
+    return true;
+}
+
 static uint8_t gicr_read_ipriorityr(GICv3CPUState *cs, MemTxAttrs attrs,
                                     int irq)
 {
@@ -809,30 +837,13 @@ void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
      * This function updates the pending bit in lpi pending table for
      * the irq being activated or deactivated.
      */
-    AddressSpace *as = &cs->gic->dma_as;
     uint64_t lpipt_baddr;
-    bool ispend = false;
-    uint8_t pend;
 
-    /*
-     * get the bit value corresponding to this irq in the
-     * lpi pending table
-     */
     lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
-
-    address_space_read(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
-                       MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
-
-    ispend = extract32(pend, irq % 8, 1);
-
-    /* no change in the value of pending bit, return */
-    if (ispend == level) {
+    if (!set_pending_table_bit(cs, lpipt_baddr, irq, level)) {
+        /* no change in the value of pending bit, return */
         return;
     }
-    pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);
-
-    address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
-                        MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
 
     /*
      * check if this LPI is better than the current hpplpi, if yes
-- 
2.25.1


