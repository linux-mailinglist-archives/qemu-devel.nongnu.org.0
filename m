Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA11D34569D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 05:17:01 +0100 (CET)
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOYTU-0002xE-T7
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 00:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPm-0000kr-Kn
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:13:11 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:44811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPM-0006bZ-O6
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:13:09 -0400
Received: by mail-qk1-x72d.google.com with SMTP id y18so13102577qky.11
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 21:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RWO1mq5fDCkFbZuLM6l5vWRQ6Gsw7T4jwV+JNy5ru+s=;
 b=O31JiQkLtbAb6N3XMTY7jWvQTiFLvHsb54UssIlBANsDzEmy3e78zXppkgacmTRebr
 6HUIfihiit/xJUltkY5O3b85r903lccBMU/wR6aRtzRAOo65QpeP2BWHeR4Qaoh0PXec
 R1WDwtmjA/GNSTyRa5Jy/5ZRP4TEdxPT94h3CdJQU4R14RgyJNSTrJg/COaLPkEMV161
 +JIsw38gC8eOEYLoV2NJJo3Sl0hEd0fkHecZ/SGGJsQg8soZZp50L0pB1xa/K8MsUkWz
 kR+Eybx8rBIzWEMWYpcyMPgWpGvI5KLUupEVY44LbRXLkzz8fFnXekDCkd3T1KZPxF7U
 B9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RWO1mq5fDCkFbZuLM6l5vWRQ6Gsw7T4jwV+JNy5ru+s=;
 b=fLMu9XnY0JK1s+6MEbdV9GWdN2gr5uNkIU4uTd3Lev32jwAteE2VanfNM4LIlgk3ZJ
 eTImzfZUNPf2qGVqpbPrlF/NZI+eahi8xXXtTmCzzSAj6+2aV58nyvr1z+iHZDoF0XQe
 AKiV7uL+ochBA4NUywPJHKk6Z7acDZm8uweAfE9LQvonTsqKiE+H4Y4fPGRt6kcX6fKw
 pQMU+zv0Xh6LouXFRSvsQ3F+2okGwk8QrxJYrYGhDHWMP/n7w3OC0JrDpLN2Nt/cc4bX
 4xZ6CAgdfLt+/VOfMPfw7ompz90lBcN/kzYTtXeptLBNT9+sJnxbfFFJY93K5KttoC3t
 HaTg==
X-Gm-Message-State: AOAM533465IZZZnVubFo2CMBUyeOycPiayeMvx4cXmKutRSsQC+QAP73
 xWSMQR1OIf6PWw/yjIHm1smlt4oiFj6rog==
X-Google-Smtp-Source: ABdhPJxd0pOOa/jvIWMSNtAPAc8zpTJwdaw+BFMsQgWd7HtZhPgIl7OTQqgPUeTvxvrHiM8VsO4+rw==
X-Received: by 2002:a37:ef14:: with SMTP id j20mr3634498qkk.471.1616472763832; 
 Mon, 22 Mar 2021 21:12:43 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id m21sm12601181qka.28.2021.03.22.21.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 21:12:43 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v1 5/8] hw/intc: GICv3 ITS Feature enablement
Date: Tue, 23 Mar 2021 00:12:35 -0400
Message-Id: <20210323041238.133835-6-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323041238.133835-1-shashi.mallela@linaro.org>
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Added properties to enable ITS feature and define qemu system
address space memory in gicv3 common,setup distributor and
redistributor registers to indicate LPI support.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_common.c         | 16 +++++++++++
 hw/intc/arm_gicv3_dist.c           | 22 +++++++++++++--
 hw/intc/arm_gicv3_redist.c         | 29 ++++++++++++++++++--
 include/hw/intc/arm_gicv3_common.h |  8 ++++++
 4 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589..3bfc52f7fa 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -156,6 +156,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
         VMSTATE_UINT32(gicr_waker, GICv3CPUState),
         VMSTATE_UINT64(gicr_propbaser, GICv3CPUState),
         VMSTATE_UINT64(gicr_pendbaser, GICv3CPUState),
+        VMSTATE_BOOL(lpi_outofrange, GICv3CPUState),
         VMSTATE_UINT32(gicr_igroupr0, GICv3CPUState),
         VMSTATE_UINT32(gicr_ienabler0, GICv3CPUState),
         VMSTATE_UINT32(gicr_ipendr0, GICv3CPUState),
@@ -227,6 +228,7 @@ static const VMStateDescription vmstate_gicv3 = {
     .priority = MIG_PRI_GICV3,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(gicd_ctlr, GICv3State),
+        VMSTATE_UINT32(gicd_typer, GICv3State),
         VMSTATE_UINT32_ARRAY(gicd_statusr, GICv3State, 2),
         VMSTATE_UINT32_ARRAY(group, GICv3State, GICV3_BMP_SIZE),
         VMSTATE_UINT32_ARRAY(grpmod, GICv3State, GICV3_BMP_SIZE),
@@ -381,6 +383,16 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
             (1 << 24) |
             (i << 8) |
             (last << 4);
+
+        if (s->lpi_enable) {
+            s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
+
+            if (!s->sysmem) {
+                error_setg(errp,
+                    "Redist-ITS: Guest 'sysmem' reference link not set");
+                return;
+            }
+        }
     }
 }
 
@@ -406,6 +418,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
         cs->gicr_waker = GICR_WAKER_ProcessorSleep | GICR_WAKER_ChildrenAsleep;
         cs->gicr_propbaser = 0;
         cs->gicr_pendbaser = 0;
+        cs->lpi_outofrange = false;
         /* If we're resetting a TZ-aware GIC as if secure firmware
          * had set it up ready to start a kernel in non-secure, we
          * need to set interrupts to group 1 so the kernel can use them.
@@ -494,9 +507,12 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", GICv3State, num_cpu, 1),
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
+    DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
     DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
                       redist_region_count, qdev_prop_uint32, uint32_t),
+    DEFINE_PROP_LINK("sysmem", GICv3State, sysmem, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b65f56f903..96a317a8ef 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -366,12 +366,15 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
         return MEMTX_OK;
     case GICD_TYPER:
     {
+        bool lpi_supported = false;
         /* For this implementation:
          * No1N == 1 (1-of-N SPI interrupts not supported)
          * A3V == 1 (non-zero values of Affinity level 3 supported)
          * IDbits == 0xf (we support 16-bit interrupt identifiers)
          * DVIS == 0 (Direct virtual LPI injection not supported)
-         * LPIS == 0 (LPIs not supported)
+         * LPIS == 1 (LPIs are supported if affinity routing is enabled)
+         * num_LPIs == 0b00000 (bits [15:11],Number of LPIs as indicated
+         *                      by GICD_TYPER.IDbits)
          * MBIS == 0 (message-based SPIs not supported)
          * SecurityExtn == 1 if security extns supported
          * CPUNumber == 0 since for us ARE is always 1
@@ -385,8 +388,23 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
          */
         bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
 
+        /*
+         * With securityextn on,LPIs are supported when affinity routing
+         * is enabled for non-secure state and if off LPIs are supported
+         * when affinity routing is enabled.
+         */
+        if (s->lpi_enable) {
+            if (sec_extn) {
+                lpi_supported = (s->gicd_ctlr & GICD_CTLR_ARE_NS);
+            } else {
+                lpi_supported = (s->gicd_ctlr & GICD_CTLR_ARE);
+            }
+        }
+
         *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
-            (0xf << 19) | itlinesnumber;
+            (lpi_supported << GICD_TYPER_LPIS_OFFSET) | (GICD_TYPER_IDBITS <<
+            GICD_TYPER_IDBITS_OFFSET) | itlinesnumber;
+        s->gicd_typer = *data;
         return MEMTX_OK;
     }
     case GICD_IIDR:
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8645220d61..f4d14811ec 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -248,10 +248,16 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
     case GICR_CTLR:
         /* For our implementation, GICR_TYPER.DPGS is 0 and so all
          * the DPG bits are RAZ/WI. We don't do anything asynchronously,
-         * so UWP and RWP are RAZ/WI. And GICR_TYPER.LPIS is 0 (we don't
-         * implement LPIs) so Enable_LPIs is RES0. So there are no writable
-         * bits for us.
+         * so UWP and RWP are RAZ/WI. GICR_TYPER.LPIS is 1 (we
+         * implement LPIs) so Enable_LPIs is programmable.
          */
+        if (cs->gicr_typer & GICR_TYPER_PLPIS) {
+            if (value & GICR_CTLR_ENABLE_LPIS) {
+                cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
+            } else {
+                cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
+            }
+        }
         return MEMTX_OK;
     case GICR_STATUSR:
         /* RAZ/WI for our implementation */
@@ -275,6 +281,14 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         cs->gicr_waker = value;
         return MEMTX_OK;
     case GICR_PROPBASER:
+        if ((value & GICR_PROPBASER_IDBITS_MASK) <
+            GICR_PROPBASER_IDBITS_THRESHOLD) {
+            cs->lpi_outofrange = true;
+        }
+        if ((value & GICR_PROPBASER_IDBITS_MASK) > GICD_TYPER_IDBITS) {
+            value &= ~GICR_PROPBASER_IDBITS_MASK;
+            value |= GICD_TYPER_IDBITS;
+        }
         cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 0, 32, value);
         return MEMTX_OK;
     case GICR_PROPBASER + 4:
@@ -397,6 +411,15 @@ static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
 {
     switch (offset) {
     case GICR_PROPBASER:
+        if ((value & GICR_PROPBASER_IDBITS_MASK) <
+            GICR_PROPBASER_IDBITS_THRESHOLD) {
+            cs->lpi_outofrange = true;
+        }
+        if ((value & GICR_PROPBASER_IDBITS_MASK) >
+            GICD_TYPER_IDBITS) {
+            value &= ~GICR_PROPBASER_IDBITS_MASK;
+            value |= GICD_TYPER_IDBITS;
+        }
         cs->gicr_propbaser = value;
         return MEMTX_OK;
     case GICR_PENDBASER:
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 3a710592a9..db3989484d 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -175,6 +175,13 @@ struct GICv3CPUState {
     uint32_t gicr_nsacr;
     uint8_t gicr_ipriorityr[GIC_INTERNAL];
 
+    /*
+     * flag to indicate LPIs are out of range
+     * since IDbits from GICR_PROPBASER is less
+     * than 0b1101
+     */
+    bool lpi_outofrange;
+
     /* CPU interface */
     uint64_t icc_sre_el1;
     uint64_t icc_ctlr_el1[2];
@@ -221,6 +228,7 @@ struct GICv3State {
     uint32_t num_cpu;
     uint32_t num_irq;
     uint32_t revision;
+    bool lpi_enable;
     bool security_extn;
     bool irq_reset_nonsecure;
     bool gicd_no_migration_shift_bug;
-- 
2.27.0


