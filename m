Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266C33B8664
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:41:34 +0200 (CEST)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycLF-0002dq-5J
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycCF-0004rF-S6
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:16 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:42694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycC3-00056V-T4
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:15 -0400
Received: by mail-qk1-x736.google.com with SMTP id v139so2818120qkb.9
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I3o8e2SFDl8H5bXNenZ0UkBZyLNON5WdhdKgDgRSzUk=;
 b=HWadK54DvaQr4CEmtgIcfkl4csLqBwYWarHzdPFlPQ1AjBEr0kj5UFpaU6IdsyIEiA
 LYSjhqBhO8NcDt20DNDxi5DQjSy3aUFsFjQ+q92CRUrWyGbjHyJEU/t1Py1Cxvaz9CP6
 1a42rrEQyFc8Bk81hW9hu4aevuzDpA8ZWiJQBMSk7tLnxL9Rh3H8+ZCH51x3jMuDowN+
 ik9eOFN7Hs1iVAWH8cf1iIR6/YXRkJ1+WHZTep9L6yIPHzUOzwYYDjixytPvsAN8FQlW
 HnASTeTSk+gmTNpbvHG2i2Gntf3hy7hmFGhM3TJeQZRbrB6gym98v1SiSBlIyuJZEfti
 RzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I3o8e2SFDl8H5bXNenZ0UkBZyLNON5WdhdKgDgRSzUk=;
 b=ZO55tTJc/GhSDlsjXYufNP/0Eg5d4C9jmoMJ+qtnDnKtNhFgteX7oLRr0d7a6PrJLx
 XNIpgEVtQzmuF7agNhXsHKCsHXmfrmMZAJsBx9/vEMVXYiQiU+7ejnDfZ7xsBdgGHBGW
 PFPweU4u1qpmtTX1sIqScIrQXFtCUWEtY2fzvOPPjEU8k0tFiIjztppeuo/BGaM07zRD
 KKmyN3V3UI/irO/Qj37HadZ9RQtHc2lI6rf7uTlcuosMKomcAxjy80MNtcdgDenx88AX
 GSDG+FqbQq0pjrWbusm5cy4ApIVfAjtThr5JDQq0lAStVIMKeFSqKIXITlSHrBQqvNYh
 W6HQ==
X-Gm-Message-State: AOAM532c0Z2SV3Q+K2Ubf2ZWYH/O7ZmzrA2Ynu6MILMXxbT9H2DEfmKk
 Djqb8ILDaAMBuep6G4K9evTKEg==
X-Google-Smtp-Source: ABdhPJx74Qj7GD4tn/8dO4GASz6vL8dYpt4moZtPOs99dEKfcBeiKtxucYOdLNAZkl+0D4JDDEuqbA==
X-Received: by 2002:a37:a654:: with SMTP id p81mr25537078qke.291.1625067123008; 
 Wed, 30 Jun 2021 08:32:03 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id 4sm836131qkm.100.2021.06.30.08.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 08:32:02 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v5 05/10] hw/intc: GICv3 ITS Feature enablement
Date: Wed, 30 Jun 2021 11:31:51 -0400
Message-Id: <20210630153156.9421-6-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210630153156.9421-1-shashi.mallela@linaro.org>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x736.google.com
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

Added properties to enable ITS feature and define qemu system
address space memory in gicv3 common,setup distributor and
redistributor registers to indicate LPI support.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_common.c         | 12 ++++++++++++
 hw/intc/arm_gicv3_dist.c           |  5 ++++-
 hw/intc/arm_gicv3_redist.c         | 12 +++++++++---
 hw/intc/gicv3_internal.h           |  9 ++++++---
 include/hw/intc/arm_gicv3_common.h |  1 +
 5 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589..53dea2a775 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -345,6 +345,11 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->lpi_enable && !s->dma) {
+        error_setg(errp, "Redist-ITS: Guest 'sysmem' reference link not set");
+        return;
+    }
+
     s->cpu = g_new0(GICv3CPUState, s->num_cpu);
 
     for (i = 0; i < s->num_cpu; i++) {
@@ -381,6 +386,10 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
             (1 << 24) |
             (i << 8) |
             (last << 4);
+
+        if (s->lpi_enable) {
+            s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
+        }
     }
 }
 
@@ -494,9 +503,12 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", GICv3State, num_cpu, 1),
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
+    DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
     DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
                       redist_region_count, qdev_prop_uint32, uint32_t),
+    DEFINE_PROP_LINK("sysmem", GICv3State, dma, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b65f56f903..ae625d758a 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -371,7 +371,9 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
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
@@ -386,6 +388,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
         bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
 
         *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
+            (s->lpi_enable << GICD_TYPER_LPIS_OFFSET) |
             (0xf << 19) | itlinesnumber;
         return MEMTX_OK;
     }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8645220d61..fc3d95dcc6 100644
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
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index f7675a5adc..43ce4a8a95 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -68,6 +68,9 @@
 #define GICD_CTLR_E1NWF             (1U << 7)
 #define GICD_CTLR_RWP               (1U << 31)
 
+#define GICD_TYPER_LPIS_OFFSET         17
+#define GICD_TYPER_IDBITS_OFFSET       19
+#define GICD_TYPER_IDBITS_MASK       0x1f
 /* 16 bits EventId */
 #define GICD_TYPER_IDBITS            0xf
 
@@ -123,6 +126,9 @@
 #define GICR_TYPER_COMMONLPIAFF      (0x3 << 24)
 #define GICR_TYPER_AFFINITYVALUE     (0xFFFFFFFFULL << 32)
 
+#define GICR_WAKER_ProcessorSleep    (1U << 1)
+#define GICR_WAKER_ChildrenAsleep    (1U << 2)
+
 FIELD(GICR_PROPBASER, IDBITS, 0, 5)
 FIELD(GICR_PROPBASER, INNERCACHE, 7, 3)
 FIELD(GICR_PROPBASER, SHAREABILITY, 10, 2)
@@ -137,9 +143,6 @@ FIELD(GICR_PENDBASER, PHYADDR, 16, 36)
 FIELD(GICR_PENDBASER, OUTERCACHE, 56, 3)
 FIELD(GICR_PENDBASER, PTZ, 62, 1)
 
-#define GICR_WAKER_ProcessorSleep    (1U << 1)
-#define GICR_WAKER_ChildrenAsleep    (1U << 2)
-
 #define ICC_CTLR_EL1_CBPR           (1U << 0)
 #define ICC_CTLR_EL1_EOIMODE        (1U << 1)
 #define ICC_CTLR_EL1_PMHE           (1U << 6)
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 0715b0bc2a..c1348cc60a 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -221,6 +221,7 @@ struct GICv3State {
     uint32_t num_cpu;
     uint32_t num_irq;
     uint32_t revision;
+    bool lpi_enable;
     bool security_extn;
     bool irq_reset_nonsecure;
     bool gicd_no_migration_shift_bug;
-- 
2.27.0


