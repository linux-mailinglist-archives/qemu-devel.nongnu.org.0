Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631421298E1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 17:47:02 +0100 (CET)
Received: from localhost ([::1]:58786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijQrE-0000e8-Kc
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 11:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41439)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1ijQmA-0003qr-64
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:41:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1ijQm5-0005R1-W1
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:41:46 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27965
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1ijQm5-0005Qu-QU
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577119301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6Os4L+WBppxRr1+PQZIGTRXnHgagS3ljQ3yg+JHbYs=;
 b=J2eJdFY+swIVo/U6cLwFnd2vwFd44GkxKFmd+h0aVIHCVc/zDwOsdexDyrUBR1aZa2KSKx
 Fp/npEYr6GAXzkQugxqpIYI/2Q6gzedT63Hh6xXBpob0Omujtz12YkdIu0ygeZC0XA2ibi
 1YO76uRpd3vvkkfsnkYAa6vtqHLxpOY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-HQfVqhTiNDGh3gOYCs85aQ-1; Mon, 23 Dec 2019 11:41:37 -0500
Received: by mail-qv1-f72.google.com with SMTP id v3so5880023qvm.2
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 08:41:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sh9NZFodPuDYsX7mh7EXFUKW/sqh5xR67aWfobfmobY=;
 b=g1z8pkVPnPewa/asO/X3ETtfRWct97fX1gLW83PBfzzaDH+XiVWJBVeoXjmcwra9eL
 9vmArKKrSvXybJJC3GS9TUb65Wnaqm0Pr04zIdAR4SZnvCz5CdSDQrVsa7t/eFh0MWZo
 GX5rdXmpoH8Bf+gJPp7xJ5f6Ka3zlmUWljKIfdC/ufKGw8IyQoqv1ZmAonQkHWlz7L/B
 0S2DfAynUxRXUdPfS03vhn+XHAQmiYC6l+odgjJHGOrgeuzFRgCkeGYMsyZSwCePwJpy
 HrbRECSEhE6m6EVy4rSXZWLeI22t2bblY6FkqFgHagh0I48HLFFQqj8OFYEf/S2oE2Jk
 emoQ==
X-Gm-Message-State: APjAAAWmlLFH+wCSpPhojd4DjeAZhijHP4TXpLTolXGj0T4iQXKJz5zG
 +TZCsHZculO+fr61qEufJMDlPeYq8g8mhNyhgBjkrCVGaqFXSD432AxoRUOXAd0Rc5l3o7dvu7I
 PMtZQb7OS+ZhkgAs=
X-Received: by 2002:aed:3287:: with SMTP id z7mr23034201qtd.103.1577119296567; 
 Mon, 23 Dec 2019 08:41:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqzEtDgvoF8U4zs4a3hgPdVxQU1VEJztuSQl4AIHV0zDBj5JL6nnaEjdIOfPQ7Emq1xrqUy41w==
X-Received: by 2002:aed:3287:: with SMTP id z7mr23034175qtd.103.1577119296233; 
 Mon, 23 Dec 2019 08:41:36 -0800 (PST)
Received: from redhat.com (bzq-109-64-31-13.red.bezeqint.net. [109.64.31.13])
 by smtp.gmail.com with ESMTPSA id
 a36sm6391083qtk.29.2019.12.23.08.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 08:41:35 -0800 (PST)
Date: Mon, 23 Dec 2019 11:41:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 08/27] virtio-pci: disable vring processing when
 bus-mastering is disabled
Message-ID: <20191223141536.72682-9-mst@redhat.com>
References: <20191223141536.72682-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191223141536.72682-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: HQfVqhTiNDGh3gOYCs85aQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Roth <mdroth@linux.vnet.ibm.com>

Currently the SLOF firmware for pseries guests will disable/re-enable
a PCI device multiple times via IO/MEM/MASTER bits of PCI_COMMAND
register after the initial probe/feature negotiation, as it tends to
work with a single device at a time at various stages like probing
and running block/network bootloaders without doing a full reset
in-between.

In QEMU, when PCI_COMMAND_MASTER is disabled we disable the
corresponding IOMMU memory region, so DMA accesses (including to vring
fields like idx/flags) will no longer undergo the necessary
translation. Normally we wouldn't expect this to happen since it would
be misbehavior on the driver side to continue driving DMA requests.

However, in the case of pseries, with iommu_platform=3Don, we trigger the
following sequence when tearing down the virtio-blk dataplane ioeventfd
in response to the guest unsetting PCI_COMMAND_MASTER:

  #2  0x0000555555922651 in virtqueue_map_desc (vdev=3Dvdev@entry=3D0x55555=
6dbcfb0, p_num_sg=3Dp_num_sg@entry=3D0x7fffe657e1a8, addr=3Daddr@entry=3D0x=
7fffe657e240, iov=3Diov@entry=3D0x7fffe6580240, max_num_sg=3Dmax_num_sg@ent=
ry=3D1024, is_write=3Dis_write@entry=3Dfalse, pa=3D0, sz=3D0)
      at /home/mdroth/w/qemu.git/hw/virtio/virtio.c:757
  #3  0x0000555555922a89 in virtqueue_pop (vq=3Dvq@entry=3D0x555556dc8660, =
sz=3Dsz@entry=3D184)
      at /home/mdroth/w/qemu.git/hw/virtio/virtio.c:950
  #4  0x00005555558d3eca in virtio_blk_get_request (vq=3D0x555556dc8660, s=
=3D0x555556dbcfb0)
      at /home/mdroth/w/qemu.git/hw/block/virtio-blk.c:255
  #5  0x00005555558d3eca in virtio_blk_handle_vq (s=3D0x555556dbcfb0, vq=3D=
0x555556dc8660)
      at /home/mdroth/w/qemu.git/hw/block/virtio-blk.c:776
  #6  0x000055555591dd66 in virtio_queue_notify_aio_vq (vq=3Dvq@entry=3D0x5=
55556dc8660)
      at /home/mdroth/w/qemu.git/hw/virtio/virtio.c:1550
  #7  0x000055555591ecef in virtio_queue_notify_aio_vq (vq=3D0x555556dc8660=
)
      at /home/mdroth/w/qemu.git/hw/virtio/virtio.c:1546
  #8  0x000055555591ecef in virtio_queue_host_notifier_aio_poll (opaque=3D0=
x555556dc86c8)
      at /home/mdroth/w/qemu.git/hw/virtio/virtio.c:2527
  #9  0x0000555555d02164 in run_poll_handlers_once (ctx=3Dctx@entry=3D0x555=
55688bfc0, timeout=3Dtimeout@entry=3D0x7fffe65844a8)
      at /home/mdroth/w/qemu.git/util/aio-posix.c:520
  #10 0x0000555555d02d1b in try_poll_mode (timeout=3D0x7fffe65844a8, ctx=3D=
0x55555688bfc0)
      at /home/mdroth/w/qemu.git/util/aio-posix.c:607
  #11 0x0000555555d02d1b in aio_poll (ctx=3Dctx@entry=3D0x55555688bfc0, blo=
cking=3Dblocking@entry=3Dtrue)
      at /home/mdroth/w/qemu.git/util/aio-posix.c:639
  #12 0x0000555555d0004d in aio_wait_bh_oneshot (ctx=3D0x55555688bfc0, cb=
=3Dcb@entry=3D0x5555558d5130 <virtio_blk_data_plane_stop_bh>, opaque=3Dopaq=
ue@entry=3D0x555556de86f0)
      at /home/mdroth/w/qemu.git/util/aio-wait.c:71
  #13 0x00005555558d59bf in virtio_blk_data_plane_stop (vdev=3D<optimized o=
ut>)
      at /home/mdroth/w/qemu.git/hw/block/dataplane/virtio-blk.c:288
  #14 0x0000555555b906a1 in virtio_bus_stop_ioeventfd (bus=3Dbus@entry=3D0x=
555556dbcf38)
      at /home/mdroth/w/qemu.git/hw/virtio/virtio-bus.c:245
  #15 0x0000555555b90dbb in virtio_bus_stop_ioeventfd (bus=3Dbus@entry=3D0x=
555556dbcf38)
      at /home/mdroth/w/qemu.git/hw/virtio/virtio-bus.c:237
  #16 0x0000555555b92a8e in virtio_pci_stop_ioeventfd (proxy=3D0x555556db4e=
40)
      at /home/mdroth/w/qemu.git/hw/virtio/virtio-pci.c:292
  #17 0x0000555555b92a8e in virtio_write_config (pci_dev=3D0x555556db4e40, =
address=3D<optimized out>, val=3D1048832, len=3D<optimized out>)
      at /home/mdroth/w/qemu.git/hw/virtio/virtio-pci.c:613

I.e. the calling code is only scheduling a one-shot BH for
virtio_blk_data_plane_stop_bh, but somehow we end up trying to process
an additional virtqueue entry before we get there. This is likely due
to the following check in virtio_queue_host_notifier_aio_poll:

  static bool virtio_queue_host_notifier_aio_poll(void *opaque)
  {
      EventNotifier *n =3D opaque;
      VirtQueue *vq =3D container_of(n, VirtQueue, host_notifier);
      bool progress;

      if (!vq->vring.desc || virtio_queue_empty(vq)) {
          return false;
      }

      progress =3D virtio_queue_notify_aio_vq(vq);

namely the call to virtio_queue_empty(). In this case, since no new
requests have actually been issued, shadow_avail_idx =3D=3D last_avail_idx,
so we actually try to access the vring via vring_avail_idx() to get
the latest non-shadowed idx:

  int virtio_queue_empty(VirtQueue *vq)
  {
      bool empty;
      ...

      if (vq->shadow_avail_idx !=3D vq->last_avail_idx) {
          return 0;
      }

      rcu_read_lock();
      empty =3D vring_avail_idx(vq) =3D=3D vq->last_avail_idx;
      rcu_read_unlock();
      return empty;

but since the IOMMU region has been disabled we get a bogus value (0
usually), which causes virtio_queue_empty() to falsely report that
there are entries to be processed, which causes errors such as:

  "virtio: zero sized buffers are not allowed"

or

  "virtio-blk missing headers"

and puts the device in an error state.

This patch works around the issue by introducing virtio_set_disabled(),
which sets a 'disabled' flag to bypass checks like virtio_queue_empty()
when bus-mastering is disabled. Since we'd check this flag at all the
same sites as vdev->broken, we replace those checks with an inline
function which checks for either vdev->broken or vdev->disabled.

The 'disabled' flag is only migrated when set, which should be fairly
rare, but to maintain migration compatibility we disable it's use for
older machine types. Users requiring the use of the flag in conjunction
with older machine types can set it explicitly as a virtio-device
option.

NOTES:

 - This leaves some other oddities in play, like the fact that
   DRIVER_OK also gets unset in response to bus-mastering being
   disabled, but not restored (however the device seems to continue
   working)
 - Similarly, we disable the host notifier via
   virtio_bus_stop_ioeventfd(), which seems to move the handling out
   of virtio-blk dataplane and back into the main IO thread, and it
   ends up staying there till a reset (but otherwise continues working
   normally)

Cc: David Gibson <david@gibson.dropbear.id.au>,
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-Id: <20191120005003.27035-1-mdroth@linux.vnet.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h | 15 +++++++++++++++
 hw/core/machine.c          |  1 +
 hw/virtio/virtio-pci.c     | 12 ++++++++----
 hw/virtio/virtio.c         | 35 ++++++++++++++++++++++++++++-------
 4 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index e18756d50d..777772475c 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -100,6 +100,8 @@ struct VirtIODevice
     uint16_t device_id;
     bool vm_running;
     bool broken; /* device in invalid state, needs reset */
+    bool use_disabled_flag; /* allow use of 'disable' flag when needed */
+    bool disabled; /* device in temporarily disabled state */
     bool use_started;
     bool started;
     bool start_on_kick; /* when virtio 1.0 feature has not been negotiated=
 */
@@ -380,4 +382,17 @@ static inline void virtio_set_started(VirtIODevice *vd=
ev, bool started)
         vdev->started =3D started;
     }
 }
+
+static inline void virtio_set_disabled(VirtIODevice *vdev, bool disable)
+{
+    if (vdev->use_disabled_flag) {
+        vdev->disabled =3D disable;
+    }
+}
+
+static inline bool virtio_device_disabled(VirtIODevice *vdev)
+{
+    return unlikely(vdev->disabled || vdev->broken);
+}
+
 #endif
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 56137e9bf0..0854dcebdd 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -34,6 +34,7 @@ const size_t hw_compat_4_2_len =3D G_N_ELEMENTS(hw_compat=
_4_2);
=20
 GlobalProperty hw_compat_4_1[] =3D {
     { "virtio-pci", "x-pcie-flr-init", "off" },
+    { "virtio-device", "use-disabled-flag", "false" },
 };
 const size_t hw_compat_4_1_len =3D G_N_ELEMENTS(hw_compat_4_1);
=20
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index e5c759e19e..f723b9f631 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -608,10 +608,14 @@ static void virtio_write_config(PCIDevice *pci_dev, u=
int32_t address,
         pcie_cap_flr_write_config(pci_dev, address, val, len);
     }
=20
-    if (range_covers_byte(address, len, PCI_COMMAND) &&
-        !(pci_dev->config[PCI_COMMAND] & PCI_COMMAND_MASTER)) {
-        virtio_pci_stop_ioeventfd(proxy);
-        virtio_set_status(vdev, vdev->status & ~VIRTIO_CONFIG_S_DRIVER_OK)=
;
+    if (range_covers_byte(address, len, PCI_COMMAND)) {
+        if (!(pci_dev->config[PCI_COMMAND] & PCI_COMMAND_MASTER)) {
+            virtio_set_disabled(vdev, true);
+            virtio_pci_stop_ioeventfd(proxy);
+            virtio_set_status(vdev, vdev->status & ~VIRTIO_CONFIG_S_DRIVER=
_OK);
+        } else {
+            virtio_set_disabled(vdev, false);
+        }
     }
=20
     if (proxy->config_cap &&
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 6de3cfdc2c..7bc6a9455e 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -546,7 +546,7 @@ static inline bool is_desc_avail(uint16_t flags, bool w=
rap_counter)
  * Called within rcu_read_lock().  */
 static int virtio_queue_empty_rcu(VirtQueue *vq)
 {
-    if (unlikely(vq->vdev->broken)) {
+    if (virtio_device_disabled(vq->vdev)) {
         return 1;
     }
=20
@@ -565,7 +565,7 @@ static int virtio_queue_split_empty(VirtQueue *vq)
 {
     bool empty;
=20
-    if (unlikely(vq->vdev->broken)) {
+    if (virtio_device_disabled(vq->vdev)) {
         return 1;
     }
=20
@@ -783,7 +783,7 @@ void virtqueue_fill(VirtQueue *vq, const VirtQueueEleme=
nt *elem,
=20
     virtqueue_unmap_sg(vq, elem, len);
=20
-    if (unlikely(vq->vdev->broken)) {
+    if (virtio_device_disabled(vq->vdev)) {
         return;
     }
=20
@@ -839,7 +839,7 @@ static void virtqueue_packed_flush(VirtQueue *vq, unsig=
ned int count)
=20
 void virtqueue_flush(VirtQueue *vq, unsigned int count)
 {
-    if (unlikely(vq->vdev->broken)) {
+    if (virtio_device_disabled(vq->vdev)) {
         vq->inuse -=3D count;
         return;
     }
@@ -1602,7 +1602,7 @@ err_undo_map:
=20
 void *virtqueue_pop(VirtQueue *vq, size_t sz)
 {
-    if (unlikely(vq->vdev->broken)) {
+    if (virtio_device_disabled(vq->vdev)) {
         return NULL;
     }
=20
@@ -1698,7 +1698,7 @@ unsigned int virtqueue_drop_all(VirtQueue *vq)
 {
     struct VirtIODevice *vdev =3D vq->vdev;
=20
-    if (unlikely(vdev->broken)) {
+    if (virtio_device_disabled(vq->vdev)) {
         return 0;
     }
=20
@@ -1816,7 +1816,7 @@ static void virtio_notify_vector(VirtIODevice *vdev, =
uint16_t vector)
     BusState *qbus =3D qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
=20
-    if (unlikely(vdev->broken)) {
+    if (virtio_device_disabled(vdev)) {
         return;
     }
=20
@@ -1920,6 +1920,7 @@ void virtio_reset(void *opaque)
     vdev->guest_features =3D 0;
     vdev->queue_sel =3D 0;
     vdev->status =3D 0;
+    vdev->disabled =3D false;
     atomic_set(&vdev->isr, 0);
     vdev->config_vector =3D VIRTIO_NO_VECTOR;
     virtio_notify_vector(vdev, vdev->config_vector);
@@ -2559,6 +2560,13 @@ static bool virtio_started_needed(void *opaque)
     return vdev->started;
 }
=20
+static bool virtio_disabled_needed(void *opaque)
+{
+    VirtIODevice *vdev =3D opaque;
+
+    return vdev->disabled;
+}
+
 static const VMStateDescription vmstate_virtqueue =3D {
     .name =3D "virtqueue_state",
     .version_id =3D 1,
@@ -2724,6 +2732,17 @@ static const VMStateDescription vmstate_virtio_start=
ed =3D {
     }
 };
=20
+static const VMStateDescription vmstate_virtio_disabled =3D {
+    .name =3D "virtio/disabled",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D &virtio_disabled_needed,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_BOOL(disabled, VirtIODevice),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_virtio =3D {
     .name =3D "virtio",
     .version_id =3D 1,
@@ -2741,6 +2760,7 @@ static const VMStateDescription vmstate_virtio =3D {
         &vmstate_virtio_extra_state,
         &vmstate_virtio_started,
         &vmstate_virtio_packed_virtqueues,
+        &vmstate_virtio_disabled,
         NULL
     }
 };
@@ -3575,6 +3595,7 @@ static void virtio_device_instance_finalize(Object *o=
bj)
 static Property virtio_properties[] =3D {
     DEFINE_VIRTIO_COMMON_FEATURES(VirtIODevice, host_features),
     DEFINE_PROP_BOOL("use-started", VirtIODevice, use_started, true),
+    DEFINE_PROP_BOOL("use-disabled-flag", VirtIODevice, use_disabled_flag,=
 true),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
MST


