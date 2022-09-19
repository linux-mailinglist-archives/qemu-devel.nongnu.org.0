Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235845BC5DA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 11:55:39 +0200 (CEST)
Received: from localhost ([::1]:35964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaDV4-0003kL-5p
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 05:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuhaiwei9699@126.com>)
 id 1oaDFd-00020D-1L
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 05:39:41 -0400
Received: from mail-m965.mail.126.com ([123.126.96.5]:19283)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuhaiwei9699@126.com>) id 1oaDFX-000638-Ix
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 05:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=00hl9
 D08ZISikC/fUczMKxe8Q7kArn40jKDvq+tLqjM=; b=XsQsEk2UARLaq1Z6ecTXD
 r5kTj0/JvA0gN0BSNRlkREb7zDKtU7fVmNvlc5+Z8hUry8SZe/2ah8DOFteszb9g
 QELCThRnRPIX4umlwzOE55nH/mjL6YaqkcSaF/wz0+r2XmEcopPr25vFVTI+Q9hi
 /SoR/Bcvd+sWEAmkQJVOUU=
Received: from localhost.localdomain (unknown [60.208.111.213])
 by smtp10 (Coremail) with SMTP id NuRpCgDHxTXKOChjF9JvCA--.62199S4;
 Mon, 19 Sep 2022 17:39:28 +0800 (CST)
From: liuhaiwei <liuhaiwei9699@126.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	jasowang@redhat.com,
	liuhaiwei <liuhaiwei9699@126.com>
Subject: [PATCH 3/3] virtio-net: set the max of queue size to 4096
Date: Mon, 19 Sep 2022 05:39:15 -0400
Message-Id: <20220919093915.33003-3-liuhaiwei9699@126.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220919093915.33003-1-liuhaiwei9699@126.com>
References: <20220919093915.33003-1-liuhaiwei9699@126.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgDHxTXKOChjF9JvCA--.62199S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF4xuw4ktFyDXw48tFyxZrb_yoW8CF4Dp3
 4DCanYgr18Kr4fAayrKF1vgrWUur1DW3ZrW34Sqw1DKFn7trn8Xw1UCr4UWFWxGFs5J3yx
 GrW0qay8tw1DurJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jqYL9UUUUU=
X-Originating-IP: [60.208.111.213]
X-CM-SenderInfo: xolxxt5lzhxmqwzzqiyswou0bp/1tbizhCB1l8RP2e1DQAAsn
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

Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>
---
 hw/net/virtio-net.c | 8 ++++----
 hw/virtio/virtio.c  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index d63ef24e6a..df16995146 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3479,23 +3479,23 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
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
+                   VIRTIO_NET_VQ_MAX_SIZE);
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
+                   VIRTIO_NET_VQ_MAX_SIZE );
         virtio_cleanup(vdev);
         return;
     }
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index d93c20d747..2f0c99e357 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2427,7 +2427,7 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
             break;
     }
 
-    if (i == VIRTIO_QUEUE_MAX || queue_size > VIRTQUEUE_MAX_SIZE)
+    if (i == VIRTIO_QUEUE_MAX )
         abort();
 
     vdev->vq[i].vring.num = queue_size;
-- 
2.27.0


