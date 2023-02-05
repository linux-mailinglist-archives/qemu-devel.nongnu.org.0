Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D9968AF1D
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:48:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObbB-0005R9-IC; Sun, 05 Feb 2023 04:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3zHrfYwgKCmUVPRVWDIDJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--smostafa.bounces.google.com>)
 id 1pObar-0004vc-FI
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:59 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3zHrfYwgKCmUVPRVWDIDJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--smostafa.bounces.google.com>)
 id 1pObap-0001Zn-QL
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:53 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5269bcf4247so48386327b3.17
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xe6zuyg8OPbp0DHjuj+CgsNjbU0AuOrw/DyH6HSiOxw=;
 b=ToMXzEYK/4Qnu5eDfPBPr7UFIj4fRVD/Yvdn04kbgjm/u9oM+EmeHlkVUDRZU2zuRV
 0OzU4mPVT4ka2jUKku0Pl9avdO3ax1Cqq7fgDa9C0I2a7EprrcIejTdesNpVU/PouaT1
 dSxOno2EpmMOutQvn4YXUceEtogPnE6puxLBWXEzH7w8opop56mEII8KSfV/Y2YRG9Go
 yC+YS7UkB7Zf6Jhk1QHNhXNlVJTIl7X17Kn9GERC9UtC4tQSHy1tEuCDxmE0S7cOToMy
 j2QD4LkJ2jO4wtPZc4LBgcvSd0QTc/wqLHnlq9VwRWkLeKj9cQL5O9dvfGfEbwbCaIQP
 WJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xe6zuyg8OPbp0DHjuj+CgsNjbU0AuOrw/DyH6HSiOxw=;
 b=CcNFieOUgaYIF7QLGFjg6rpyccC8grAKPkihaM0r+VVV2QZmYCvnmMSmA98O8/Zx66
 VoOUK0XZLqumOM0W//9nZy0JLHWDk3IYG7omfSiiTeSx3joqKopMxLKlPjIHGAFJ8jsC
 oT5kEjoysQ0tvXCxj4P/pPJaymUgfrps1qAiBuZGfVJxFYk4VKWkj5QgD4VtnUkS78Px
 ZtR+4BXnhb6xpbxZwnROWKvwgWEmFMWKVOEV3f1hOHVsCiU52k1tPNZkPUYqgmiIiZtN
 9lB9ueFAcv7Ld2Jkb3uBw4r61YsgBCXdV7vUa8yeX9vHMtBWh3fsBU3veKdOK0uBsFZS
 Joag==
X-Gm-Message-State: AO0yUKUgNNDud0Sa+ymydwluivIlIHwxlE2vcIc2JVBnCOhm7wvjHI8l
 P/Q5k+eFZSKh8NsXCdRB4/7e4JGGlPZnzWRjKpq2hJtfovxw234niP5T3rjhKzYf6iKsAWcqePb
 50ysAMALx5X/cvHLTOsJ5yim7iaVhoT0izhJTc2z25gzcilWGfKIxoobpcTMfKfJumQ==
X-Google-Smtp-Source: AK7set/rA+//+eKDi3rTbfQAtdNZkAAwIEMPSs57LN+hjuV3g533RMruyUOdtP1rdIpdOYYhWYI3Y4jMyjM8ow==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a25:3413:0:b0:855:fd7e:b84c with SMTP id
 b19-20020a253413000000b00855fd7eb84cmr20yba.8.1675590348386; Sun, 05 Feb 2023
 01:45:48 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:08 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-14-smostafa@google.com>
Subject: [RFC PATCH 13/16] hw/arm/smmuv3: Add CMDs related to stage 2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3zHrfYwgKCmUVPRVWDIDJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--smostafa.bounces.google.com;
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

CMD_TLBI_S2_IPA: As S1+S2 is not enabled, for now this can be the
same as CMD_TLBI_NH_VAA.

CMD_TLBI_S12_VMALL: Added new function to invalidate TLB by VMID.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 16 ++++++++++++++++
 hw/arm/smmuv3.c              | 25 +++++++++++++++++++++++--
 hw/arm/trace-events          |  2 ++
 include/hw/arm/smmu-common.h |  1 +
 4 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 028a60949a..28089d94a6 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -133,6 +133,16 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
 
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
@@ -185,6 +195,12 @@ void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
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
index 8b070f6bb5..2b563a5b1b 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1174,14 +1174,35 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_TLBI_NH_VA:
             smmuv3_s1_range_inval(bs, &cmd);
             break;
+        case SMMU_CMD_TLBI_S12_VMALL:
+            uint16_t vmid = CMD_VMID(&cmd);
+
+            if (!STAGE2_SUPPORTED(s->features)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+
+            trace_smmuv3_cmdq_tlbi_s12_vmid(vmid);
+            smmu_inv_notifiers_all(&s->smmu_state);
+            smmu_iotlb_inv_vmid(bs, vmid);
+            break;
+        case SMMU_CMD_TLBI_S2_IPA:
+            if (!STAGE2_SUPPORTED(s->features)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+            /*
+             * As currently only either s1 or s2 are supported
+             * we can reuse same function for s2.
+             */
+            smmuv3_s1_range_inval(bs, &cmd);
+            break;
         case SMMU_CMD_TLBI_EL3_ALL:
         case SMMU_CMD_TLBI_EL3_VA:
         case SMMU_CMD_TLBI_EL2_ALL:
         case SMMU_CMD_TLBI_EL2_ASID:
         case SMMU_CMD_TLBI_EL2_VA:
         case SMMU_CMD_TLBI_EL2_VAA:
-        case SMMU_CMD_TLBI_S12_VMALL:
-        case SMMU_CMD_TLBI_S2_IPA:
         case SMMU_CMD_ATC_INV:
         case SMMU_CMD_PRI_RESP:
         case SMMU_CMD_RESUME:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 2dee296c8f..61e2ffade5 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -12,6 +12,7 @@ smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, ui
 smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
 smmu_iotlb_inv_all(void) "IOTLB invalidate all"
 smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
+smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
 smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
 smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
 smmu_iotlb_lookup_hit(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
@@ -48,6 +49,7 @@ smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t
 smmuv3_s1_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
 smmuv3_cmdq_tlbi_nh(void) ""
 smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
+smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 5cca1c17f5..46ba1f6329 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -181,6 +181,7 @@ SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
                                 uint8_t tg, uint8_t level);
 void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
+void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
 
-- 
2.39.1.519.gcb327c4b5f-goog


