Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B64E6D2FBF
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 12:52:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piYoX-0000qe-CU; Sat, 01 Apr 2023 06:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZAwoZAgKCkUztvz0hmhnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--smostafa.bounces.google.com>)
 id 1piYoM-0000nr-V0
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:19 -0400
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZAwoZAgKCkUztvz0hmhnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--smostafa.bounces.google.com>)
 id 1piYoJ-0003Do-PC
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:17 -0400
Received: by mail-wm1-x349.google.com with SMTP id
 bg33-20020a05600c3ca100b003ef6d684105so9048029wmb.1
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 03:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346213;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=zVDAZMhAgBT9TXpgUYUZSHvHWpJ2ghy01UMwDbx0Zp8=;
 b=qACRRSc+bTXy6DCbCGhfyhu9g/Jtppikoscy7CKXf3zI52+yC+DllsguKZ2OkAyaXj
 zBEEFMz8Rl7GKMte0N6KmpjmGi2HCYrHtsMJHUCAFvGUnSLxoWXF3Kb4A2rKztgzjRUz
 FpjuJ6GKhqWNBNAMYgisejkfYNhkKF4ipvXZQ40y3DA4jtxQ5sS/wzdQpx4PhaGLCY+l
 4OZXsg2a0brem9ThOQ9yrc853h6zA/oSlExh094yWJIWPdn9+DANLc8qCLRHHQWxnyiL
 /U7Q5vKpuwKCFkgw4Fvlt1PDIf7w+6OfI0fFFSQG0hpDuFJFVJfowKUq3aqRDfLQKxGo
 JG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346213;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zVDAZMhAgBT9TXpgUYUZSHvHWpJ2ghy01UMwDbx0Zp8=;
 b=zv5ClPYLwfgEzrvpqAB5FhpCnWV56kvZjWTCcYwm3wX8x5p65D5PHDbds/cWwIyhrv
 JQhWqlQ/4++sOaUcysNCixkgovTujcTgKNxeneg19AWC7dWsZZztWK+u+Ci+g5IxZbKb
 GA6r2JsIlen4739uHRLAcSmamZam1L6kvkz13L1Mh7scCuB7ts0yRMnAsnA3PSb4lySh
 omMbPsCBHDu8eVgUKmwXxg6OMY7h149TBONGPoTKaENL4qteCdsJ+Zvm6NZfoNHQk5Uj
 T17dGNwrIe0AzncRTXONFCAob7+bD1XxlhZikrp2G6Ul3ZX8WmRgrOgwltTBgVftRiTS
 SRsA==
X-Gm-Message-State: AAQBX9enXuSw5SS3G5YWTAa41ES4UbTbIZzdpTeIC6RR9fPHEjm/sZMS
 vFjbLjmWCpjoMz3BXyW/Z+3ohHuI+P/nVdxUd0ZaukPmufaNAF//eDICtOflaCynUDWBIXPm4RQ
 +RC2zWyRAURJqPBkOg+JToKelqWt6DuLM8BFOcIYOptMbyQsexJw5U6bTDuQ96jyxOQ==
X-Google-Smtp-Source: AKy350Z5rl+d85sjL2FTUJm3T+bLoAsNOru5WksK0pyVcmM6CVUKy0ax7WYNhwiYcR7Ky2iC8t9mtq2wJwqS1w==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:69d1:0:b0:2e4:cc35:dbb5 with SMTP id
 s17-20020a5d69d1000000b002e4cc35dbb5mr1915191wrw.0.1680346212776; Sat, 01 Apr
 2023 03:50:12 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:50 +0000
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-8-smostafa@google.com>
Subject: [RFC PATCH v3 07/10] hw/arm/smmuv3: Add VMID to TLB tagging
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3ZAwoZAgKCkUztvz0hmhnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--smostafa.bounces.google.com;
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

Allow TLB to be tagged with VMID.

If stage-1 is only supported, VMID is set to -1 and ignored from STE
and CMD_TLBI_NH* cmds.

Update smmu_iotlb_insert trace event to have vmid.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
Changes in v3:
- Collected Reviewed-by tag.
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
index a4ebd004c5..72ed6edd48 100644
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
index a9454f914e..843bebb185 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -132,9 +132,11 @@ static inline int pgd_concat_idx(int start_level, int granule_sz,
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
index a1f4a4f902..d7e7003da9 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1073,7 +1073,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
 {
     dma_addr_t end, addr = CMD_ADDR(cmd);
     uint8_t type = CMD_TYPE(cmd);
-    uint16_t vmid = CMD_VMID(cmd);
+    int vmid = -1;
     uint8_t scale = CMD_SCALE(cmd);
     uint8_t num = CMD_NUM(cmd);
     uint8_t ttl = CMD_TTL(cmd);
@@ -1082,6 +1082,12 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
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
@@ -1090,7 +1096,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     if (!tg) {
         trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
-        smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
+        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         return;
     }
 
@@ -1108,7 +1114,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
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
index 4f1405d4e4..3cbb4998ad 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -125,6 +125,7 @@ typedef struct SMMUPciBus {
 typedef struct SMMUIOTLBKey {
     uint64_t iova;
     uint16_t asid;
+    uint16_t vmid;
     uint8_t tg;
     uint8_t level;
 } SMMUIOTLBKey;
@@ -188,11 +189,11 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
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
2.40.0.348.gf938b09366-goog


