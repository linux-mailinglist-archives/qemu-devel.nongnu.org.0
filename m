Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9202D4ED15E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 03:42:35 +0200 (CEST)
Received: from localhost ([::1]:45126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZjpa-0004qy-Lr
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 21:42:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1nZjo4-00043b-GW
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 21:41:00 -0400
Received: from smtpbg123.qq.com ([175.27.65.52]:65231 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1nZjnz-0006VY-Fw
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 21:40:58 -0400
X-QQ-mid: bizesmtp63t1648690780t7hd4bgx
Received: from [10.25.2.237] ( [222.190.105.194])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 31 Mar 2022 09:39:39 +0800 (CST)
X-QQ-SSF: 01000000000000502000B00A0000000
X-QQ-FEAT: aP2oNmVYkM97276gGhg9Jy+x2UrLdpWj6zxYVWjs1/nCH4JunpOKahFNfkdKJ
 /KMNalRHNjZ3vzHn8Xr3ldLwFnEf9o/IhElZb85XKQN4ypmBDBH64yELBZpyZdEIsf4guCs
 TVX86G/EXD/v2YfOKTV+1SbzoCgtPfwTra/157cJtaGOep0eXkryGcFSERoEnPGA2c9E96o
 Ta6ccSt3ESL6/qCPAdxCaPCHTNwKCgXrQIuRmFstrLOd5BJlo8BUzncAJ9cC8AIM6pXdTQs
 IdjDuAQyHWXdLdiRAs3uR3/jKnedeLPEg2nc0C4Oh9z/2avd0JjOZ/xFG8i2qzp2BpMQ==
X-QQ-GoodBg: 0
Message-ID: <7221a374-6887-9053-0be5-bfb5c56306a7@archeros.com>+14DB5E87DCA8D6D0
Date: Thu, 31 Mar 2022 09:39:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] vdpa: reset the backend device in stage of stop last
 vhost device
To: "Michael S. Tsirkin" <mst@redhat.com>, 08005325@163.com
References: <1648024966-5170-1-git-send-email-08005325@163.com>
 <1648634561-12504-1-git-send-email-08005325@163.com>
 <20220330065216-mutt-send-email-mst@kernel.org>
From: Michael Qiu <qiudayu@archeros.com>
In-Reply-To: <20220330065216-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:archeros.com:qybgspam:qybgspam8
Received-SPF: none client-ip=175.27.65.52; envelope-from=qiudayu@archeros.com;
 helo=smtpbg.qq.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 INVALID_MSGID=0.568, KHOP_HELO_FCRDNS=0.187, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lulu@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 eperezma@redhat.com, si-wei.liu@oracle.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael,

Others has already received the patch, don't know why. Anyway, I will 
repost another version(V3).

Here is the V2 patch, see below:

From: Michael Qiu <qiudayu@archeros.com>

Currently, when VM poweroff, it will trigger vdpa
device(such as mlx bluefield2 VF) reset many times(with 1 datapath
queue pair and one control queue, triggered 3 times), this
leads to below issue:

vhost VQ 2 ring restore failed: -22: Invalid argument (22)

This because in vhost_net_stop(), it will stop all vhost device bind to
this virtio device, and in vhost_dev_stop(), qemu tries to stop the device
, then stop the queue: vhost_virtqueue_stop().

In vhost_dev_stop(), it resets the device, which clear some flags
in low level driver, and in next loop(stop other vhost backends),
qemu try to stop the queue corresponding to the vhost backend,
  the driver finds that the VQ is invalied, this is the root cause.

To solve the issue, vdpa should set vring unready, and
remove reset ops in device stop: vhost_dev_start(hdev, false).

and implement a new function vhost_dev_reset, only reset backend
device when the last vhost stop triggerd.

Signed-off-by: Michael Qiu<qiudayu@archeros.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
v2 --> v1:
    implement a new function vhost_dev_reset,
    reset the backend kernel device at last.

---
  hw/net/vhost_net.c        | 22 +++++++++++++++++++---
  hw/virtio/vhost-vdpa.c    |  8 ++++----
  hw/virtio/vhost.c         | 16 +++++++++++++++-
  include/hw/virtio/vhost.h |  1 +
  4 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 30379d2..3cdf6a4 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -299,7 +299,7 @@ fail_notifiers:
  }

  static void vhost_net_stop_one(struct vhost_net *net,
-                               VirtIODevice *dev)
+                               VirtIODevice *dev, bool reset)
  {
      struct vhost_vring_file file = { .fd = -1 };

@@ -313,6 +313,11 @@ static void vhost_net_stop_one(struct vhost_net *net,
          net->nc->info->poll(net->nc, true);
      }
      vhost_dev_stop(&net->dev, dev);
+
+    if (reset) {
+        vhost_dev_reset(&net->dev);
+    }
+
      vhost_dev_disable_notifiers(&net->dev, dev);
  }

@@ -391,7 +396,12 @@ int vhost_net_start(VirtIODevice *dev, 
NetClientState *ncs,
  err_start:
      while (--i >= 0) {
          peer = qemu_get_peer(ncs , i);
-        vhost_net_stop_one(get_vhost_net(peer), dev);
+
+        if (i == 0) {
+            vhost_net_stop_one(get_vhost_net(peer), dev, true);
+        } else {
+            vhost_net_stop_one(get_vhost_net(peer), dev, false);
+        }
      }
      e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
      if (e < 0) {
@@ -420,7 +430,13 @@ void vhost_net_stop(VirtIODevice *dev, 
NetClientState *ncs,
          } else {
              peer = qemu_get_peer(ncs, n->max_queue_pairs);
          }
-        vhost_net_stop_one(get_vhost_net(peer), dev);
+
+        /* We only reset backend device during the last vhost */
+        if (i == nvhosts - 1) {
+            vhost_net_stop_one(get_vhost_net(peer), dev, true);
+        } else {
+            vhost_net_stop_one(get_vhost_net(peer), dev, false);
+        }
      }

      r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c5ed7a3..d858b4f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -719,14 +719,14 @@ static int vhost_vdpa_get_vq_index(struct 
vhost_dev *dev, int idx)
      return idx;
  }

-static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
+static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned 
int ready)
  {
      int i;
      trace_vhost_vdpa_set_vring_ready(dev);
      for (i = 0; i < dev->nvqs; ++i) {
          struct vhost_vring_state state = {
              .index = dev->vq_index + i,
-            .num = 1,
+            .num = ready,
          };
          vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
      }
@@ -1088,8 +1088,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev 
*dev, bool started)
          if (unlikely(!ok)) {
              return -1;
          }
-        vhost_vdpa_set_vring_ready(dev);
+        vhost_vdpa_set_vring_ready(dev, 1);
      } else {
+        vhost_vdpa_set_vring_ready(dev, 0);
          ok = vhost_vdpa_svqs_stop(dev);
          if (unlikely(!ok)) {
              return -1;
@@ -1105,7 +1106,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev 
*dev, bool started)
          memory_listener_register(&v->listener, &address_space_memory);
          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
      } else {
-        vhost_vdpa_reset_device(dev);
          vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                     VIRTIO_CONFIG_S_DRIVER);
          memory_listener_unregister(&v->listener);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index b643f42..6d9b4a3 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1820,7 +1820,7 @@ fail_features:
  void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
  {
      int i;
-
+    printf("vhost_dev_stop test\n");
      /* should only be called after backend is connected */
      assert(hdev->vhost_ops);

@@ -1854,3 +1854,17 @@ int vhost_net_set_backend(struct vhost_dev *hdev,

      return -ENOSYS;
  }
+
+int vhost_dev_reset(struct vhost_dev *hdev)
+{
+    int ret = 0;
+
+    /* should only be called after backend is connected */
+    assert(hdev->vhost_ops);
+
+    if (hdev->vhost_ops->vhost_reset_device) {
+        ret = hdev->vhost_ops->vhost_reset_device(hdev);
+    }
+
+    return ret;
+}
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 58a73e7..b8b7c20 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
  void vhost_dev_cleanup(struct vhost_dev *hdev);
  int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
  void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
+int vhost_dev_reset(struct vhost_dev *hdev);
  int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice 
*vdev);
  void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice 
*vdev);

-- 
1.8.3.1




On 2022/3/30 18:52, Michael S. Tsirkin wrote:
> On Wed, Mar 30, 2022 at 06:02:41AM -0400, 08005325@163.com wrote:
> 
> It's an empty patch.
> 

