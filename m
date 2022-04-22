Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A6B50B5D1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:01:08 +0200 (CEST)
Received: from localhost ([::1]:33944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhr2B-0007xH-Rp
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9r-0004Zm-7M
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9p-0002dW-Ai
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:58 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l3-20020a05600c1d0300b0038ff89c938bso4849676wms.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SsmXZg+uwjL7FCu6QoUQXU4qkVe/XwjPaQqP4D8bLQU=;
 b=yBqv585d25wr3ORR9wOllFEzGHe4WXeipZTf8Ua5KXmMTdF9hIAcOY7bB6bZYIewpA
 zoVcBh919xIv7cWh/e8KebzL53tatn6zZsMqzVQDTRDqjljkPei8C9PDI7jUsYn4UHGA
 qRYhHTYnghCXgqBd2UwVDKqwD3ATC8dek2xomwobVQwELxEgetY7CEqO1H7+PNbIR0fz
 SN30wuJjlM7gHkJvEURJCxaPnzUMSEfm6BtAOEb4ugpD0z9DrW97Nqj2GvejjjwLC06Y
 mfo7ApRJQ7G492Eqj/3KwhKsU9gfr4SAZNgghVlDZMV8eqsIQveGPmQv7xZ4tBrhpU9K
 DRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SsmXZg+uwjL7FCu6QoUQXU4qkVe/XwjPaQqP4D8bLQU=;
 b=MyAY6HO4QjNQOkC4GWneUjQPYrySFTONZZ+POHCuBWIFwGiRj4XVMFjMFv1hDzQr+4
 t8pvIEIMlWetj4tyKq9B2iXnl3MoceTnUJQ5sv0tibXJbxVT0GAu3W2J5RlyxB0Kp7p6
 b6y5357L1jio9SNKbCona2HvBV4gAcYfZxEMquOj1YdEel2iitAhbq6brj1Kch2ZF6La
 0guRSJvN6728d3ul6RsKvPcqmgEalnira59jDR3j7lUvnXZg14H9BSFkFtS09QKNCB/s
 9bi5WhXBujtXsuaFV3Cymk7jU4PO23rXivDD+k0ku6IQcE0Miynale+unoiXHghdUSon
 sknw==
X-Gm-Message-State: AOAM530neBDcjqFSeElaZVXTCR+EcpB0zQoe81bjrbXmQR+HIhqph3v7
 hcz8oDGaQNScj0EeaaOE/OniVVIsozXbaA==
X-Google-Smtp-Source: ABdhPJwHVafKn5Dm/FNZRFoemfYZ5+KnzzPs2n8vmcraSV/tlq1r8I31/GdK145bKDjp6ObOXocwnw==
X-Received: by 2002:a1c:2904:0:b0:37b:ea53:4cbf with SMTP id
 p4-20020a1c2904000000b0037bea534cbfmr3428072wmp.46.1650621895704; 
 Fri, 22 Apr 2022 03:04:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/61] hw/intc/arm_gicv3: Implement new GICv4 redistributor
 registers
Date: Fri, 22 Apr 2022 11:03:54 +0100
Message-Id: <20220422100432.2288247-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Implement the new GICv4 redistributor registers: GICR_VPROPBASER
and GICR_VPENDBASER; for the moment we implement these as simple
reads-as-written stubs, together with the necessary migration
and reset handling.

We don't put ID-register checks on the handling of these registers,
because they are all in the only-in-v4 extra register frames, so
they're not accessible in a GICv3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-24-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h           | 21 +++++++++++
 include/hw/intc/arm_gicv3_common.h |  3 ++
 hw/intc/arm_gicv3_common.c         | 22 ++++++++++++
 hw/intc/arm_gicv3_redist.c         | 56 ++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 9720ccf7507..795bf57d2b3 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -77,6 +77,7 @@
  * Redistributor frame offsets from RD_base
  */
 #define GICR_SGI_OFFSET 0x10000
+#define GICR_VLPI_OFFSET 0x20000
 
 /*
  * Redistributor registers, offsets from RD_base
@@ -109,6 +110,10 @@
 #define GICR_IGRPMODR0        (GICR_SGI_OFFSET + 0x0D00)
 #define GICR_NSACR            (GICR_SGI_OFFSET + 0x0E00)
 
+/* VLPI redistributor registers, offsets from VLPI_base */
+#define GICR_VPROPBASER       (GICR_VLPI_OFFSET + 0x70)
+#define GICR_VPENDBASER       (GICR_VLPI_OFFSET + 0x78)
+
 #define GICR_CTLR_ENABLE_LPIS        (1U << 0)
 #define GICR_CTLR_CES                (1U << 1)
 #define GICR_CTLR_RWP                (1U << 3)
@@ -143,6 +148,22 @@ FIELD(GICR_PENDBASER, PTZ, 62, 1)
 
 #define GICR_PROPBASER_IDBITS_THRESHOLD          0xd
 
+/* These are the GICv4 VPROPBASER and VPENDBASER layouts; v4.1 is different */
+FIELD(GICR_VPROPBASER, IDBITS, 0, 5)
+FIELD(GICR_VPROPBASER, INNERCACHE, 7, 3)
+FIELD(GICR_VPROPBASER, SHAREABILITY, 10, 2)
+FIELD(GICR_VPROPBASER, PHYADDR, 12, 40)
+FIELD(GICR_VPROPBASER, OUTERCACHE, 56, 3)
+
+FIELD(GICR_VPENDBASER, INNERCACHE, 7, 3)
+FIELD(GICR_VPENDBASER, SHAREABILITY, 10, 2)
+FIELD(GICR_VPENDBASER, PHYADDR, 16, 36)
+FIELD(GICR_VPENDBASER, OUTERCACHE, 56, 3)
+FIELD(GICR_VPENDBASER, DIRTY, 60, 1)
+FIELD(GICR_VPENDBASER, PENDINGLAST, 61, 1)
+FIELD(GICR_VPENDBASER, IDAI, 62, 1)
+FIELD(GICR_VPENDBASER, VALID, 63, 1)
+
 #define ICC_CTLR_EL1_CBPR           (1U << 0)
 #define ICC_CTLR_EL1_EOIMODE        (1U << 1)
 #define ICC_CTLR_EL1_PMHE           (1U << 6)
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 40bc404a652..7ff5a1aa5fc 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -179,6 +179,9 @@ struct GICv3CPUState {
     uint32_t gicr_igrpmodr0;
     uint32_t gicr_nsacr;
     uint8_t gicr_ipriorityr[GIC_INTERNAL];
+    /* VLPI_base page registers */
+    uint64_t gicr_vpropbaser;
+    uint64_t gicr_vpendbaser;
 
     /* CPU interface */
     uint64_t icc_sre_el1;
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 18999e3c8bb..14d76d74840 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -144,6 +144,25 @@ const VMStateDescription vmstate_gicv3_cpu_sre_el1 = {
     }
 };
 
+static bool gicv4_needed(void *opaque)
+{
+    GICv3CPUState *cs = opaque;
+
+    return cs->gic->revision > 3;
+}
+
+const VMStateDescription vmstate_gicv3_gicv4 = {
+    .name = "arm_gicv3_cpu/gicv4",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = gicv4_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(gicr_vpropbaser, GICv3CPUState),
+        VMSTATE_UINT64(gicr_vpendbaser, GICv3CPUState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gicv3_cpu = {
     .name = "arm_gicv3_cpu",
     .version_id = 1,
@@ -175,6 +194,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
     .subsections = (const VMStateDescription * []) {
         &vmstate_gicv3_cpu_virt,
         &vmstate_gicv3_cpu_sre_el1,
+        &vmstate_gicv3_gicv4,
         NULL
     }
 };
@@ -444,6 +464,8 @@ static void arm_gicv3_common_reset(DeviceState *dev)
         cs->gicr_waker = GICR_WAKER_ProcessorSleep | GICR_WAKER_ChildrenAsleep;
         cs->gicr_propbaser = 0;
         cs->gicr_pendbaser = 0;
+        cs->gicr_vpropbaser = 0;
+        cs->gicr_vpendbaser = 0;
         /* If we're resetting a TZ-aware GIC as if secure firmware
          * had set it up ready to start a kernel in non-secure, we
          * need to set interrupts to group 1 so the kernel can use them.
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 9f1fe09a78e..c310d7f8ff2 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -236,6 +236,23 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
     case GICR_IDREGS ... GICR_IDREGS + 0x2f:
         *data = gicv3_idreg(offset - GICR_IDREGS, GICV3_PIDR0_REDIST);
         return MEMTX_OK;
+        /*
+         * VLPI frame registers. We don't need a version check for
+         * VPROPBASER and VPENDBASER because gicv3_redist_size() will
+         * prevent pre-v4 GIC from passing us offsets this high.
+         */
+    case GICR_VPROPBASER:
+        *data = extract64(cs->gicr_vpropbaser, 0, 32);
+        return MEMTX_OK;
+    case GICR_VPROPBASER + 4:
+        *data = extract64(cs->gicr_vpropbaser, 32, 32);
+        return MEMTX_OK;
+    case GICR_VPENDBASER:
+        *data = extract64(cs->gicr_vpendbaser, 0, 32);
+        return MEMTX_OK;
+    case GICR_VPENDBASER + 4:
+        *data = extract64(cs->gicr_vpendbaser, 32, 32);
+        return MEMTX_OK;
     default:
         return MEMTX_ERROR;
     }
@@ -379,6 +396,23 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
                       "%s: invalid guest write to RO register at offset "
                       TARGET_FMT_plx "\n", __func__, offset);
         return MEMTX_OK;
+        /*
+         * VLPI frame registers. We don't need a version check for
+         * VPROPBASER and VPENDBASER because gicv3_redist_size() will
+         * prevent pre-v4 GIC from passing us offsets this high.
+         */
+    case GICR_VPROPBASER:
+        cs->gicr_vpropbaser = deposit64(cs->gicr_vpropbaser, 0, 32, value);
+        return MEMTX_OK;
+    case GICR_VPROPBASER + 4:
+        cs->gicr_vpropbaser = deposit64(cs->gicr_vpropbaser, 32, 32, value);
+        return MEMTX_OK;
+    case GICR_VPENDBASER:
+        cs->gicr_vpendbaser = deposit64(cs->gicr_vpendbaser, 0, 32, value);
+        return MEMTX_OK;
+    case GICR_VPENDBASER + 4:
+        cs->gicr_vpendbaser = deposit64(cs->gicr_vpendbaser, 32, 32, value);
+        return MEMTX_OK;
     default:
         return MEMTX_ERROR;
     }
@@ -397,6 +431,17 @@ static MemTxResult gicr_readll(GICv3CPUState *cs, hwaddr offset,
     case GICR_PENDBASER:
         *data = cs->gicr_pendbaser;
         return MEMTX_OK;
+        /*
+         * VLPI frame registers. We don't need a version check for
+         * VPROPBASER and VPENDBASER because gicv3_redist_size() will
+         * prevent pre-v4 GIC from passing us offsets this high.
+         */
+    case GICR_VPROPBASER:
+        *data = cs->gicr_vpropbaser;
+        return MEMTX_OK;
+    case GICR_VPENDBASER:
+        *data = cs->gicr_vpendbaser;
+        return MEMTX_OK;
     default:
         return MEMTX_ERROR;
     }
@@ -418,6 +463,17 @@ static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
                       "%s: invalid guest write to RO register at offset "
                       TARGET_FMT_plx "\n", __func__, offset);
         return MEMTX_OK;
+        /*
+         * VLPI frame registers. We don't need a version check for
+         * VPROPBASER and VPENDBASER because gicv3_redist_size() will
+         * prevent pre-v4 GIC from passing us offsets this high.
+         */
+    case GICR_VPROPBASER:
+        cs->gicr_vpropbaser = value;
+        return MEMTX_OK;
+    case GICR_VPENDBASER:
+        cs->gicr_vpendbaser = value;
+        return MEMTX_OK;
     default:
         return MEMTX_ERROR;
     }
-- 
2.25.1


