Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADEE500B8E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 12:52:36 +0200 (CEST)
Received: from localhost ([::1]:55486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nex5X-0001f7-6T
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 06:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex0V-0001vK-BU
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:47:23 -0400
Received: from mga12.intel.com ([192.55.52.136]:34772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex0T-0005Kn-Bv
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649933241; x=1681469241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MkfDu/adIzxh1OcaPHvWWpqlG9bfb7sCRkpa27MhdSk=;
 b=ahttKsIlZEw30Uglp0YDemvhPcvTRUiBjIRBFI7CiO3zRibNwxEKIabB
 ucWFmeKL/GS8p4pqE7rrN3eJxV54MyIJcTqSujjsfWuui9eUWP9CwXU3Y
 5Il8WiU9yVZ087ZSvkvf43/e1XpgQB0uGMsxnh0WaPAnN5Bb1JxGm8kLb
 ylmx5s2LZxRVxP14VTW6Vg9IrYgO8v6bEUKWKHR6YPJNXU+rvO8RVR502
 gvPflUfBRFxHePs7yR+8eDCxHQID1p+Thsg4ICmKY2jUdha0x/vKcZS3u
 qbPgyFiegZ5fg6jcY2Ze+ijyOwU7WaQb3cfpKzVgyWGSG5DwgYe2AL4OZ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="242836479"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="242836479"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 03:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="803091193"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2022 03:47:14 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	cohuck@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC 05/18] vfio/common: Rename VFIOGuestIOMMU::iommu into ::iommu_mr
Date: Thu, 14 Apr 2022 03:46:57 -0700
Message-Id: <20220414104710.28534-6-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220414104710.28534-1-yi.l.liu@intel.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yi.l.liu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, thuth@redhat.com,
 yi.l.liu@intel.com, kvm@vger.kernel.org, mjrosato@linux.ibm.com,
 jasowang@redhat.com, farman@linux.ibm.com, peterx@redhat.com,
 pasic@linux.ibm.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 chao.p.peng@intel.com, nicolinc@nvidia.com, kevin.tian@intel.com,
 jgg@nvidia.com, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
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
index 080046e3f5..b05f68b5c7 100644
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


