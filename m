Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2635650B5C1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:57:40 +0200 (CEST)
Received: from localhost ([::1]:53464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqyp-00008e-8T
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9q-0004YZ-L2
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:58 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9o-0002dR-MU
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:58 -0400
Received: by mail-wr1-x429.google.com with SMTP id v12so3513643wrv.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=c0yHcR8YX+80NnBGhmsGm2fxQhfDVLS6/G8Kbm/Fj84=;
 b=tmTTrwiJbvK+gh7yf6bmS+eWH7jbBLcE5UujWpp5n1q2LtZ4QS0bEuJZeaUutsa4ym
 6dWpDnOBSlSz0LFluZNY6qYETWG6nWKmz9S/Fk1+lTGHn3iNcweTSXTvJUBT1ZTX3FWM
 s7LlzqFAneGxWPIXx2WTQGt6soqEXBnvDZzw7hprQz2PAgyKYdjlYKJ9CYlqBWzIUTi9
 NzT6GE38eOciasEgNYeKXANLALI5ci9EQwOyCjVEJhECTENwVK9PQ0QA0ahnqRRiht+N
 eSnzQInJb1WFFMFZMd0VBui/UbZ1xxyPFfVZPBRsiTkcVwV/oGz6x3BRleE3Wv21y83D
 K4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c0yHcR8YX+80NnBGhmsGm2fxQhfDVLS6/G8Kbm/Fj84=;
 b=0QT+1O9IsSaaMTqKc522ZiXTeKLJTGtyIRFT8GKIhDgdcyIuxpbY1o20dXGZ8XVlxy
 XhrAcq3vrUz9c/jaTzZk5L1SQ49UdRnHEbAwsZsFMxDHVLQOvcrAAdLF9fhUSExpftCn
 49NkcsjrM0c8aOn2tb69QeEYxke4MJrEAKyOg9HjId3cncUfHkR6zruxhCO8uvemvtxk
 9tESbNZRvETrjpQB9uuGcXj2biwx8+UXzZb6UCuVPgW3eVZtLVsH6/dkMX6vMpOh7wa2
 XZdxNGC65ajmAHMa9jsrqc2gAEt000a+aLcNbtypq681V07CoybsetRH/CyE65yFMdnP
 n9CQ==
X-Gm-Message-State: AOAM533M80D/NMb6GXOFYLsDCPr0lmqg2bK+MyV/BOIxDCLoAmledkTR
 I+gSF6VKHtEmG42Wy986bCTtF5DDRkiHKQ==
X-Google-Smtp-Source: ABdhPJyaFqpI9J/zWTtKTwsJ9PBLe9T+/poYfkCLQoAKxjepUcQlytGmHEJ/Z68q0U/ES6iwylCrWw==
X-Received: by 2002:adf:d1ce:0:b0:20a:992a:3b54 with SMTP id
 b14-20020adfd1ce000000b0020a992a3b54mr3005173wrd.270.1650621894704; 
 Fri, 22 Apr 2022 03:04:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/61] hw/intc/arm_gicv3: Implement GICv4's new redistributor
 frame
Date: Fri, 22 Apr 2022 11:03:53 +0100
Message-Id: <20220422100432.2288247-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The GICv4 extends the redistributor register map -- where GICv3
had two 64KB frames per CPU, GICv4 has four frames. Add support
for the extra frame by using a new gicv3_redist_size() function
in the places in the GIC implementation which currently use
a fixed constant size for the redistributor register block.
(Until we implement the extra registers they will RAZ/WI.)

Any board that wants to use a GICv4 will need to also adjust
to handle the different sized redistributor register block;
that will be done separately.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-23-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h           | 21 +++++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  5 +++++
 hw/intc/arm_gicv3_common.c         |  2 +-
 hw/intc/arm_gicv3_redist.c         |  8 ++++----
 4 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 8d58d38836f..9720ccf7507 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -489,6 +489,27 @@ FIELD(VTE, RDBASE, 42, RDBASE_PROCNUM_LENGTH)
 
 /* Functions internal to the emulated GICv3 */
 
+/**
+ * gicv3_redist_size:
+ * @s: GICv3State
+ *
+ * Return the size of the redistributor register frame in bytes
+ * (which depends on what GIC version this is)
+ */
+static inline int gicv3_redist_size(GICv3State *s)
+{
+    /*
+     * Redistributor size is controlled by the redistributor GICR_TYPER.VLPIS.
+     * It's the same for every redistributor in the GIC, so arbitrarily
+     * use the register field in the first one.
+     */
+    if (s->cpu[0].gicr_typer & GICR_TYPER_VLPIS) {
+        return GICV4_REDIST_SIZE;
+    } else {
+        return GICV3_REDIST_SIZE;
+    }
+}
+
 /**
  * gicv3_intid_is_special:
  * @intid: interrupt ID
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 08b27789385..40bc404a652 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -38,7 +38,12 @@
 
 #define GICV3_LPI_INTID_START 8192
 
+/*
+ * The redistributor in GICv3 has two 64KB frames per CPU; in
+ * GICv4 it has four 64KB frames per CPU.
+ */
 #define GICV3_REDIST_SIZE 0x20000
+#define GICV4_REDIST_SIZE 0x40000
 
 /* Number of SGI target-list bits */
 #define GICV3_TARGETLIST_BITS 16
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index dcc5ce28c6a..18999e3c8bb 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -295,7 +295,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 
         memory_region_init_io(&region->iomem, OBJECT(s),
                               ops ? &ops[1] : NULL, region, name,
-                              s->redist_region_count[i] * GICV3_REDIST_SIZE);
+                              s->redist_region_count[i] * gicv3_redist_size(s));
         sysbus_init_mmio(sbd, &region->iomem);
         g_free(name);
     }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 7c75dd6f072..9f1fe09a78e 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -442,8 +442,8 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
      * in the memory map); if so then the GIC has multiple MemoryRegions
      * for the redistributors.
      */
-    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
-    offset %= GICV3_REDIST_SIZE;
+    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
+    offset %= gicv3_redist_size(s);
 
     cs = &s->cpu[cpuidx];
 
@@ -501,8 +501,8 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
      * in the memory map); if so then the GIC has multiple MemoryRegions
      * for the redistributors.
      */
-    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
-    offset %= GICV3_REDIST_SIZE;
+    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
+    offset %= gicv3_redist_size(s);
 
     cs = &s->cpu[cpuidx];
 
-- 
2.25.1


