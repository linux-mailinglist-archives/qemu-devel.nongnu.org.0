Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8886251E079
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 22:57:16 +0200 (CEST)
Received: from localhost ([::1]:40038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn50l-0000mU-Mf
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 16:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4tE-0005KI-4r
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:49:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4tC-0005wb-7l
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651870165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xmkN+2PGuHqCGODmkj2ntnwkD12X+yWq79vXD1RqwrI=;
 b=fGp2Dk5PqEDV0sL0FUHbm/3xOEbOqJzRNmKgVFOgbAQEEqiIQOvfLSRbT8OZUKMQAclGlW
 xG576Y7FoHBpm84JFgT8BkVH02AWEFIREEqnL/jJSoEQx0+m7yd8fe0XP7dKyfRW/g03pL
 hIPk3j132lEiAORyLYuRE/vfxqXoeWk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-4uihxJVhNb25kCeY2sHJFA-1; Fri, 06 May 2022 16:49:22 -0400
X-MC-Unique: 4uihxJVhNb25kCeY2sHJFA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 241D0811E78;
 Fri,  6 May 2022 20:49:22 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFA8D554A3C;
 Fri,  6 May 2022 20:49:21 +0000 (UTC)
Subject: [PULL 11/11] vfio/common: Rename VFIOGuestIOMMU::iommu into ::iommu_mr
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>
Date: Fri, 06 May 2022 14:49:21 -0600
Message-ID: <165187015835.4166595.8691903256855460050.stgit@omen>
In-Reply-To: <165186988363.4166595.3147442303200167674.stgit@omen>
References: <165186988363.4166595.3147442303200167674.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

From: Yi Liu <yi.l.liu@intel.com>

Rename VFIOGuestIOMMU iommu field into iommu_mr. Then it becomes clearer
it is an IOMMU memory region.

no functional change intended

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Link: https://lore.kernel.org/r/20220502094223.36384-4-yi.l.liu@intel.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c              |   16 ++++++++--------
 include/hw/vfio/vfio-common.h |    2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index cfcb71974a61..159f910421bc 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1017,7 +1017,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
          * device emulation the VFIO iommu handles to use).
          */
         giommu = g_malloc0(sizeof(*giommu));
-        giommu->iommu = iommu_mr;
+        giommu->iommu_mr = iommu_mr;
         giommu->iommu_offset = section->offset_within_address_space -
                                section->offset_within_region;
         giommu->container = container;
@@ -1032,7 +1032,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
                             int128_get64(llend),
                             iommu_idx);
 
-        ret = memory_region_iommu_set_page_size_mask(giommu->iommu,
+        ret = memory_region_iommu_set_page_size_mask(giommu->iommu_mr,
                                                      container->pgsizes,
                                                      &err);
         if (ret) {
@@ -1047,7 +1047,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
             goto fail;
         }
         QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
-        memory_region_iommu_replay(giommu->iommu, &giommu->n);
+        memory_region_iommu_replay(giommu->iommu_mr, &giommu->n);
 
         return;
     }
@@ -1153,7 +1153,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
         VFIOGuestIOMMU *giommu;
 
         QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
-            if (MEMORY_REGION(giommu->iommu) == section->mr &&
+            if (MEMORY_REGION(giommu->iommu_mr) == section->mr &&
                 giommu->n.start == section->offset_within_region) {
                 memory_region_unregister_iommu_notifier(section->mr,
                                                         &giommu->n);
@@ -1418,11 +1418,11 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
         VFIOGuestIOMMU *giommu;
 
         QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
-            if (MEMORY_REGION(giommu->iommu) == section->mr &&
+            if (MEMORY_REGION(giommu->iommu_mr) == section->mr &&
                 giommu->n.start == section->offset_within_region) {
                 Int128 llend;
                 vfio_giommu_dirty_notifier gdn = { .giommu = giommu };
-                int idx = memory_region_iommu_attrs_to_index(giommu->iommu,
+                int idx = memory_region_iommu_attrs_to_index(giommu->iommu_mr,
                                                        MEMTXATTRS_UNSPECIFIED);
 
                 llend = int128_add(int128_make64(section->offset_within_region),
@@ -1435,7 +1435,7 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
                                     section->offset_within_region,
                                     int128_get64(llend),
                                     idx);
-                memory_region_iommu_replay(giommu->iommu, &gdn.n);
+                memory_region_iommu_replay(giommu->iommu_mr, &gdn.n);
                 break;
             }
         }
@@ -2270,7 +2270,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
 
         QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp) {
             memory_region_unregister_iommu_notifier(
-                    MEMORY_REGION(giommu->iommu), &giommu->n);
+                    MEMORY_REGION(giommu->iommu_mr), &giommu->n);
             QLIST_REMOVE(giommu, giommu_next);
             g_free(giommu);
         }
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 8af11b0a7692..e573f5a9f19f 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -98,7 +98,7 @@ typedef struct VFIOContainer {
 
 typedef struct VFIOGuestIOMMU {
     VFIOContainer *container;
-    IOMMUMemoryRegion *iommu;
+    IOMMUMemoryRegion *iommu_mr;
     hwaddr iommu_offset;
     IOMMUNotifier n;
     QLIST_ENTRY(VFIOGuestIOMMU) giommu_next;



