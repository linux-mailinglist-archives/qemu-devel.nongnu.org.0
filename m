Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F34410329
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 05:04:56 +0200 (CEST)
Received: from localhost ([::1]:57096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRQet-00040s-HR
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 23:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mRQcI-00085E-Lu; Fri, 17 Sep 2021 23:02:14 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mRQcF-00063t-Oc; Fri, 17 Sep 2021 23:02:14 -0400
Received: by mail-ed1-x533.google.com with SMTP id j13so37049757edv.13;
 Fri, 17 Sep 2021 20:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MAJNMl5Uzan1nvwDM5dEthas03QFW7M8fC6iJPS61cM=;
 b=PbbjnIqg5esYEtj/TcU5xc6gchXg7cdyPVYEH5c+pvN93w6OYGS3C/WADL69q7OKpr
 taDg9rKFq/8WHLLLzSJ3Wan1QYlROwFDHpS1KagLUKxm2mUmQ7yxi5PxqndNXb2poYPY
 qNKHv7jhwgRcxi6E2arU+Kp6amv43iu6HSeb9edQXmC3bG7HwG1HrDl3yvihTyqloSf3
 Cr1eItGFQmz3LBWjePSQTOW4ev7BOmanGVceKlWp/0EXzFSnOM87XORoMcCHVJeqh7h5
 PPqB5qUPnFeW1uA1AtyO+YC5k6saGew3wP+3PUbA3y7Cs9Bn8b/qBFuhO6x8EyQhyQbf
 pYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MAJNMl5Uzan1nvwDM5dEthas03QFW7M8fC6iJPS61cM=;
 b=eQm3yEJN7xJQQKzKsJ72kJrpOEzyUx3HRqwE0vCoLw7SuutA1xMZtgoq2T6ghbkFy4
 jkvrm2wvNwxkUDxUy0BRgxUXJdLoV5QvO/u0fo5OeKZDcJ7Rh+he4mT+E75Ag4AV/Pbo
 johRQT63GtwclAvxeHueOsgSteTEpPAO6PLW9MdBHeNTp0I6prczoILCDztRPIxI0eQF
 /Q9R006xkYTn/11USbxlVNGT4hJzw9Y7IB+e+/akPsoCxpPnvIwDvAspxFUSDqjQt55i
 A1GLz0BkZFgfYTYUL00KIlb2lnGPFVVR3Wntbp80+BRTIegqXEvLKUfPMJHqLePNU+5q
 yLJg==
X-Gm-Message-State: AOAM53123XRiRsKrxl7EkWujuQu1w74cu1qQwyOI0/VqDmdGp2byPUBb
 Ry27mFZPTGXXqzUCIvjl8dqZR+YYNuE=
X-Google-Smtp-Source: ABdhPJzqYPgf+p3iUi2svJmrQ3LaKx+dbzgcD3g4REzqV+wRMlrRbtJgsPrzgb/xCLJDZ3r5tYySPQ==
X-Received: by 2002:a05:6402:88e:: with SMTP id
 e14mr16812873edy.342.1631934129808; 
 Fri, 17 Sep 2021 20:02:09 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d3sm3419367edv.87.2021.09.17.20.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 20:02:09 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: [PATCH 3/3] hw/intc: openpic: Clean up the styles
Date: Sat, 18 Sep 2021 11:01:49 +0800
Message-Id: <20210918030149.642398-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918030149.642398-1-bmeng.cn@gmail.com>
References: <20210918030149.642398-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Correct the multi-line comment format. No functional changes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 include/hw/ppc/openpic.h |  9 ++++---
 hw/intc/openpic.c        | 55 +++++++++++++++++++++++++---------------
 2 files changed, 40 insertions(+), 24 deletions(-)

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
 
-- 
2.25.1


