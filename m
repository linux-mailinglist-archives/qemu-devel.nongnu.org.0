Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7565E6A3466
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:09:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPAr-0002Sk-PX; Sun, 26 Feb 2023 17:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Dtj7YwgKCtMHBDHIz4z5DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--smostafa.bounces.google.com>)
 id 1pWPAo-0002Qr-SC
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:14 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Dtj7YwgKCtMHBDHIz4z5DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--smostafa.bounces.google.com>)
 id 1pWPAm-0003uv-UH
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:14 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-536bf649e70so101329107b3.0
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 14:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=w8gBXvn0nsgqacWJ24f/nJlkTQIB5LOcWqOtQmpTzys=;
 b=ApflCs8A7SFoSx4FK7hhvBTIoIT/M1+f9EnUc0sF84QEMPkWnB9VF2AzTY47MmWTA5
 tyg63MU67paFA6L5QpnH4ALjnVafS98hOfplo9y7grFUCaxaiRLqa7+UuORlJJ9LnUMk
 716r2SyHyvxQcSWNjEBmbc0cui75cIEIM9KmAnsXpvei639MJdwhS9rjKK1nXJFBItZk
 nv5JVZCp4fXnNUFZLdWcepJ02hxZnoFXdLyib2Jaut5GDgEKyYJyX3KYOspVqDgpQ8n8
 UDsEIHYKNUqnwAnh2rbZF0bWs0cOT2ZKmidh1tUBdkUi/II6mP9kuvy1mzYLEbv+KEwi
 QSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w8gBXvn0nsgqacWJ24f/nJlkTQIB5LOcWqOtQmpTzys=;
 b=k6SmkadkYSuj8WenqTPKqT26tgVdUqzfYaevm+FhjKHG8CbksMyN8k0HWTQcadw874
 4j7/e8fIulGsBfsbfxUYxbQJ0G5vc2GmLDoG6GDUhQ/ujda1FpdfJFlmHvo9Wg6TlZ55
 ZqAzI+5sgReVOCy0u2JSOfiWsr3bXL0ZQ0kQ3oIl5xGqH4xpXKdVYY43+zp9yN12cGVR
 YqOedWHXow1xWdzV0PLrx3oNeJdSGAAm+wU30g2K2pXtI8O1J+B7hsK0yF4LpA6pNW/S
 XAFGTtQ7nVFHdu0wldBTwQ1p281kcJzCWAfWzw4NfVJgD9MJmr4gdfJAF2Je0iiq4Z6M
 Ktww==
X-Gm-Message-State: AO0yUKWsOkPTNobS3p5JzTsjYLnRbwYfZiyeDMAjgtdBGU/QecZoOkf3
 2zxHBL4+98Q42qeKtMEg21sMdVonUFBDdP/Zpv2kDmRUaqYi8YvtQJompHDNqeLvKER/3NGm0N2
 jc6AVWi5K/VlaRHoyAvpgsxlNOtwn2FoaedZNzf4fg20HRRoUdPHaUOZyhLy+HWbW3Q==
X-Google-Smtp-Source: AK7set8JOOsKZV3pra2YX+K4szS/Y0vFbrys4Q5+faksFHp+/NfZsMkayYKdz5Bqcu4B/3t0hG5H5z0zGWsxiA==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:1602:b0:8a3:d147:280b with SMTP
 id bw2-20020a056902160200b008a3d147280bmr5715077ybb.3.1677449230307; Sun, 26
 Feb 2023 14:07:10 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:43 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-5-smostafa@google.com>
Subject: [RFC PATCH v2 04/11] hw/arm/smmuv3: Add page table walk for stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3Dtj7YwgKCtMHBDHIz4z5DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--smostafa.bounces.google.com;
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

In preparation for adding stage-2 support, add Stage-2 PTW code.
Only Aarch64 format is supported as stage-1.

Nesting stage-1 and stage-2 is not supported right now.

HTTU is not supported, SW is expected to maintain the Access flag.
This is described in the SMMUv3 manual "5.2. Stream Table Entry" in
"[181] S2AFFD".
This flag determines the behavior on access of a stage-2 page whose
descriptor has AF == 0:
- 0b0: An Access flag fault occurs (stall not supported).
- 0b1: An Access flag fault never occurs.
An Access fault takes priority over a Permission fault.

Checks for IPA and output PA are done according to the user manual
"3.4 Address sizes".

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v2:
- Squash S2AFF PTW code.
- Use common functions between stage-1 and stage-2.
- Add checks for IPA and out PA.
---
 hw/arm/smmu-common.c   | 132 ++++++++++++++++++++++++++++++++++++++++-
 hw/arm/smmu-internal.h |  39 ++++++++++++
 2 files changed, 170 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index b49c1affdb..3f448bc82e 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -363,6 +363,130 @@ error:
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
+static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
+                          dma_addr_t iova, IOMMUAccessFlags perm,
+                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+{
+    const int stage = 2;
+    int granule_sz = cfg->s2cfg.granule_sz;
+    /* ARM ARM: Table D8-7. */
+    int inputsize = 64 - cfg->s2cfg.tsz;
+    int level = get_start_level(cfg->s2cfg.sl0, granule_sz);
+    int stride = SMMU_STRIDE(granule_sz);
+    int idx = pgd_idx(level, granule_sz, iova);
+    /*
+     * Get the ttb from concatenated structure.
+     * The offset is the idx * size of each ttb(number of ptes * (sizeof(pte))
+     */
+    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, 48) + (1 << stride) *
+                                  idx * sizeof(uint64_t);
+    dma_addr_t indexmask = SMMU_IDXMSK(inputsize, stride, level);
+
+    baseaddr &= ~indexmask;
+
+    /*
+     * If the input address of a transaction exceeds the size of the IAS, a
+     * stage 1 Address Size fault occurs.
+     * For AA64, IAS = OAS
+     */
+    if (iova >= (1ULL << cfg->s2cfg.oas)) {
+        info->type = SMMU_PTW_ERR_ADDR_SIZE;
+        info->stage = 1;
+        goto error_no_stage;
+    }
+
+    while (level < SMMU_LEVELS) {
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
+        trace_smmu_ptw_level(stage, level, iova, subpage_size,
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
+
+        /*
+         * If S2AFFD and PTE.AF are 0 => fault. (5.2. Stream Table Entry)
+         * An Access fault takes priority over a Permission fault.
+         */
+        if (!PTE_AF(pte) && !cfg->s2cfg.affd) {
+            info->type = SMMU_PTW_ERR_ACCESS;
+            goto error;
+        }
+
+        ap = PTE_AP(pte);
+        if (is_permission_fault_s2(ap, perm)) {
+            info->type = SMMU_PTW_ERR_PERMISSION;
+            goto error;
+        }
+
+        /*
+         * The address output from the translation causes a stage 2 Address
+         * Size fault if it exceeds the effective PA output range.
+         */
+        if (gpa >= (1ULL << cfg->s2cfg.oas)) {
+            info->type = SMMU_PTW_ERR_ADDR_SIZE;
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
+    info->stage = 2;
+error_no_stage:
+    tlbe->entry.perm = IOMMU_NONE;
+    return -EINVAL;
+}
+
 /**
  * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
  *
@@ -377,7 +501,13 @@ error:
 int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
              SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
-    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
+    if (cfg->stage == 1) {
+        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
+    } else if (cfg->stage == 2) {
+        return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
+    }
+
+    g_assert_not_reached();
 }
 
 /**
diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index 2d75b31953..f79c389cd3 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -66,6 +66,8 @@
 #define PTE_APTABLE(pte) \
     (extract64(pte, 61, 2))
 
+#define PTE_AF(pte) \
+    (extract64(pte, 10, 1))
 /*
  * TODO: At the moment all transactions are considered as privileged (EL1)
  * as IOMMU translation callback does not pass user/priv attributes.
@@ -73,6 +75,9 @@
 #define is_permission_fault(ap, perm) \
     (((perm) & IOMMU_WO) && ((ap) & 0x2))
 
+#define is_permission_fault_s2(ap, perm) \
+    (!((ap & perm) == perm))
+
 #define PTE_AP_TO_PERM(ap) \
     (IOMMU_ACCESS_FLAG(true, !((ap) & 0x2)))
 
@@ -96,6 +101,40 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize,
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
+    int shift = (SMMU_LEVELS - start_level) * (granule - 3) + granule;
+
+    ret = iova >> shift;
+    return ret;
+}
+
 #define SMMU_IOTLB_ASID(key) ((key).asid)
 
 typedef struct SMMUIOTLBPageInvInfo {
-- 
2.39.2.637.g21b0678d19-goog


