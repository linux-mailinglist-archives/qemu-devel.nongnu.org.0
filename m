Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1C9695F7A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 10:41:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRrng-0001YW-T3; Tue, 14 Feb 2023 04:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ClfrYwgKCos71378pupv33v0t.r315t19-stAt0232v29.36v@flex--smostafa.bounces.google.com>)
 id 1pRrnc-0001Wv-Db
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:40:32 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ClfrYwgKCos71378pupv33v0t.r315t19-stAt0232v29.36v@flex--smostafa.bounces.google.com>)
 id 1pRrnZ-0003Hc-R9
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:40:32 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 q127-20020a25d985000000b009362f0368aeso2829434ybg.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 01:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Neh8flrNSW6kKtEV2rgeV8if+ORYQQ/9RHHh84hh50E=;
 b=mDdc45/eyiEN4QReTJ7j7y2NqKj6Vlefpj9JUqgIHMrC62aq2eH+RL8r4qqSvFyJHX
 RXgcMBETM1HqpxTibLg4BIa4Xllt+tH5hBXUAqn/vEQz2PpRGCpBk7CBlJ5zleW3dhHc
 eWq/TB6hM9zPd1gLSXD+UQuAeM1bnd69Vpjj9OZ4JA/U+KeUfK0OqwlzPBNnh/rY9Rnq
 36WWXM1TiS3x33EFcwWoYVIrdr/e8d73vYq8xXuAZf4xT728mZ+s6csJ9yIbBVv0moZn
 VtarewL/Xm4oJKzADI3ottWDleauVbN/Hsk/oytSRrSlo2nGUBEXt4LVzRc3r7+X9fQt
 xD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Neh8flrNSW6kKtEV2rgeV8if+ORYQQ/9RHHh84hh50E=;
 b=An/iF/cRYR4KU4fL0us6nlLvNDPr8U4Z0nBcRvzHlwDaFZLXJ/vetNBhvOWOGXbpre
 6//POQ0TqcRkxhFUdtBvyt9vfTXRGk+js6P+KXburMQdz2r6U+AyWozjopEfO5Aa1G8R
 sVh+M8YrfRdbmNOHfRHdhQkFVfENX7+6/IZ0AkMLK5X4lYXXeQyWm2DIJG06xzL8LPPc
 Tx6MoyR0+nlgCIWna1b66+zaKhttEQnQdHMdwZ83aF6mEa2Sm6WVE2To+0WW3gwh8OYV
 dBz3KKj6T1go+94H0QmgNkZPEzyxEPta7iJiAt+UEG9yUdII+1ArUAXZ+rHlAr1GMKDB
 /o4A==
X-Gm-Message-State: AO0yUKUQAN3/AhktthnFzcIVcxgoNwj14Q7Yfyg/P8njukiX3rWEAKol
 pZ6r8ZoEkqvZqP/8O6QlA1MYQ/gaX5lVA6H5fmDfjcKdVnjWP7dFDk+2nmov0ZXFZ4CN6pzJiwn
 XsSTNCH+abXt4uu/o+Vr7IdIQPTrUm/YCCZf/RlcXxpup8vrofCX/8QtzAoZMVPNUSw==
X-Google-Smtp-Source: AK7set8LwqpSEn2FEu1UVFYuL3Tq36LPfqA6CYpa6TCylcPmytbjNkXzeAYiXgGJWvhlrqYio7Hvwq23Qk42mA==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a81:5f45:0:b0:52e:c57e:7f28 with SMTP id
 t66-20020a815f45000000b0052ec57e7f28mr117956ywb.333.1676367626572; Tue, 14
 Feb 2023 01:40:26 -0800 (PST)
Date: Tue, 14 Feb 2023 09:40:09 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230214094009.2445653-1-smostafa@google.com>
Subject: [PATCH v5] hw/arm/smmuv3: Add GBPA register
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ClfrYwgKCos71378pupv33v0t.r315t19-stAt0232v29.36v@flex--smostafa.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
---
Changes in v5:
- Simplify needed migration function for GBPA.
- Collected Reviewed-by tags.

Changes in v4:
- Migrate if GBPA is different from reset value, not only ABORT bit.

Changes in v3:
- Remove migrate_gbpa property as it was unnecessary.

Changes in v2:
- GBPA is effective only when SMMU is not enabled.
- Ignore GBPA write when UPDATE is not set.
- Default value for SHCFG is "Use Incoming".
- Support migration.
---
 hw/arm/smmuv3-internal.h |  7 +++++++
 hw/arm/smmuv3.c          | 43 +++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/smmuv3.h  |  1 +
 3 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index bce161870f..e8f0ebf25e 100644
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
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 955b89c8d5..270c80b665 100644
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
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index f1921fdf9e..9899fa1860 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -46,6 +46,7 @@ struct SMMUv3State {
     uint32_t cr[3];
     uint32_t cr0ack;
     uint32_t statusr;
+    uint32_t gbpa;
     uint32_t irq_ctrl;
     uint32_t gerror;
     uint32_t gerrorn;
-- 
2.39.1.581.gbfd45094c4-goog


