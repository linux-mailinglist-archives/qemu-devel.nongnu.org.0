Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD994F97D4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:18:30 +0200 (CEST)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpRV-0002GG-4B
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP9-0006id-My
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:04 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP6-0002EY-Nx
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:03 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w21so13099140wra.2
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UgfSynmK+XRGptalQdPXQzCZuxEoEEBnalXv3aPbwZY=;
 b=gQzwbiEhxW2ctyavl5c2Va78Jbm8JD+zZBWO5BvXZpyN7n5UeVTCN6iGyfh6ZcxscR
 R707bFNIfpI4DCeMb2grDRd2KovU4U+mWnkpE/UezN+o9ITLPNRTxlELEvyw5BPsN494
 P7RuJ1eUGiRYimWg/PfojWZwuAKEX/fHyL7X4bM78RZWWnCCy2gVWXM+RdgEh3qcnBXP
 CBudLoypJCrEi/5rF6aKcXfzQI9m0sRf5bJXwVnhbxFhytFKN0ASQCD3PZuiSIF1gtcY
 rs92+KI/MckIZepJaGsINmHoYg8pNAvjBzcEIghCMadGuhTqr5QxBeDu/jFb4hk4P6kr
 fF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UgfSynmK+XRGptalQdPXQzCZuxEoEEBnalXv3aPbwZY=;
 b=oaw2K2CPIsN0evTMTgBFu5ET93uIPEnTX2f1yyfhOzq0WYkvasCEQjeLY4oMADkejm
 KTtAfHXKKdmKsr/jrnimhk95Dgz3gu7cjuUfzc0Qit2Rn/JwEfebioiwlAExltgztqwD
 rTj96Hr2mU5mabQzz7vvuGv7n07T5el9/d8fKGZGYZ794hB0Pu2qawcWtYvTEwpYL5XJ
 G7OlVq4aYzx3Fw4ANgKRWLkiqTdfB7F1lz1UGob3045lJIeEm47JGD+C35V1gJEScTEn
 xWpXi3DDnFyPWnBQFZuXaTl6HcA/w2dm7GZuFv4VUp4rm9PxkycoEC9oSkoePxWqBAWE
 cXFA==
X-Gm-Message-State: AOAM531B9IJxSMxeFdAIOhBWjYYR9T4uJInTqdHJgzsuozvx7p1D5a6r
 EnPoHbFeXJxKUCEj+2/Tp0/CTg==
X-Google-Smtp-Source: ABdhPJwZOAFZIDLDDFTSMw1T6rf7XS3Uzc25CzIvy85kKMiQBdyNEBtfJ1yzaJgIZ4/RgGdwWXdRLQ==
X-Received: by 2002:adf:ce83:0:b0:206:c45:62bd with SMTP id
 r3-20020adfce83000000b002060c4562bdmr14264723wrn.97.1649427358275; 
 Fri, 08 Apr 2022 07:15:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:15:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/41] hw/intc/arm_gicv3: Report correct PIDR0 values for ID
 registers
Date: Fri,  8 Apr 2022 15:15:13 +0100
Message-Id: <20220408141550.1271295-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We use the common function gicv3_idreg() to supply the CoreSight ID
register values for the GICv3 for the copies of these ID registers in
the distributor, redistributor and ITS register frames.  This isn't
quite correct, because while most of the register values are the
same, the PIDR0 value should vary to indicate which of these three
frames it is.  (You can see this and also the correct values of these
PIDR0 registers by looking at the GIC-600 or GIC-700 TRMs, for
example.)

Make gicv3_idreg() take an extra argument for the PIDR0 value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h   | 15 +++++++++++++--
 hw/intc/arm_gicv3_dist.c   |  2 +-
 hw/intc/arm_gicv3_its.c    |  2 +-
 hw/intc/arm_gicv3_redist.c |  2 +-
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 2bf1baef047..dec413f7cfa 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -555,7 +555,12 @@ static inline uint32_t gicv3_iidr(void)
     return 0x43b;
 }
 
-static inline uint32_t gicv3_idreg(int regoffset)
+/* CoreSight PIDR0 values for ARM GICv3 implementations */
+#define GICV3_PIDR0_DIST 0x92
+#define GICV3_PIDR0_REDIST 0x93
+#define GICV3_PIDR0_ITS 0x94
+
+static inline uint32_t gicv3_idreg(int regoffset, uint8_t pidr0)
 {
     /* Return the value of the CoreSight ID register at the specified
      * offset from the first ID register (as found in the distributor
@@ -565,7 +570,13 @@ static inline uint32_t gicv3_idreg(int regoffset)
     static const uint8_t gicd_ids[] = {
         0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x3B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
     };
-    return gicd_ids[regoffset / 4];
+
+    regoffset /= 4;
+
+    if (regoffset == 4) {
+        return pidr0;
+    }
+    return gicd_ids[regoffset];
 }
 
 /**
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 28d913b2114..7f6275363ea 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -557,7 +557,7 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
     }
     case GICD_IDREGS ... GICD_IDREGS + 0x2f:
         /* ID registers */
-        *data = gicv3_idreg(offset - GICD_IDREGS);
+        *data = gicv3_idreg(offset - GICD_IDREGS, GICV3_PIDR0_DIST);
         return true;
     case GICD_SGIR:
         /* WO registers, return unknown value */
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 44914f25780..f8467b61ec5 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1161,7 +1161,7 @@ static bool its_readl(GICv3ITSState *s, hwaddr offset,
         break;
     case GITS_IDREGS ... GITS_IDREGS + 0x2f:
         /* ID registers */
-        *data = gicv3_idreg(offset - GITS_IDREGS);
+        *data = gicv3_idreg(offset - GITS_IDREGS, GICV3_PIDR0_ITS);
         break;
     case GITS_TYPER:
         *data = extract64(s->typer, 0, 32);
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 412a04f59cf..dc9729e8395 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -234,7 +234,7 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
         *data = cs->gicr_nsacr;
         return MEMTX_OK;
     case GICR_IDREGS ... GICR_IDREGS + 0x2f:
-        *data = gicv3_idreg(offset - GICR_IDREGS);
+        *data = gicv3_idreg(offset - GICR_IDREGS, GICV3_PIDR0_REDIST);
         return MEMTX_OK;
     default:
         return MEMTX_ERROR;
-- 
2.25.1


