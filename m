Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F63422DEC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:26:26 +0200 (CEST)
Received: from localhost ([::1]:41362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnGr-0001kb-Q6
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsY-00007C-In
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsV-0004mJ-P9
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DSyVi0I4imdq55uSunyFJ+6UljUfdU64JGgCSA4aLIE=;
 b=C/W5nxahu49Itmgrge2ue/12OmS1WA1/P6koIgOqHy2yy+5yaXCCsZAdKn8KyuiYFu4xgS
 7LbAis+Q5Q5rWPhvI1ftTobGs3FyLWk3xV7a8v0XM3vpFQw6xdpHISHLQB8f+f6STEvfga
 kW9Xt/8RA2oM/z53QKVE1inQ0wvR+Xk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-L8u39Q9KNRWy8vyoCHiH2Q-1; Tue, 05 Oct 2021 12:01:13 -0400
X-MC-Unique: L8u39Q9KNRWy8vyoCHiH2Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so1215162wmj.6
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DSyVi0I4imdq55uSunyFJ+6UljUfdU64JGgCSA4aLIE=;
 b=pdBV7ci6rg46h+sZgFmXTSp+fmMyBKEYWkV2yM0BIaY42f/oAY5uSsNnhXdRrTqVm3
 i60l1YtLQLgkVDBjp+13IieG0ZSDhTrtyMSVrJO6aXrblMXwuEnv24lJH4VvhOpR9Z9p
 0wNcPi5zgkQRW3/gwxNLxSC3iEYDb3VvAcTM5Zlq+A2NjW1ykniMDFZj+gwoFFDalHq1
 wNBU1KczpCicDkwqOFxvhBdUVIirREWQWUTxPnqo9cgj8GO6lM0co8mYFuUSj0PI5GS2
 ea5EuqrYaCiICn8ChTDoXJc59L+sYr4g5gkUSzGRUJVMvv58IdlffiZ2ShYA4GNDoqmr
 OiAg==
X-Gm-Message-State: AOAM532uMEWl0KrrJF1fmaqv7lBI6axRVZRh5Ra7amIoMFMJBCixD2iT
 Xb1xAUtU0LAbOeXPyU4a38smOYDVmQC59xSWmpPU3mbp2ldpPaze8b2TEujFJSJTTPdegxScCpN
 JQSM0VpxpjvLH/iKrsJhf5bbApuHGjquXmu5/UU/4K9SL0h0l4wnLNaNqLmLy
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr22209899wrr.142.1633449672152; 
 Tue, 05 Oct 2021 09:01:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3smtNMHVjaAAhzdQMLOnUNmw7HuBwe+35fjwpI7ymXhDfkZSN2N6JfuoiCaqH4kZ0qPT3jA==
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr22209843wrr.142.1633449671811; 
 Tue, 05 Oct 2021 09:01:11 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id k188sm2371494wme.44.2021.10.05.09.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:11 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/57] vhost-net: control virtqueue support
Message-ID: <20211005155946.513818-9-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

We assume there's no cvq in the past, this is not true when we need
control virtqueue support for vhost-user backends. So this patch
implements the control virtqueue support for vhost-net. As datapath,
the control virtqueue is also required to be coupled with the
NetClientState. The vhost_net_start/stop() are tweaked to accept the
number of datapath queue pairs plus the the number of control
virtqueue for us to start and stop the vhost device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210907090322.1756-7-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/vhost_net.h |  6 ++++--
 hw/net/vhost_net.c      | 43 ++++++++++++++++++++++++++++++-----------
 hw/net/virtio-net.c     |  4 ++--
 3 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index fba40cf695..387e913e4e 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -21,8 +21,10 @@ typedef struct VhostNetOptions {
 uint64_t vhost_net_get_max_queues(VHostNetState *net);
 struct vhost_net *vhost_net_init(VhostNetOptions *options);
 
-int vhost_net_start(VirtIODevice *dev, NetClientState *ncs, int total_queues);
-void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs, int total_queues);
+int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
+                    int data_queue_pairs, int cvq);
+void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
+                    int data_queue_pairs, int cvq);
 
 void vhost_net_cleanup(VHostNetState *net);
 
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 386ec2eaa2..e1e9d1ec89 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -315,11 +315,14 @@ static void vhost_net_stop_one(struct vhost_net *net,
 }
 
 int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
-                    int total_queues)
+                    int data_queue_pairs, int cvq)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
     VirtioBusState *vbus = VIRTIO_BUS(qbus);
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
+    int total_notifiers = data_queue_pairs * 2 + cvq;
+    VirtIONet *n = VIRTIO_NET(dev);
+    int nvhosts = data_queue_pairs + cvq;
     struct vhost_net *net;
     int r, e, i;
     NetClientState *peer;
@@ -329,9 +332,14 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         return -ENOSYS;
     }
 
-    for (i = 0; i < total_queues; i++) {
+    for (i = 0; i < nvhosts; i++) {
+
+        if (i < data_queue_pairs) {
+            peer = qemu_get_peer(ncs, i);
+        } else { /* Control Virtqueue */
+            peer = qemu_get_peer(ncs, n->max_queues);
+        }
 
-        peer = qemu_get_peer(ncs, i);
         net = get_vhost_net(peer);
         vhost_net_set_vq_index(net, i * 2);
 
@@ -344,14 +352,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         }
      }
 
-    r = k->set_guest_notifiers(qbus->parent, total_queues * 2, true);
+    r = k->set_guest_notifiers(qbus->parent, total_notifiers, true);
     if (r < 0) {
         error_report("Error binding guest notifier: %d", -r);
         goto err;
     }
 
-    for (i = 0; i < total_queues; i++) {
-        peer = qemu_get_peer(ncs, i);
+    for (i = 0; i < nvhosts; i++) {
+        if (i < data_queue_pairs) {
+            peer = qemu_get_peer(ncs, i);
+        } else {
+            peer = qemu_get_peer(ncs, n->max_queues);
+        }
         r = vhost_net_start_one(get_vhost_net(peer), dev);
 
         if (r < 0) {
@@ -375,7 +387,7 @@ err_start:
         peer = qemu_get_peer(ncs , i);
         vhost_net_stop_one(get_vhost_net(peer), dev);
     }
-    e = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
+    e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
     if (e < 0) {
         fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
         fflush(stderr);
@@ -385,18 +397,27 @@ err:
 }
 
 void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
-                    int total_queues)
+                    int data_queue_pairs, int cvq)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
     VirtioBusState *vbus = VIRTIO_BUS(qbus);
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
+    VirtIONet *n = VIRTIO_NET(dev);
+    NetClientState *peer;
+    int total_notifiers = data_queue_pairs * 2 + cvq;
+    int nvhosts = data_queue_pairs + cvq;
     int i, r;
 
-    for (i = 0; i < total_queues; i++) {
-        vhost_net_stop_one(get_vhost_net(ncs[i].peer), dev);
+    for (i = 0; i < nvhosts; i++) {
+        if (i < data_queue_pairs) {
+            peer = qemu_get_peer(ncs, i);
+        } else {
+            peer = qemu_get_peer(ncs, n->max_queues);
+        }
+        vhost_net_stop_one(get_vhost_net(peer), dev);
     }
 
-    r = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
+    r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
     if (r < 0) {
         fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", r);
         fflush(stderr);
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f205331dcf..f1119cf0ad 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -285,14 +285,14 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
         }
 
         n->vhost_started = 1;
-        r = vhost_net_start(vdev, n->nic->ncs, queues);
+        r = vhost_net_start(vdev, n->nic->ncs, queues, 0);
         if (r < 0) {
             error_report("unable to start vhost net: %d: "
                          "falling back on userspace virtio", -r);
             n->vhost_started = 0;
         }
     } else {
-        vhost_net_stop(vdev, n->nic->ncs, queues);
+        vhost_net_stop(vdev, n->nic->ncs, queues, 0);
         n->vhost_started = 0;
     }
 }
-- 
MST


