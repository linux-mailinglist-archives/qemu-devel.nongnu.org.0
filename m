Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B075A5A269C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 13:09:52 +0200 (CEST)
Received: from localhost ([::1]:55104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRXDj-0006aG-7x
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 07:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oRX0z-0002el-HD
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:56:41 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:51830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oRX0q-00016N-R6
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:56:35 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VNIuqEt_1661511382; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VNIuqEt_1661511382) by smtp.aliyun-inc.com;
 Fri, 26 Aug 2022 18:56:23 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, arei.gonglei@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH 2/8] net: virtio: rename vhost_set_vring_enable to
 vhost_set_dev_enable
Date: Fri, 26 Aug 2022 18:56:14 +0800
Message-Id: <f5fafe22e9bee6e43597eb20500e9c5033920643.1661510725.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1661510725.git.kangjie.xu@linux.alibaba.com>
References: <cover.1661510725.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.42;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-42.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

Previously, vhost_set_vring_enable will enable/disable all vrings
in a device, which causes ambiguity. So we rename it to
vhost_set_dev_enable.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 backends/cryptodev-vhost.c        | 12 ++++++------
 hw/net/vhost_net-stub.c           |  2 +-
 hw/net/vhost_net.c                |  8 ++++----
 hw/net/virtio-net.c               |  4 ++--
 hw/virtio/vhost-user.c            |  4 ++--
 include/hw/virtio/vhost-backend.h |  6 +++---
 include/net/vhost_net.h           |  2 +-
 7 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/backends/cryptodev-vhost.c b/backends/cryptodev-vhost.c
index bc13e466b4..b83e939760 100644
--- a/backends/cryptodev-vhost.c
+++ b/backends/cryptodev-vhost.c
@@ -147,9 +147,9 @@ cryptodev_vhost_set_vq_index(CryptoDevBackendVhost *crypto,
 }
 
 static int
-vhost_set_vring_enable(CryptoDevBackendClient *cc,
-                            CryptoDevBackend *b,
-                            uint16_t queue, int enable)
+vhost_set_dev_enable(CryptoDevBackendClient *cc,
+                     CryptoDevBackend *b,
+                     uint16_t queue, int enable)
 {
     CryptoDevBackendVhost *crypto =
                        cryptodev_get_vhost(cc, b, queue);
@@ -162,8 +162,8 @@ vhost_set_vring_enable(CryptoDevBackendClient *cc,
     }
 
     vhost_ops = crypto->dev.vhost_ops;
-    if (vhost_ops->vhost_set_vring_enable) {
-        return vhost_ops->vhost_set_vring_enable(&crypto->dev, enable);
+    if (vhost_ops->vhost_set_dev_enable) {
+        return vhost_ops->vhost_set_dev_enable(&crypto->dev, enable);
     }
 
     return 0;
@@ -219,7 +219,7 @@ int cryptodev_vhost_start(VirtIODevice *dev, int total_queues)
 
         if (cc->vring_enable) {
             /* restore vring enable state */
-            r = vhost_set_vring_enable(cc, b, i, cc->vring_enable);
+            r = vhost_set_dev_enable(cc, b, i, cc->vring_enable);
 
             if (r < 0) {
                 goto err_start;
diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
index 89d71cfb8e..ac5f217dc1 100644
--- a/hw/net/vhost_net-stub.c
+++ b/hw/net/vhost_net-stub.c
@@ -92,7 +92,7 @@ VHostNetState *get_vhost_net(NetClientState *nc)
     return 0;
 }
 
-int vhost_set_vring_enable(NetClientState *nc, int enable)
+int vhost_set_dev_enable(NetClientState *nc, int enable)
 {
     return 0;
 }
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 74c5147d6e..c0c1456172 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -379,7 +379,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
 
         if (peer->vring_enable) {
             /* restore vring enable state */
-            r = vhost_set_vring_enable(peer, peer->vring_enable);
+            r = vhost_set_dev_enable(peer, peer->vring_enable);
 
             if (r < 0) {
                 vhost_net_stop_one(get_vhost_net(peer), dev);
@@ -491,15 +491,15 @@ VHostNetState *get_vhost_net(NetClientState *nc)
     return vhost_net;
 }
 
-int vhost_set_vring_enable(NetClientState *nc, int enable)
+int vhost_set_dev_enable(NetClientState *nc, int enable)
 {
     VHostNetState *net = get_vhost_net(nc);
     const VhostOps *vhost_ops = net->dev.vhost_ops;
 
     nc->vring_enable = enable;
 
-    if (vhost_ops && vhost_ops->vhost_set_vring_enable) {
-        return vhost_ops->vhost_set_vring_enable(&net->dev, enable);
+    if (vhost_ops && vhost_ops->vhost_set_dev_enable) {
+        return vhost_ops->vhost_set_dev_enable(&net->dev, enable);
     }
 
     return 0;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 7817206596..6ab796b399 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -696,7 +696,7 @@ static int peer_attach(VirtIONet *n, int index)
     }
 
     if (nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
-        vhost_set_vring_enable(nc->peer, 1);
+        vhost_set_dev_enable(nc->peer, 1);
     }
 
     if (nc->peer->info->type != NET_CLIENT_DRIVER_TAP) {
@@ -719,7 +719,7 @@ static int peer_detach(VirtIONet *n, int index)
     }
 
     if (nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
-        vhost_set_vring_enable(nc->peer, 0);
+        vhost_set_dev_enable(nc->peer, 0);
     }
 
     if (nc->peer->info->type !=  NET_CLIENT_DRIVER_TAP) {
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index bd24741be8..794519359b 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1198,7 +1198,7 @@ static int vhost_user_set_vring_base(struct vhost_dev *dev,
     return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
 }
 
-static int vhost_user_set_vring_enable(struct vhost_dev *dev, int enable)
+static int vhost_user_set_dev_enable(struct vhost_dev *dev, int enable)
 {
     int i;
 
@@ -2627,7 +2627,7 @@ const VhostOps user_ops = {
         .vhost_set_owner = vhost_user_set_owner,
         .vhost_reset_device = vhost_user_reset_device,
         .vhost_get_vq_index = vhost_user_get_vq_index,
-        .vhost_set_vring_enable = vhost_user_set_vring_enable,
+        .vhost_set_dev_enable = vhost_user_set_dev_enable,
         .vhost_requires_shm_log = vhost_user_requires_shm_log,
         .vhost_migration_done = vhost_user_migration_done,
         .vhost_backend_can_merge = vhost_user_can_merge,
diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index eab46d7f0b..b49432045f 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -81,8 +81,8 @@ typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
 typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
 typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
 typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
-typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
-                                         int enable);
+typedef int (*vhost_set_dev_enable_op)(struct vhost_dev *dev,
+                                       int enable);
 typedef bool (*vhost_requires_shm_log_op)(struct vhost_dev *dev);
 typedef int (*vhost_migration_done_op)(struct vhost_dev *dev,
                                        char *mac_addr);
@@ -155,7 +155,7 @@ typedef struct VhostOps {
     vhost_set_owner_op vhost_set_owner;
     vhost_reset_device_op vhost_reset_device;
     vhost_get_vq_index_op vhost_get_vq_index;
-    vhost_set_vring_enable_op vhost_set_vring_enable;
+    vhost_set_dev_enable_op vhost_set_dev_enable;
     vhost_requires_shm_log_op vhost_requires_shm_log;
     vhost_migration_done_op vhost_migration_done;
     vhost_backend_can_merge_op vhost_backend_can_merge;
diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 40b9a40074..22a1fcd39e 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -42,7 +42,7 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
 int vhost_net_notify_migration_done(VHostNetState *net, char* mac_addr);
 VHostNetState *get_vhost_net(NetClientState *nc);
 
-int vhost_set_vring_enable(NetClientState * nc, int enable);
+int vhost_set_dev_enable(NetClientState *nc, int enable);
 
 uint64_t vhost_net_get_acked_features(VHostNetState *net);
 
-- 
2.32.0


