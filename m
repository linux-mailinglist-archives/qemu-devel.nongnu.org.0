Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609BC50B5F6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:13:24 +0200 (CEST)
Received: from localhost ([::1]:54220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrE3-0007vG-F5
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9v-0004hs-TJ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:03 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:45671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9t-0002eQ-RJ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:03 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 17-20020a05600c021100b00393a19f8f98so2067545wmi.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Jjd65YXtvG5lQwdp8xCN6MNJ/6af5LF+gZQZc18vANc=;
 b=B4Sl8ZxDwKQhJtVN/Tqi/ox3tQspIR6X5wPY9cPIeSPOEnFk4Eq3SVsbo2Mf2CVBCB
 Aa14u3qm4KkuxykUXBCZUgfxWcdvFEgNjPH6WPaGuh7k3UuU17diUmaN5PlEKArXFGBZ
 7yo8CfQ+f/1o9uzQS7iZzt4+H0R18IEFXjoHV8KNZZsheiY+txq3TXjfuR/twwAIBdcQ
 rwmXJZ1uWeSCP6DYzmQSiEGMIlweaWzKKgLyoUxKnyGSGUkgyjsK1vP5z+A20zOnErY1
 CazuOvQ2m2lJrtFQPQlzFlKa8NKy0MTPK9t30q8m9von5u/d0KnrtpuduJz7GxJehKBo
 2vgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jjd65YXtvG5lQwdp8xCN6MNJ/6af5LF+gZQZc18vANc=;
 b=YZem6fI7BCw2BJ0aolYS92gNc8veQVk4yIclQtzbNUQwieRlzEAH3aPDTT7XgCRPQ7
 iO+wLjWgvluZOG2gzmJ8TEvT6IP8JNjiCIwuaieATDcqRyGRFl35pHdcKdj3Nyr2Pl+p
 OWDCsldzdpY1Afgx4LtfupIjeVV98h9GZ/gl2Rh6y+ngDZ9dH67mcfZrZtU97JloKAzF
 hWwvSEG4sv8j8YvZylV8vNOx9+aF3JCSknnJpHhBYr/VQTH/cbmmPLXfRHZ70tv2flN/
 79zx3tIMl8/Q/JUnskj9ftCdJVo6fn1J/T+aZeHWy9siWIeHkQjSo3ITURTwRC39pGPk
 0l2Q==
X-Gm-Message-State: AOAM532mo+15FoDjP02W8xj4SIPMR8yFtZyQF8RdD137YwIPYV6DgjUr
 brprgBgu7cL+MwSIpU/BQePmzf5qmwGePQ==
X-Google-Smtp-Source: ABdhPJzIoMj79gc07joTnRCTThs+pGBegKS1gTGe88h0KxYLBl9jAML6bX9igvkPUN4TryZDFoGzug==
X-Received: by 2002:a7b:c5cd:0:b0:38c:8b1b:d220 with SMTP id
 n13-20020a7bc5cd000000b0038c8b1bd220mr3397663wmk.118.1650621900418; 
 Fri, 22 Apr 2022 03:05:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/61] hw/intc/arm_gicv3_redist: Factor out "update hpplpi for
 all LPIs" logic
Date: Fri, 22 Apr 2022 11:03:59 +0100
Message-Id: <20220422100432.2288247-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Factor out the common part of gicv3_redist_update_lpi_only() into
a new function update_for_all_lpis(), which does a full rescan
of an LPI Pending table and sets the specified PendingIrq struct
with the highest priority pending enabled LPI it finds.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-29-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_redist.c | 66 ++++++++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 20 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 571e0fa8309..2379389d14e 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -103,6 +103,48 @@ static void update_for_one_lpi(GICv3CPUState *cs, int irq,
     }
 }
 
+/**
+ * update_for_all_lpis: Fully scan LPI tables and find best pending LPI
+ *
+ * @cs: GICv3CPUState
+ * @ptbase: physical address of LPI Pending table
+ * @ctbase: physical address of LPI Configuration table
+ * @ptsizebits: size of tables, specified as number of interrupt ID bits minus 1
+ * @ds: true if priority value should not be shifted
+ * @hpp: points to pending information to set
+ *
+ * Recalculate the highest priority pending enabled LPI from scratch,
+ * and set @hpp accordingly.
+ *
+ * We scan the LPI pending table @ptbase; for each pending LPI, we read the
+ * corresponding entry in the LPI configuration table @ctbase to extract
+ * the priority and enabled information.
+ *
+ * We take @ptsizebits in the form idbits-1 because this is the way that
+ * LPI table sizes are architecturally specified in GICR_PROPBASER.IDBits
+ * and in the VMAPP command's VPT_size field.
+ */
+static void update_for_all_lpis(GICv3CPUState *cs, uint64_t ptbase,
+                                uint64_t ctbase, unsigned ptsizebits,
+                                bool ds, PendingIrq *hpp)
+{
+    AddressSpace *as = &cs->gic->dma_as;
+    uint8_t pend;
+    uint32_t pendt_size = (1ULL << (ptsizebits + 1));
+    int i, bit;
+
+    hpp->prio = 0xff;
+
+    for (i = GICV3_LPI_INTID_START / 8; i < pendt_size / 8; i++) {
+        address_space_read(as, ptbase + i, MEMTXATTRS_UNSPECIFIED, &pend, 1);
+        while (pend) {
+            bit = ctz32(pend);
+            update_for_one_lpi(cs, i * 8 + bit, ctbase, ds, hpp);
+            pend &= ~(1 << bit);
+        }
+    }
+}
+
 static uint8_t gicr_read_ipriorityr(GICv3CPUState *cs, MemTxAttrs attrs,
                                     int irq)
 {
@@ -657,11 +699,7 @@ void gicv3_redist_update_lpi_only(GICv3CPUState *cs)
      * priority is lower than the last computed high priority lpi interrupt.
      * If yes, replace current LPI as the new high priority lpi interrupt.
      */
-    AddressSpace *as = &cs->gic->dma_as;
-    uint64_t lpipt_baddr;
-    uint32_t pendt_size = 0;
-    uint8_t pend;
-    int i, bit;
+    uint64_t lpipt_baddr, lpict_baddr;
     uint64_t idbits;
 
     idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
@@ -671,23 +709,11 @@ void gicv3_redist_update_lpi_only(GICv3CPUState *cs)
         return;
     }
 
-    cs->hpplpi.prio = 0xff;
-
     lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
+    lpict_baddr = cs->gicr_propbaser & R_GICR_PROPBASER_PHYADDR_MASK;
 
-    /* Determine the highest priority pending interrupt among LPIs */
-    pendt_size = (1ULL << (idbits + 1));
-
-    for (i = GICV3_LPI_INTID_START / 8; i < pendt_size / 8; i++) {
-        address_space_read(as, lpipt_baddr + i, MEMTXATTRS_UNSPECIFIED, &pend,
-                           sizeof(pend));
-
-        while (pend) {
-            bit = ctz32(pend);
-            gicv3_redist_check_lpi_priority(cs, i * 8 + bit);
-            pend &= ~(1 << bit);
-        }
-    }
+    update_for_all_lpis(cs, lpipt_baddr, lpict_baddr, idbits,
+                        cs->gic->gicd_ctlr & GICD_CTLR_DS, &cs->hpplpi);
 }
 
 void gicv3_redist_update_lpi(GICv3CPUState *cs)
-- 
2.25.1


