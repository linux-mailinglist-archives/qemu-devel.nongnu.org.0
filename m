Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A941E39922D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 20:07:11 +0200 (CEST)
Received: from localhost ([::1]:59752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loVGo-0004QL-Oq
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 14:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAo-0008NX-8K
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:00:58 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:38545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAg-0006bS-Lz
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:00:57 -0400
Received: by mail-qk1-x72c.google.com with SMTP id q10so3279220qkc.5
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 11:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nV/2og5iNjTvxv5IHohDCBjlVZlJDUJklrLG5YzbJuU=;
 b=iTCr/KLckxrfQDVkBWZTOGxLVmqPwr0bQ66iE/PyyK9NCd6mjoQKfulfw0EHycycLl
 IvurFuiVid8rLDcKIRGVqHRYZYO6qXMHWXWx8APT4pSstAO8ZT7tktpP5K/+2JnHuT4R
 pbx3aPr1Gr/dsMAUCTU6lUx9EVEENNA6a3CkFcf+NsvmGP+n1WtBqVg2H1R1pUMpH4V9
 umhMTseuROkXCgdITardAb2yG0qTyYX0WnxRxZ+CHlXY6+4FPMdzYGv2k4yTyy9S8D5u
 GP2cMAzVJE3Foiaon5kqnc3rKIAnTifw71CIMNBpIW2NAgEeyWR3KwIzoxMmSfJhDiA4
 72Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nV/2og5iNjTvxv5IHohDCBjlVZlJDUJklrLG5YzbJuU=;
 b=JmF2yxj4AbRiNfteCtwSPyw85fW2Y30K+jjyREbB14+7iLcOsCllAIvgEnSNaZMLgA
 jJzwmGi81HWfFTdF1hJ2bQhPUZbOJbDPppGYj0XjM/7oe0krSyUsPDfTNJKMDIh8Tjr5
 ek+OEwo2LcFXoWtbZIUeJcw/GjqJs7HKYblCinCQsZyw/bYgjoEhuIuCre8tiuMFgcLI
 kJs1yhOe+PwGpGQM1Vl5KgeaQYUP6r2WivlR7OVeeB6tuFBU1Z8QeiSuwRAHVrDqKNiD
 KYUQuAm/xL5627tg9G3RYusC+37YnQ0npU4PRpb5A+zyhioRc3WKUNbbfuo8IIqLDA//
 4e+A==
X-Gm-Message-State: AOAM530IIIG3KyWVDrOzR1ARd353WErHiG2rtb8ogbkgjZYJyxMt6TBy
 AVSJmlvspUZi+y4O8ZpfWNy4lOxxB4GZmg==
X-Google-Smtp-Source: ABdhPJyANYEMTg+FP2H7HrBSVCX+EjZwMpUCo7A30vzHzEYJf0YVcpUcBD6yNH5J8U4u4w7dPLwX/g==
X-Received: by 2002:a05:620a:127b:: with SMTP id
 b27mr27836959qkl.104.1622656849297; 
 Wed, 02 Jun 2021 11:00:49 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.googlemail.com with ESMTPSA id 97sm273044qte.20.2021.06.02.11.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:00:48 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v4 6/8] hw/intc: GICv3 redistributor ITS processing
Date: Wed,  2 Jun 2021 14:00:40 -0400
Message-Id: <20210602180042.111347-7-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210602180042.111347-1-shashi.mallela@linaro.org>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implemented lpi processing at redistributor to get lpi config info
from lpi configuration table,determine priority,set pending state in
lpi pending table and forward the lpi to cpuif.Added logic to invoke
redistributor lpi processing with translated LPI which set/clear LPI
from ITS device as part of ITS INT,CLEAR,DISCARD command and
GITS_TRANSLATER processing.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3.c                |   9 ++
 hw/intc/arm_gicv3_common.c         |   1 +
 hw/intc/arm_gicv3_cpuif.c          |   7 +-
 hw/intc/arm_gicv3_its.c            |  14 ++-
 hw/intc/arm_gicv3_redist.c         | 145 +++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h           |  10 ++
 include/hw/intc/arm_gicv3_common.h |  10 ++
 7 files changed, 190 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index d63f8af604..4d19190b9c 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -165,6 +165,15 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
         cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
     }
 
+    if (cs->gic->lpi_enable && cs->lpivalid) {
+        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
+            cs->hppi.irq = cs->hpplpi.irq;
+            cs->hppi.prio = cs->hpplpi.prio;
+            cs->hppi.grp = cs->hpplpi.grp;
+            seenbetter = true;
+        }
+    }
+
     /* If the best interrupt we just found would preempt whatever
      * was the previous best interrupt before this update, then
      * we know it's definitely the best one now.
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 53dea2a775..223db16fec 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -435,6 +435,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
         memset(cs->gicr_ipriorityr, 0, sizeof(cs->gicr_ipriorityr));
 
         cs->hppi.prio = 0xff;
+        cs->hpplpi.prio = 0xff;
 
         /* State in the CPU interface must *not* be reset here, because it
          * is part of the CPU's reset domain, not the GIC device's.
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 81f94c7f4a..5be3efaa3f 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -898,10 +898,12 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
         cs->gicr_iactiver0 = deposit32(cs->gicr_iactiver0, irq, 1, 1);
         cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 0);
         gicv3_redist_update(cs);
-    } else {
+    } else if (irq < GICV3_LPI_INTID_START) {
         gicv3_gicd_active_set(cs->gic, irq);
         gicv3_gicd_pending_clear(cs->gic, irq);
         gicv3_update(cs->gic, irq, 1);
+    } else {
+        gicv3_redist_lpi_pending(cs, irq, 0);
     }
 }
 
@@ -1317,7 +1319,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
     trace_gicv3_icc_eoir_write(is_eoir0 ? 0 : 1,
                                gicv3_redist_affid(cs), value);
 
-    if (irq >= cs->gic->num_irq) {
+    if ((irq >= cs->gic->num_irq) &&  (!(cs->gic->lpi_enable &&
+        (irq >= GICV3_LPI_INTID_START)))) {
         /* This handles two cases:
          * 1. If software writes the ID of a spurious interrupt [ie 1020-1023]
          * to the GICC_EOIR, the GIC ignores that write.
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 0a978cf55b..e0fbd4041f 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -211,6 +211,7 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
     bool ite_valid = false;
     uint64_t cte = 0;
     bool cte_valid = false;
+    uint64_t rdbase;
     uint64_t itel = 0;
     uint32_t iteh = 0;
 
@@ -267,10 +268,15 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
          * command in the queue
          */
     } else {
-        /*
-         * Current implementation only supports rdbase == procnum
-         * Hence rdbase physical address is ignored
-         */
+        rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
+        assert(rdbase <= s->gicv3->num_cpu);
+
+        if ((cmd == CLEAR) || (cmd == DISCARD)) {
+            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
+        } else {
+            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
+        }
+
         if (cmd == DISCARD) {
             /* remove mapping from interrupt translation table */
             res = update_ite(s, eventid, dte, itel, iteh);
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index fb9a4ee3cc..bfc6e4e9b9 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -255,6 +255,11 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         if (cs->gicr_typer & GICR_TYPER_PLPIS) {
             if (value & GICR_CTLR_ENABLE_LPIS) {
                 cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
+                /* Check for any pending interr in pending table */
+                cs->lpivalid = false;
+                cs->hpplpi.prio = 0xff;
+                gicv3_redist_update_lpi(cs);
+                gicv3_redist_update(cs);
             } else {
                 cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
             }
@@ -534,6 +539,146 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
     return r;
 }
 
+void gicv3_redist_update_lpi(GICv3CPUState *cs)
+{
+    /*
+     * This function scans the LPI pending table and for each pending
+     * LPI, reads the corresponding entry from LPI configuration table
+     * to extract the priority info and determine if the LPI priority
+     * is lower than the current high priority interrupt.If yes, update
+     * high priority pending interrupt to that of LPI.
+     */
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t lpict_baddr, lpipt_baddr;
+    uint32_t pendt_size = 0;
+    uint8_t lpite;
+    uint8_t prio, pend;
+    int i;
+    uint64_t idbits;
+
+    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
+                 GICD_TYPER_IDBITS);
+
+    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+        !cs->gicr_pendbaser || (idbits < GICR_PROPBASER_IDBITS_THRESHOLD)) {
+        return;
+    }
+
+    lpict_baddr = cs->gicr_propbaser & R_GICR_PROPBASER_PHYADDR_MASK;
+
+    lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
+
+    /* Determine the highest priority pending interrupt among LPIs */
+    pendt_size = (1ULL << (idbits + 1));
+
+    for (i = 0; i < pendt_size / 8; i++) {
+        address_space_read(as, lpipt_baddr +
+                (((GICV3_LPI_INTID_START + i) / 8) * sizeof(pend)),
+                MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+
+        if ((1 << ((GICV3_LPI_INTID_START + i) % 8)) & pend) {
+            address_space_read(as, lpict_baddr + (i * sizeof(lpite)),
+                      MEMTXATTRS_UNSPECIFIED, &lpite, sizeof(lpite));
+
+            if (!(lpite & LPI_CTE_ENABLED)) {
+                continue;
+            }
+
+            if (cs->gic->gicd_ctlr & GICD_CTLR_DS) {
+                prio = lpite & LPI_PRIORITY_MASK;
+            } else {
+                prio = lpite & LPI_SPRIORITY_MASK;
+            }
+
+            if (prio <= cs->hpplpi.prio) {
+                cs->hpplpi.irq = GICV3_LPI_INTID_START + i;
+                cs->hpplpi.prio = prio;
+                /* LPIs are always non-secure Grp1 interrupts */
+                cs->hpplpi.grp = GICV3_G1NS;
+                cs->lpivalid = true;
+            }
+        }
+    }
+}
+
+void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
+{
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t lpipt_baddr;
+    bool ispend = false;
+    uint8_t pend;
+
+    /*
+     * get the bit value corresponding to this irq in the
+     * lpi pending table
+     */
+    lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
+
+    address_space_read(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
+                         MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+    ispend = ((pend >> (irq % 8)) & 0x1);
+
+    if (ispend) {
+        if (!level) {
+            /*
+             * clear the pending bit and update the lpi pending table
+             */
+            pend &= ~(1 << (irq % 8));
+
+            address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
+                                 MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+        }
+    } else {
+        if (level) {
+            /*
+             * if pending bit is not already set for this irq,turn-on the
+             * pending bit and update the lpi pending table
+             */
+            pend |= (1 << (irq % 8));
+
+            address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
+                                 MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+        }
+    }
+    cs->lpivalid = false;
+    cs->hpplpi.prio = 0xff;
+    gicv3_redist_update_lpi(cs);
+}
+
+void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
+{
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t lpict_baddr;
+    uint8_t lpite;
+    uint64_t idbits;
+
+    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
+                 GICD_TYPER_IDBITS);
+
+    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+         !cs->gicr_pendbaser || (idbits < GICR_PROPBASER_IDBITS_THRESHOLD) ||
+         (irq > (1ULL << (idbits + 1)))) {
+        return;
+    }
+
+    lpict_baddr = cs->gicr_propbaser & R_GICR_PROPBASER_PHYADDR_MASK;
+
+    /* get the lpi config table entry corresponding to this irq */
+    address_space_read(as, lpict_baddr + ((irq - GICV3_LPI_INTID_START) *
+                        sizeof(lpite)), MEMTXATTRS_UNSPECIFIED,
+                        &lpite, sizeof(lpite));
+
+    /* check if this irq is enabled before proceeding further */
+    if (!(lpite & LPI_CTE_ENABLED)) {
+        return;
+    }
+
+    /* set/clear the pending bit for this irq */
+    gicv3_redist_lpi_pending(cs, irq, level);
+
+    gicv3_redist_update(cs);
+}
+
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
 {
     /* Update redistributor state for a change in an external PPI input line */
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 91dbe01176..bcbccba573 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -308,6 +308,13 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 
 #define L1TABLE_ENTRY_SIZE         8
 
+#define LPI_CTE_ENABLE_OFFSET      0
+#define LPI_CTE_ENABLED          VALID_MASK
+#define LPI_CTE_PRIORITY_OFFSET    2
+#define LPI_CTE_PRIORITY_MASK     ((1U << 6) - 1)
+#define LPI_PRIORITY_MASK         0xfc
+#define LPI_SPRIORITY_MASK        0x7e
+
 #define GITS_CMDQ_ENTRY_SIZE               32
 #define NUM_BYTES_IN_DW                     8
 
@@ -452,6 +459,9 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
                                unsigned size, MemTxAttrs attrs);
 void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_update_lpi(GICv3CPUState *cs);
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index c1348cc60a..5d839da9c9 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -204,6 +204,16 @@ struct GICv3CPUState {
      * real state above; it doesn't need to be migrated.
      */
     PendingIrq hppi;
+
+    /*
+     * Current highest priority pending lpi for this CPU.
+     * This is cached information that can be recalculated from the
+     * real state above; it doesn't need to be migrated.
+     */
+    PendingIrq hpplpi;
+
+    bool lpivalid; /* current highest priority lpi validity status */
+
     /* This is temporary working state, to avoid a malloc in gicv3_update() */
     bool seenbetter;
 };
-- 
2.27.0


