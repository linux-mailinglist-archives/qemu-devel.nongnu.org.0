Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09BC41D33E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:23:13 +0200 (CEST)
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpTM-0006A0-Nc
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosn-0001zu-52; Thu, 30 Sep 2021 01:45:25 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:37963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosj-00042l-Mn; Thu, 30 Sep 2021 01:45:24 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR3v4fz4xc7; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=HzWjb7sZD6zFnDRZekCp8lpO/lPgg42fwK8Jeu0wF6Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LMrv0oQL0rKyzN95uXdNWswHLVEThKWhOf+DN7da8+yI1pmDvaXol8Q+C3JihHgmi
 nsWuTsE4BoJodSE6Scl0CNofTAQhkf/CLYInCakrqU7YgSpYHS9c+U2ylXcUREi9TJ
 pp8mejaU3MtQGygeYr9I9Ot1GlRxx9PykwNPC0/A=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 36/44] hw/intc: openpic: Clean up the styles
Date: Thu, 30 Sep 2021 15:44:18 +1000
Message-Id: <20210930054426.357344-37-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

Correct the multi-line comment format. No functional changes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

Message-Id: <20210918032653.646370-3-bin.meng@windriver.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/openpic.c        | 55 +++++++++++++++++++++++++---------------
 include/hw/ppc/openpic.h |  9 ++++---
 2 files changed, 40 insertions(+), 24 deletions(-)

diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 23eafb32bd..49504e740f 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -47,7 +47,7 @@
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
 
-//#define DEBUG_OPENPIC
+/* #define DEBUG_OPENPIC */
 
 #ifdef DEBUG_OPENPIC
 static const int debug_openpic = 1;
@@ -118,7 +118,8 @@ static FslMpicInfo fsl_mpic_42 = {
 #define ILR_INTTGT_CINT   0x01 /* critical */
 #define ILR_INTTGT_MCP    0x02 /* machine check */
 
-/* The currently supported INTTGT values happen to be the same as QEMU's
+/*
+ * The currently supported INTTGT values happen to be the same as QEMU's
  * openpic output codes, but don't depend on this.  The output codes
  * could change (unlikely, but...) or support could be added for
  * more INTTGT values.
@@ -177,10 +178,11 @@ static void openpic_cpu_write_internal(void *opaque, hwaddr addr,
                                        uint32_t val, int idx);
 static void openpic_reset(DeviceState *d);
 
-/* Convert between openpic clock ticks and nanosecs.  In the hardware the clock
-   frequency is driven by board inputs to the PIC which the PIC would then
-   divide by 4 or 8.  For now hard code to 25MZ.
-*/
+/*
+ * Convert between openpic clock ticks and nanosecs.  In the hardware the clock
+ * frequency is driven by board inputs to the PIC which the PIC would then
+ * divide by 4 or 8.  For now hard code to 25MZ.
+ */
 #define OPENPIC_TIMER_FREQ_MHZ 25
 #define OPENPIC_TIMER_NS_PER_TICK (1000 / OPENPIC_TIMER_FREQ_MHZ)
 static inline uint64_t ns_to_ticks(uint64_t ns)
@@ -253,7 +255,8 @@ static void IRQ_local_pipe(OpenPICState *opp, int n_CPU, int n_IRQ,
                 __func__, src->output, n_IRQ, active, was_active,
                 dst->outputs_active[src->output]);
 
-        /* On Freescale MPIC, critical interrupts ignore priority,
+        /*
+         * On Freescale MPIC, critical interrupts ignore priority,
          * IACK, EOI, etc.  Before MPIC v4.1 they also ignore
          * masking.
          */
@@ -276,7 +279,8 @@ static void IRQ_local_pipe(OpenPICState *opp, int n_CPU, int n_IRQ,
 
     priority = IVPR_PRIORITY(src->ivpr);
 
-    /* Even if the interrupt doesn't have enough priority,
+    /*
+     * Even if the interrupt doesn't have enough priority,
      * it is still raised, in case ctpr is lowered later.
      */
     if (active) {
@@ -408,7 +412,8 @@ static void openpic_set_irq(void *opaque, int n_IRQ, int level)
         }
 
         if (src->output != OPENPIC_OUTPUT_INT) {
-            /* Edge-triggered interrupts shouldn't be used
+            /*
+             * Edge-triggered interrupts shouldn't be used
              * with non-INT delivery, but just in case,
              * try to make it do something sane rather than
              * cause an interrupt storm.  This is close to
@@ -501,7 +506,8 @@ static inline void write_IRQreg_ivpr(OpenPICState *opp, int n_IRQ, uint32_t val)
 {
     uint32_t mask;
 
-    /* NOTE when implementing newer FSL MPIC models: starting with v4.0,
+    /*
+     * NOTE when implementing newer FSL MPIC models: starting with v4.0,
      * the polarity bit is read-only on internal interrupts.
      */
     mask = IVPR_MASK_MASK | IVPR_PRIORITY_MASK | IVPR_SENSE_MASK |
@@ -511,7 +517,8 @@ static inline void write_IRQreg_ivpr(OpenPICState *opp, int n_IRQ, uint32_t val)
     opp->src[n_IRQ].ivpr =
         (opp->src[n_IRQ].ivpr & IVPR_ACTIVITY_MASK) | (val & mask);
 
-    /* For FSL internal interrupts, The sense bit is reserved and zero,
+    /*
+     * For FSL internal interrupts, The sense bit is reserved and zero,
      * and the interrupt is always level-triggered.  Timers and IPIs
      * have no sense or polarity bits, and are edge-triggered.
      */
@@ -695,16 +702,20 @@ static void qemu_timer_cb(void *opaque)
     openpic_set_irq(opp, n_IRQ, 0);
 }
 
-/* If enabled is true, arranges for an interrupt to be raised val clocks into
-   the future, if enabled is false cancels the timer. */
+/*
+ * If enabled is true, arranges for an interrupt to be raised val clocks into
+ * the future, if enabled is false cancels the timer.
+ */
 static void openpic_tmr_set_tmr(OpenPICTimer *tmr, uint32_t val, bool enabled)
 {
     uint64_t ns = ticks_to_ns(val & ~TCCR_TOG);
-    /* A count of zero causes a timer to be set to expire immediately.  This
-       effectively stops the simulation since the timer is constantly expiring
-       which prevents guest code execution, so we don't honor that
-       configuration.  On real hardware, this situation would generate an
-       interrupt on every clock cycle if the interrupt was unmasked. */
+    /*
+     * A count of zero causes a timer to be set to expire immediately.  This
+     * effectively stops the simulation since the timer is constantly expiring
+     * which prevents guest code execution, so we don't honor that
+     * configuration.  On real hardware, this situation would generate an
+     * interrupt on every clock cycle if the interrupt was unmasked.
+     */
     if ((ns == 0) || !enabled) {
         tmr->qemu_timer_active = false;
         tmr->tccr = tmr->tccr & TCCR_TOG;
@@ -717,8 +728,10 @@ static void openpic_tmr_set_tmr(OpenPICTimer *tmr, uint32_t val, bool enabled)
     }
 }
 
-/* Returns the currrent tccr value, i.e., timer value (in clocks) with
-   appropriate TOG. */
+/*
+ * Returns the currrent tccr value, i.e., timer value (in clocks) with
+ * appropriate TOG.
+ */
 static uint64_t openpic_tmr_get_timer(OpenPICTimer *tmr)
 {
     uint64_t retval;
@@ -1309,7 +1322,7 @@ static void openpic_reset(DeviceState *d)
 typedef struct MemReg {
     const char             *name;
     MemoryRegionOps const  *ops;
-    hwaddr      start_addr;
+    hwaddr                  start_addr;
     ram_addr_t              size;
 } MemReg;
 
diff --git a/include/hw/ppc/openpic.h b/include/hw/ppc/openpic.h
index f89802a15c..ebdaf8a493 100644
--- a/include/hw/ppc/openpic.h
+++ b/include/hw/ppc/openpic.h
@@ -51,7 +51,8 @@ typedef enum IRQType {
     IRQ_TYPE_FSLSPECIAL,    /* FSL timer/IPI interrupt, edge, no polarity */
 } IRQType;
 
-/* Round up to the nearest 64 IRQs so that the queue length
+/*
+ * Round up to the nearest 64 IRQs so that the queue length
  * won't change when moving between 32 and 64 bit hosts.
  */
 #define IRQQUEUE_SIZE_BITS ((OPENPIC_MAX_IRQ + 63) & ~63)
@@ -101,8 +102,10 @@ typedef struct OpenPICTimer {
     bool                  qemu_timer_active; /* Is the qemu_timer is running? */
     struct QEMUTimer     *qemu_timer;
     struct OpenPICState  *opp;          /* Device timer is part of. */
-    /* The QEMU_CLOCK_VIRTUAL time (in ns) corresponding to the last
-       current_count written or read, only defined if qemu_timer_active. */
+    /*
+     * The QEMU_CLOCK_VIRTUAL time (in ns) corresponding to the last
+     * current_count written or read, only defined if qemu_timer_active.
+     */
     uint64_t              origin_time;
 } OpenPICTimer;
 
-- 
2.31.1


