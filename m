Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32436A345C
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:07:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPAs-0002Sp-3Y; Sun, 26 Feb 2023 17:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ENj7YwgKCtUJDFJK1617FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--smostafa.bounces.google.com>)
 id 1pWPAq-0002Rq-J3
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:16 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ENj7YwgKCtUJDFJK1617FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--smostafa.bounces.google.com>)
 id 1pWPAo-0003vO-Ib
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:16 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-536bf649e70so101330177b3.0
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 14:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=vgcJwiR1WaLfuqlyYYnqY8cLFGvSA2dGsL7q/gzpNRk=;
 b=q+z1Ubkb6iwuq7N9GJ4abyDrWmOEX0TmdQFn8U1/WZ6r9VF1yMMfn5X0QO85EvdNVu
 BrfgMsoopcKDwM+KqQPmBMW2rRtIr6NSYkcORS0V0KF1pp9RNkk07nXtlmjg0pKaYH//
 3dghIW406zwOUaQ/wrdwmdfKhmIE16wR5L2DwV1+FT9WdK2ctYZUQvbyuEKXMDaRrOIw
 HXH6LnvNy4H0RP6pZRds3t727gM0MvqGVzAIxggNEJaeXFxtoAJ7exiVMka4My3PpGQr
 5jcTJc0F/LGh5Wy2yrsJTVKf/rwAd3nCoYulCinQHrkBTwKC7kO3atRMAO7YjMI7HL7L
 7v0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vgcJwiR1WaLfuqlyYYnqY8cLFGvSA2dGsL7q/gzpNRk=;
 b=ovaW1szwcbC4tF9D3kUZCtoBKAQGhXQ22yGyqsq2H5lbF5o7OwMoRK2zSsRV0BuVWh
 QlF//gWSBlJVRv/0XD3NcAovSU7dxpfpyIGVPDB8udrD9dOVeQ8AuJYMGVqFClvnm6XP
 /WkvZJ1DWq2RLfLqy5BPH95gIFZEQ2Kh7rLUgT2+nNOA4kQ2kbchpBcvcH5ZLGfbdzAl
 wM7Rl18eyG4ZCRDVeM9IfnZHbDVmZh1D3IgrRX60n30YmqVMlKFj3hFNxQZepPWyonA0
 pgPSFrocfAT6KrqIKdCU74Gaz++Gt2r37uqGIBflzIKPSHdCWRo3jw0+flvsJ54kd+sR
 0vzA==
X-Gm-Message-State: AO0yUKXOARLdaqNdjmiXVmXePUPh0yDW9XYWf3tHoaK5eQV5Q5/2Aliq
 PA5YodxfmVp82PyDTS0w9783Gzf+DKKAFmGk6f839LQTGE268XEMLaD9GOkmkpG1XwGVTy1ItvG
 0uS8l51tbyN5WIhSyPvgEqC90hMsmEI0Gw07dCpeknMe5mPN6seNtN82Dc4wkIUMlhA==
X-Google-Smtp-Source: AK7set8Yl+zN19h8B33+/F/LRjUmnCkzLdaDBSGpcZH4508mF/QGJybD1bmfsXm43VvF3QtrNyYrlTphla87yQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:1003:b0:9f5:af6b:6f69 with SMTP
 id w3-20020a056902100300b009f5af6b6f69mr5709597ybt.5.1677449232676; Sun, 26
 Feb 2023 14:07:12 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:44 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-6-smostafa@google.com>
Subject: [RFC PATCH v2 05/11] hw/arm/smmuv3: Parse STE config for stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3ENj7YwgKCtUJDFJK1617FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--smostafa.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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
Validity of these value are checked when possible.

Only AA64 tables are supported and STT is not supported.

According to SMMUv3 user manual "5.2 Stream Table Entry": All fields
with an S2 prefix (with the exception of S2VMID) are IGNORED when
stage-2 bypasses translation (Config[1] == 0).

Which means that VMID can be used(for TLB tagging) even if stage-2 is
bypassed, so we parse it unconditionally when S2P exists. Otherwise
it is set to -1.(only S1P)

As stall is not supported, if S2S is set the translation would abort.
For S2R, we reuse the same code used for stage-1 with flag
record_faults. However when nested translation is supported we would
need to separate stage-1 and stage-2 faults.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in V2:
- Parse S2PS and S2ENDI
- Squash with S2VMID parsing patch
- Squash with S2AFF parsing
- Squash with fault reporting patch
- Add check for S2T0SZ
- Renaming and refactoring code
---
 hw/arm/smmuv3-internal.h |   4 ++
 hw/arm/smmuv3.c          | 138 +++++++++++++++++++++++++++++++++++++++
 include/hw/arm/smmuv3.h  |   3 +
 3 files changed, 145 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 183d5ac8dc..3388e1a5f8 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -526,9 +526,13 @@ typedef struct CD {
 #define STE_S2TG(x)        extract32((x)->word[5], 14, 2)
 #define STE_S2PS(x)        extract32((x)->word[5], 16, 3)
 #define STE_S2AA64(x)      extract32((x)->word[5], 19, 1)
+#define STE_S2ENDI(x)      extract32((x)->word[5], 20, 1)
+#define STE_S2AFFD(x)      extract32((x)->word[5], 21, 1)
 #define STE_S2HD(x)        extract32((x)->word[5], 24, 1)
 #define STE_S2HA(x)        extract32((x)->word[5], 25, 1)
 #define STE_S2S(x)         extract32((x)->word[5], 26, 1)
+#define STE_S2R(x)         extract32((x)->word[5], 27, 1)
+
 #define STE_CTXPTR(x)                                           \
     ({                                                          \
         unsigned long addr;                                     \
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 4e90343996..dc74a5442d 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -329,6 +329,46 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
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
+static bool t0sz_valid(SMMUTransCfg *cfg)
+{
+    if (cfg->s2cfg.tsz > 39) {
+        return false;
+    }
+
+    if (cfg->s2cfg.granule_sz == 16) {
+        return (cfg->s2cfg.tsz >= 64 - cfg->s2cfg.oas);
+    }
+
+    return (cfg->s2cfg.tsz >= MAX(64 - cfg->s2cfg.oas, 16));
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
+    int nr_concat = pgd_idx(level, gran, max_ipa) + 1;
+
+    return nr_concat <= SMMU_MAX_S2_CONCAT;
+}
+
 /* Returns < 0 in case of invalid STE, 0 otherwise */
 static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       STE *ste, SMMUEventInfo *event)
@@ -354,7 +394,105 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
         return 0;
     }
 
+    /*
+     * If a stage is enabled in SW while not advertised, throw bad ste
+     * according to SMMU manual 5.2 Stream Table Entry - [3:1] Config.
+     */
+    if (!STAGE1_SUPPORTED(s) && STE_CFG_S1_ENABLED(config)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S1 used but not supported.\n");
+        goto bad_ste;
+    }
+    if (!STAGE2_SUPPORTED(s) && STE_CFG_S2_ENABLED(config)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S2 used but not supported.\n");
+        goto bad_ste;
+    }
+
+    if (STAGE2_SUPPORTED(s)) {
+        /* VMID is considered even if s2 is disabled. */
+        cfg->s2cfg.vmid = STE_S2VMID(ste);
+    } else {
+        /* Default to -1 */
+        cfg->s2cfg.vmid = -1;
+    }
+
     if (STE_CFG_S2_ENABLED(config)) {
+        cfg->stage = 2;
+
+        if (STE_S2AA64(ste) == 0x0) {
+            qemu_log_mask(LOG_UNIMP,
+                          "SMMUv3 AArch32 tables not supported\n");
+            g_assert_not_reached();
+        }
+
+        switch (STE_S2TG(ste)) {
+        case 0x0: /* 4KB */
+            cfg->s2cfg.granule_sz = 12;
+            break;
+        case 0x1: /* 64KB */
+            cfg->s2cfg.granule_sz = 16;
+            break;
+        case 0x2: /* 16KB */
+            cfg->s2cfg.granule_sz = 14;
+            break;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "SMMUv3 bad STE S2TG: %x\n", STE_S2TG(ste));
+            goto bad_ste;
+        }
+
+        cfg->s2cfg.vttb = STE_S2TTB(ste);
+
+        cfg->s2cfg.sl0 = STE_S2SL0(ste);
+        /* FEAT_TTST not supported. */
+        if (cfg->s2cfg.sl0 == 0x3) {
+            qemu_log_mask(LOG_UNIMP, "SMMUv3 S2SL0 = 0x3 has no meaning!\n");
+            goto bad_ste;
+        }
+
+
+        cfg->s2cfg.oas = oas2bits(MIN(STE_S2PS(ste), SMMU_IDR5_OAS));
+        /*
+         * It is ILLEGAL for the address in S2TTB to be outside the range
+         * described by the effective S2PS value.
+         */
+        if (cfg->s2cfg.vttb & ~(MAKE_64BIT_MASK(0, cfg->s2cfg.oas))) {
+            goto bad_ste;
+        }
+
+        cfg->s2cfg.tsz = STE_S2T0SZ(ste);
+
+        if (!t0sz_valid(cfg)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 bad STE S2T0SZ = %d\n",
+                          cfg->s2cfg.tsz);
+            goto bad_ste;
+        }
+
+        if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
+                                     cfg->s2cfg.granule_sz)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "SMMUv3 STE stage 2 config not valid!\n");
+            goto bad_ste;
+        }
+
+        /* Only LE supported(IDR0.TTENDIAN). */
+        if (STE_S2ENDI(ste)) {
+            goto bad_ste;
+        }
+
+        cfg->s2cfg.affd = STE_S2AFFD(ste);
+        /*
+         * We reuse the same code used for stage-1 with flag record_faults.
+         * However when nested translation is supported we would
+         * need to separate stage-1 and stage-2 faults.
+         */
+        cfg->record_faults = STE_S2R(ste);
+        /* As stall is not supported. */
+        if (STE_S2S(ste)) {
+            qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
+            goto bad_ste;
+        }
+
+        /* This is still here as stage 2 has not been fully enabled yet. */
         qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
         goto bad_ste;
     }
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
2.39.2.637.g21b0678d19-goog


