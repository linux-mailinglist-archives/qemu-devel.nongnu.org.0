Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B084CB088
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:01:19 +0100 (CET)
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPW62-0000mj-Jd
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:01:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPVfK-0000lQ-CK
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:33:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPVfI-0002RJ-Kb
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646253220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7xhHAz8H2z8ce9iGEbnF/7PMWeA3Wh8JqwljJZbJ+2A=;
 b=CPk/gHX6zbBtYkcOokB9RYXegSIquJ6e8ehyv9yDc4gZB9b3cbD6j94jEjzmOTmXFkAEqd
 962uNRsGr5c4NNAAwKq0a5vomGX8Zch/MWxb7Rjfwyvjz6TAV1G8qRtzL6905107J7xosI
 7yvC2DXu0DHyUrTgtnSXyQpd7JaDUOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-4so_3gxVPx-xH9krI04ffQ-1; Wed, 02 Mar 2022 15:33:34 -0500
X-MC-Unique: 4so_3gxVPx-xH9krI04ffQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0013E1854E21;
 Wed,  2 Mar 2022 20:33:33 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 976DD646A4;
 Wed,  2 Mar 2022 20:32:55 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/14] vdpa: Add x-svq to NetdevVhostVDPAOptions
Date: Wed,  2 Mar 2022 21:30:12 +0100
Message-Id: <20220302203012.3476835-15-eperezma@redhat.com>
In-Reply-To: <20220302203012.3476835-1-eperezma@redhat.com>
References: <20220302203012.3476835-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, virtualization@lists.linux-foundation.org,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finally offering the possibility to enable SVQ from the command line.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 qapi/net.json    |  5 ++++-
 net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/qapi/net.json b/qapi/net.json
index 7fab2e7cd8..d243701527 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -445,12 +445,15 @@
 # @queues: number of queues to be created for multiqueue vhost-vdpa
 #          (default: 1)
 #
+# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.0)
+#
 # Since: 5.1
 ##
 { 'struct': 'NetdevVhostVDPAOptions',
   'data': {
     '*vhostdev':     'str',
-    '*queues':       'int' } }
+    '*queues':       'int',
+    '*x-svq':        'bool' } }
 
 ##
 # @NetClientDriver:
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1e9fe47c03..def738998b 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -127,7 +127,11 @@ err_init:
 static void vhost_vdpa_cleanup(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_dev *dev = s->vhost_vdpa.dev;
 
+    if (dev && dev->vq_index + dev->nvqs == dev->vq_index_end) {
+        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
+    }
     if (s->vhost_net) {
         vhost_net_cleanup(s->vhost_net);
         g_free(s->vhost_net);
@@ -187,13 +191,23 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
+static int vhost_vdpa_get_iova_range(int fd,
+                                     struct vhost_vdpa_iova_range *iova_range)
+{
+    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
+
+    return ret < 0 ? -errno : 0;
+}
+
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
-                                           const char *device,
-                                           const char *name,
-                                           int vdpa_device_fd,
-                                           int queue_pair_index,
-                                           int nvqs,
-                                           bool is_datapath)
+                                       const char *device,
+                                       const char *name,
+                                       int vdpa_device_fd,
+                                       int queue_pair_index,
+                                       int nvqs,
+                                       bool is_datapath,
+                                       bool svq,
+                                       VhostIOVATree *iova_tree)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
@@ -211,6 +225,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
+    s->vhost_vdpa.shadow_vqs_enabled = svq;
+    s->vhost_vdpa.iova_tree = iova_tree;
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
         qemu_del_net_client(nc);
@@ -266,6 +282,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     g_autofree NetClientState **ncs = NULL;
     NetClientState *nc;
     int queue_pairs, i, has_cvq = 0;
+    g_autoptr(VhostIOVATree) iova_tree = NULL;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -285,29 +302,44 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         qemu_close(vdpa_device_fd);
         return queue_pairs;
     }
+    if (opts->x_svq) {
+        struct vhost_vdpa_iova_range iova_range;
+
+        if (has_cvq) {
+            error_setg(errp, "vdpa svq does not work with cvq");
+            goto err_svq;
+        }
+        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
+        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
+    }
 
     ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
 
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                     vdpa_device_fd, i, 2, true);
+                                     vdpa_device_fd, i, 2, true, opts->x_svq,
+                                     iova_tree);
         if (!ncs[i])
             goto err;
     }
 
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                 vdpa_device_fd, i, 1, false);
+                                 vdpa_device_fd, i, 1, false, opts->x_svq,
+                                 iova_tree);
         if (!nc)
             goto err;
     }
 
+    iova_tree = NULL;
     return 0;
 
 err:
     if (i) {
         qemu_del_net_client(ncs[0]);
     }
+
+err_svq:
     qemu_close(vdpa_device_fd);
 
     return -1;
-- 
2.27.0


