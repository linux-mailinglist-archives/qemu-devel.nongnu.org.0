Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6DC6A3463
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:08:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPAw-0002VR-Fu; Sun, 26 Feb 2023 17:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Fdj7YwgKCtoOIKOP6B6CKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--smostafa.bounces.google.com>)
 id 1pWPAv-0002UA-0F
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:21 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Fdj7YwgKCtoOIKOP6B6CKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--smostafa.bounces.google.com>)
 id 1pWPAt-0003w8-63
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:20 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-536c039f859so101213997b3.21
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 14:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+h14IS3oIPIkYWXpfXi/FA89QzYqsvMO3akwpCPj/O0=;
 b=eA6StUV1jU1IqZJc5NEf7YlW7kOmIkiZgdhepX0pu/HIQtskxEGd0Pf2xz7Poa3QTO
 feXDF0jpzms2KQP9CD5kKA4K8ZgjA75vL5Kbs6l6jl8bSrpB7tjct5ekFLylYIdX63VZ
 9ZKqllbyRKHEtkwL4I8Ca+SI5GykPDDI56GVRmaAYPTfqhII9rT14RVJ7FI8GnUHLCqn
 x5KtT0eM+rxbYU9aygSa0R5jYwTj4opf9+Zfob9WPXJUEYH7vXe0q+l5UfwM9Wi9ybIo
 ddK+XQsMcWlRsBi64aTy3hBrSEdRRJilIyzuo6YwLJhlRGMp/TzopAFB1w1YtLJINlKL
 rMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+h14IS3oIPIkYWXpfXi/FA89QzYqsvMO3akwpCPj/O0=;
 b=QPWB85J9zE9dtZ85YZHg989R4biAB3WkTaPHSl2rxGYvjS6ZmcP1TOgp4fVZ7HAuom
 9I7qVMlYiTJb+GVpqur/qUlxzzU66Zo39pM9/m+H4m50XL9VPaAQcOAn86Ey/PE/7z5C
 VVyZGH3cEThkTnVu+1Iymo/cpWwLqXKn06hm0lsl3kE9iPhmXgmxGMw8gN4/0mkrcCtp
 cRU8q1Ywajh9Rsqywl9LeeKPhU47SCE809h3+PKT0EeRmtkStf+1bV/jfspUDqDUlMbI
 Y85DpMoQLsYTblbHDdLe8nAQsYB+96e7WriEhPrheH93DLKmvSc7h0atWcF9jf5uNSpk
 A9jw==
X-Gm-Message-State: AO0yUKXWMH8u9WJ8xwkGUlk0hhx4TUzMIs6EJIPtLwejmCL1RbNOYI2E
 9Htk+csmZSPlKiUriFFq46mvskFynwxMu3oszABPjKLaBKOwzG2ynh2UaFxZaIOIUD+oZ6balYI
 XlKkbaiK+vOEmZYSndSAiimX2j5QgDYoRPi/758pE5wukDHhTu+5zop5JwCXIjFfGQA==
X-Google-Smtp-Source: AK7set9D9O1OvflFoVz88G4/VuTzcj4TjnGPtilMj2Q/CvSBHewXeAZ/hfKWY9Uql5kAhkUcTHb7LAn1wppvTQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5b:ac9:0:b0:80b:dedb:ec94 with SMTP id
 a9-20020a5b0ac9000000b0080bdedbec94mr428034ybr.528.1677449237106; Sun, 26 Feb
 2023 14:07:17 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:46 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-8-smostafa@google.com>
Subject: [RFC PATCH v2 07/11] hw/arm/smmuv3: Add VMID to tlb tagging
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3Fdj7YwgKCtoOIKOP6B6CKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--smostafa.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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

Allow TLB to be tagged with VMID.

If stage-1 is only supported, VMID is set to -1 and ignored from STE
and CMD_TLBI_NH* cmds.

Update smmu_iotlb_insert trace event to have vmid.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v2:
-Fix TLB aliasing issue from missing check in smmu_iotlb_key_equal.
-Add vmid to traces smmu_iotlb_insert and smmu_iotlb_lookup_hit/miss.
-Add vmid to hash function.
---
 hw/arm/smmu-common.c         | 36 ++++++++++++++++++++++--------------
 hw/arm/smmu-internal.h       |  2 ++
 hw/arm/smmuv3.c              | 12 +++++++++---
 hw/arm/trace-events          |  6 +++---
 include/hw/arm/smmu-common.h |  5 +++--
 5 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 3f448bc82e..3191a008c6 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -38,7 +38,7 @@ static guint smmu_iotlb_key_hash(gconstpointer v)
 
     /* Jenkins hash */
     a = b = c = JHASH_INITVAL + sizeof(*key);
-    a += key->asid + key->level + key->tg;
+    a += key->asid + key->vmid + key->level + key->tg;
     b += extract64(key->iova, 0, 32);
     c += extract64(key->iova, 32, 32);
 
@@ -53,13 +53,15 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
     SMMUIOTLBKey *k1 = (SMMUIOTLBKey *)v1, *k2 = (SMMUIOTLBKey *)v2;
 
     return (k1->asid == k2->asid) && (k1->iova == k2->iova) &&
-           (k1->level == k2->level) && (k1->tg == k2->tg);
+           (k1->level == k2->level) && (k1->tg == k2->tg) &&
+           (k1->vmid == k2->vmid);
 }
 
-SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
+SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
                                 uint8_t tg, uint8_t level)
 {
-    SMMUIOTLBKey key = {.asid = asid, .iova = iova, .tg = tg, .level = level};
+    SMMUIOTLBKey key = {.asid = asid, .vmid = vmid, .iova = iova,
+                        .tg = tg, .level = level};
 
     return key;
 }
@@ -78,7 +80,8 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
         uint64_t mask = subpage_size - 1;
         SMMUIOTLBKey key;
 
-        key = smmu_get_iotlb_key(cfg->asid, iova & ~mask, tg, level);
+        key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid,
+                                 iova & ~mask, tg, level);
         entry = g_hash_table_lookup(bs->iotlb, &key);
         if (entry) {
             break;
@@ -88,13 +91,13 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
 
     if (entry) {
         cfg->iotlb_hits++;
-        trace_smmu_iotlb_lookup_hit(cfg->asid, iova,
+        trace_smmu_iotlb_lookup_hit(cfg->asid, cfg->s2cfg.vmid, iova,
                                     cfg->iotlb_hits, cfg->iotlb_misses,
                                     100 * cfg->iotlb_hits /
                                     (cfg->iotlb_hits + cfg->iotlb_misses));
     } else {
         cfg->iotlb_misses++;
-        trace_smmu_iotlb_lookup_miss(cfg->asid, iova,
+        trace_smmu_iotlb_lookup_miss(cfg->asid, cfg->s2cfg.vmid, iova,
                                      cfg->iotlb_hits, cfg->iotlb_misses,
                                      100 * cfg->iotlb_hits /
                                      (cfg->iotlb_hits + cfg->iotlb_misses));
@@ -111,8 +114,10 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
         smmu_iotlb_inv_all(bs);
     }
 
-    *key = smmu_get_iotlb_key(cfg->asid, new->entry.iova, tg, new->level);
-    trace_smmu_iotlb_insert(cfg->asid, new->entry.iova, tg, new->level);
+    *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
+                              tg, new->level);
+    trace_smmu_iotlb_insert(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
+                            tg, new->level);
     g_hash_table_insert(bs->iotlb, key, new);
 }
 
@@ -130,8 +135,7 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
 
     return SMMU_IOTLB_ASID(*iotlb_key) == asid;
 }
-
-static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
+static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
                                               gpointer user_data)
 {
     SMMUTLBEntry *iter = (SMMUTLBEntry *)value;
@@ -142,18 +146,21 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
     if (info->asid >= 0 && info->asid != SMMU_IOTLB_ASID(iotlb_key)) {
         return false;
     }
+    if (info->vmid >= 0 && info->vmid != SMMU_IOTLB_VMID(iotlb_key)) {
+        return false;
+    }
     return ((info->iova & ~entry->addr_mask) == entry->iova) ||
            ((entry->iova & ~info->mask) == info->iova);
 }
 
-void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
+void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl)
 {
     /* if tg is not set we use 4KB range invalidation */
     uint8_t granule = tg ? tg * 2 + 10 : 12;
 
     if (ttl && (num_pages == 1) && (asid >= 0)) {
-        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova, tg, ttl);
+        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, iova, tg, ttl);
 
         if (g_hash_table_remove(s->iotlb, &key)) {
             return;
@@ -166,10 +173,11 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
 
     SMMUIOTLBPageInvInfo info = {
         .asid = asid, .iova = iova,
+        .vmid = vmid,
         .mask = (num_pages * 1 << granule) - 1};
 
     g_hash_table_foreach_remove(s->iotlb,
-                                smmu_hash_remove_by_asid_iova,
+                                smmu_hash_remove_by_asid_vmid_iova,
                                 &info);
 }
 
diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index f79c389cd3..4beba76302 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -136,9 +136,11 @@ static inline int pgd_idx(int start_level, int granule, dma_addr_t iova)
 }
 
 #define SMMU_IOTLB_ASID(key) ((key).asid)
+#define SMMU_IOTLB_VMID(key) ((key).vmid)
 
 typedef struct SMMUIOTLBPageInvInfo {
     int asid;
+    int vmid;
     uint64_t iova;
     uint64_t mask;
 } SMMUIOTLBPageInvInfo;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index ce193e9598..f9c06723f9 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1038,7 +1038,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
 {
     dma_addr_t end, addr = CMD_ADDR(cmd);
     uint8_t type = CMD_TYPE(cmd);
-    uint16_t vmid = CMD_VMID(cmd);
+    int vmid = -1;
     uint8_t scale = CMD_SCALE(cmd);
     uint8_t num = CMD_NUM(cmd);
     uint8_t ttl = CMD_TTL(cmd);
@@ -1047,6 +1047,12 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     uint64_t num_pages;
     uint8_t granule;
     int asid = -1;
+    SMMUv3State *smmuv3 = ARM_SMMUV3(s);
+
+    /* Only consider VMID if stage-2 is supported. */
+    if (STAGE2_SUPPORTED(smmuv3)) {
+        vmid = CMD_VMID(cmd);
+    }
 
     if (type == SMMU_CMD_TLBI_NH_VA) {
         asid = CMD_ASID(cmd);
@@ -1055,7 +1061,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     if (!tg) {
         trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
-        smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
+        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         return;
     }
 
@@ -1073,7 +1079,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
         num_pages = (mask + 1) >> granule;
         trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
-        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
+        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
         addr += mask + 1;
     }
 }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 205ac04573..705104e58b 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -14,9 +14,9 @@ smmu_iotlb_inv_all(void) "IOTLB invalidate all"
 smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
 smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
 smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
-smmu_iotlb_lookup_hit(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
-smmu_iotlb_lookup_miss(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
-smmu_iotlb_insert(uint16_t asid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d addr=0x%"PRIx64" tg=%d level=%d"
+smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
+smmu_iotlb_lookup_miss(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
+smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d"
 
 # smmuv3.c
 smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 1ada792122..c415e8d853 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -118,6 +118,7 @@ typedef struct SMMUPciBus {
 typedef struct SMMUIOTLBKey {
     uint64_t iova;
     uint16_t asid;
+    uint16_t vmid;
     uint8_t tg;
     uint8_t level;
 } SMMUIOTLBKey;
@@ -181,11 +182,11 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
 SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
                                 SMMUTransTableInfo *tt, hwaddr iova);
 void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
-SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
+SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
                                 uint8_t tg, uint8_t level);
 void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
-void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
+void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
 
 /* Unmap the range of all the notifiers registered to any IOMMU mr */
-- 
2.39.2.637.g21b0678d19-goog


