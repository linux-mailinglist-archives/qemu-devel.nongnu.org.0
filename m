Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D0B69A20E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:03:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnHO-0002YV-LL; Thu, 16 Feb 2023 18:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnHM-0002K9-19
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:03:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnHJ-0005dD-S1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676588579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZ/0IyZddN8XsbeOanGAhVA6TxBF6lXCWTn5SkzFznQ=;
 b=EMfc09W9s08R5rxOey4pAPPD6NOM1f3miiTF0K2LijkSAtuX09i9HCyCflX9snXjGhtNlc
 4qfG5qFhrCLkvr7R3QdTXEWge+6M8f345J2ou/Wdaq30KPDnOvcrrObOLTWUQBuTxd157m
 dK7mts/zAjJFoyXmw9v+4ThuIlxHZ8E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-py8xeBedOBG3e0LznQQgig-1; Thu, 16 Feb 2023 18:02:55 -0500
X-MC-Unique: py8xeBedOBG3e0LznQQgig-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BA4E80D0E9;
 Thu, 16 Feb 2023 23:02:54 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1678E492B15;
 Thu, 16 Feb 2023 23:02:54 +0000 (UTC)
Subject: [PULL 11/12] docs/devel: Align VFIO migration docs to v2 protocol
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com
Date: Thu, 16 Feb 2023 16:02:53 -0700
Message-ID: <167658857367.932837.1367453248342219671.stgit@omen>
In-Reply-To: <167658846945.932837.1420176491103357684.stgit@omen>
References: <167658846945.932837.1420176491103357684.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
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

From: Avihai Horon <avihaih@nvidia.com>

Now that VFIO migration protocol v2 has been implemented and v1 protocol
has been removed, update the documentation according to v2 protocol.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Link: https://lore.kernel.org/r/20230216143630.25610-12-avihaih@nvidia.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 docs/devel/vfio-migration.rst |   72 +++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 38 deletions(-)

diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
index 673057c90d89..c214c73e2818 100644
--- a/docs/devel/vfio-migration.rst
+++ b/docs/devel/vfio-migration.rst
@@ -7,46 +7,43 @@ the guest is running on source host and restoring this saved state on the
 destination host. This document details how saving and restoring of VFIO
 devices is done in QEMU.
 
-Migration of VFIO devices consists of two phases: the optional pre-copy phase,
-and the stop-and-copy phase. The pre-copy phase is iterative and allows to
-accommodate VFIO devices that have a large amount of data that needs to be
-transferred. The iterative pre-copy phase of migration allows for the guest to
-continue whilst the VFIO device state is transferred to the destination, this
-helps to reduce the total downtime of the VM. VFIO devices can choose to skip
-the pre-copy phase of migration by returning pending_bytes as zero during the
-pre-copy phase.
+Migration of VFIO devices currently consists of a single stop-and-copy phase.
+During the stop-and-copy phase the guest is stopped and the entire VFIO device
+data is transferred to the destination.
+
+The pre-copy phase of migration is currently not supported for VFIO devices.
+Support for VFIO pre-copy will be added later on.
+
+Note that currently VFIO migration is supported only for a single device. This
+is due to VFIO migration's lack of P2P support. However, P2P support is planned
+to be added later on.
 
 A detailed description of the UAPI for VFIO device migration can be found in
-the comment for the ``vfio_device_migration_info`` structure in the header
-file linux-headers/linux/vfio.h.
+the comment for the ``vfio_device_mig_state`` structure in the header file
+linux-headers/linux/vfio.h.
 
 VFIO implements the device hooks for the iterative approach as follows:
 
-* A ``save_setup`` function that sets up the migration region and sets _SAVING
-  flag in the VFIO device state.
+* A ``save_setup`` function that sets up migration on the source.
 
-* A ``load_setup`` function that sets up the migration region on the
-  destination and sets _RESUMING flag in the VFIO device state.
+* A ``load_setup`` function that sets the VFIO device on the destination in
+  _RESUMING state.
 
 * A ``state_pending_exact`` function that reads pending_bytes from the vendor
   driver, which indicates the amount of data that the vendor driver has yet to
   save for the VFIO device.
 
-* A ``save_live_iterate`` function that reads the VFIO device's data from the
-  vendor driver through the migration region during iterative phase.
-
 * A ``save_state`` function to save the device config space if it is present.
 
-* A ``save_live_complete_precopy`` function that resets _RUNNING flag from the
-  VFIO device state and iteratively copies the remaining data for the VFIO
-  device until the vendor driver indicates that no data remains (pending bytes
-  is zero).
+* A ``save_live_complete_precopy`` function that sets the VFIO device in
+  _STOP_COPY state and iteratively copies the data for the VFIO device until
+  the vendor driver indicates that no data remains.
 
 * A ``load_state`` function that loads the config section and the data
-  sections that are generated by the save functions above
+  sections that are generated by the save functions above.
 
 * ``cleanup`` functions for both save and load that perform any migration
-  related cleanup, including unmapping the migration region
+  related cleanup.
 
 
 The VFIO migration code uses a VM state change handler to change the VFIO
@@ -71,13 +68,13 @@ tracking can identify dirtied pages, but any page pinned by the vendor driver
 can also be written by the device. There is currently no device or IOMMU
 support for dirty page tracking in hardware.
 
-By default, dirty pages are tracked when the device is in pre-copy as well as
-stop-and-copy phase. So, a page pinned by the vendor driver will be copied to
-the destination in both phases. Copying dirty pages in pre-copy phase helps
-QEMU to predict if it can achieve its downtime tolerances. If QEMU during
-pre-copy phase keeps finding dirty pages continuously, then it understands
-that even in stop-and-copy phase, it is likely to find dirty pages and can
-predict the downtime accordingly.
+By default, dirty pages are tracked during pre-copy as well as stop-and-copy
+phase. So, a page pinned by the vendor driver will be copied to the destination
+in both phases. Copying dirty pages in pre-copy phase helps QEMU to predict if
+it can achieve its downtime tolerances. If QEMU during pre-copy phase keeps
+finding dirty pages continuously, then it understands that even in stop-and-copy
+phase, it is likely to find dirty pages and can predict the downtime
+accordingly.
 
 QEMU also provides a per device opt-out option ``pre-copy-dirty-page-tracking``
 which disables querying the dirty bitmap during pre-copy phase. If it is set to
@@ -111,23 +108,22 @@ Live migration save path
                                   |
                      migrate_init spawns migration_thread
                 Migration thread then calls each device's .save_setup()
-                    (RUNNING, _SETUP, _RUNNING|_SAVING)
+                       (RUNNING, _SETUP, _RUNNING)
                                   |
-                    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
+                      (RUNNING, _ACTIVE, _RUNNING)
              If device is active, get pending_bytes by .state_pending_exact()
           If total pending_bytes >= threshold_size, call .save_live_iterate()
-                  Data of VFIO device for pre-copy phase is copied
         Iterate till total pending bytes converge and are less than threshold
                                   |
   On migration completion, vCPU stops and calls .save_live_complete_precopy for
-   each active device. The VFIO device is then transitioned into _SAVING state
-                   (FINISH_MIGRATE, _DEVICE, _SAVING)
+  each active device. The VFIO device is then transitioned into _STOP_COPY state
+                  (FINISH_MIGRATE, _DEVICE, _STOP_COPY)
                                   |
      For the VFIO device, iterate in .save_live_complete_precopy until
                          pending data is 0
-                   (FINISH_MIGRATE, _DEVICE, _STOPPED)
+                   (FINISH_MIGRATE, _DEVICE, _STOP)
                                   |
-                 (FINISH_MIGRATE, _COMPLETED, _STOPPED)
+                 (FINISH_MIGRATE, _COMPLETED, _STOP)
              Migraton thread schedules cleanup bottom half and exits
 
 Live migration resume path
@@ -136,7 +132,7 @@ Live migration resume path
 ::
 
               Incoming migration calls .load_setup for each device
-                       (RESTORE_VM, _ACTIVE, _STOPPED)
+                       (RESTORE_VM, _ACTIVE, _STOP)
                                  |
        For each device, .load_state is called for that device section data
                        (RESTORE_VM, _ACTIVE, _RESUMING)



