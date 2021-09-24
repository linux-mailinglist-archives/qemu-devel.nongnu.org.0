Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB1E417DC6
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 00:29:24 +0200 (CEST)
Received: from localhost ([::1]:56130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTth5-0001Ox-Bn
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 18:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mTtfc-0000UF-1v
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 18:27:54 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:34452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mTtfW-0002ql-48
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 18:27:49 -0400
Received: by mail-lf1-x135.google.com with SMTP id g41so46129248lfv.1
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 15:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QLAbLngn6BOPhLIDkpUSDpIjL/bGWIE7/T5p/Gdt0hE=;
 b=hCC31zeYKqplgCKqPloYGzTDYQjFztJyNYLjG1reg6OjIYx8ZUZ6m+G1AAISZP1EmZ
 8yYzSHRAGZzF/CtrjuMRHdZneuHd8IuRBf8fLqvKp3VNymNs7sAUWQjI46O/fMGXTDqX
 RuC8fvPqXxe0kKVPQsTbCii3oye7322QTqf+ZOwFmfm3tTjonkvrroZg3OZ0KknH/DIq
 ciQNwZ6YUtK5O1f95oJU0vI2dQKHnz2D1kWWYaRIaVsiZPhpiF/9dkmUl6t2CmR8Fali
 c8n34AIJ6qizDcwhbSjDwx6XptQIwRbtVm50FM2g5xUMY0+ueKuw2YEx/aChkIjJpdhX
 AVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QLAbLngn6BOPhLIDkpUSDpIjL/bGWIE7/T5p/Gdt0hE=;
 b=4r7DOcIcT5HkwXSPRMt1ESRMS/q1u1zdC3PNQo2rFyGQ6c6QWW9k4nmc88xIcyCavp
 Uu+HGBKXoUoyXAn2uHmIlWKnaY02wraSKhm1CI3ppdhGFUqIWmDPJN12g9TVvFYSM6+R
 cbxSm0+F3hTcijoV9qE2q9wG5EKOM3ivAc1DILlBiPqm2GkXVWe+FoVTPBTGjAORZxvP
 IeqwHoWciPhRA7sOuzsV+yXDd0IcoiqMkk4JmiT0ZmQ+xa4uRJ7ffAlFvxeOGVFyvdU9
 +BxFipnnk2PN9ns99q6ZJj+NUiSPWsCkMmQf6Zs1oRFQvB8p+pszwwY0RSSb60e/7AT5
 GmZg==
X-Gm-Message-State: AOAM532da4n2eQUK0O0p/ZLgdUhcuzzXjfUsylkEnOsNby8bBtI/Hgxu
 w9zeoO+oL4smjboi44S5l+Wr4UW9nxsVAfWcWLH0Dg==
X-Google-Smtp-Source: ABdhPJy14LJXF87frFbKYjvfECchHHPPAHfi3lz2icyD9sAUEhtdmVpW4J3xI7I4LawySoPM84TG14v6Qv9G1uoL+QE=
X-Received: by 2002:a2e:a80d:: with SMTP id l13mr13804385ljq.213.1632522461848; 
 Fri, 24 Sep 2021 15:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAP_N_Z8p+qsOAm15TtUFhCG-bJHM+zOQ4UJkr4XBdUQnm2wtzQ@mail.gmail.com>
 <20210923091828.e2ao3mra6ps5osc2@steredhat>
In-Reply-To: <20210923091828.e2ao3mra6ps5osc2@steredhat>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Fri, 24 Sep 2021 15:27:30 -0700
Message-ID: <CAP_N_Z-D+TdAzRhJScs+nitz4GW7otY-nOVHDxGf68X1aXQiHQ@mail.gmail.com>
Subject: Re: [External] Re: [RFC v7] virtio/vsock: add two more queues for
 datagram types
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=jiang.wang@bytedance.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Jason Wang <jasowang@redhat.com>, qemu devel list <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 23, 2021 at 2:18 AM Stefano Garzarella <sgarzare@redhat.com> wr=
ote:
>
> On Wed, Sep 22, 2021 at 10:36:24AM -0700, Jiang Wang . wrote:
> >On Wed, Sep 22, 2021 at 2:23 AM Stefano Garzarella <sgarzare@redhat.com>=
 wrote:
> >>
> >> On Wed, Sep 22, 2021 at 12:00:24AM +0000, Jiang Wang wrote:
> >> >Datagram sockets are connectionless and unreliable.
> >> >The sender does not know the capacity of the receiver
> >> >and may send more packets than the receiver can handle.
> >> >
> >> >Add two more dedicate virtqueues for datagram sockets,
> >> >so that it will not unfairly steal resources from
> >> >stream and future connection-oriented sockets.
> >> >
> >> >The two new virtqueues are enabled by default and will
> >> >be removed if the guest does not support. This will help
> >> >migration work.
> >> >
> >> >btw: enable_dgram argument in vhost_vsock_common_realize
> >> >is redundant for now, but will be used later when we
> >> >want to disable DGRAM feature bit for old versions.
> >> >
> >> >Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> >> >---
> >> >v1 -> v2: use qemu cmd option to control number of queues,
> >> >        removed configuration settings for dgram.
> >> >v2 -> v3: use ioctl to get features and decide number of
> >> >        virt queues, instead of qemu cmd option.
> >> >v3 -> v4: change DGRAM feature bit value to 2. Add an argument
> >> >        in vhost_vsock_common_realize to indicate dgram is supported =
or not.
> >> >v4 -> v5: don't open dev to get vhostfd. Removed leftover definition =
of
> >> >        enable_dgram
> >> >v5 -> v6: fix style errors. Imporve error handling of
> >> >        vhost_vsock_dgram_supported. Rename MAX_VQS_WITH_DGRAM and an=
other one.
> >> >v6 -> v7: Always enable dgram for vhost-user and vhost kernel.
> >> >        Delete unused virtqueues at the beginning of
> >> >        vhost_vsock_common_start for migration. Otherwise, migration =
will fail.
> >> >
> >> > hw/virtio/vhost-user-vsock.c                  |  2 +-
> >> > hw/virtio/vhost-vsock-common.c                | 32 +++++++++++++++++=
--
> >> > hw/virtio/vhost-vsock.c                       |  6 +++-
> >> > include/hw/virtio/vhost-vsock-common.h        |  6 ++--
> >> > include/hw/virtio/vhost-vsock.h               |  3 ++
> >> > include/standard-headers/linux/virtio_vsock.h |  1 +
> >> > 6 files changed, 43 insertions(+), 7 deletions(-)
> >> >
> >> >diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsoc=
k.c
> >> >index 6095ed7349..9823a2f3bd 100644
> >> >--- a/hw/virtio/vhost-user-vsock.c
> >> >+++ b/hw/virtio/vhost-user-vsock.c
> >> >@@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, =
Error **errp)
> >> >         return;
> >> >     }
> >> >
> >> >-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
> >> >+    vhost_vsock_common_realize(vdev, "vhost-user-vsock", true);
> >> >
> >> >     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
> >> >
> >> >diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-c=
ommon.c
> >> >index 4ad6e234ad..7d89b4d242 100644
> >> >--- a/hw/virtio/vhost-vsock-common.c
> >> >+++ b/hw/virtio/vhost-vsock-common.c
> >> >@@ -26,6 +26,18 @@ int vhost_vsock_common_start(VirtIODevice *vdev)
> >> >     int ret;
> >> >     int i;
> >> >
> >> >+    if (!virtio_has_feature(vdev->guest_features, VIRTIO_VSOCK_F_DGR=
AM)) {
> >> >+        struct vhost_virtqueue *vqs;
> >> >+        virtio_delete_queue(vvc->dgram_recv_vq);
> >> >+        virtio_delete_queue(vvc->dgram_trans_vq);
> >> >+
> >>
> >> Are you sure it works removing queues here?
> >> The event_queue would always be #4, but the guest will use #2 which
> >> we're removing.
> >>
> >Yes, this works. In fact, I should include this in v6 and my tests done
> >in my previous emails have these changes. But before I submitted the pat=
ch,
> >I thought this code was redundant and removed it without further testing=
.
>
> Just tried on an host that doesn't support F_DGRAM and I have the
> following errors:
> qemu-system-x86_64: -device vhost-vsock-pci,guest-cid=3D6: vhost_set_vrin=
g_call failed: No buffer space available (105)
> qemu-system-x86_64: -device vhost-vsock-pci,guest-cid=3D6: Failed to init=
ialize virtqueue 2: No buffer space available
>
> I thinks we should re-add the feature discovery before call
> vhost_dev_init().
>

Yes. You are right. I will add it back.

> >
> >To explain it, I think the event queue number does not matter for the
> >vhost and qemu. The vhost-vsock kernel module does not allocate any
> >data structure for the event queue.  Qemu also only allocates an array o=
f
> >size 2 or 4 for the tx, rx queues. The event queue is handled separately=
.
> >
> >The event queue number only shows up in the spec, but in real code, I do=
n't
> >see anywhere that the event queue number is used explicitly or implicitl=
y.
> >The Event queue looks independent of tx, rx queues.
>
> Yep, it is used in the linux driver. Look at
> virtio_transport_event_work(), it uses VSOCK_VQ_EVENT (2).
>
Agree, it is used in virtio driver and QEMU as you mentioned later.

> The main test to do is to migrate a guest with active connections that
By active connections, do you mean active vsock stream connections?
The guest should be the server or the client? I have two simple vsock clien=
t,
server tests which only send messages for each direction once. Or I can als=
o
use something like iperf3.

> doesn't support F_DGRAM on an host that support it and check if, after
> the migration, the connections are reset and the CID updated.

Not sure about why CID should be updated? Right now, on the destination
host, I used the same CID as the one on the source host. You mean choose
another guest CID on the destination host? I will try that.

> I think is not working now.
>
> >
> >> >+        vqs =3D vvc->vhost_dev.vqs;
> >> >+        vvc->vhost_dev.nvqs =3D MAX_VQS_WITHOUT_DGRAM;
> >> >+        vvc->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue,
> >> >+                                   vvc->vhost_dev.nvqs);
> >> >+        g_free(vqs);
> >> >+    }
> >> >+
> >> >     if (!k->set_guest_notifiers) {
> >> >         error_report("binding does not support guest notifiers");
> >> >         return -ENOSYS;
> >> >@@ -196,9 +208,11 @@ int vhost_vsock_common_post_load(void *opaque, i=
nt version_id)
> >> >     return 0;
> >> > }
> >> >
> >> >-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name=
)
> >> >+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name=
,
> >> >+                               bool enable_dgram)
> >>                                        ^
> >> It seems always true, and also unused.
> >>
> >Yes, I can remove it. I am just wondering when we modify the feature
> >bit as in your recent seqpacket patch, do we want to change it to false =
when
> >the feature is not supported and make the code logically more
> >resonable=EF=BC=9F
> >Or do we still make it true even if the feature bit is not supported?
>
> Maybe we need to use it because now vhost_dev_init is failing if the
> host doesn't support F_DGRAM since we are registering more queues than
> the device can handle.
>
Sure.

> >
> >> > {
> >> >     VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> >> >+    int nvqs =3D MAX_VQS_WITH_DGRAM;
> >> >
> >> >     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
> >> >                 sizeof(struct virtio_vsock_config));
> >> >@@ -209,12 +223,17 @@ void vhost_vsock_common_realize(VirtIODevice *v=
dev, const char *name)
> >> >     vvc->trans_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >                                        vhost_vsock_common_handle_out=
put);
> >> >
> >> >+    vvc->dgram_recv_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_=
SIZE,
> >> >+                                          vhost_vsock_common_handle_=
output);
> >> >+    vvc->dgram_trans_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE=
_SIZE,
> >> >+                                          vhost_vsock_common_handle_=
output);
> >> >+
> >> >     /* The event queue belongs to QEMU */
> >> >     vvc->event_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >                                        vhost_vsock_common_handle_out=
put);
> >> >
> >> >-    vvc->vhost_dev.nvqs =3D ARRAY_SIZE(vvc->vhost_vqs);
> >> >-    vvc->vhost_dev.vqs =3D vvc->vhost_vqs;
> >> >+    vvc->vhost_dev.nvqs =3D nvqs;
> >> >+    vvc->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue, vvc->vhost=
_dev.nvqs);
> >> >
> >> >     vvc->post_load_timer =3D NULL;
> >> > }
> >> >@@ -227,6 +246,13 @@ void vhost_vsock_common_unrealize(VirtIODevice *=
vdev)
> >> >
> >> >     virtio_delete_queue(vvc->recv_vq);
> >> >     virtio_delete_queue(vvc->trans_vq);
> >> >+    if (vvc->vhost_dev.nvqs =3D=3D MAX_VQS_WITH_DGRAM) {
> >> >+        virtio_delete_queue(vvc->dgram_recv_vq);
> >> >+        virtio_delete_queue(vvc->dgram_trans_vq);
> >> >+    }
> >> >+
> >> >+    g_free(vvc->vhost_dev.vqs);
> >> >+
> >> >     virtio_delete_queue(vvc->event_vq);
> >> >     virtio_cleanup(vdev);
> >> > }
> >> >diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> >> >index 1b1a5c70ed..6e315ecf23 100644
> >> >--- a/hw/virtio/vhost-vsock.c
> >> >+++ b/hw/virtio/vhost-vsock.c
> >> >@@ -23,6 +23,7 @@
> >> >
> >> > const int feature_bits[] =3D {
> >> >     VIRTIO_VSOCK_F_SEQPACKET,
> >> >+    VIRTIO_VSOCK_F_DGRAM,
> >> >     VHOST_INVALID_FEATURE_BIT
> >> > };
> >> >
> >> >@@ -116,6 +117,9 @@ static uint64_t vhost_vsock_get_features(VirtIODe=
vice *vdev,
> >> >     VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> >> >
> >> >     virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET=
);
> >> >+    if (vvc->vhost_dev.nvqs =3D=3D MAX_VQS_WITH_DGRAM) {
> >> >+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM=
);
> >> >+    }
> >>
> >> Take a look at
> >> https://lore.kernel.org/qemu-devel/20210921161642.206461-1-sgarzare@re=
dhat.com/
> >>
> >Yes, I noticed that email. Thanks for reminding me. I did not make
> >similar changes yet because I want to wait for that patch to be merged.
> >I can start to make similar changes in the next version.
>
> Yep, better to wait comments on that series.
>
OK.
> >
> >> If it will be accepted, we should use something similar (e.g.
> >> `datagram` prop) and handle this flag in vhost-vsock-common.
> >>
> >> And we should change a bit the queue handling:
> >> - if QEMU (new `datagram` prop is `on` or `auto`) and the kernel
> >>    supports F_DGRAM, we can allocate 5 queues.
> >Agree with the new prop. But when the kernel supports F_DGRAM, qemu
> >still only allocates 4 queues. As in the following code=EF=BC=9A
> >
> >vvc->vhost_dev.nvqs =3D nvqs;
> >vvc->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue,
> >vvc->vhost_dev.nvqs);
> >
> >// nvqs will be either 2 or 4. Will not be 5. btw, in the new version, i=
t will
> >// always be 4.
>
> Sorry, with allocating I meant virtio_add_queue() calls.
>
> Just to be clear, I think we should do something like this:
>
> #define VHOST_VSOCK_NVQS          3
> #define VHOST_VSOCK_NVQS_DGRAM    5
> #define VHOST_VSOCK_MAX_VQS       VHOST_VSOCK_NVQS_DGRAM
>
> struct VHostVSockCommon {
>      ...
>
>      VirtQueue *vqs[VHOST_VSOCK_MAX_VQS];
>
>      int event_vq_id;
> }
>
> void vhost_vsock_common_realize(...)
> {
>      int nvqs =3D VHOST_VSOCK_NVQS;
>
>      ...
>
>      if (enable_dgram) {
>          nvqs =3D VHOST_VSOCK_NVQS_DGRAM;
>      }
>
>      ...
>
>      for (i =3D 0; i < nvqs; i++) {
>          vvc->vqs[i] =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>                                         vhost_vsock_common_handle_output)=
;
>      }
>
>      /* event queue is not handled by the vhost device */
>      vvc->vhost_dev.nvqs =3D nvqs - 1;
>      vvc->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue, vvc->vhost_dev=
.nvqs);
>
>      ...
> }
>
> int vhost_vsock_common_start(...)
> {
>      ...
>
>      if (virtio_has_feature(vdev->guest_features, VIRTIO_VSOCK_F_DGRAM)) =
{
>          vvc->event_vq_id =3D VHOST_VSOCK_NVQS_DGRAM - 1;
>      } else {
>          vvc->event_vq_id =3D VHOST_VSOCK_NVQS - 1;
>      }
>
>      ...
> }
>
I see. The example code helps a lot.

> Then use `vvc->event_vq_id` in :
> - vhost_vsock_common_send_transport_reset()
> - vhost_vsock_common_post_load() (instead of 2 wired in the code)
I see now vhost_vsock_common_post_load() has a problem. One way
to fix it is as you mentioned. Another way is to check the acked feature
bit here too and change the event queue number to 2 or 4 accordingly.

In your example code:
vvc->vqs[i] =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
                                         vhost_vsock_common_handle_output);
We still need to do some assignment as following:
vvc->recv_vq =3D vvc->vqs[0];
vvc->trans_vq =3D vvc->vqs[1];
...(skipped other similar assignments)

I think both ways will work.  Your example adds ordering for those recv and
trans vqs and makes it similar to virtio and vhost code. I will go that rou=
te.

>
> Maybe in vhost_vsock_common_send_transport_reset() we can skip the
> message enqueueing if the device is not started
> (vvc->vhost_dev.started).
>
OK. Btw, I can make this a separate change because it looks like a
standalone bugfix? I.e, not related to dgram?


> Thanks,
> Stefano
>

