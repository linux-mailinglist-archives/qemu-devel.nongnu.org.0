Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D236AF2A7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:54:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZcRk-00074i-O2; Tue, 07 Mar 2023 13:54:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcRi-0006qp-Hp
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcRg-0002Yy-Mk
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678215236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tw27+l4O82r7jBEapDwdNN0naMMdsCt8B+Jk2NalOIA=;
 b=QX8RbnbtpuzpLPmZ9lY+QZWJrQH6Rp39q+t+rKbnl2ioMkFnpA3SR1I9mtfbTzYjCbvwla
 +pOvnVN7Wz4FsHRk8hYJ8PMfU/q3X+RpE6hmfUohyAduPATafXUNcA28X04jBIkuUO1ef1
 YP6xLde5hTGiV0kWRz/tZhqVxBHSgt0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-JUbtks5RNd-0EKnYZ8uBfA-1; Tue, 07 Mar 2023 13:53:52 -0500
X-MC-Unique: JUbtks5RNd-0EKnYZ8uBfA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 317813C218A8;
 Tue,  7 Mar 2023 18:53:52 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.16.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB2C0492C3E;
 Tue,  7 Mar 2023 18:53:51 +0000 (UTC)
Subject: [PULL 16/17] vfio/migration: Rename entry points
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com,
 joao.m.martins@oracle.com
Date: Tue, 07 Mar 2023 11:53:51 -0700
Message-ID: <167821523138.619792.17249791072209558313.stgit@omen>
In-Reply-To: <167821508699.619792.1719671327865445814.stgit@omen>
References: <167821508699.619792.1719671327865445814.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Pick names that align with the section drivers should use them from,
avoiding the confusion of calling a _finalize() function from _exit()
and generalizing the actual _finalize() to handle removing the viommu
blocker.

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
Link: https://lore.kernel.org/r/167820912978.606734.12740287349119694623.stgit@omen
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c              |    2 +-
 hw/vfio/migration.c           |    8 ++++----
 hw/vfio/pci.c                 |    6 +++---
 include/hw/vfio/vfio-common.h |    6 +++---
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 539246e332b0..4d01ea351515 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -447,7 +447,7 @@ int vfio_block_giommu_migration(Error **errp)
     return ret;
 }
 
-void vfio_unblock_giommu_migration(void)
+void vfio_migration_finalize(void)
 {
     if (!giommu_migration_blocker ||
         vfio_viommu_preset()) {
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 5d1e66f69194..1a1a8659c859 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -521,7 +521,7 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     }
 }
 
-static void vfio_migration_exit(VFIODevice *vbasedev)
+static void vfio_migration_free(VFIODevice *vbasedev)
 {
     g_free(vbasedev->migration);
     vbasedev->migration = NULL;
@@ -631,7 +631,7 @@ int64_t vfio_mig_bytes_transferred(void)
     return bytes_transferred;
 }
 
-int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
+int vfio_migration_realize(VFIODevice *vbasedev, Error **errp)
 {
     int ret = -ENOTSUP;
 
@@ -669,7 +669,7 @@ add_blocker:
     return ret;
 }
 
-void vfio_migration_finalize(VFIODevice *vbasedev)
+void vfio_migration_exit(VFIODevice *vbasedev)
 {
     if (vbasedev->migration) {
         VFIOMigration *migration = vbasedev->migration;
@@ -677,7 +677,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
         remove_migration_state_change_notifier(&migration->migration_state);
         qemu_del_vm_change_state_handler(migration->vm_state);
         unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
-        vfio_migration_exit(vbasedev);
+        vfio_migration_free(vbasedev);
         vfio_unblock_multiple_devices_migration();
     }
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 30a271eab38c..ec9a854361ac 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3145,7 +3145,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     }
 
     if (!pdev->failover_pair_id) {
-        ret = vfio_migration_probe(vbasedev, errp);
+        ret = vfio_migration_realize(vbasedev, errp);
         if (ret) {
             error_report("%s: Migration disabled", vbasedev->name);
         }
@@ -3185,7 +3185,7 @@ static void vfio_instance_finalize(Object *obj)
      */
     vfio_put_device(vdev);
     vfio_put_group(group);
-    vfio_unblock_giommu_migration();
+    vfio_migration_finalize();
 }
 
 static void vfio_exitfn(PCIDevice *pdev)
@@ -3204,7 +3204,7 @@ static void vfio_exitfn(PCIDevice *pdev)
     }
     vfio_teardown_msi(vdev);
     vfio_bars_exit(vdev);
-    vfio_migration_finalize(&vdev->vbasedev);
+    vfio_migration_exit(&vdev->vbasedev);
 }
 
 static void vfio_pci_reset(DeviceState *dev)
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 009bec34c4bc..eed244f25f34 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -223,7 +223,6 @@ bool vfio_mig_active(void);
 int vfio_block_multiple_devices_migration(Error **errp);
 void vfio_unblock_multiple_devices_migration(void);
 int vfio_block_giommu_migration(Error **errp);
-void vfio_unblock_giommu_migration(void);
 int64_t vfio_mig_bytes_transferred(void);
 
 #ifdef CONFIG_LINUX
@@ -247,7 +246,8 @@ int vfio_spapr_create_window(VFIOContainer *container,
 int vfio_spapr_remove_window(VFIOContainer *container,
                              hwaddr offset_within_address_space);
 
-int vfio_migration_probe(VFIODevice *vbasedev, Error **errp);
-void vfio_migration_finalize(VFIODevice *vbasedev);
+int vfio_migration_realize(VFIODevice *vbasedev, Error **errp);
+void vfio_migration_exit(VFIODevice *vbasedev);
+void vfio_migration_finalize(void);
 
 #endif /* HW_VFIO_VFIO_COMMON_H */



