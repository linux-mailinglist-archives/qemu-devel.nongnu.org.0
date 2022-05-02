Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695E9516DAD
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 11:47:34 +0200 (CEST)
Received: from localhost ([::1]:54508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlSeT-00025Z-C3
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 05:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nlSZd-0007j5-Dd
 for qemu-devel@nongnu.org; Mon, 02 May 2022 05:42:34 -0400
Received: from mga05.intel.com ([192.55.52.43]:48091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nlSZb-0007nw-NL
 for qemu-devel@nongnu.org; Mon, 02 May 2022 05:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651484551; x=1683020551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jNbFrqjQ9CWFv0nryAshtmZ5YCZ1dndg17ZdlYMfCjQ=;
 b=DYBpvUcTcLhQRy1fZsTzYSnVyRDfAiVc+dsjO9ZCWBeiP6CaucUFDdP6
 VVs0rSrmrvizmb298BKkHkE5LSFw78Xf+vefwUeTPKeWdAjB0YMV+QZ0o
 acWx9Bqb2TNyS+M8tQZB4zaygryppG8mjGRmBIpSE9an0opN8Cvm1xZ7a
 LtZW0jIHfuoPcOuTJEo6BIeSX8c8KrjeWRVxA6x+5dJoW9KZV3ETIP5Ua
 bcUfb7Z8bg+zn0oWyUO5I3vvgVLwkPpJxZ9jkUWdmZSEf/UOu2OQ9mfcE
 maVcifngG39A/OE32nNX65Av7j9W5io6Cj1bhS6vCUxDBzvP2v0ruTE/9 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="353597175"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="353597175"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 02:42:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="561649602"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 02 May 2022 02:42:23 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	qemu-devel@nongnu.org
Subject: [Patch 3/3] vfio/common: Rename VFIOGuestIOMMU::iommu into ::iommu_mr
Date: Mon,  2 May 2022 02:42:23 -0700
Message-Id: <20220502094223.36384-4-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220502094223.36384-1-yi.l.liu@intel.com>
References: <20220502094223.36384-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yi.l.liu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eric.auger@redhat.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename VFIOGuestIOMMU iommu field into iommu_mr. Then it becomes clearer
it is an IOMMU memory region.

no functional change intended

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/vfio/common.c              | 16 ++++++++--------
 include/hw/vfio/vfio-common.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 2b1f78fdfa..287a2b6828 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -992,7 +992,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
          * device emulation the VFIO iommu handles to use).
          */
         giommu = g_malloc0(sizeof(*giommu));
-        giommu->iommu = iommu_mr;
+        giommu->iommu_mr = iommu_mr;
         giommu->iommu_offset = section->offset_within_address_space -
                                section->offset_within_region;
         giommu->container = container;
@@ -1007,7 +1007,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
                             int128_get64(llend),
                             iommu_idx);
 
-        ret = memory_region_iommu_set_page_size_mask(giommu->iommu,
+        ret = memory_region_iommu_set_page_size_mask(giommu->iommu_mr,
                                                      container->pgsizes,
                                                      &err);
         if (ret) {
@@ -1022,7 +1022,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
             goto fail;
         }
         QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
-        memory_region_iommu_replay(giommu->iommu, &giommu->n);
+        memory_region_iommu_replay(giommu->iommu_mr, &giommu->n);
 
         return;
     }
@@ -1128,7 +1128,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
         VFIOGuestIOMMU *giommu;
 
         QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
-            if (MEMORY_REGION(giommu->iommu) == section->mr &&
+            if (MEMORY_REGION(giommu->iommu_mr) == section->mr &&
                 giommu->n.start == section->offset_within_region) {
                 memory_region_unregister_iommu_notifier(section->mr,
                                                         &giommu->n);
@@ -1393,11 +1393,11 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
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
@@ -1410,7 +1410,7 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
                                     section->offset_within_region,
                                     int128_get64(llend),
                                     idx);
-                memory_region_iommu_replay(giommu->iommu, &gdn.n);
+                memory_region_iommu_replay(giommu->iommu_mr, &gdn.n);
                 break;
             }
         }
@@ -2246,7 +2246,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
 
         QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp) {
             memory_region_unregister_iommu_notifier(
-                    MEMORY_REGION(giommu->iommu), &giommu->n);
+                    MEMORY_REGION(giommu->iommu_mr), &giommu->n);
             QLIST_REMOVE(giommu, giommu_next);
             g_free(giommu);
         }
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 8af11b0a76..e573f5a9f1 100644
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
-- 
2.27.0


