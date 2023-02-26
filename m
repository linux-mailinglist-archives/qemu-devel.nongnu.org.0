Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B696A3465
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:09:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPB0-0002Wk-3n; Sun, 26 Feb 2023 17:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3F9j7YwgKCtwQKMQR8D8EMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--smostafa.bounces.google.com>)
 id 1pWPAx-0002Vv-ES
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:23 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3F9j7YwgKCtwQKMQR8D8EMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--smostafa.bounces.google.com>)
 id 1pWPAv-0003wP-I9
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:23 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso1772649wmi.7
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 14:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KbNmuFGJ5Kdw3e1umgze+jOGkBO3q4RpCfJyV0Au9q8=;
 b=HovXJDDVcAPJ8wunhROH2tYz9QiTCjSO+cJDVfjvjcEnSNq8gX2zD/p3zfG6m6THHW
 na+b45s1rngx2L3bfpw+tuc47doUbk2eeYxyXLpT0Zqz8dIrhNFCkP4ecXORkoKERV0A
 kdfESpOXPXu1AkMq9KMwpHM/XQT8tKn5K7ANO1qiBgqV5JskZBmJYqgryydLc7ugHDWS
 14OuSVYjKM9gCMw+O0K/oKsq+tqmTzFTdpbLKzhOFKwxp+nJinmKWEN5TEepFT9v9qIm
 ptK6UEM2DcFmd+k1Gj1LPEJ2ah2PnP42OD/PLeu900pMcyQBpdtGkDc6NSw857f4YhvS
 tAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KbNmuFGJ5Kdw3e1umgze+jOGkBO3q4RpCfJyV0Au9q8=;
 b=jIrU64vv2JX2U7NHGdNT7LMIlJ3m0qyZFPtmTIFcTXIhIFUTp3C+eYUgx1Bg+PeKVL
 qytqPBwrWQVcgWeSSEdYi3QUoqWnbTZ+xg/Y4HKWsUoCfjmP1rbBWUJVw+/NyqNjOsv6
 apmu/TVNU12M24t2QJcJ69UDC8ZQJ39fJUss+duS4Ri8S0hOzK8Ds/aqlYj9NTTSvkeB
 q9SpeTQfkskxTOyGuKiCiOExQXG3ffyZzzpBXrgbYL64sinU4NvMgGDXu9h27nRThclP
 oq6KQhFoypnwO2CHogWGcJcyd4+bwtJAn7Dcg80zykI1SbR9FMFHE1mHy9zSHJQNYHsT
 A4VQ==
X-Gm-Message-State: AO0yUKUejjrfKJQDinvr/2PJMPzPX9gSbNqNCpUsSqiLP1eroThIMLG7
 29HLo+CBjS5O09QL3r2RNd+7zmyC9ogq3B4UFdES6Z2pAACo61Ntnci2M/qWVClBnKayHu9uI57
 Kql2pGUle8dckU0VrHxiXmz7W5CswPwlkyhpstnOjtNfABtEsDdEumzUD12aVZ/fhGQ==
X-Google-Smtp-Source: AK7set+Ljynlsis1ZQ7rOWoCcfH4XpCT2KP0KgIi0HBg0I3YsYCSJubrSnvGxUuOZ9FT3m05nkAQUIzcbM9umA==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:3b25:b0:3df:97b0:ba02 with SMTP
 id m37-20020a05600c3b2500b003df97b0ba02mr3190242wms.3.1677449239536; Sun, 26
 Feb 2023 14:07:19 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:47 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-9-smostafa@google.com>
Subject: [RFC PATCH v2 08/11] hw/arm/smmuv3: Add CMDs related to stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3F9j7YwgKCtwQKMQR8D8EMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
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

CMD_TLBI_S2_IPA: As S1+S2 is not enabled, for now this can be the
same as CMD_TLBI_NH_VAA.

CMD_TLBI_S12_VMALL: Added new function to invalidate TLB by VMID.

For stage-1 only commands, add a check to to throw CERROR_ILL if used
when stage-1 is not supported.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v2:
- Add checks for stage-1 only commands
- Rename smmuv3_s1_range_inval to smmuv3_range_inval
---
 hw/arm/smmu-common.c         | 16 ++++++++++++
 hw/arm/smmuv3.c              | 47 +++++++++++++++++++++++++++++++-----
 hw/arm/trace-events          |  4 ++-
 include/hw/arm/smmu-common.h |  1 +
 4 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 3191a008c6..e4b477af10 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -135,6 +135,16 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
 
     return SMMU_IOTLB_ASID(*iotlb_key) == asid;
 }
+
+static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
+                                         gpointer user_data)
+{
+    uint16_t vmid = *(uint16_t *)user_data;
+    SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
+
+    return SMMU_IOTLB_VMID(*iotlb_key) == vmid;
+}
+
 static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
                                               gpointer user_data)
 {
@@ -187,6 +197,12 @@ void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
     g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
 }
 
+inline void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
+{
+    trace_smmu_iotlb_inv_vmid(vmid);
+    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
+}
+
 /* VMSAv8-64 Translation */
 
 /**
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index f9c06723f9..8c76a48c8d 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1034,7 +1034,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
     }
 }
 
-static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
+static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
 {
     dma_addr_t end, addr = CMD_ADDR(cmd);
     uint8_t type = CMD_TYPE(cmd);
@@ -1059,7 +1059,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     }
 
     if (!tg) {
-        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
+        trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         return;
@@ -1077,7 +1077,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
         uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
 
         num_pages = (mask + 1) >> granule;
-        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
+        trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
         addr += mask + 1;
@@ -1211,12 +1211,22 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         {
             uint16_t asid = CMD_ASID(&cmd);
 
+            if (!STAGE1_SUPPORTED(s)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+
             trace_smmuv3_cmdq_tlbi_nh_asid(asid);
             smmu_inv_notifiers_all(&s->smmu_state);
             smmu_iotlb_inv_asid(bs, asid);
             break;
         }
         case SMMU_CMD_TLBI_NH_ALL:
+            if (!STAGE1_SUPPORTED(s)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+            QEMU_FALLTHROUGH;
         case SMMU_CMD_TLBI_NSNH_ALL:
             trace_smmuv3_cmdq_tlbi_nh();
             smmu_inv_notifiers_all(&s->smmu_state);
@@ -1224,7 +1234,34 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             break;
         case SMMU_CMD_TLBI_NH_VAA:
         case SMMU_CMD_TLBI_NH_VA:
-            smmuv3_s1_range_inval(bs, &cmd);
+            if (!STAGE1_SUPPORTED(s)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+            smmuv3_range_inval(bs, &cmd);
+            break;
+        case SMMU_CMD_TLBI_S12_VMALL:
+            uint16_t vmid = CMD_VMID(&cmd);
+
+            if (!STAGE2_SUPPORTED(s)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+
+            trace_smmuv3_cmdq_tlbi_s12_vmid(vmid);
+            smmu_inv_notifiers_all(&s->smmu_state);
+            smmu_iotlb_inv_vmid(bs, vmid);
+            break;
+        case SMMU_CMD_TLBI_S2_IPA:
+            if (!STAGE2_SUPPORTED(s)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+            /*
+             * As currently only either s1 or s2 are supported
+             * we can reuse same function for s2.
+             */
+            smmuv3_range_inval(bs, &cmd);
             break;
         case SMMU_CMD_TLBI_EL3_ALL:
         case SMMU_CMD_TLBI_EL3_VA:
@@ -1232,8 +1269,6 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_TLBI_EL2_ASID:
         case SMMU_CMD_TLBI_EL2_VA:
         case SMMU_CMD_TLBI_EL2_VAA:
-        case SMMU_CMD_TLBI_S12_VMALL:
-        case SMMU_CMD_TLBI_S2_IPA:
         case SMMU_CMD_ATC_INV:
         case SMMU_CMD_PRI_RESP:
         case SMMU_CMD_RESUME:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 705104e58b..f8fdf1ca9f 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -12,6 +12,7 @@ smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, ui
 smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
 smmu_iotlb_inv_all(void) "IOTLB invalidate all"
 smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
+smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
 smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
 smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
 smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
@@ -45,9 +46,10 @@ smmuv3_cmdq_cfgi_ste_range(int start, int end) "start=0x%x - end=0x%x"
 smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
 smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
 smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
-smmuv3_s1_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
+smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
 smmuv3_cmdq_tlbi_nh(void) ""
 smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
+smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index c415e8d853..d8b458379e 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -186,6 +186,7 @@ SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
                                 uint8_t tg, uint8_t level);
 void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
+void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
 
-- 
2.39.2.637.g21b0678d19-goog


