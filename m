Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C26D68AF25
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:50:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOba4-0003dd-Qx; Sun, 05 Feb 2023 04:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3mXrfYwgKCjIgacghOTOUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--smostafa.bounces.google.com>)
 id 1pOba1-0003cA-GO
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:01 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3mXrfYwgKCjIgacghOTOUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--smostafa.bounces.google.com>)
 id 1pObZz-0001A4-Gz
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:01 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 ay19-20020a05600c1e1300b003dc54daba42so4575252wmb.7
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=bTfcpJPkNJefby4UhJXramXyVy4DgU410xkm+mvspkA=;
 b=YNwvyDJX19Zd9Jo+9azjB6s/8HCFhytPQaxTI9PB0DM6f+QBn7eixeC/NORpqOvtm4
 8MDmiFBJSR/nIHigsUv0B2D823OoA8ljODugCRBPuVbj74ZCDxaxDDfuYkJuuXlxcibP
 A1G28OnW44RsndApxyR0VDCt+e8ItzMm0lheQtg8XIrPRZGwW8GlOeQ7Qg3G/MLzeYFJ
 pHtLKbuUVtMN24d+hE1VZ77ZlTslyfRJ7RXfkQU/QSDiq5ZtuvC48ndQY2TvhgdIxKht
 Q/jYShxTJ0Z6pvt+HuMIa+uUytLN2S99iEVP95a2NHuzQttssFJH556vLSED5TQ//BN0
 RKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bTfcpJPkNJefby4UhJXramXyVy4DgU410xkm+mvspkA=;
 b=LBWnoufpxRJAAOxiRNEpeEZwFS10NvSFpwmVVjQz8GYmMxgNgUwh2L2wMmaEEFggE1
 N3R887ln6PtGLqBkF41pn6ymbNZ6JNip8hLnhXldph+MV71PVnkGPoQcDzsc0tLLbiy4
 +grspbsO0d9K8EG5AkWt0KNnwmn/eZFpj0u83SqJ5TQhvwU8+iL4H5kRILohj1LR6PtH
 3neNCP+Y20zZ5MjGEfZyBGTDX96c86mYrTTPHvwZFB6BbVA6La8lzJ/8WP5z6Co3IKDZ
 AkwcBpXi1UGLUiVJZEmbs5WAvEIiNRLmjmMJE80dOYZh/niZJdxb16y/AXbKEjc06bvx
 YTYg==
X-Gm-Message-State: AO0yUKUMHyrbRhZ4NjeUT86OXdrAd7L0mxieTtRQGpVNepCLrRPHQ6Rs
 W4g2hsCpz0NV0Ci3PGOFzdeN7btlgF4LfzUYvvsyfy0kiCiDZB376fr3tVL9Qqk/FQu5LflL4xR
 gdW6yhtU5uwCtb71C3FOTbwlJ3Prt9UM3cxNQj7IbTufZqFIP9EZRUrDkEYVT9PAwwA==
X-Google-Smtp-Source: AK7set+ANlQTny/VuiVmO8DjLmon7JKl9nStF55wKzsiPcpyPE35xGf6rTSU/FuOSjJ+et8D6MNIxGHJudYtIg==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:540b:b0:3dc:5d35:908c with SMTP
 id he11-20020a05600c540b00b003dc5d35908cmr807227wmb.90.1675590297893; Sun, 05
 Feb 2023 01:44:57 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:00 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-6-smostafa@google.com>
Subject: [RFC PATCH 05/16] hw/arm/smmuv3: Add page table walk for stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3mXrfYwgKCjIgacghOTOUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
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

In preparation for adding stage-2 support. Add Stage-2 PTW code.
Only Aarch64 fromat is supported as stage-1.
Max 48 bits IPA is supported.

Nesting stage-1 and stage-2 is not supported right now.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 112 ++++++++++++++++++++++++++++++++---
 hw/arm/smmu-internal.h       |  37 ++++++++++++
 include/hw/arm/smmu-common.h |   1 +
 3 files changed, 143 insertions(+), 7 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 4fcbffa2f1..df0d1dc024 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -362,6 +362,99 @@ error:
     return -EINVAL;
 }
 
+/**
+ * smmu_ptw_64_s2 - VMSAv8-64 Walk of the page tables for a given IOVA
+ * for stage-2.
+ * @cfg: translation config
+ * @iova: iova to translate
+ * @perm: access type
+ * @tlbe: SMMUTLBEntry (out)
+ * @info: handle to an error info
+ *
+ * Return 0 on success, < 0 on error. In case of error, @info is filled
+ * and tlbe->perm is set to IOMMU_NONE.
+ * Upon success, @tlbe is filled with translated_addr and entry
+ * permission rights.
+ */
+
+static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
+                          dma_addr_t iova, IOMMUAccessFlags perm,
+                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+{
+    const int stage = 2;
+    int granule_sz = cfg->s2cfg.granule_sz;
+    /* ARM ARM: Table D8-7. */
+    int inputsize = 64 - cfg->s2cfg.tsz;
+    int level = get_start_level(cfg->s2cfg.sl0, granule_sz);
+    int stride = granule_sz - 3;
+    int idx = pgd_idx(level, granule_sz, iova);
+    /*
+     * Get the ttb from concatenated structure.
+     * The offset is the idx * size of each ttb(number of ptes * (sizeof(pte))
+     */
+    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, 48) + (1 << stride) *
+                        idx * sizeof(uint64_t);
+    dma_addr_t indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
+
+    baseaddr &= ~indexmask;
+
+    while (level < SMMU_MAX_LEVELS) {
+        uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
+        uint64_t mask = subpage_size - 1;
+        uint32_t offset = iova_level_offset(iova, inputsize, level, granule_sz);
+        uint64_t pte, gpa;
+        dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
+        uint8_t ap;
+
+        if (get_pte(baseaddr, offset, &pte, info)) {
+                goto error;
+        }
+        trace_smmu_ptw_level(level, iova, subpage_size,
+                             baseaddr, offset, pte);
+        if (is_invalid_pte(pte) || is_reserved_pte(pte, level)) {
+            trace_smmu_ptw_invalid_pte(stage, level, baseaddr,
+                                       pte_addr, offset, pte);
+            break;
+        }
+
+        if (is_table_pte(pte, level)) {
+            baseaddr = get_table_pte_address(pte, granule_sz);
+            level++;
+            continue;
+        } else if (is_page_pte(pte, level)) {
+            gpa = get_page_pte_address(pte, granule_sz);
+            trace_smmu_ptw_page_pte(stage, level, iova,
+                                    baseaddr, pte_addr, pte, gpa);
+        } else {
+            uint64_t block_size;
+
+            gpa = get_block_pte_address(pte, level, granule_sz,
+                                        &block_size);
+            trace_smmu_ptw_block_pte(stage, level, baseaddr,
+                                     pte_addr, pte, iova, gpa,
+                                     block_size >> 20);
+        }
+        ap = PTE_AP(pte);
+        if (is_permission_fault_s2(ap, perm)) {
+            info->type = SMMU_PTW_ERR_PERMISSION;
+            goto error;
+        }
+
+        tlbe->entry.translated_addr = gpa;
+        tlbe->entry.iova = iova & ~mask;
+        tlbe->entry.addr_mask = mask;
+        tlbe->entry.perm = ap;
+        tlbe->level = level;
+        tlbe->granule = granule_sz;
+        return 0;
+    }
+    info->type = SMMU_PTW_ERR_TRANSLATION;
+
+error:
+    tlbe->entry.perm = IOMMU_NONE;
+    return -EINVAL;
+}
+
 /**
  * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
  *
@@ -376,15 +469,20 @@ error:
 int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
              SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
-    if (!cfg->aa64) {
-        /*
-         * This code path is not entered as we check this while decoding
-         * the configuration data in the derived SMMU model.
-         */
-        g_assert_not_reached();
+    if (cfg->stage == 1) {
+        if (!cfg->aa64) {
+            /*
+             * This code path is not entered as we check this while decoding
+             * the configuration data in the derived SMMU model.
+             */
+            g_assert_not_reached();
+        }
+        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
+    } else if (cfg->stage == 2) {
+        return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
     }
 
-    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
+    g_assert_not_reached();
 }
 
 /**
diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index 2d75b31953..b02c05319f 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -73,6 +73,9 @@
 #define is_permission_fault(ap, perm) \
     (((perm) & IOMMU_WO) && ((ap) & 0x2))
 
+#define is_permission_fault_s2(ap, perm) \
+    (!((ap & perm) == perm))
+
 #define PTE_AP_TO_PERM(ap) \
     (IOMMU_ACCESS_FLAG(true, !((ap) & 0x2)))
 
@@ -96,6 +99,40 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize,
             MAKE_64BIT_MASK(0, gsz - 3);
 }
 
+#define SMMU_MAX_S2_CONCAT    16
+
+/*
+ * Relies on correctness of gran and sl0 from caller.
+ * FEAT_LPA2 and FEAT_TTST are not implemented.
+ */
+static inline int get_start_level(int sl0 , int gran)
+{
+    /* ARM ARM: Table D8-12. */
+    if (gran == 12) {
+        return 2 - sl0;
+    }
+    /* ARM ARM: Table D8-22 and Table D8-31. */
+    return 3 - sl0;
+}
+
+/*
+ * Index in a concatenated first level stage-2 page table.
+ * ARM ARM: D8.2.2 Concatenated translation tables.
+ */
+static inline int pgd_idx(int start_level, int granule, dma_addr_t iova)
+{
+    uint64_t ret;
+    /*
+     * Get the number of bits handled by next levels, then any extra bits in
+     * the address should index the concatenated tables. This relation can
+     * deduced from tables in ARM ARM: D8.2.7-9
+     */
+    int shift = (SMMU_MAX_LEVELS - start_level) * (granule - 3) + granule;
+
+    ret = iova >> shift;
+    return ret;
+}
+
 #define SMMU_IOTLB_ASID(key) ((key).asid)
 
 typedef struct SMMUIOTLBPageInvInfo {
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 45f74d0e93..1e666e8b6d 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -28,6 +28,7 @@
 #define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
 
 #define SMMU_MAX_VA_BITS      48
+#define SMMU_MAX_LEVELS       4
 
 /*
  * Page table walk error types
-- 
2.39.1.519.gcb327c4b5f-goog


