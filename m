Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6315BC5A1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 11:43:17 +0200 (CEST)
Received: from localhost ([::1]:44936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaDJ5-0005gU-HO
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 05:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuhaiwei9699@126.com>)
 id 1oaDFc-00020F-On
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 05:39:40 -0400
Received: from mail-m965.mail.126.com ([123.126.96.5]:19143)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuhaiwei9699@126.com>) id 1oaDFY-00062o-5D
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 05:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4cCWX
 W5haRHxMsZqRmcV+pJKGunp/LpeQDh6CPHuUdw=; b=DYxn6e1NPVPTgVSZHzLMc
 Wp1TwmBjmtmJ+0uOxiChkXUCTXZQBzuHEezAb+ad+Wv1PmArzp1MCHFdFw+VRBAv
 5WOzguAGp0LQhcYhyx+/VBAjvroq1wS0KA4gm8qf4saUC8UO8cV8GIDUQqMtPJAE
 6oAv0pJtJRScZ3iQehb4os=
Received: from localhost.localdomain (unknown [60.208.111.213])
 by smtp10 (Coremail) with SMTP id NuRpCgDHxTXKOChjF9JvCA--.62199S3;
 Mon, 19 Sep 2022 17:39:26 +0800 (CST)
From: liuhaiwei <liuhaiwei9699@126.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	jasowang@redhat.com,
	liuhaiwei <liuhaiwei9699@126.com>
Subject: [PATCH 2/3] virtio-net: update the default and max of rx/tx_queue_size
Date: Mon, 19 Sep 2022 05:39:14 -0400
Message-Id: <20220919093915.33003-2-liuhaiwei9699@126.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220919093915.33003-1-liuhaiwei9699@126.com>
References: <20220919093915.33003-1-liuhaiwei9699@126.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgDHxTXKOChjF9JvCA--.62199S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFWxGw1ruF4fJw1DGFW7Jwb_yoWrJF1xp3
 4DJFyvvrn7Kr1fta93trn8J3yrur18K3ZrWr1agryvk3WkWr1DXw4UGFW5KrW8tFs5t3y8
 GrsYqay8W34UZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j3dbbUUUUU=
X-Originating-IP: [60.208.111.213]
X-CM-SenderInfo: xolxxt5lzhxmqwzzqiyswou0bp/1tbi2gyB1luwMwvQswABsw
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

Set the max of tx_queue_size to 4096 even if the backends
are not vhost-user.

Set the default of rx/tx_queue_size to 2048 if the backends
are vhost-user, otherwise to 4096.

Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>
---
 hw/net/virtio-net.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index dd0d056fde..d63ef24e6a 100644
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
 
@@ -593,6 +592,28 @@ static int peer_has_ufo(VirtIONet *n)
 
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
 
@@ -3450,6 +3471,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
 
     virtio_net_set_config_size(n, n->host_features);
     virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
+    virtio_net_set_default_queue_size(n);
 
     /*
      * We set a lower limit on RX queue size to what it always was.
@@ -3750,10 +3772,8 @@ static Property virtio_net_properties[] = {
                        TX_TIMER_INTERVAL),
     DEFINE_PROP_INT32("x-txburst", VirtIONet, net_conf.txburst, TX_BURST),
     DEFINE_PROP_STRING("tx", VirtIONet, net_conf.tx),
-    DEFINE_PROP_UINT16("rx_queue_size", VirtIONet, net_conf.rx_queue_size,
-                       VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE),
-    DEFINE_PROP_UINT16("tx_queue_size", VirtIONet, net_conf.tx_queue_size,
-                       VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE),
+    DEFINE_PROP_UINT16("rx_queue_size", VirtIONet, net_conf.rx_queue_size, 0),
+    DEFINE_PROP_UINT16("tx_queue_size", VirtIONet, net_conf.tx_queue_size, 0),
     DEFINE_PROP_UINT16("host_mtu", VirtIONet, net_conf.mtu, 0),
     DEFINE_PROP_BOOL("x-mtu-bypass-backend", VirtIONet, mtu_bypass_backend,
                      true),
-- 
2.27.0


