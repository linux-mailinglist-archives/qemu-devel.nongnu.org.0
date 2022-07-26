Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3CE581A87
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:50:30 +0200 (CEST)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQZZ-0000su-RZ
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQX-00079B-CV
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:41:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQV-000563-Di
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lcDZ+kvJCB8XhMtmG2zKvtJJoMu/uNhWnfYMk/wNzZ0=;
 b=SZyKBVZyW1Bt55w4rVhqJ12OeRnWD+QiW79GTdNdFJ4neyrzbp5llETyh7N1Qkj26BDEVI
 1ERiAwSZfRKKrn5hOFHR/eUHYKZYWkWdUCpVexH3DJGYXDS2UlbonSpQ6802GE/FoLPbIj
 KNZzQX0PfaiXyt4grThxl/qR2r+hwaI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-Af-fJphZPYa6C0UAtYzzNA-1; Tue, 26 Jul 2022 15:41:04 -0400
X-MC-Unique: Af-fJphZPYa6C0UAtYzzNA-1
Received: by mail-wm1-f69.google.com with SMTP id
 h65-20020a1c2144000000b003a30cae106cso10646682wmh.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=lcDZ+kvJCB8XhMtmG2zKvtJJoMu/uNhWnfYMk/wNzZ0=;
 b=YzOy1HrdrYk3K3Z3AgjnYnDHRqTiiWXy9BmJbwhNjT27smo196xX3Bj+siulhv56xe
 9yft94PBALYByQ80aUmIHsUVsHccAYNaTySRKXFucgZ8OMpKkeOub7kqDcHhAShZEtIi
 QmIITTssVT0q1CvPBR7OwWsHLJqbKbfpSU/HHfkC4YUdb5zyPek3CuLBCJ/zcy7qr/rN
 AGFe0qzU5BQ5uhE8aZLfcllYEMG7Mxshf3TaZWiVp9AOfmxpT6MLV+tzEELhHDuWSmPF
 yeOQt9QITOF1AESYQ6jmnLWjaXBN/vzlUJlPbyveeoEI7Q7sE7ViU+7RD1byicW/HITq
 CK8Q==
X-Gm-Message-State: AJIora+pc748I+3/AeLKkM5B1C2uEshAxdlqZhSqzZk3RzHt4fXFz4ME
 KMQA4sHsl8sgrOt7dehUSc8NzkOBV4TsvPJ2Wg0YL69lFF0/6nPbVrm9q40SjfmLMgtT4umXAfI
 ODCzSN8VgJSgjGNrM3lHeFZrAbXn9Gkb44GrUPZM/1756ZVQ5xFtVLk/Yxd5X
X-Received: by 2002:a5d:4f82:0:b0:21e:b8b2:cbc3 with SMTP id
 d2-20020a5d4f82000000b0021eb8b2cbc3mr1650978wru.661.1658864463230; 
 Tue, 26 Jul 2022 12:41:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vF6lwk7fGS5sVmjm+NSyovip5XgEy2rWFGFYkDwUGMcSb3XJK3Se2mQrF6qSk8J0+QiEsxnQ==
X-Received: by 2002:a5d:4f82:0:b0:21e:b8b2:cbc3 with SMTP id
 d2-20020a5d4f82000000b0021eb8b2cbc3mr1650962wru.661.1658864462864; 
 Tue, 26 Jul 2022 12:41:02 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c510f00b003a30fbde91dsm25264601wms.20.2022.07.26.12.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:41:02 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:41:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Tina Zhang <tina.zhang@intel.com>, Eric Auger <eric.auger@redhat.com>
Subject: [PULL 16/16] hw/virtio/virtio-iommu: Enforce power-of-two notify for
 both MAP and UNMAP
Message-ID: <20220726193858.177462-17-mst@redhat.com>
References: <20220726193858.177462-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726193858.177462-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Currently we only enforce power-of-two mappings (required by the QEMU
notifier) for UNMAP requests. A MAP request not aligned on a
power-of-two may be successfully handled by VFIO, and then the
corresponding UNMAP notify will fail because it will attempt to split
that mapping. Ensure MAP and UNMAP notifications are consistent.

Fixes: dde3f08b5cab ("virtio-iommu: Handle non power of 2 range invalidations")
Reported-by: Tina Zhang <tina.zhang@intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20220718135636.338264-1-jean-philippe@linaro.org>
Tested-by: Tina Zhang <tina.zhang@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
 
-    if (delta == UINT64_MAX) {
-        memory_region_notify_iommu(mr, 0, event);
-    }
-
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
MST


