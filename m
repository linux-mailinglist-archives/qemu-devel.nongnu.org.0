Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066E68E00B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:31:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPSkZ-0007Ew-Gm; Tue, 07 Feb 2023 13:31:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <36JjiYwgKCsk71378pupv33v0t.r315t19-stAt0232v29.36v@flex--smostafa.bounces.google.com>)
 id 1pPSkJ-0007AM-6V
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:31:11 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <36JjiYwgKCsk71378pupv33v0t.r315t19-stAt0232v29.36v@flex--smostafa.bounces.google.com>)
 id 1pPSkF-00069B-4N
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:31:10 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-50e79ffba49so150649487b3.9
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 10:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4G9XaiL6wCx1dnLD1jFtzKBnip0VoAfb6+PfWU81E8M=;
 b=eVCe8QwY/gKUcsstmndjwTKmxm06GdiYoog2/D/0h7mtF5YoEtYsr9DqW58NTL9S20
 /hj9u9QkPvZJCoNicpX9ZNF7LvcOVWAc8ZSAHtTQCA4q5x+lNRMNpYawzzPTXdn4FZRi
 hZLY+ALCHKRWicPql9s0jPIiDdzCc0TI1tx5ZmRnV7LU0LJRrQl9xx0TcPzp9sAA0m1Z
 d79TdeVMIWu2cDF2t9s4PYca25iT+1UWrHhZpv+PUYGr9xRUvSwycFFgWF0x077AiMET
 ok5SpEkEuJKA8BFi7pdmVDiBjxiZRNjlN6AXzSsnJXzsBbC3uAQaTHUR23nR33s09ZSX
 1uAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4G9XaiL6wCx1dnLD1jFtzKBnip0VoAfb6+PfWU81E8M=;
 b=QYPOpCva8K7ZIBmHrDqWiyCBZl7J4eveOAY2PyrLCA70vkBk71cYIHO9BQ36L28PTw
 Xznt2YTUc7mLGckEYxwyQjEO7W113+G/VrlvML05o7QIIpMBVne2//og/GddhJLdQMXB
 D0feBaxbYJkDKrwVePUq8wZK9EzkSMWlZVifWYqLHBaRgdqmFQHPZjHMyuvmJnyW2IsF
 1JyKpiXshsrS4xOt3M5eH7ArsuLXF5308z3XJoVNRi3SmL0k3Gm/PCNTf2rEEiUEPvJq
 ypfr+VMPWJRBAuYkxNnuo4TAmS7M8iu/IEW5q8fElP7mpmmjCW33PrTigwz7y/n/J2yI
 2LOw==
X-Gm-Message-State: AO0yUKWLxlDaTvk5YnL5/nzXeh6fKLKfPo01k/olT6yAveBaw+Z6mIjk
 61s4c0CzoEVMm7IvlsxJGKfIZy8mmY/8u65zCSnueh/YFIQF7KwBnv7NkATy1kL5Ys+lBRt2nPy
 yMDlmbjEU11NxU2sHvAwDDEHPglF3RfyTY4gJCTjiASZgTfxb0N3m+XNiIC/fpLhLwA==
X-Google-Smtp-Source: AK7set8DgLBOCc6hAQefuo+r7iqOUz16vT9JGpPI3n+w8ARg3rYktbzjaLfzzhdIjJcGgksrFqamSAPslTDlUQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5b:28f:0:b0:888:4819:456a with SMTP id
 x15-20020a5b028f000000b008884819456amr434765ybl.151.1675794664879; Tue, 07
 Feb 2023 10:31:04 -0800 (PST)
Date: Tue,  7 Feb 2023 18:19:34 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230207181933.1999817-1-smostafa@google.com>
Subject: [PATCH v3] hw/arm/smmuv3: Add GBPA register
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=36JjiYwgKCsk71378pupv33v0t.r315t19-stAt0232v29.36v@flex--smostafa.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
GBPA is only migrated when GBPA.ABORT is set from SW at the time of
migration, to avoid inconsistencies where a qemu instance is aborting
transactions and it is migrated to another older instance bypassing
them.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---

Changes in v3:
- Remove migrate_gbpa property as it was unnecessary.

Changes in v2:
- GBPA is effective only when SMMU is not enabled.
- Ignore GBPA write when UPDATE is not set.
- Default value for SHCFG is "Use Incoming".
- Support migration.

 hw/arm/smmuv3-internal.h |  5 ++++
 hw/arm/smmuv3.c          | 52 +++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/smmuv3.h  |  1 +
 3 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index bce161870f..3ff704248d 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -79,6 +79,11 @@ REG32(CR0ACK,              0x24)
 REG32(CR1,                 0x28)
 REG32(CR2,                 0x2c)
 REG32(STATUSR,             0x40)
+REG32(GBPA,                0x44)
+    FIELD(GBPA, SHCFG,        12, 2)
+    FIELD(GBPA, ABORT,        20, 1)
+    FIELD(GBPA, UPDATE,       31, 1)
+
 REG32(IRQ_CTRL,            0x50)
     FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
     FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 955b89c8d5..a184665181 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -285,6 +285,8 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->gerror = 0;
     s->gerrorn = 0;
     s->statusr = 0;
+    /* Use incoming as other fields. */
+    s->gbpa = FIELD_DP32(s->gbpa, GBPA, SHCFG, 1);
 }
 
 static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
@@ -659,7 +661,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
 
@@ -1170,6 +1176,16 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
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
@@ -1318,6 +1334,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
     case A_STATUSR:
         *data = s->statusr;
         return MEMTX_OK;
+    case A_GBPA:
+        *data = s->gbpa;
+        return MEMTX_OK;
     case A_IRQ_CTRL:
     case A_IRQ_CTRL_ACK:
         *data = s->irq_ctrl;
@@ -1482,6 +1501,33 @@ static const VMStateDescription vmstate_smmuv3_queue = {
     },
 };
 
+static bool smmuv3_gbpa_needed(void *opaque)
+{
+    SMMUv3State *s = opaque;
+
+    /*
+     * Only migrate GBPA if ABORT set from SW to 1, which is different from
+     * default behaviour. This allows maximum compatibility with old qemu
+     * instances while being forward compatible.
+     */
+    if (FIELD_EX32(s->gbpa, GBPA, ABORT)) {
+        return true;
+    }
+
+    return false;
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
@@ -1512,6 +1558,10 @@ static const VMStateDescription vmstate_smmuv3 = {
 
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
2.39.1.519.gcb327c4b5f-goog


