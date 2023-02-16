Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB425699B10
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:16:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnK-0008Dc-OB; Thu, 16 Feb 2023 12:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnI-0008Ai-6p
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:40 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnF-0007rB-Qr
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:39 -0500
Received: by mail-wm1-x330.google.com with SMTP id n36so1353068wmr.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=if/qVtarW27gDMcczuPNTXDooSW2u0gTRRM5vrJgeIM=;
 b=UIKX+HkTPmRT2noEhm5MvVWfOHFQ+upaT8l787oY0zXaiZzQHgL4gFnI+tPY+9+Q8C
 OCz1Pi9E2E6DAtFeNYiZXURASlgaQa6vFO36D0ibe5bi/1Mi28cSiaSDfxIL8b5ok5J1
 BuN9CRKHmUVxWdn9TFWIW1ZoqSi7r4Knro37hDleMdvumMoiqtDByKnT0GPaRWTRmnN5
 5EOa82LqdjPwTilyZsdiZab7xj/UQ7ucuin+NjM+NVgyMR4YonpUGPCLB2DFP6jWjecW
 TnXxbejUsPT7wB/XgoztJ+H2KMMV9041BKlL/Rb04eCK9O+ipH9OkJ7hNBhFzCIuRicm
 fX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=if/qVtarW27gDMcczuPNTXDooSW2u0gTRRM5vrJgeIM=;
 b=PFYCxgP8gbWPgOwHBNwm3O9AxqDqtCVcq2gSe9f33OkW9uUGnA1kd5RHXCnf8VmOsc
 ISSbbNuhUj0AgWWjM5UtDq3w5zQchUoQDE+s5e0LfhqsPBQgOrbSt70QB10Z73SE92Rj
 8wTb2tEnbjFcrkkKjVNqJkNf+VpgQbhLzbyxTHFQPswp0AOIT4knW1oWxI3JEF8b9Q1S
 STEGJfof1Cdn++gqvItsMal7BJEXBoZe5FDZHmAcMcP/PEjVpYPG+MdSGCrNdX2KzAP4
 b121TjR2+InO0wcWtqQ8I2IR40SVJkn1RYjFE22c8Jrd5TkqmctZ/ouNEm0AA7WdIgRZ
 +b2g==
X-Gm-Message-State: AO0yUKV5tpjD93RZNB0JTQ6ksLm6clsIqbarWpd6E7jseUGg3fCQPLdZ
 ImvXjrXlAXvfqK4YfKfoYCNxQLhsi/qYZAnG
X-Google-Smtp-Source: AK7set8GYxst5pd0ivbkHSe947OheV4edxWNcHJHSE31Lu1J2OTg0677E4Q63EXZdUDx5BK34DfYGQ==
X-Received: by 2002:a05:600c:13c3:b0:3e2:9b5:c2c3 with SMTP id
 e3-20020a05600c13c300b003e209b5c2c3mr2504387wmg.22.1676567496269; 
 Thu, 16 Feb 2023 09:11:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/30] hw/arm/smmuv3: Add GBPA register
Date: Thu, 16 Feb 2023 17:11:06 +0000
Message-Id: <20230216171123.2518285-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mostafa Saleh <smostafa@google.com>

GBPA register can be used to globally abort all
transactions.

It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
be zero(Do not abort incoming transactions).

Other fields have default values of Use Incoming.

If UPDATE is not set, the write is ignored. This is the only permitted
behavior in SMMUv3.2 and later.(6.3.14.1 Update procedure)

As this patch adds a new state to the SMMU (GBPA), it is added
in a new subsection for forward migration compatibility.
GBPA is only migrated if its value is different from the reset value.
It does this to be backward migration compatible if SW didn't write
the register.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20230214094009.2445653-1-smostafa@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3-internal.h |  7 +++++++
 include/hw/arm/smmuv3.h  |  1 +
 hw/arm/smmuv3.c          | 43 +++++++++++++++++++++++++++++++++++++++-
 3 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index bce161870f6..e8f0ebf25e3 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -79,6 +79,13 @@ REG32(CR0ACK,              0x24)
 REG32(CR1,                 0x28)
 REG32(CR2,                 0x2c)
 REG32(STATUSR,             0x40)
+REG32(GBPA,                0x44)
+    FIELD(GBPA, ABORT,        20, 1)
+    FIELD(GBPA, UPDATE,       31, 1)
+
+/* Use incoming. */
+#define SMMU_GBPA_RESET_VAL 0x1000
+
 REG32(IRQ_CTRL,            0x50)
     FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
     FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index b6dd0875264..a0c026402e1 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -45,6 +45,7 @@ struct SMMUv3State {
     uint32_t cr[3];
     uint32_t cr0ack;
     uint32_t statusr;
+    uint32_t gbpa;
     uint32_t irq_ctrl;
     uint32_t gerror;
     uint32_t gerrorn;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 955b89c8d59..270c80b665f 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -285,6 +285,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->gerror = 0;
     s->gerrorn = 0;
     s->statusr = 0;
+    s->gbpa = SMMU_GBPA_RESET_VAL;
 }
 
 static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
@@ -659,7 +660,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     qemu_mutex_lock(&s->mutex);
 
     if (!smmu_enabled(s)) {
-        status = SMMU_TRANS_DISABLE;
+        if (FIELD_EX32(s->gbpa, GBPA, ABORT)) {
+            status = SMMU_TRANS_ABORT;
+        } else {
+            status = SMMU_TRANS_DISABLE;
+        }
         goto epilogue;
     }
 
@@ -1170,6 +1175,16 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
     case A_GERROR_IRQ_CFG2:
         s->gerror_irq_cfg2 = data;
         return MEMTX_OK;
+    case A_GBPA:
+        /*
+         * If UPDATE is not set, the write is ignored. This is the only
+         * permitted behavior in SMMUv3.2 and later.
+         */
+        if (data & R_GBPA_UPDATE_MASK) {
+            /* Ignore update bit as write is synchronous. */
+            s->gbpa = data & ~R_GBPA_UPDATE_MASK;
+        }
+        return MEMTX_OK;
     case A_STRTAB_BASE: /* 64b */
         s->strtab_base = deposit64(s->strtab_base, 0, 32, data);
         return MEMTX_OK;
@@ -1318,6 +1333,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
     case A_STATUSR:
         *data = s->statusr;
         return MEMTX_OK;
+    case A_GBPA:
+        *data = s->gbpa;
+        return MEMTX_OK;
     case A_IRQ_CTRL:
     case A_IRQ_CTRL_ACK:
         *data = s->irq_ctrl;
@@ -1482,6 +1500,25 @@ static const VMStateDescription vmstate_smmuv3_queue = {
     },
 };
 
+static bool smmuv3_gbpa_needed(void *opaque)
+{
+    SMMUv3State *s = opaque;
+
+    /* Only migrate GBPA if it has different reset value. */
+    return s->gbpa != SMMU_GBPA_RESET_VAL;
+}
+
+static const VMStateDescription vmstate_gbpa = {
+    .name = "smmuv3/gbpa",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = smmuv3_gbpa_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(gbpa, SMMUv3State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_smmuv3 = {
     .name = "smmuv3",
     .version_id = 1,
@@ -1512,6 +1549,10 @@ static const VMStateDescription vmstate_smmuv3 = {
 
         VMSTATE_END_OF_LIST(),
     },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_gbpa,
+        NULL
+    }
 };
 
 static void smmuv3_instance_init(Object *obj)
-- 
2.34.1


