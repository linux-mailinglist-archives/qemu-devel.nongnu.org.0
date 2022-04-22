Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276A550B58F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:50:41 +0200 (CEST)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqs3-0005Ud-SA
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA4-00050X-QL
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:12 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA2-0002rc-BG
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:12 -0400
Received: by mail-wm1-x335.google.com with SMTP id r19so4805549wmq.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ndm3t5N4OR0qFLpk2c9QhA+QCMSP9KicMr+q+FQ7Er8=;
 b=Z5oWSDwSdklSKXP6VScla6be5zMXhMm42x35OwYLCFM/HGc6K6oddzLkbwLhiwDJN6
 odm0y1e0avNrsTDN3LEYIipBi80j5X6ZU3khjW06s3GUpude2/dvO245EpBJ6Z2IUMGt
 cfLdqxiFys4Uxliq4ZJT2sj2PQe6aY5AYchDpw3kfDXZw1AL9erXPmFtqEO42N9TCccO
 MMA6+Hulsrf1QRefdDKL/RMlGw1NT0NcnkJ/7IrA18okSw4HU01v+EYwiBsaQhElTLiU
 9RpImDBsOnQg/nWV8//62vPl5z8gaO6hg/4DpSjwlsnZXHycaGndWtoJPhbhGtOotqiT
 xUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ndm3t5N4OR0qFLpk2c9QhA+QCMSP9KicMr+q+FQ7Er8=;
 b=mJpSPcYIbEQNRSXViEN1p1RLPdDklahnlGpGvPCgXu3EoVX+Yhrgu5cHLKnX8GsKfx
 9vdZpt7TSK1gC/yPuorfr0t2MlRApa38Cf+13aykvxtIauznVB4taoLk2KwurceO/k+H
 D3O9RIPCQp2XuU316CEHEuO1Hp4vcuqzYrKYdwmFdlnXa8fR1kVaqWpnmMxdVrf0wo1A
 tf1QF0UQSr0ePRjU4bUpXxfZ+Pb1kSarKfIFieGp36HVYdSJ4yS2+KOgOQ4ASA5Ur9Zy
 +X7RY3R7lCS5tl5EpOUdmlYVJTvTJ6bezNPnIj8C70QYzDv8ULRKWlKGS2BwWTqarUZk
 kXZg==
X-Gm-Message-State: AOAM533HsMfJK1MQzMMzYLnROW7p+wg6f3D2F5vIwvPF68+4uUVX3lg7
 yNYICU8+znbymkANkvzL5yka93SDjHHDzQ==
X-Google-Smtp-Source: ABdhPJxi765iFfT7423IYxNAe641KY0d+yCK7uZZY2F6pisugpbjJIDYzI4PhAm7XLxLj1oFx+LZsA==
X-Received: by 2002:a7b:c5cd:0:b0:38c:8b1b:d220 with SMTP id
 n13-20020a7bc5cd000000b0038c8b1bd220mr3398281wmk.118.1650621908963; 
 Fri, 22 Apr 2022 03:05:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/61] hw/intc/arm_gicv3: Update ID and feature registers for
 GICv4
Date: Fri, 22 Apr 2022 11:04:08 +0100
Message-Id: <20220422100432.2288247-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Update the various GIC ID and feature registers for GICv4:
 * PIDR2 [7:4] is the GIC architecture revision
 * GICD_TYPER.DVIS is 1 to indicate direct vLPI injection support
 * GICR_TYPER.VLPIS is 1 to indicate redistributor support for vLPIs
 * GITS_TYPER.VIRTUAL is 1 to indicate vLPI support
 * GITS_TYPER.VMOVP is 1 to indicate that our VMOVP implementation
   handles cross-ITS synchronization for the guest
 * ICH_VTR_EL2.nV4 is 0 to indicate direct vLPI injection support

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-38-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h   | 15 +++++++++++----
 hw/intc/arm_gicv3_common.c |  7 +++++--
 hw/intc/arm_gicv3_cpuif.c  |  6 +++++-
 hw/intc/arm_gicv3_dist.c   |  7 ++++---
 hw/intc/arm_gicv3_its.c    |  7 ++++++-
 hw/intc/arm_gicv3_redist.c |  2 +-
 6 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 07644b2be6f..0bf68452395 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -309,6 +309,7 @@ FIELD(GITS_TYPER, SEIS, 18, 1)
 FIELD(GITS_TYPER, PTA, 19, 1)
 FIELD(GITS_TYPER, CIDBITS, 32, 4)
 FIELD(GITS_TYPER, CIL, 36, 1)
+FIELD(GITS_TYPER, VMOVP, 37, 1)
 
 #define GITS_IDREGS           0xFFD0
 
@@ -747,23 +748,29 @@ static inline uint32_t gicv3_iidr(void)
 #define GICV3_PIDR0_REDIST 0x93
 #define GICV3_PIDR0_ITS 0x94
 
-static inline uint32_t gicv3_idreg(int regoffset, uint8_t pidr0)
+static inline uint32_t gicv3_idreg(GICv3State *s, int regoffset, uint8_t pidr0)
 {
     /* Return the value of the CoreSight ID register at the specified
      * offset from the first ID register (as found in the distributor
      * and redistributor register banks).
-     * These values indicate an ARM implementation of a GICv3.
+     * These values indicate an ARM implementation of a GICv3 or v4.
      */
     static const uint8_t gicd_ids[] = {
-        0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x3B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
+        0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x0B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
     };
+    uint32_t id;
 
     regoffset /= 4;
 
     if (regoffset == 4) {
         return pidr0;
     }
-    return gicd_ids[regoffset];
+    id = gicd_ids[regoffset];
+    if (regoffset == 6) {
+        /* PIDR2 bits [7:4] are the GIC architecture revision */
+        id |= s->revision << 4;
+    }
+    return id;
 }
 
 /**
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 3f47b3501fe..181f342f32c 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -406,8 +406,8 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
          *  Last == 1 if this is the last redistributor in a series of
          *            contiguous redistributor pages
          *  DirectLPI == 0 (direct injection of LPIs not supported)
-         *  VLPIS == 0 (virtual LPIs not supported)
-         *  PLPIS == 0 (physical LPIs not supported)
+         *  VLPIS == 1 if vLPIs supported (GICv4 and up)
+         *  PLPIS == 1 if LPIs supported
          */
         cpu_affid = object_property_get_uint(OBJECT(cpu), "mp-affinity", NULL);
 
@@ -422,6 +422,9 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
 
         if (s->lpi_enable) {
             s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
+            if (s->revision > 3) {
+                s->cpu[i].gicr_typer |= GICR_TYPER_VLPIS;
+            }
         }
     }
 
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index d627ddac90f..8404f46ee0b 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2578,11 +2578,15 @@ static uint64_t ich_vtr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     uint64_t value;
 
     value = ((cs->num_list_regs - 1) << ICH_VTR_EL2_LISTREGS_SHIFT)
-        | ICH_VTR_EL2_TDS | ICH_VTR_EL2_NV4 | ICH_VTR_EL2_A3V
+        | ICH_VTR_EL2_TDS | ICH_VTR_EL2_A3V
         | (1 << ICH_VTR_EL2_IDBITS_SHIFT)
         | ((cs->vprebits - 1) << ICH_VTR_EL2_PREBITS_SHIFT)
         | ((cs->vpribits - 1) << ICH_VTR_EL2_PRIBITS_SHIFT);
 
+    if (cs->gic->revision < 4) {
+        value |= ICH_VTR_EL2_NV4;
+    }
+
     trace_gicv3_ich_vtr_read(gicv3_redist_affid(cs), value);
     return value;
 }
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 7f6275363ea..b9ed955e36b 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -383,7 +383,7 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
          * No1N == 1 (1-of-N SPI interrupts not supported)
          * A3V == 1 (non-zero values of Affinity level 3 supported)
          * IDbits == 0xf (we support 16-bit interrupt identifiers)
-         * DVIS == 0 (Direct virtual LPI injection not supported)
+         * DVIS == 1 (Direct virtual LPI injection supported) if GICv4
          * LPIS == 1 (LPIs are supported if affinity routing is enabled)
          * num_LPIs == 0b00000 (bits [15:11],Number of LPIs as indicated
          *                      by GICD_TYPER.IDbits)
@@ -399,8 +399,9 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
          * so we only need to check the DS bit.
          */
         bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
+        bool dvis = s->revision >= 4;
 
-        *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
+        *data = (1 << 25) | (1 << 24) | (dvis << 18) | (sec_extn << 10) |
             (s->lpi_enable << GICD_TYPER_LPIS_SHIFT) |
             (0xf << 19) | itlinesnumber;
         return true;
@@ -557,7 +558,7 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
     }
     case GICD_IDREGS ... GICD_IDREGS + 0x2f:
         /* ID registers */
-        *data = gicv3_idreg(offset - GICD_IDREGS, GICV3_PIDR0_DIST);
+        *data = gicv3_idreg(s, offset - GICD_IDREGS, GICV3_PIDR0_DIST);
         return true;
     case GICD_SGIR:
         /* WO registers, return unknown value */
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 0670aca4d46..2ff21ed6bbe 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1699,7 +1699,7 @@ static bool its_readl(GICv3ITSState *s, hwaddr offset,
         break;
     case GITS_IDREGS ... GITS_IDREGS + 0x2f:
         /* ID registers */
-        *data = gicv3_idreg(offset - GITS_IDREGS, GICV3_PIDR0_ITS);
+        *data = gicv3_idreg(s->gicv3, offset - GITS_IDREGS, GICV3_PIDR0_ITS);
         break;
     case GITS_TYPER:
         *data = extract64(s->typer, 0, 32);
@@ -1946,6 +1946,11 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, DEVBITS, ITS_DEVBITS);
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIL, 1);
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIDBITS, ITS_CIDBITS);
+    if (s->gicv3->revision >= 4) {
+        /* Our VMOVP handles cross-ITS synchronization itself */
+        s->typer = FIELD_DP64(s->typer, GITS_TYPER, VMOVP, 1);
+        s->typer = FIELD_DP64(s->typer, GITS_TYPER, VIRTUAL, 1);
+    }
 }
 
 static void gicv3_its_reset(DeviceState *dev)
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index bcb54bef76e..c3d4cdd66b7 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -441,7 +441,7 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
         *data = cs->gicr_nsacr;
         return MEMTX_OK;
     case GICR_IDREGS ... GICR_IDREGS + 0x2f:
-        *data = gicv3_idreg(offset - GICR_IDREGS, GICV3_PIDR0_REDIST);
+        *data = gicv3_idreg(cs->gic, offset - GICR_IDREGS, GICV3_PIDR0_REDIST);
         return MEMTX_OK;
         /*
          * VLPI frame registers. We don't need a version check for
-- 
2.25.1


