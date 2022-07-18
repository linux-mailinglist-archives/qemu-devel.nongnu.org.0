Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0EB5785BA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:46:27 +0200 (CEST)
Received: from localhost ([::1]:59430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDS0w-0005bJ-3p
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oDRga-00033N-6f
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:25:26 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oDRgY-0007WM-BS
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:25:23 -0400
Received: by mail-wr1-x432.google.com with SMTP id h17so17356542wrx.0
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BtFZASdng0XjIjFeHK3YeIzIhyjE9eTOh6A5GMRsTdM=;
 b=Kh6zK1iZSA9+6UbojT/lDlPXqLknwjV6rlr/0sUG5RGTrLUn2/F2ds7uQXQoZ153T2
 BYhawOeWdWaFvnMskFrp5tLb1hqrG6OkwHo0B0+Ir2MXlll3gpxg3jNR6L9eQ9YuP2D+
 Zf9ywNSyz76GSS5VghOTAYvotyDNz7Cz6Q6WwRsJpufDk3zKDwiV5wZ+w2VIYl65oSsl
 t2KIBO3XDBQ/5JdPbhfhYfp7rpToQs9bjLgS1AUfAcjw1r6iV0pcMW608KT2mi+nVbFO
 TlkgIoz3281UBGOdfZfDBvRplzE5MG2eKdRNOEGyfBZlmR7Rl5yLhwBlnZN5vDKTnyNe
 EpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BtFZASdng0XjIjFeHK3YeIzIhyjE9eTOh6A5GMRsTdM=;
 b=0t0KxOA4xxGw3e1VZUHJGN+Uy4/j2C0+WcFbzJO0nfnPRx42k9s8HqY1XJsAYWAVlA
 GpMftbrsJymiHuj9yOwZxBYhyg74yyUU3pzi5SRlik5xeNodiojLhu6zHsJ2p5UGOfBb
 LssRUU11BPXiISF9T6pdF+Y2pjsr0+2H3HoPhAcbz5HnZYk9AMjqGy5PZwUPZW59p6xo
 5yZ3M5eNiOqMNZXJxiRB7hUU9d6yZOTuMwaXadcUl+m1t0eucOa6YdeD3tHHUyg9Oall
 4P4gX7P3eGltjS67K51/qIwvlx/KqHPJAzxeLccIktMSlK8mS+fZgurDfKABiHtpaoQs
 0BnA==
X-Gm-Message-State: AJIora+lhNeV5NAxLA+ZKR3w52XR6PGLf0noBfO+U6fqStWnNrd7KHJf
 p3DGLW2PAuaZ7jr6pmrYk4Q3oQ==
X-Google-Smtp-Source: AGRyM1tevUQczrqyiOMB/EugiLxHYjAl9KanJFPXYU3+t+86L6hVmngllvRBpQNGvjBdpGjovce9Dw==
X-Received: by 2002:a5d:6483:0:b0:21d:99c5:cb6e with SMTP id
 o3-20020a5d6483000000b0021d99c5cb6emr23355517wri.592.1658154320429; 
 Mon, 18 Jul 2022 07:25:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 v130-20020a1cac88000000b003a046549a85sm19299705wme.37.2022.07.18.07.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 07:25:20 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Cc: mst@redhat.com, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Tina Zhang <tina.zhang@intel.com>
Subject: [PATCH v2] hw/virtio/virtio-iommu: Enforce power-of-two notify for
 both MAP and UNMAP
Date: Mon, 18 Jul 2022 14:56:37 +0100
Message-Id: <20220718135636.338264-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we only enforce power-of-two mappings (required by the QEMU
notifier) for UNMAP requests. A MAP request not aligned on a
power-of-two may be successfully handled by VFIO, and then the
corresponding UNMAP notify will fail because it will attempt to split
that mapping. Ensure MAP and UNMAP notifications are consistent.

Fixes: dde3f08b5cab ("virtio-iommu: Handle non power of 2 range invalidations")
Reported-by: Tina Zhang <tina.zhang@intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2: correct translated_addr increment
v1: https://lore.kernel.org/all/20220714095418.261387-1-jean-philippe@linaro.org/

---
 hw/virtio/virtio-iommu.c | 47 ++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 281152d338..62e07ec2e4 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -197,6 +197,32 @@ static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     }
 }
 
+static void virtio_iommu_notify_map_unmap(IOMMUMemoryRegion *mr,
+                                          IOMMUTLBEvent *event,
+                                          hwaddr virt_start, hwaddr virt_end)
+{
+    uint64_t delta = virt_end - virt_start;
+
+    event->entry.iova = virt_start;
+    event->entry.addr_mask = delta;
+
+    if (delta == UINT64_MAX) {
+        memory_region_notify_iommu(mr, 0, *event);
+    }
+
+    while (virt_start != virt_end + 1) {
+        uint64_t mask = dma_aligned_pow2_mask(virt_start, virt_end, 64);
+
+        event->entry.addr_mask = mask;
+        event->entry.iova = virt_start;
+        memory_region_notify_iommu(mr, 0, *event);
+        virt_start += mask + 1;
+        if (event->entry.perm != IOMMU_NONE) {
+            event->entry.translated_addr += mask + 1;
+        }
+    }
+}
+
 static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr virt_start,
                                     hwaddr virt_end, hwaddr paddr,
                                     uint32_t flags)
@@ -215,19 +241,16 @@ static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr virt_start,
 
     event.type = IOMMU_NOTIFIER_MAP;
     event.entry.target_as = &address_space_memory;
-    event.entry.addr_mask = virt_end - virt_start;
-    event.entry.iova = virt_start;
     event.entry.perm = perm;
     event.entry.translated_addr = paddr;
 
-    memory_region_notify_iommu(mr, 0, event);
+    virtio_iommu_notify_map_unmap(mr, &event, virt_start, virt_end);
 }
 
 static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
                                       hwaddr virt_end)
 {
     IOMMUTLBEvent event;
-    uint64_t delta = virt_end - virt_start;
 
     if (!(mr->iommu_notify_flags & IOMMU_NOTIFIER_UNMAP)) {
         return;
@@ -239,22 +262,8 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
     event.entry.target_as = &address_space_memory;
     event.entry.perm = IOMMU_NONE;
     event.entry.translated_addr = 0;
-    event.entry.addr_mask = delta;
-    event.entry.iova = virt_start;
-
-    if (delta == UINT64_MAX) {
-        memory_region_notify_iommu(mr, 0, event);
-    }
 
-
-    while (virt_start != virt_end + 1) {
-        uint64_t mask = dma_aligned_pow2_mask(virt_start, virt_end, 64);
-
-        event.entry.addr_mask = mask;
-        event.entry.iova = virt_start;
-        memory_region_notify_iommu(mr, 0, event);
-        virt_start += mask + 1;
-    }
+    virtio_iommu_notify_map_unmap(mr, &event, virt_start, virt_end);
 }
 
 static gboolean virtio_iommu_notify_unmap_cb(gpointer key, gpointer value,
-- 
2.37.1


