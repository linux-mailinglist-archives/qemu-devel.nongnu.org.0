Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B526D2FBA
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 12:51:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piYoY-0000rK-8G; Sat, 01 Apr 2023 06:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3aQwoZAgKCko4y045mrms00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--smostafa.bounces.google.com>)
 id 1piYoP-0000oc-UN
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:24 -0400
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3aQwoZAgKCko4y045mrms00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--smostafa.bounces.google.com>)
 id 1piYoM-0002xv-Vh
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:20 -0400
Received: by mail-wm1-x34a.google.com with SMTP id
 bi7-20020a05600c3d8700b003edecc610abso13331205wmb.7
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 03:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346217;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=D8bYzLyNXIeInkuK1zlvxR+8oj7W06AeUzqoSCZlDNM=;
 b=pjqn1jD2g1av5fQumTKmd3FNI4TWCd/t6fT9v8qSV6iup4ZUXf+vGk7eF+58mZ4hY4
 u89/iSe5UD7wRHO870HKxkkExoPP3kPKsYuRG3m10iGUO2TzKeto6Us+gB424KGVn4V4
 towYmEopv9nvXB4xEyNBIcPwLKev/Lod+hrx6pIaqfs3booZHwhifRUOpSqj/eAtMLgG
 crdSlnBzsFWopyGcAA4Hb61nTKccHgja2tnkOC1Q1mqjpy8mIXuQ2tIhcaZglUmQp2fs
 uN//8KiA2e8TRTx/021AmzPnujgCsvYDAOEXulmkJ7VsbZIPOzQpuf4K74jV9oRNMp6u
 frUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346217;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D8bYzLyNXIeInkuK1zlvxR+8oj7W06AeUzqoSCZlDNM=;
 b=AVBey4Ls7n+68ZnSyGCNF2hNVKNDudF4scX8oWaGuzAQ4fUSw/l/5XR3B8PSdzAGGS
 p+iGOiLO6nBLM9Zu6oqa8UN/EiTgQJXwEo0ad/d+V2ueMcJtIbSyflMRjCxbhczHREsS
 BesNKrHisq2YIoBDeArOcxEuHBZJCPyyYJD9EtKYDv3hicZoUuhECUG3HGEGzBw27naA
 nMeu3CL/DmazTHtJEdjrYct+Xmbzet7wWdQpNi8r1Qmg6f07DgOESrrUF8KTYjK+KPW4
 hzX5v7tV/fINFM6FcJUTokWgPTOA7AhOkJ+UckyNhbyq7EXzq9+ooqPYcbAMH2F6JOZN
 iXmg==
X-Gm-Message-State: AO0yUKUO1qW4+5VpVkKLLCXzRra3BsVHv9ipXyjsHdY2LCjbIkG24yGe
 +2zri65hiVYle7Efz4JUZm66I6CjEOnC5iqzxO2ucuDRhLl0D0uYhHjXwnlRrSMg9a0akZZsFOm
 W8EbgSw+gl8S5pyB5MWJInq0PpTdTeK6T6sU4UC7HsF8xLe5jG+mMRRQkI3cUTtidRw==
X-Google-Smtp-Source: AK7set/DsRvK4axI764XFmvaBtEOVmfefOKE9kxp2yXkk0TOQ2NSuvka8twf2e9sFqqKCTQflst7lAznGpPulw==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a7b:c414:0:b0:3ed:7664:6d79 with SMTP id
 k20-20020a7bc414000000b003ed76646d79mr6953447wmi.0.1680346217192; Sat, 01 Apr
 2023 03:50:17 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:52 +0000
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-10-smostafa@google.com>
Subject: [RFC PATCH v3 09/10] hw/arm/smmuv3: Add stage-2 support in iova
 notifier
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3aQwoZAgKCko4y045mrms00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
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

In smmuv3_notify_iova, read the granule based on translation stage
and use VMID if valid value is sent.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
Changes in v3:
- Collected Reviewed-by tag.
---
 hw/arm/smmuv3.c     | 39 ++++++++++++++++++++++++++-------------
 hw/arm/trace-events |  2 +-
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3b5b1fad1a..826aacf8b1 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1006,18 +1006,21 @@ epilogue:
  * @mr: IOMMU mr region handle
  * @n: notifier to be called
  * @asid: address space ID or negative value if we don't care
+ * @vmid: virtual machine ID or negative value if we don't care
  * @iova: iova
  * @tg: translation granule (if communicated through range invalidation)
  * @num_pages: number of @granule sized pages (if tg != 0), otherwise 1
  */
 static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
                                IOMMUNotifier *n,
-                               int asid, dma_addr_t iova,
-                               uint8_t tg, uint64_t num_pages)
+                               int asid, int vmid,
+                               dma_addr_t iova, uint8_t tg,
+                               uint64_t num_pages)
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
     IOMMUTLBEvent event;
     uint8_t granule;
+    SMMUv3State *s = sdev->smmu;
 
     if (!tg) {
         SMMUEventInfo event = {.inval_ste_allowed = true};
@@ -1032,11 +1035,20 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
             return;
         }
 
-        tt = select_tt(cfg, iova);
-        if (!tt) {
+        if (vmid >= 0 && cfg->s2cfg.vmid != vmid) {
             return;
         }
-        granule = tt->granule_sz;
+
+        if (STAGE1_SUPPORTED(s)) {
+            tt = select_tt(cfg, iova);
+            if (!tt) {
+                return;
+            }
+            granule = tt->granule_sz;
+        } else {
+            granule = cfg->s2cfg.granule_sz;
+        }
+
     } else {
         granule = tg * 2 + 10;
     }
@@ -1050,9 +1062,10 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     memory_region_notify_iommu_one(n, &event);
 }
 
-/* invalidate an asid/iova range tuple in all mr's */
-static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
-                                      uint8_t tg, uint64_t num_pages)
+/* invalidate an asid/vmid/iova range tuple in all mr's */
+static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
+                                      dma_addr_t iova, uint8_t tg,
+                                      uint64_t num_pages)
 {
     SMMUDevice *sdev;
 
@@ -1060,11 +1073,11 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
         IOMMUMemoryRegion *mr = &sdev->iommu;
         IOMMUNotifier *n;
 
-        trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, iova,
-                                        tg, num_pages);
+        trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, vmid,
+                                        iova, tg, num_pages);
 
         IOMMU_NOTIFIER_FOREACH(n, mr) {
-            smmuv3_notify_iova(mr, n, asid, iova, tg, num_pages);
+            smmuv3_notify_iova(mr, n, asid, vmid, iova, tg, num_pages);
         }
     }
 }
@@ -1095,7 +1108,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
 
     if (!tg) {
         trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
-        smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         return;
     }
@@ -1113,7 +1126,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
 
         num_pages = (mask + 1) >> granule;
         trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
-        smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
         addr += mask + 1;
     }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index f8fdf1ca9f..cdc1ea06a8 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -53,5 +53,5 @@ smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
-smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
+smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
 
-- 
2.40.0.348.gf938b09366-goog


