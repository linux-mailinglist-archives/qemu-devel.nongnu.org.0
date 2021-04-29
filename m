Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0425D36F30D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 01:48:59 +0200 (CEST)
Received: from localhost ([::1]:38246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcGOw-00049H-3W
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 19:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIU-0005ka-KO
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:19 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:41799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIJ-0004LT-VO
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:18 -0400
Received: by mail-qv1-xf36.google.com with SMTP id gv2so24254077qvb.8
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 16:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SxrpV4e31oEDznPH8sP8Z5BnHttfVKwpeRs3n8YtvXg=;
 b=gO3GQlB3w1bSOrd/LawofYb86PaWhMknKW6vbZVRdFs110DTULmuXELqOcBkEerCm/
 3uSM6e16Fyw1fBzpharKeZHKsVSiE8w1n9K3om4Cmnm6+Y2mbfyoWd5u8hIA+L6Uog4f
 SSFCptyvkwJ62SqDWcwEFmJBrNZueGCil0CKQaDcSSZ/sIvGuQcBbMxzz9bWi2UyuaS0
 HC83wi71lzDhlDDRNkIz1bl1k29XDIyWTxRh/J/PWNiIeJiDKhOSaUXtEfZ0tpJT9on/
 O6Nj8qJyhFpIrpDlIFeCLFGu8pL4kuKCh8Bm8rvpBz7BzWRVQQeaVsOXyifXAfETUW8D
 l2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SxrpV4e31oEDznPH8sP8Z5BnHttfVKwpeRs3n8YtvXg=;
 b=pXcOUQbDVU8/y5W3STF0Y00e76XV06js2x/BObQl4xVmYLs9KOWTuwZfIFRuxrH7sl
 8t5rM8qSWij0bAft5xGv7lcQN+4/XwIMpvV12skAnVI/NGeUlHQC7kq82L9+9KYtYWpa
 bZ0pGh6uyAx/bVjZnlvtq+5a1OmwF/01Y3qPFoXuobrHzHw3JKUz0ZvlPsaNtKmHAcNq
 dtaNjWyn/wz1w0jU06UCBxLDXJdlLOp2tfXY33esa4/C7bKUQ3Q8KTD9qKK+9Oi8u7GP
 bCLgpL4z4AUPPtLycf+LbGTZc2QyJHD/0GpCOAenLplTRaEsU4eUMeE7fiKWuWDd4vZ6
 sDbg==
X-Gm-Message-State: AOAM533ug6zEqHFVY1qSldukg/tgUNCQDugD3uWMpDNIc8sVT3fEXD2f
 aSv7m0feuj90Jg4R+f+1yOm6OgNwtIPJdA==
X-Google-Smtp-Source: ABdhPJyVic5CQ8dYpZdd/IIADr8k1XJ6OnxgeDefG+mcpBJy/S+kd8mX1JcmyfZ1ML/pDyBR1n6VtQ==
X-Received: by 2002:a0c:b399:: with SMTP id t25mr2257466qve.31.1619739725573; 
 Thu, 29 Apr 2021 16:42:05 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id i2sm1093229qtg.0.2021.04.29.16.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:42:05 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v3 5/8] hw/intc: GICv3 ITS Feature enablement
Date: Thu, 29 Apr 2021 19:41:58 -0400
Message-Id: <20210429234201.125565-6-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429234201.125565-1-shashi.mallela@linaro.org>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf36.google.com
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
 hw/intc/arm_gicv3_common.c         | 13 +++++++++++++
 hw/intc/arm_gicv3_dist.c           | 21 +++++++++++++++++++--
 hw/intc/arm_gicv3_redist.c         | 30 +++++++++++++++++++++++++-----
 hw/intc/gicv3_internal.h           | 17 +++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 5 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589..a55e91071a 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -381,6 +381,16 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
             (1 << 24) |
             (i << 8) |
             (last << 4);
+
+        if (s->lpi_enable) {
+            s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
+
+            if (!s->dma) {
+                error_setg(errp,
+                    "Redist-ITS: Guest 'sysmem' reference link not set");
+                return;
+            }
+        }
     }
 }
 
@@ -494,9 +504,12 @@ static Property arm_gicv3_common_properties[] = {
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
index b65f56f903..43e0ea4367 100644
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
@@ -385,8 +388,22 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
          */
         bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
 
+        /*
+         * With securityextn on, LPIs are supported when affinity routing
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
         return MEMTX_OK;
     }
     case GICD_IIDR:
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8645220d61..7604ccdc83 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -244,14 +244,22 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
 static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
                                uint64_t value, MemTxAttrs attrs)
 {
+    uint64_t data;
+
     switch (offset) {
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
@@ -275,7 +283,12 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         cs->gicr_waker = value;
         return MEMTX_OK;
     case GICR_PROPBASER:
-        cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 0, 32, value);
+        data = value;
+        if (FIELD_EX64(data, GICR_PROPBASER, IDBITS) > GICD_TYPER_IDBITS) {
+            data &= ~R_GICR_PROPBASER_IDBITS_MASK;
+            data |= GICD_TYPER_IDBITS;
+        }
+        cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 0, 32, data);
         return MEMTX_OK;
     case GICR_PROPBASER + 4:
         cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 32, 32, value);
@@ -395,9 +408,16 @@ static MemTxResult gicr_readll(GICv3CPUState *cs, hwaddr offset,
 static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
                                 uint64_t value, MemTxAttrs attrs)
 {
+    uint64_t data;
+
     switch (offset) {
     case GICR_PROPBASER:
-        cs->gicr_propbaser = value;
+        data = value;
+        if (FIELD_EX64(data, GICR_PROPBASER, IDBITS) > GICD_TYPER_IDBITS) {
+            data &= ~R_GICR_PROPBASER_IDBITS_MASK;
+            data |= GICD_TYPER_IDBITS;
+        }
+        cs->gicr_propbaser = data;
         return MEMTX_OK;
     case GICR_PENDBASER:
         cs->gicr_pendbaser = value;
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index e49370224f..c99a05461e 100644
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
 
@@ -126,6 +129,20 @@
 #define GICR_WAKER_ProcessorSleep    (1U << 1)
 #define GICR_WAKER_ChildrenAsleep    (1U << 2)
 
+FIELD(GICR_PROPBASER, IDBITS, 0, 5)
+FIELD(GICR_PROPBASER, INNERCACHE, 7, 3)
+FIELD(GICR_PROPBASER, SHAREABILITY, 10, 2)
+FIELD(GICR_PROPBASER, PHYADDR, 12, 40)
+FIELD(GICR_PROPBASER, OUTERCACHE, 56, 3)
+
+#define GICR_PROPBASER_IDBITS_THRESHOLD          0xd
+
+FIELD(GICR_PENDBASER, INNERCACHE, 7, 3)
+FIELD(GICR_PENDBASER, SHAREABILITY, 10, 2)
+FIELD(GICR_PENDBASER, PHYADDR, 16, 36)
+FIELD(GICR_PENDBASER, OUTERCACHE, 56, 3)
+FIELD(GICR_PENDBASER, PTZ, 62, 1)
+
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


