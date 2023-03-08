Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CE26AFBDB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:13:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiLZ-0002De-1s; Tue, 07 Mar 2023 20:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLW-00028C-Ls
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLU-0001bO-Pf
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hovKUNAuuewScR8Z3znrdDkYwgEnlrBBEGPBW/OLpfQ=;
 b=c6ge1J3UjjQZR4g15fDOTb6ELfIdlgRBnP6LI0FtuCDLU+7s1P6xqO/DEEXQCctQYkMvRN
 KCoaZLj5SanwYWXXdohiuzN9XhHqIUB9LHKdv84hThwj2KKwzccQVWqkOkCQ9GWtCnHdaw
 ZkI1MHeuAWooqYpyk4TRN5UYL7Yh5C0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-MZfKRkNnPxi1T3D3Ql0zfg-1; Tue, 07 Mar 2023 20:11:54 -0500
X-MC-Unique: MZfKRkNnPxi1T3D3Ql0zfg-1
Received: by mail-ed1-f72.google.com with SMTP id
 ec11-20020a0564020d4b00b004e2cb85c8bcso12385936edb.16
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237913;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hovKUNAuuewScR8Z3znrdDkYwgEnlrBBEGPBW/OLpfQ=;
 b=QHRJiNrjVYENYRaa6VkZGEJdp76Yx7QE6slc+7z0x40DUuqTxcw3wyeuxc/IuMsvoi
 7sznIC1SX172Zgz8XRBZl84GFyppErZyVddnRUnr8ranpuSHoy0pVA+OVEP4UCixhzrR
 gtCepg48hsnMYsYFT6/AzMgZsb7h8kwamd4lwpSei904Mw3gXD6/PnJbMk6Frwy9tRaV
 zf028vxGVxzUMLPtQraYDHcmeN3LByBK1cKL7YqYTkee5q3et7ItW54jt0d6qPktJ1iT
 1TV+LY+JaNQHrogCwlACi7Vvj7d76R7FMD4gLNhCsKLbEg4I7MLYITVMspQ2BOFYzixC
 UETQ==
X-Gm-Message-State: AO0yUKWjt2m8JCBrQ75moL4xa6vdExJeIXqeNhvnxhegI9SLGtTfLCaQ
 KZi9it2rUJMfcezAmzYFh2hROAIk3W4/WwPzsN1JaYcw7BngcGOLJ9JKFkVLJJvo7TjZsH0eR5L
 i6txcDtPXiCTt+yoRD0vVEeB0eoy93R20cqFRbFeHiAH+vicEPWaIcPk7i0680SHkBi7U
X-Received: by 2002:a17:906:fe07:b0:879:ab3:93d1 with SMTP id
 wy7-20020a170906fe0700b008790ab393d1mr23857724ejb.4.1678237913083; 
 Tue, 07 Mar 2023 17:11:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+hOqN4vZtzLCutyLIZpQTWSg7ygTcUCGT/RdEoJV8ESEimJ1bOxss1zIxQzWsxx852s4+Vsw==
X-Received: by 2002:a17:906:fe07:b0:879:ab3:93d1 with SMTP id
 wy7-20020a170906fe0700b008790ab393d1mr23857710ejb.4.1678237912772; 
 Tue, 07 Mar 2023 17:11:52 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 q2-20020a1709060e4200b009140707b475sm2542433eji.33.2023.03.07.17.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:52 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 20/73] vdpa: add vdpa net migration state notifier
Message-ID: <6949843046b6f9c4c6cd28922d5427a17414dfc9.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

This allows net to restart the device backend to configure SVQ on it.

Ideally, these changes should not be net specific and they could be done
in:
* vhost_vdpa_set_features (with VHOST_F_LOG_ALL)
* vhost_vdpa_set_vring_addr (with .enable_log)
* vhost_vdpa_set_log_base.

However, the vdpa net backend is the one with enough knowledge to
configure everything because of some reasons:
* Queues might need to be shadowed or not depending on its kind (control
  vs data).
* Queues need to share the same map translations (iova tree).

Also, there are other problems that may have solutions but complicates
the implementation at this stage:
* We're basically duplicating vhost_dev_start and vhost_dev_stop, and
  they could go out of sync.  If we want to reuse them, we need a way to
  skip some function calls to avoid recursiveness (either vhost_ops ->
  vhost_set_features, vhost_set_vring_addr, ...).
* We need to traverse all vhost_dev of a given net device twice: one to
  stop and get the vq state and another one after the reset to
  configure properties like address, fd, etc.

Because of that it is cleaner to restart the whole net backend and
configure again as expected, similar to how vhost-kernel moves between
userspace and passthrough.

If more kinds of devices need dynamic switching to SVQ we can:
* Create a callback struct like VhostOps and move most of the code
  there.  VhostOps cannot be reused since all vdpa backend share them,
  and to personalize just for networking would be too heavy.
* Add a parent struct or link all the vhost_vdpa or vhost_dev structs so
  we can traverse them.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20230303172445.1089785-9-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 3 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index d195f48776..167b43679d 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -26,12 +26,15 @@
 #include <err.h>
 #include "standard-headers/linux/virtio_net.h"
 #include "monitor/monitor.h"
+#include "migration/migration.h"
+#include "migration/misc.h"
 #include "hw/virtio/vhost.h"
 
 /* Todo:need to add the multiqueue support here */
 typedef struct VhostVDPAState {
     NetClientState nc;
     struct vhost_vdpa vhost_vdpa;
+    Notifier migration_state;
     VHostNetState *vhost_net;
 
     /* Control commands shadow buffers */
@@ -239,10 +242,59 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
     return DO_UPCAST(VhostVDPAState, nc, nc0);
 }
 
+static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bool enable)
+{
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+    VirtIONet *n;
+    VirtIODevice *vdev;
+    int data_queue_pairs, cvq, r;
+
+    /* We are only called on the first data vqs and only if x-svq is not set */
+    if (s->vhost_vdpa.shadow_vqs_enabled == enable) {
+        return;
+    }
+
+    vdev = v->dev->vdev;
+    n = VIRTIO_NET(vdev);
+    if (!n->vhost_started) {
+        return;
+    }
+
+    data_queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
+    cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
+                                  n->max_ncs - n->max_queue_pairs : 0;
+    /*
+     * TODO: vhost_net_stop does suspend, get_base and reset. We can be smarter
+     * in the future and resume the device if read-only operations between
+     * suspend and reset goes wrong.
+     */
+    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
+
+    /* Start will check migration setup_or_active to configure or not SVQ */
+    r = vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
+    if (unlikely(r < 0)) {
+        error_report("unable to start vhost net: %s(%d)", g_strerror(-r), -r);
+    }
+}
+
+static void vdpa_net_migration_state_notifier(Notifier *notifier, void *data)
+{
+    MigrationState *migration = data;
+    VhostVDPAState *s = container_of(notifier, VhostVDPAState,
+                                     migration_state);
+
+    if (migration_in_setup(migration)) {
+        vhost_vdpa_net_log_global_enable(s, true);
+    } else if (migration_has_failed(migration)) {
+        vhost_vdpa_net_log_global_enable(s, false);
+    }
+}
+
 static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
 {
     struct vhost_vdpa *v = &s->vhost_vdpa;
 
+    add_migration_state_change_notifier(&s->migration_state);
     if (v->shadow_vqs_enabled) {
         v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
                                            v->iova_range.last);
@@ -256,6 +308,15 @@ static int vhost_vdpa_net_data_start(NetClientState *nc)
 
     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
 
+    if (s->always_svq ||
+        migration_is_setup_or_active(migrate_get_current()->state)) {
+        v->shadow_vqs_enabled = true;
+        v->shadow_data = true;
+    } else {
+        v->shadow_vqs_enabled = false;
+        v->shadow_data = false;
+    }
+
     if (v->index == 0) {
         vhost_vdpa_net_data_start_first(s);
         return 0;
@@ -276,6 +337,10 @@ static void vhost_vdpa_net_client_stop(NetClientState *nc)
 
     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
 
+    if (s->vhost_vdpa.index == 0) {
+        remove_migration_state_change_notifier(&s->migration_state);
+    }
+
     dev = s->vhost_vdpa.dev;
     if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
         g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
@@ -412,11 +477,12 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
     s = DO_UPCAST(VhostVDPAState, nc, nc);
     v = &s->vhost_vdpa;
 
-    v->shadow_data = s->always_svq;
+    s0 = vhost_vdpa_net_first_nc_vdpa(s);
+    v->shadow_data = s0->vhost_vdpa.shadow_vqs_enabled;
     v->shadow_vqs_enabled = s->always_svq;
     s->vhost_vdpa.address_space_id = VHOST_VDPA_GUEST_PA_ASID;
 
-    if (s->always_svq) {
+    if (s->vhost_vdpa.shadow_data) {
         /* SVQ is already configured for all virtqueues */
         goto out;
     }
@@ -473,7 +539,6 @@ out:
         return 0;
     }
 
-    s0 = vhost_vdpa_net_first_nc_vdpa(s);
     if (s0->vhost_vdpa.iova_tree) {
         /*
          * SVQ is already configured for all virtqueues.  Reuse IOVA tree for
@@ -749,6 +814,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
     s->always_svq = svq;
+    s->migration_state.notify = vdpa_net_migration_state_notifier;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_range = iova_range;
     s->vhost_vdpa.shadow_data = svq;
-- 
MST


