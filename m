Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A6468AF21
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:48:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObbD-0005nT-0J; Sun, 05 Feb 2023 04:46:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vnrfYwgKClcHBDHIz4z5DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--smostafa.bounces.google.com>)
 id 1pObae-0004dx-CJ
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:41 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vnrfYwgKClcHBDHIz4z5DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--smostafa.bounces.google.com>)
 id 1pObac-0001Xg-3r
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:39 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5290f6169fbso824017b3.10
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tl2xKWBs5EU0VjJyqjseyqrz+BJA1mBDaPfRU5IKsDo=;
 b=bcqSeFBZfY5002mkHYAmdkwSPWIDVcUz1ENzsUn8iJ4p2yYHNgDEzgHypEORcJ3oMZ
 YgKxTeWh7zH9SWTejVZMw7LrF8gEC9qNypoIAl/vLnJgp+CCN/A6JMt+uP28cIhOEoI5
 zx7qK16Sl9U2ERquQnNkQ6ZA/AEsg+5d3W4Xbm/ibQynkv5tE4w7oTxM8X2s5oiNsTdx
 +UQ67di/uHznpjMx+DnxkOcI2ViFlU+cPW/ttl3G0MpE+IbgYON9hwJpDyQZahpnIDGs
 SSkbnj3oXZWA3KWakJAjM8sURCtr9EhymYPuWh7Fr6hUY/vaOlQbo2bwPgH1v0yIxzcV
 8m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tl2xKWBs5EU0VjJyqjseyqrz+BJA1mBDaPfRU5IKsDo=;
 b=WdsjJC8MANBhGwVptl2LINFekT14SgdBjEmPJDYVET9eJlHppm+Cn4qzrbICbcbHd3
 fXxiMO0WmlZtsaO0kLaS7ntnShMIeIStW5R8YI4aYSYnmqrKYH5s3/x7k1+mIBGsYiYI
 lb4+L0n3aTlcOGP+HHVU1L6l7BwsPe/O/OXExQuGuKcP4nqtRZcv1dhPkeaV3JosCRGZ
 Oqh72JUQmHQuSVRRyXz0IkICSt7KFW9mvnv4Ev1hifauDZXIVt3WSY6GV7p2R0PQG0T7
 HlLaxbgyIrnu+ihE2FM18VNlhG02YDasZ0J5fD4OaDg56jIF96BuPmsHqV/2F6Bb19yP
 WRKw==
X-Gm-Message-State: AO0yUKWuuoTQfoxb72gZL2+Mh+pf4iBTuW/4qLJJodYk/so4FIsUcTr0
 qWmZUwsLzw2127SZR73m6fgJh4CelqORKSeNy+wIgwLG7snN2w3Ee2SB8kDPQjvY3jBaGdq7yJc
 AOQg9G+FlHlTJjQuw3nE/wtZd1s/P5NZOSXv2+mXUGeG2A3mZajRk985MR9YcxCvZ0g==
X-Google-Smtp-Source: AK7set8dK7PKxVgKxqFC0bOQ0iV7onZrXoktSyszVcVjDXXWV9LUawyk8S0XiPRWFqbYq679WpTw9CujaVcvFA==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a0d:cb44:0:b0:527:95bf:db25 with SMTP id
 n65-20020a0dcb44000000b0052795bfdb25mr528109ywd.273.1675590334540; Sun, 05
 Feb 2023 01:45:34 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:07 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-13-smostafa@google.com>
Subject: [RFC PATCH 12/16] hw/arm/smmuv3: Add VMID to tlb tagging
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3vnrfYwgKClcHBDHIz4z5DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--smostafa.bounces.google.com;
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

Allow TLB to be tagged with VMID.

If stage-1 is only supported, VMID is set to -1 and ignored from STE
and CMD_TLBI_NH* cmds.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 24 +++++++++++++++---------
 hw/arm/smmu-internal.h       |  2 ++
 hw/arm/smmuv3.c              | 12 +++++++++---
 include/hw/arm/smmu-common.h |  5 +++--
 4 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 541c427684..028a60949a 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -56,10 +56,11 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
            (k1->level == k2->level) && (k1->tg == k2->tg);
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
@@ -78,7 +79,8 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
         uint64_t mask = subpage_size - 1;
         SMMUIOTLBKey key;
 
-        key = smmu_get_iotlb_key(cfg->asid, iova & ~mask, tg, level);
+        key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid,
+                                 iova & ~mask, tg, level);
         entry = g_hash_table_lookup(bs->iotlb, &key);
         if (entry) {
             break;
@@ -111,7 +113,8 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
         smmu_iotlb_inv_all(bs);
     }
 
-    *key = smmu_get_iotlb_key(cfg->asid, new->entry.iova, tg, new->level);
+    *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
+                              tg, new->level);
     trace_smmu_iotlb_insert(cfg->asid, new->entry.iova, tg, new->level);
     g_hash_table_insert(bs->iotlb, key, new);
 }
@@ -130,8 +133,7 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
 
     return SMMU_IOTLB_ASID(*iotlb_key) == asid;
 }
-
-static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
+static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
                                               gpointer user_data)
 {
     SMMUTLBEntry *iter = (SMMUTLBEntry *)value;
@@ -142,18 +144,21 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
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
@@ -166,10 +171,11 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
 
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
index 7d3f76ce14..3a14e5dca5 100644
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
index 35a0149bbf..8b070f6bb5 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -986,7 +986,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
 {
     dma_addr_t end, addr = CMD_ADDR(cmd);
     uint8_t type = CMD_TYPE(cmd);
-    uint16_t vmid = CMD_VMID(cmd);
+    int vmid = -1;
     uint8_t scale = CMD_SCALE(cmd);
     uint8_t num = CMD_NUM(cmd);
     uint8_t ttl = CMD_TTL(cmd);
@@ -995,6 +995,12 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     uint64_t num_pages;
     uint8_t granule;
     int asid = -1;
+    SMMUv3State *smmuv3 = ARM_SMMUV3(s);
+
+    /* Only consider VMID if stage-2 is supported. */
+    if (STAGE2_SUPPORTED(smmuv3->features)) {
+        vmid = CMD_VMID(cmd);
+    }
 
     if (type == SMMU_CMD_TLBI_NH_VA) {
         asid = CMD_ASID(cmd);
@@ -1003,7 +1009,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     if (!tg) {
         trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
-        smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
+        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         return;
     }
 
@@ -1021,7 +1027,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
         num_pages = (mask + 1) >> granule;
         trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
-        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
+        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
         addr += mask + 1;
     }
 }
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 7906e359d9..5cca1c17f5 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -113,6 +113,7 @@ typedef struct SMMUPciBus {
 typedef struct SMMUIOTLBKey {
     uint64_t iova;
     uint16_t asid;
+    uint16_t vmid;
     uint8_t tg;
     uint8_t level;
 } SMMUIOTLBKey;
@@ -176,11 +177,11 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
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
2.39.1.519.gcb327c4b5f-goog


