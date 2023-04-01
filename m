Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC566D2FBB
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 12:51:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piYoU-0000ob-D1; Sat, 01 Apr 2023 06:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3YAwoZAgKCkEvprvwdidjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--smostafa.bounces.google.com>)
 id 1piYoH-0000mf-D3
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:15 -0400
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3YAwoZAgKCkEvprvwdidjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--smostafa.bounces.google.com>)
 id 1piYoD-0002vq-FW
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:11 -0400
Received: by mail-wm1-x349.google.com with SMTP id
 o37-20020a05600c512500b003edd119ec9eso12273332wms.0
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346208;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5NsnOiiNKiq9RPwglbGJv4hA7dP9/qO396dgXTO7px8=;
 b=Z5uaEJgdfFD+q0rjpzpKUhrFwSXH+TlgOt6/+Xjp9JGOFRqtuvNzUQm4TXyKz74LLe
 t0YiJP/EnoP0vs01FRyuwJZpnJOfUBve2K+ayvJrCmBQ7TUHbS2IyJOvQB7zM4bi5gN1
 uF6llH5skcwVQPxJVsODEGO5nKjcBDMMMaHT7KIlh0GIuVSP9NmQ2qGDfPlP5qvBfnf7
 pb8kqEPJOEzVHlOqvfCPVDORplgun3hegr7vvj1LeK2yqlMbEIrUMJSsdUtOzsSB22qR
 zHiIUZRfO7KwcSA4RXpABaK2xnVgmqjZ8WBCD4sTFXtkrEoo1m8KVDR4dcn8lnDgJGGS
 9cMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346208;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5NsnOiiNKiq9RPwglbGJv4hA7dP9/qO396dgXTO7px8=;
 b=LIQj/u40DPwcKYjITrjwDM1RYNFKdlH0dHtvIqdatWqlBDJR6Pjxoat4IPuAtnaEFy
 icz0r2+eAx6r2RuncipBnxUbcgePFCddF/sjwsXz/AIinWFssUDILoSpAEJueudilK/n
 ARnJHPKe/eRNDHxag5hH2vsePOthzbQEO79gSNa9I5WRffwZtLibFrHBHBfW1x5ST5xI
 OOSYogrIuCvL4B9YNNTr15/91vz8ECjwhM7h9DH6nV1tiMZY+sMctLOagkfEd7w8vTb3
 mEQIPRMJrYxoR8pOqSFdZV4WKTBE3jKypdy8RZ+/BVpZphaC1lopMLT0r3BnNKZXwELq
 gEiQ==
X-Gm-Message-State: AO0yUKWW2jW6UIKxkkk+ZS2isTVdIJi9MWtLOafMKfr6eejKe+Xbcnl5
 Cr6it/8fRPuVI0X82M3ijkWu75LWPO/+9jWkW/5TVeIF4DUWKgxaIHY6n5b+iZAMFGSH7aIuN4d
 qXIkBkCQAQ15iVa5krjqpFWBpmQ3NwiSCvYjC43+1MycruCNUQOxBJnptIlr3ohQp8Q==
X-Google-Smtp-Source: AK7set/mbBiZQs+6P1BMpF4zFa70QMYT+YpXRiUHLm7eI9yDZ6MnnW2aDfXo7zJ2zvA03jU7czL3hptEy5WYlg==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a1c:790b:0:b0:3ed:a25d:8ae1 with SMTP id
 l11-20020a1c790b000000b003eda25d8ae1mr6854042wme.3.1680346208259; Sat, 01 Apr
 2023 03:50:08 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:48 +0000
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-6-smostafa@google.com>
Subject: [RFC PATCH v3 05/10] hw/arm/smmuv3: Parse STE config for stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3YAwoZAgKCkEvprvwdidjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
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

Parse stage-2 configuration from STE and populate it in SMMUS2Cfg.
Validity of field values are checked when possible.

Only AA64 tables are supported and Small Translation Tables (STT) are
not supported.

According to SMMUv3 UM(IHI0070E) "5.2 Stream Table Entry": All fields
with an S2 prefix (with the exception of S2VMID) are IGNORED when
stage-2 bypasses translation (Config[1] == 0).

Which means that VMID can be used(for TLB tagging) even if stage-2 is
bypassed, so we parse it unconditionally when S2P exists. Otherwise
it is set to -1.(only S1P)

As stall is not supported, if S2S is set the translation would abort.
For S2R, we reuse the same code used for stage-1 with flag
record_faults. However when nested translation is supported we would
need to separate stage-1 and stage-2 faults.

Fix wrong shift in STE_S2HD, STE_S2HA, STE_S2S.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in V3:
- Separate fault handling.
- Fix shift in STE_S2HD, STE_S2HA, STE_S2S, STE_S2R.
- Rename t0sz_valid to s2t0sz_valid.
- separate stage-2 STE parsing in decode_ste_s2_cfg.
- Add a log for invalid S2ENDI and S2TTB.
- Set default value for stage-1 OAS.
- Move and rename SMMU_MAX_S2_CONCAT to VMSA_MAX_S2_CONCAT.
Changes in V2:
- Parse S2PS and S2ENDI
- Squash with S2VMID parsing patch
- Squash with S2AFF parsing
- Squash with fault reporting patch
- Add check for S2T0SZ
- Renaming and refactoring code
---
 hw/arm/smmuv3-internal.h     |  10 +-
 hw/arm/smmuv3.c              | 188 +++++++++++++++++++++++++++++++++--
 include/hw/arm/smmu-common.h |   1 +
 include/hw/arm/smmuv3.h      |   3 +
 4 files changed, 192 insertions(+), 10 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 183d5ac8dc..6d1c1edab7 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -526,9 +526,13 @@ typedef struct CD {
 #define STE_S2TG(x)        extract32((x)->word[5], 14, 2)
 #define STE_S2PS(x)        extract32((x)->word[5], 16, 3)
 #define STE_S2AA64(x)      extract32((x)->word[5], 19, 1)
-#define STE_S2HD(x)        extract32((x)->word[5], 24, 1)
-#define STE_S2HA(x)        extract32((x)->word[5], 25, 1)
-#define STE_S2S(x)         extract32((x)->word[5], 26, 1)
+#define STE_S2ENDI(x)      extract32((x)->word[5], 20, 1)
+#define STE_S2AFFD(x)      extract32((x)->word[5], 21, 1)
+#define STE_S2HD(x)        extract32((x)->word[5], 23, 1)
+#define STE_S2HA(x)        extract32((x)->word[5], 24, 1)
+#define STE_S2S(x)         extract32((x)->word[5], 25, 1)
+#define STE_S2R(x)         extract32((x)->word[5], 26, 1)
+
 #define STE_CTXPTR(x)                                           \
     ({                                                          \
         unsigned long addr;                                     \
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 4e90343996..0f5429aed8 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -33,6 +33,16 @@
 #include "smmuv3-internal.h"
 #include "smmu-internal.h"
 
+/* If stage-1 fault enabled and ptw event targets it. */
+#define PTW_FAULT_S1(cfg, event)            ((cfg)->record_faults && \
+                                             !(event).u.f_walk_eabt.s2)
+/* If stage-2 fault enabled and ptw event targets it. */
+#define PTW_FAULT_S2(cfg, event)            ((cfg)->s2cfg.record_faults && \
+                                             (event).u.f_walk_eabt.s2)
+
+#define PTW_FAULT_ALLOWED(cfg, event)       (PTW_FAULT_S1(cfg, event) || \
+                                             PTW_FAULT_S2(cfg, event))
+
 /**
  * smmuv3_trigger_irq - pulse @irq if enabled and update
  * GERROR register in case of GERROR interrupt
@@ -329,11 +339,141 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
     return 0;
 }
 
+/*
+ * Max valid value is 39 when SMMU_IDR3.STT == 0.
+ * In architectures after SMMUv3.0:
+ * - If STE.S2TG selects a 4KB or 16KB granule, the minimum valid value for this
+ * field is MAX(16, 64-IAS)
+ * - If STE.S2TG selects a 64KB granule, the minimum valid value for this field
+ * is (64-IAS).
+ * As we only support AA64, IAS = OAS.
+ */
+static bool s2t0sz_valid(SMMUTransCfg *cfg)
+{
+    if (cfg->s2cfg.tsz > 39) {
+        return false;
+    }
+
+    if (cfg->s2cfg.granule_sz == 16) {
+        return (cfg->s2cfg.tsz >= 64 - oas2bits(SMMU_IDR5_OAS));
+    }
+
+    return (cfg->s2cfg.tsz >= MAX(64 - oas2bits(SMMU_IDR5_OAS), 16));
+}
+
+/*
+ * Return true if s2 page table config is valid.
+ * This checks with the configured start level, ias_bits and granularity we can
+ * have a valid page table as described in ARM ARM D8.2 Translation process.
+ * The idea here is to see for the highest possible number of IPA bits, how
+ * many concatenated tables we would need, if it is more than 16, then this is
+ * not possible.
+ */
+static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
+{
+    int level = get_start_level(sl0, gran);
+    uint64_t ipa_bits = 64 - t0sz;
+    uint64_t max_ipa = (1ULL << ipa_bits) - 1;
+    int nr_concat = pgd_concat_idx(level, gran, max_ipa) + 1;
+
+    return nr_concat <= VMSA_MAX_S2_CONCAT;
+}
+
+static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
+{
+    cfg->stage = 2;
+
+    if (STE_S2AA64(ste) == 0x0) {
+        qemu_log_mask(LOG_UNIMP,
+                      "SMMUv3 AArch32 tables not supported\n");
+        g_assert_not_reached();
+    }
+
+    switch (STE_S2TG(ste)) {
+    case 0x0: /* 4KB */
+        cfg->s2cfg.granule_sz = 12;
+        break;
+    case 0x1: /* 64KB */
+        cfg->s2cfg.granule_sz = 16;
+        break;
+    case 0x2: /* 16KB */
+        cfg->s2cfg.granule_sz = 14;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SMMUv3 bad STE S2TG: %x\n", STE_S2TG(ste));
+        goto bad_ste;
+    }
+
+    cfg->s2cfg.vttb = STE_S2TTB(ste);
+
+    cfg->s2cfg.sl0 = STE_S2SL0(ste);
+    /* FEAT_TTST not supported. */
+    if (cfg->s2cfg.sl0 == 0x3) {
+        qemu_log_mask(LOG_UNIMP, "SMMUv3 S2SL0 = 0x3 has no meaning!\n");
+        goto bad_ste;
+    }
+
+    /* For AA64, The effective S2PS size is capped to the OAS. */
+    cfg->s2cfg.eff_ps = oas2bits(MIN(STE_S2PS(ste), SMMU_IDR5_OAS));
+    /*
+     * It is ILLEGAL for the address in S2TTB to be outside the range
+     * described by the effective S2PS value.
+     */
+    if (cfg->s2cfg.vttb & ~(MAKE_64BIT_MASK(0, cfg->s2cfg.eff_ps))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SMMUv3 S2TTB too large 0x%lx, effective PS %d bits\n",
+                      cfg->s2cfg.vttb,  cfg->s2cfg.eff_ps);
+        goto bad_ste;
+    }
+
+    cfg->s2cfg.tsz = STE_S2T0SZ(ste);
+
+    if (!s2t0sz_valid(cfg)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 bad STE S2T0SZ = %d\n",
+                      cfg->s2cfg.tsz);
+        goto bad_ste;
+    }
+
+    if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
+                                    cfg->s2cfg.granule_sz)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SMMUv3 STE stage 2 config not valid!\n");
+        goto bad_ste;
+    }
+
+    /* Only LE supported(IDR0.TTENDIAN). */
+    if (STE_S2ENDI(ste)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SMMUv3 STE_S2ENDI only supports LE!\n");
+        goto bad_ste;
+    }
+
+    cfg->s2cfg.affd = STE_S2AFFD(ste);
+
+    cfg->s2cfg.record_faults = STE_S2R(ste);
+    /* As stall is not supported. */
+    if (STE_S2S(ste)) {
+        qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
+        goto bad_ste;
+    }
+
+    /* This is still here as stage 2 has not been fully enabled yet. */
+    qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
+    goto bad_ste;
+
+    return 0;
+
+bad_ste:
+    return -EINVAL;
+}
+
 /* Returns < 0 in case of invalid STE, 0 otherwise */
 static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       STE *ste, SMMUEventInfo *event)
 {
     uint32_t config;
+    int ret;
 
     if (!STE_VALID(ste)) {
         if (!event->inval_ste_allowed) {
@@ -354,11 +494,39 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
         return 0;
     }
 
-    if (STE_CFG_S2_ENABLED(config)) {
-        qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
+    /*
+     * If a stage is enabled in SW while not advertised, throw bad ste
+     * according to user manual(IHI0070E) "5.2 Stream Table Entry".
+     */
+    if (!STAGE1_SUPPORTED(s) && STE_CFG_S1_ENABLED(config)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S1 used but not supported.\n");
+        goto bad_ste;
+    }
+    if (!STAGE2_SUPPORTED(s) && STE_CFG_S2_ENABLED(config)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S2 used but not supported.\n");
         goto bad_ste;
     }
 
+    if (STAGE2_SUPPORTED(s)) {
+        /* VMID is considered even if s2 is disabled. */
+        cfg->s2cfg.vmid = STE_S2VMID(ste);
+    } else {
+        /* Default to -1 */
+        cfg->s2cfg.vmid = -1;
+    }
+
+    if (STE_CFG_S2_ENABLED(config)) {
+        /*
+         * Stage-1 OAS defaults to OAS even if not enabled as it would be used
+         * in input address check for stage-2.
+         */
+        cfg->oas = oas2bits(SMMU_IDR5_OAS);
+        ret = decode_ste_s2_cfg(cfg, ste);
+        if (ret) {
+            goto bad_ste;
+        }
+    }
+
     if (STE_S1CDMAX(ste) != 0) {
         qemu_log_mask(LOG_UNIMP,
                       "SMMUv3 does not support multiple context descriptors yet\n");
@@ -702,7 +870,13 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     if (cached_entry) {
         if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
             status = SMMU_TRANS_ERROR;
-            if (cfg->record_faults) {
+            /*
+             * We know that the TLB only contains either stage-1 or stage-2 as
+             * nesting is not supported. So it is sufficient to check the
+             * translation stage to know the TLB stage for now.
+             */
+            event.u.f_walk_eabt.s2 = (cfg->stage == 2);
+            if (PTW_FAULT_ALLOWED(cfg, event)) {
                 event.type = SMMU_EVT_F_PERMISSION;
                 event.u.f_permission.addr = addr;
                 event.u.f_permission.rnw = flag & 0x1;
@@ -728,28 +902,28 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
             event.u.f_walk_eabt.addr2 = ptw_info.addr;
             break;
         case SMMU_PTW_ERR_TRANSLATION:
-            if (cfg->record_faults) {
+            if (PTW_FAULT_ALLOWED(cfg, event)) {
                 event.type = SMMU_EVT_F_TRANSLATION;
                 event.u.f_translation.addr = addr;
                 event.u.f_translation.rnw = flag & 0x1;
             }
             break;
         case SMMU_PTW_ERR_ADDR_SIZE:
-            if (cfg->record_faults) {
+            if (PTW_FAULT_ALLOWED(cfg, event)) {
                 event.type = SMMU_EVT_F_ADDR_SIZE;
                 event.u.f_addr_size.addr = addr;
                 event.u.f_addr_size.rnw = flag & 0x1;
             }
             break;
         case SMMU_PTW_ERR_ACCESS:
-            if (cfg->record_faults) {
+            if (PTW_FAULT_ALLOWED(cfg, event)) {
                 event.type = SMMU_EVT_F_ACCESS;
                 event.u.f_access.addr = addr;
                 event.u.f_access.rnw = flag & 0x1;
             }
             break;
         case SMMU_PTW_ERR_PERMISSION:
-            if (cfg->record_faults) {
+            if (PTW_FAULT_ALLOWED(cfg, event)) {
                 event.type = SMMU_EVT_F_PERMISSION;
                 event.u.f_permission.addr = addr;
                 event.u.f_permission.rnw = flag & 0x1;
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 97cea8ea06..4f1405d4e4 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -29,6 +29,7 @@
 
 /* VMSAv8-64 Translation constants and functions */
 #define VMSA_LEVELS                         4
+#define VMSA_MAX_S2_CONCAT                  16
 
 #define VMSA_STRIDE(gran)                   ((gran) - VMSA_LEVELS + 1)
 #define VMSA_BIT_LVL(isz, strd, lvl)        ((isz) - (strd) * \
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index a0c026402e..6031d7d325 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -83,4 +83,7 @@ struct SMMUv3Class {
 #define TYPE_ARM_SMMUV3   "arm-smmuv3"
 OBJECT_DECLARE_TYPE(SMMUv3State, SMMUv3Class, ARM_SMMUV3)
 
+#define STAGE1_SUPPORTED(s)      FIELD_EX32(s->idr[0], IDR0, S1P)
+#define STAGE2_SUPPORTED(s)      FIELD_EX32(s->idr[0], IDR0, S2P)
+
 #endif
-- 
2.40.0.348.gf938b09366-goog


