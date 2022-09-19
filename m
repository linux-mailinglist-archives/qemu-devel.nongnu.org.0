Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7C05BCBDC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 14:34:20 +0200 (CEST)
Received: from localhost ([::1]:44702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaFyc-0006Qq-VP
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 08:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuhaiwei9699@126.com>)
 id 1oaFtD-000252-TX
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:28:44 -0400
Received: from mail-m965.mail.126.com ([123.126.96.5]:57846)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuhaiwei9699@126.com>) id 1oaFt8-0005CG-Oi
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=IllWk
 RQ4x6aAU4fb3oe9rqTwTvLLwjReNkx0dTL13kQ=; b=cnadqVrBCLsphYhic9zQn
 JbThNxHaFKEZY1cMJWSJnZ9fI3NsUHRN9sO2WmmQHDNnTGgjx6lt5kh4gndZG0Nn
 Qw89ituBP7wowW/lBGrqNQOC8S0AdigDHssXiIqYvenGvuzeF/JT57XJeIeO8/M7
 Nq/htlNOXpXb4CNw1S2cmQ=
Received: from localhost.localdomain (unknown [60.208.111.213])
 by smtp10 (Coremail) with SMTP id NuRpCgCnqDhsYChjoCJ5CA--.65147S2;
 Mon, 19 Sep 2022 20:28:30 +0800 (CST)
From: liuhaiwei <liuhaiwei9699@126.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	jasowang@redhat.com,
	liuhaiwei <liuhaiwei9699@126.com>
Subject: [PATCH] virtio-net: set the max of queue size to 4096 according to
 the virtio specs, The maximum Queue Size value is 32768 :
 https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-240006
Date: Mon, 19 Sep 2022 08:28:22 -0400
Message-Id: <20220919122822.1928748-1-liuhaiwei9699@126.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgCnqDhsYChjoCJ5CA--.65147S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ww4xGryfWr1DJrW3XF47urg_yoWxJFy5p3
 4DAF9Yvw18Kr4ftayftFnxGry7ur1kG3ZrWryagryqk3WkWrn8Xw1DGFW5GFWxKFs5J3y8
 Gr4vqay0qw1UZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jz0PfUUUUU=
X-Originating-IP: [60.208.111.213]
X-CM-SenderInfo: xolxxt5lzhxmqwzzqiyswou0bp/1tbi7Q6B1lpEAvXeggAAsB
Received-SPF: pass client-ip=123.126.96.5; envelope-from=liuhaiwei9699@126.com;
 helo=mail-m965.mail.126.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the limit of maximum of rx_queue_size and tx_queue to 1024 is so small as to affect our network performance when using the  virtio-net and vhost ,
we cannot set the maximum size beyond 1k.
why not enlarge the maximum size (such as 4096) when using the vhost backend?

Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>
---
 hw/net/virtio-net.c        | 47 +++++++++++++++++++++++++++-----------
 hw/virtio/virtio.c         |  8 +++++--
 include/hw/virtio/virtio.h |  1 +
 3 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index dd0d056fde..4b56484855 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -52,12 +52,11 @@
 #define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
 
 /* previously fixed value */
-#define VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE 256
-#define VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE 256
+#define VIRTIO_NET_VHOST_USER_DEFAULT_SIZE 2048
 
 /* for now, only allow larger queue_pairs; with virtio-1, guest can downsize */
-#define VIRTIO_NET_RX_QUEUE_MIN_SIZE VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE
-#define VIRTIO_NET_TX_QUEUE_MIN_SIZE VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE
+#define VIRTIO_NET_RX_QUEUE_MIN_SIZE 256
+#define VIRTIO_NET_TX_QUEUE_MIN_SIZE 256
 
 #define VIRTIO_NET_IP4_ADDR_SIZE   8        /* ipv4 saddr + daddr */
 
@@ -594,6 +593,28 @@ static int peer_has_ufo(VirtIONet *n)
     return n->has_ufo;
 }
 
+static void virtio_net_set_default_queue_size(VirtIONet *n)
+{
+    NetClientState *peer = n->nic_conf.peers.ncs[0];
+
+    /* Default value is 0 if not set */
+    if (n->net_conf.rx_queue_size == 0) {
+        if (peer && peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
+            n->net_conf.rx_queue_size = VIRTIO_NET_VHOST_USER_DEFAULT_SIZE;
+        } else {
+            n->net_conf.rx_queue_size = VIRTIO_NET_VQ_MAX_SIZE;
+        }
+    }
+
+    if (n->net_conf.tx_queue_size == 0) {
+        if (peer && peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
+            n->net_conf.tx_queue_size = VIRTIO_NET_VHOST_USER_DEFAULT_SIZE;
+        } else {
+            n->net_conf.tx_queue_size = VIRTIO_NET_VQ_MAX_SIZE;
+        }
+    }
+}
+
 static void virtio_net_set_mrg_rx_bufs(VirtIONet *n, int mergeable_rx_bufs,
                                        int version_1, int hash_report)
 {
@@ -633,7 +654,7 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
      * size.
      */
     if (!peer) {
-        return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
+        return VIRTIO_NET_VQ_MAX_SIZE;
     }
 
     switch(peer->info->type) {
@@ -641,7 +662,7 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
     case NET_CLIENT_DRIVER_VHOST_VDPA:
         return VIRTQUEUE_MAX_SIZE;
     default:
-        return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
+        return VIRTIO_NET_VQ_MAX_SIZE;
     };
 }
 
@@ -3450,30 +3471,30 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
 
     virtio_net_set_config_size(n, n->host_features);
     virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
-
+    virtio_net_set_default_queue_size(n);
     /*
      * We set a lower limit on RX queue size to what it always was.
      * Guests that want a smaller ring can always resize it without
      * help from us (using virtio 1 and up).
      */
     if (n->net_conf.rx_queue_size < VIRTIO_NET_RX_QUEUE_MIN_SIZE ||
-        n->net_conf.rx_queue_size > VIRTQUEUE_MAX_SIZE ||
+        n->net_conf.rx_queue_size > VIRTIO_NET_VQ_MAX_SIZE ||
         !is_power_of_2(n->net_conf.rx_queue_size)) {
         error_setg(errp, "Invalid rx_queue_size (= %" PRIu16 "), "
                    "must be a power of 2 between %d and %d.",
                    n->net_conf.rx_queue_size, VIRTIO_NET_RX_QUEUE_MIN_SIZE,
-                   VIRTQUEUE_MAX_SIZE);
+                   VIRTIO_NET_VQ_MAX_SIZE );
         virtio_cleanup(vdev);
         return;
     }
 
     if (n->net_conf.tx_queue_size < VIRTIO_NET_TX_QUEUE_MIN_SIZE ||
-        n->net_conf.tx_queue_size > VIRTQUEUE_MAX_SIZE ||
+        n->net_conf.tx_queue_size > VIRTIO_NET_VQ_MAX_SIZE ||
         !is_power_of_2(n->net_conf.tx_queue_size)) {
         error_setg(errp, "Invalid tx_queue_size (= %" PRIu16 "), "
                    "must be a power of 2 between %d and %d",
                    n->net_conf.tx_queue_size, VIRTIO_NET_TX_QUEUE_MIN_SIZE,
-                   VIRTQUEUE_MAX_SIZE);
+                   VIRTIO_NET_VQ_MAX_SIZE);
         virtio_cleanup(vdev);
         return;
     }
@@ -3751,9 +3772,9 @@ static Property virtio_net_properties[] = {
     DEFINE_PROP_INT32("x-txburst", VirtIONet, net_conf.txburst, TX_BURST),
     DEFINE_PROP_STRING("tx", VirtIONet, net_conf.tx),
     DEFINE_PROP_UINT16("rx_queue_size", VirtIONet, net_conf.rx_queue_size,
-                       VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE),
+                       0),
     DEFINE_PROP_UINT16("tx_queue_size", VirtIONet, net_conf.tx_queue_size,
-                       VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE),
+                       0),
     DEFINE_PROP_UINT16("host_mtu", VirtIONet, net_conf.mtu, 0),
     DEFINE_PROP_BOOL("x-mtu-bypass-backend", VirtIONet, mtu_bypass_backend,
                      true),
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..ad9dfa20e7 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2286,11 +2286,15 @@ void virtio_queue_set_rings(VirtIODevice *vdev, int n, hwaddr desc,
 
 void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
 {
+    int vq_max_size = VIRTQUEUE_MAX_SIZE;
+    if (!strcmp(vdev->name, "virtio-net")) {
+        vq_max_size = VIRTIO_NET_VQ_MAX_SIZE;
+    }
     /* Don't allow guest to flip queue between existent and
      * nonexistent states, or to set it to an invalid size.
      */
     if (!!num != !!vdev->vq[n].vring.num ||
-        num > VIRTQUEUE_MAX_SIZE ||
+        num > vq_max_size ||
         num < 0) {
         return;
     }
@@ -2423,7 +2427,7 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
             break;
     }
 
-    if (i == VIRTIO_QUEUE_MAX || queue_size > VIRTQUEUE_MAX_SIZE)
+    if (i == VIRTIO_QUEUE_MAX )
         abort();
 
     vdev->vq[i].vring.num = queue_size;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..1f4d2eb5d7 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -50,6 +50,7 @@ size_t virtio_feature_get_config_size(const VirtIOFeature *features,
 typedef struct VirtQueue VirtQueue;
 
 #define VIRTQUEUE_MAX_SIZE 1024
+#define VIRTIO_NET_VQ_MAX_SIZE (4096)
 
 typedef struct VirtQueueElement
 {
-- 
2.27.0


