Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95DA337BC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 20:21:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXrZw-0002wT-RL
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 14:21:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hXrOR-0002Es-IQ
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 14:09:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hXrOQ-0000sD-AE
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 14:09:11 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46558)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hXrOQ-0000r8-43
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 14:09:10 -0400
Received: by mail-qt1-f196.google.com with SMTP id z19so10484142qtz.13
	for <qemu-devel@nongnu.org>; Mon, 03 Jun 2019 11:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=1DkvQpNZ6CwyiPWrtu8aXp08JjOfs2dpwhlXm3wVrEk=;
	b=ErtdDEx6/dBZGruXcGzjybjdhiVdUuc4YrVmumeL3Re6Pa/WTkR5dXh7JcHjewjUOy
	nIR51OAyKthOnFzwYL/3pEnfdGM+IGw0eUAEDFqMz8YIsltYVqHfk5TvEUVv5Ybmt3dY
	yAWlMvVmZj4Jra/GR9a9J8IIVXUfT5PeiyH7QaLX2Rv6sD6m2ZzMkrSz79XSwlaSW1db
	WkjtzjIFPe5bEiehFykSzOqcG9E/b540cd9QZ8D13PqpYgQmxdJN7/kbH4VdwNmDo27w
	Xs1sxSZNwti2b+rCB9ptGtSpx4EibyqjNoWI4TMb+Bl6S5q4WU5jgRx/HkO9RGC0OWiK
	KFPA==
X-Gm-Message-State: APjAAAVG/cETACgx1G1pmnm+wQS+gBg/J3fY3srfVQx7gI/66IKDeJoB
	Lps7FQ3iNu8VNN0FmLTexr4s9/DPAzw=
X-Google-Smtp-Source: APXvYqyjDJvHCmzx5tUPfUnxHbiiaE3kEmsae+b7uZnPWvr9WPDJUXVKkcaieR1G1tFdRg3WSBshxw==
X-Received: by 2002:ad4:43c1:: with SMTP id o1mr10184670qvs.226.1559585349170; 
	Mon, 03 Jun 2019 11:09:09 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103]) by smtp.gmail.com with ESMTPSA id
	f67sm9342457qtb.68.2019.06.03.11.09.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 03 Jun 2019 11:09:08 -0700 (PDT)
Date: Mon, 3 Jun 2019 14:09:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190416125912.44001-4-liran.alon@oracle.com>
References: <20190603180807.16140-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603180807.16140-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.196
Subject: [Qemu-devel] [PULL v2 13/14] vhost-scsi: Allow user to enable
 migration
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	Bijan Mottahedeh <bijan.mottahedeh@oracle.com>,
	Liran Alon <liran.alon@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Nir Weiner <nir.weiner@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liran Alon <liran.alon@oracle.com>

In order to perform a valid migration of a vhost-scsi device,
the following requirements must be met:
(1) The virtio-scsi device state needs to be saved & loaded.
(2) The vhost backend must be stopped before virtio-scsi device state
is saved:
  (2.1) Sync vhost backend state to virtio-scsi device state.
  (2.2) No further I/O requests are made by vhost backend to target
        SCSI device.
  (2.3) No further guest memory access takes place after VM is stopped.
(3) Requests in-flight to target SCSI device are completed before
    migration handover.
(4) Target SCSI device state needs to be saved & loaded into the
    destination host target SCSI device.

Previous commit ("vhost-scsi: Add VMState descriptor")
add support to save & load the device state using VMState.
This meets requirement (1).

When VM is stopped by migration thread (On Pre-Copy complete), the
following code path is executed:
migration_completion() -> vm_stop_force_state() -> vm_stop() ->
do_vm_stop().

do_vm_stop() calls first pause_all_vcpus() which pause all guest
vCPUs and then call vm_state_notify().
In case of vhost-scsi device, this will lead to the following code path
to be executed:
vm_state_notify() -> virtio_vmstate_change() ->
virtio_set_status() -> vhost_scsi_set_status() -> vhost_scsi_stop().
vhost_scsi_stop() then calls vhost_scsi_clear_endpoint() and
vhost_scsi_common_stop().

vhost_scsi_clear_endpoint() sends VHOST_SCSI_CLEAR_ENDPOINT ioctl to
vhost backend which will reach kernel's vhost_scsi_clear_endpoint()
which process all pending I/O requests and wait for them to complete
(vhost_scsi_flush()). This meets requirement (3).

vhost_scsi_common_stop() will stop the vhost backend.
As part of this stop, dirty-bitmap is synced and vhost backend state is
synced with virtio-scsi device state. As at this point guest vCPUs are
already paused, this meets requirement (2).

At this point we are left with requirement (4) which is target SCSI
device specific and therefore cannot be done by QEMU. Which is the main
reason why vhost-scsi adds a migration blocker.
However, as this can be handled either by an external orchestrator or
by using shared-storage (i.e. iSCSI), there is no reason to limit the
orchestrator from being able to explictly specify it wish to enable
migration even when VM have a vhost-scsi device.

Considering all the above, this commit allows orchestrator to explictly
specify that it is responsbile for taking care of requirement (4) and
therefore vhost-scsi should not add a migration blocker.

Reviewed-by: Nir Weiner <nir.weiner@oracle.com>
Reviewed-by: Bijan Mottahedeh <bijan.mottahedeh@oracle.com>
Signed-off-by: Liran Alon <liran.alon@oracle.com>
Message-Id: <20190416125912.44001-4-liran.alon@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/vhost-scsi-common.h |  1 +
 hw/scsi/vhost-scsi.c                  | 30 ++++++++++++++++++---------
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/include/hw/virtio/vhost-scsi-common.h b/include/hw/virtio/vhost-scsi-common.h
index 57fb1d87b5..4eab767ee8 100644
--- a/include/hw/virtio/vhost-scsi-common.h
+++ b/include/hw/virtio/vhost-scsi-common.h
@@ -36,6 +36,7 @@ typedef struct VHostSCSICommon {
     int target;
     int lun;
     uint64_t host_features;
+    bool migratable;
 } VHostSCSICommon;
 
 int vhost_scsi_common_start(VHostSCSICommon *vsc);
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index eb0cf9e131..6b01accf61 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -199,13 +199,18 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
         goto close_fd;
     }
 
-    error_setg(&vsc->migration_blocker,
-               "vhost-scsi does not support migration");
-    migrate_add_blocker(vsc->migration_blocker, &err);
-    if (err) {
-        error_propagate(errp, err);
-        error_free(vsc->migration_blocker);
-        goto close_fd;
+    if (!vsc->migratable) {
+        error_setg(&vsc->migration_blocker,
+                "vhost-scsi does not support migration in all cases. "
+                "When external environment supports it (Orchestrator migrates "
+                "target SCSI device state or use shared storage over network), "
+                "set 'migratable' property to true to enable migration.");
+        migrate_add_blocker(vsc->migration_blocker, &err);
+        if (err) {
+            error_propagate(errp, err);
+            error_free(vsc->migration_blocker);
+            goto close_fd;
+        }
     }
 
     vsc->dev.nvqs = VHOST_SCSI_VQ_NUM_FIXED + vs->conf.num_queues;
@@ -230,7 +235,9 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     return;
 
  free_vqs:
-    migrate_del_blocker(vsc->migration_blocker);
+    if (!vsc->migratable) {
+        migrate_del_blocker(vsc->migration_blocker);
+    }
     g_free(vsc->dev.vqs);
  close_fd:
     close(vhostfd);
@@ -243,8 +250,10 @@ static void vhost_scsi_unrealize(DeviceState *dev, Error **errp)
     VHostSCSICommon *vsc = VHOST_SCSI_COMMON(dev);
     struct vhost_virtqueue *vqs = vsc->dev.vqs;
 
-    migrate_del_blocker(vsc->migration_blocker);
-    error_free(vsc->migration_blocker);
+    if (!vsc->migratable) {
+        migrate_del_blocker(vsc->migration_blocker);
+        error_free(vsc->migration_blocker);
+    }
 
     /* This will stop vhost backend. */
     vhost_scsi_set_status(vdev, 0);
@@ -268,6 +277,7 @@ static Property vhost_scsi_properties[] = {
     DEFINE_PROP_BIT64("t10_pi", VHostSCSICommon, host_features,
                                                  VIRTIO_SCSI_F_T10_PI,
                                                  false),
+    DEFINE_PROP_BOOL("migratable", VHostSCSICommon, migratable, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


