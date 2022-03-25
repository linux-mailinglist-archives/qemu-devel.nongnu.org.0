Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4881F4E6F3A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 09:01:33 +0100 (CET)
Received: from localhost ([::1]:41410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXet0-0007VO-Ul
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 04:01:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nXerM-0006n0-12
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:59:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nXerI-0007uz-0H
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648195182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCbiipYJvBV1Ekd6KtAyxvXYojV0u8Wsd5Wfakc9rC4=;
 b=g/LrLE3MThZdCFXktv6HeB/B55CiGCbkiKBT9GiEj1GoHqmKm4hvbETrviLcie86et5at8
 hNuT2e5ZezFQtdS4zMGMuK10bGhJZITjCG3UZSBknVgueGrQyo66deI03zPWfcnv2Gsgr9
 VxtLlpc/uo+od/ok0ghyryyEnz+J2O4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-a3JixhdHMlKDG2YfZ5bdrg-1; Fri, 25 Mar 2022 03:59:40 -0400
X-MC-Unique: a3JixhdHMlKDG2YfZ5bdrg-1
Received: by mail-lj1-f198.google.com with SMTP id
 76-20020a2e054f000000b00249606fea4fso2683742ljf.19
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 00:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qCbiipYJvBV1Ekd6KtAyxvXYojV0u8Wsd5Wfakc9rC4=;
 b=GfRJ44Nh6rUy7Uz5+TdZ7h2Fzeo4aqRLkBK56tXI+k3SA1/DFN04xIsK7u0bdYX+6Z
 Juno6We5ZaguYiFEvHhH0RMPZBF9Q1yfTmBj0188zMyLu6o/q7wquTW8Opcuc8bIMctm
 0yaBx1GUrCiaOy2VnAmDxGnquQgJNfRWG5fabEJzmD5IaxIQn8vCYFPvEUCza5b0bjAk
 D4azP5pY52MKClnK1fQfAMLNNHjdO+YF6LEQRQBVG4RnV866Zhu+Xbf1f8yWdMAW2Kaw
 R03MJ1VDV6HzIxC/iLlT0yepqhKwsvM4RMF4KO1CEHtwUgzHkPfNZUofu0/woMOoEQxq
 ychQ==
X-Gm-Message-State: AOAM531kA+J30dgh080jnYYT7zK2uNI733ZJsB/z3+hRKNhb6If0RRYi
 OcuikW7MWGA+5kz7rnpOpVVSyjTCU9vdPtumUBrvsIWe38V9s5P4RIsarvMo7MhzZk0ZF4WjTYi
 okJvV3SpRUx87S5NwiGaBdjxt7oHe0lA=
X-Received: by 2002:a2e:54d:0:b0:249:8213:f970 with SMTP id
 74-20020a2e054d000000b002498213f970mr7243983ljf.315.1648195178811; 
 Fri, 25 Mar 2022 00:59:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4EXhCQAi2pjfWZ8glWRyp19nHptJpq5eLuqghd+pwZD0uhlQwgvRqtwD/v918GZG/xx/bXhKWfqD10gISjIg=
X-Received: by 2002:a2e:54d:0:b0:249:8213:f970 with SMTP id
 74-20020a2e054d000000b002498213f970mr7243955ljf.315.1648195178285; Fri, 25
 Mar 2022 00:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <1647663216-11260-1-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEucw7GASmZwYEwwTYtNw3Bup_0huaDtoV5_FdSfW_4Cuw@mail.gmail.com>
 <c3e931ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com>
In-Reply-To: <c3e931ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 25 Mar 2022 15:59:26 +0800
Message-ID: <CACGkMEuh8S3ShJZRtDkjvykHMNSi4A1pO0PRJPuEKJL=uAhX9Q@mail.gmail.com>
Subject: Re: [RFC PATCH] vhost_net: should not use max_queue_pairs for non-mq
 guest
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 25, 2022 at 3:02 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 3/21/2022 8:47 PM, Jason Wang wrote:
> > On Sat, Mar 19, 2022 at 12:14 PM Si-Wei Liu <si-wei.liu@oracle.com> wro=
te:
> >> With MQ enabled vdpa device and non-MQ supporting guest e.g.
> >> booting vdpa with mq=3Don over OVMF of single vqp, it's easy
> >> to hit assert failure as the following:
> >>
> >> ../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx=
 >=3D dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.
> >>
> >> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
> >> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
> >> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
> >> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
> >> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=3D<optimized out=
>, idx=3D<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
> >> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=3D<optimized out=
>, idx=3D<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
> >> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=3D0x558f55c01800, =
vdev=3D0x558f568f91f0, n=3D2, mask=3D<optimized out>) at ../hw/virtio/vhost=
.c:1557
> >> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=3Dd@entry=3D=
0x558f568f0f60, n=3Dn@entry=3D2, assign=3Dassign@entry=3Dtrue, with_irqfd=
=3Dwith_irqfd@entry=3Dfalse)
> >>     at ../hw/virtio/virtio-pci.c:974
> >> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=3D0x558f568=
f0f60, nvqs=3D3, assign=3Dtrue) at ../hw/virtio/virtio-pci.c:1019
> >> 9  0x0000558f52bf091d in vhost_net_start (dev=3Ddev@entry=3D0x558f568f=
91f0, ncs=3D0x558f56937cd0, data_queue_pairs=3Ddata_queue_pairs@entry=3D1, =
cvq=3Dcvq@entry=3D1)
> >>     at ../hw/net/vhost_net.c:361
> >> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=3D<optimized ou=
t>, n=3D0x558f568f91f0) at ../hw/net/virtio-net.c:289
> >> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=3D0x558f568f91f0,=
 status=3D15 '\017') at ../hw/net/virtio-net.c:370
> >> 12 0x0000558f52d6c4b2 in virtio_set_status (vdev=3Dvdev@entry=3D0x558f=
568f91f0, val=3Dval@entry=3D15 '\017') at ../hw/virtio/virtio.c:1945
> >> 13 0x0000558f52c69eff in virtio_pci_common_write (opaque=3D0x558f568f0=
f60, addr=3D<optimized out>, val=3D<optimized out>, size=3D<optimized out>)=
 at ../hw/virtio/virtio-pci.c:1292
> >> 14 0x0000558f52d15d6e in memory_region_write_accessor (mr=3D0x558f568f=
19d0, addr=3D20, value=3D<optimized out>, size=3D1, shift=3D<optimized out>=
, mask=3D<optimized out>, attrs=3D...)
> >>     at ../softmmu/memory.c:492
> >> 15 0x0000558f52d127de in access_with_adjusted_size (addr=3Daddr@entry=
=3D20, value=3Dvalue@entry=3D0x7f8cdbffe748, size=3Dsize@entry=3D1, access_=
size_min=3D<optimized out>, access_size_max=3D<optimized out>, access_fn=3D=
0x558f52d15cf0 <memory_region_write_accessor>, mr=3D0x558f568f19d0, attrs=
=3D...) at ../softmmu/memory.c:554
> >> 16 0x0000558f52d157ef in memory_region_dispatch_write (mr=3Dmr@entry=
=3D0x558f568f19d0, addr=3D20, data=3D<optimized out>, op=3D<optimized out>,=
 attrs=3Dattrs@entry=3D...)
> >>     at ../softmmu/memory.c:1504
> >> 17 0x0000558f52d078e7 in flatview_write_continue (fv=3Dfv@entry=3D0x7f=
8accbc3b90, addr=3Daddr@entry=3D103079215124, attrs=3D..., ptr=3Dptr@entry=
=3D0x7f8ce6300028, len=3Dlen@entry=3D1, addr1=3D<optimized out>, l=3D<optim=
ized out>, mr=3D0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/hos=
t-utils.h:165
> >> 18 0x0000558f52d07b06 in flatview_write (fv=3D0x7f8accbc3b90, addr=3D1=
03079215124, attrs=3D..., buf=3D0x7f8ce6300028, len=3D1) at ../softmmu/phys=
mem.c:2822
> >> 19 0x0000558f52d0b36b in address_space_write (as=3D<optimized out>, ad=
dr=3D<optimized out>, attrs=3D..., buf=3Dbuf@entry=3D0x7f8ce6300028, len=3D=
<optimized out>)
> >>     at ../softmmu/physmem.c:2914
> >> 20 0x0000558f52d0b3da in address_space_rw (as=3D<optimized out>, addr=
=3D<optimized out>, attrs=3D...,
> >>     attrs@entry=3D..., buf=3Dbuf@entry=3D0x7f8ce6300028, len=3D<optimi=
zed out>, is_write=3D<optimized out>) at ../softmmu/physmem.c:2924
> >> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x558f55c2da6=
0) at ../accel/kvm/kvm-all.c:2903
> >> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=3Darg@entry=3D0x558f5=
5c2da60) at ../accel/kvm/kvm-accel-ops.c:49
> >> 23 0x0000558f52f9f04a in qemu_thread_start (args=3D<optimized out>) at=
 ../util/qemu-thread-posix.c:556
> >> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
> >> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
> >>
> >> The cause for the assert failure is due to that the vhost_dev index
> >> for the ctrl vq was not aligned with actual one in use by the guest.
> >> Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
> >> if guest doesn't support multiqueue, the guest vq layout would shrink
> >> to single queue pair of 3 vqs in total (rx, tx and ctrl). This results
> >> in ctrl_vq taking a different vhost_dev group index than the default
> >> n->max_queue_pairs, the latter of which is only valid for multiqueue
> >> guest. While on those additional vqs not exposed to the guest,
> >> vhost_net_set_vq_index() never populated vq_index properly, hence
> >> getting the assert failure.
> >>
> >> A possible fix is to pick the correct vhost_dev group for the control
> >> vq according to this table [*]:
> >>
> >> vdpa tool / QEMU arg / guest config    / ctrl_vq group index
> >> ----------------------------------------------------------------
> >> max_vqp 8 / mq=3Don    / mq=3Doff  (UEFI) =3D> data_queue_pairs
> >> max_vqp 8 / mq=3Don    / mq=3Don  (Linux) =3D> n->max_queue_pairs(>1)
> >> max_vqp 8 / mq=3Doff   / mq=3Don  (Linux) =3D> n->max_queue_pairs(=3D1=
)
> >>
> >> [*] Please see FIXME in the code for open question and discussion
> >>
> >> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> >> ---
> >>   hw/net/vhost_net.c     | 13 +++++++++----
> >>   hw/virtio/vhost-vdpa.c | 25 ++++++++++++++++++++++++-
> >>   2 files changed, 33 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> >> index 30379d2..9a4479b 100644
> >> --- a/hw/net/vhost_net.c
> >> +++ b/hw/net/vhost_net.c
> >> @@ -322,6 +322,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientSt=
ate *ncs,
> >>       BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(dev)));
> >>       VirtioBusState *vbus =3D VIRTIO_BUS(qbus);
> >>       VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(vbus);
> >> +    bool mq =3D virtio_host_has_feature(dev, VIRTIO_NET_F_MQ);
> >>       int total_notifiers =3D data_queue_pairs * 2 + cvq;
> >>       VirtIONet *n =3D VIRTIO_NET(dev);
> >>       int nvhosts =3D data_queue_pairs + cvq;
> >> @@ -343,7 +344,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientSt=
ate *ncs,
> >>           if (i < data_queue_pairs) {
> >>               peer =3D qemu_get_peer(ncs, i);
> >>           } else { /* Control Virtqueue */
> >> -            peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> >> +            peer =3D qemu_get_peer(ncs, mq ? data_queue_pairs : n->ma=
x_queue_pairs);
> >>           }
> >>
> >>           net =3D get_vhost_net(peer);
> >> @@ -368,7 +369,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientSt=
ate *ncs,
> >>           if (i < data_queue_pairs) {
> >>               peer =3D qemu_get_peer(ncs, i);
> >>           } else {
> >> -            peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> >> +            peer =3D qemu_get_peer(ncs, mq ? data_queue_pairs : n->ma=
x_queue_pairs);
> >>           }
> >>           r =3D vhost_net_start_one(get_vhost_net(peer), dev);
> >>
> >> @@ -390,7 +391,10 @@ int vhost_net_start(VirtIODevice *dev, NetClientS=
tate *ncs,
> >>
> >>   err_start:
> >>       while (--i >=3D 0) {
> >> -        peer =3D qemu_get_peer(ncs , i);
> >> +        if (mq)
> >> +            peer =3D qemu_get_peer(ncs, i < data_queue_pairs ? i : da=
ta_queue_pairs);
> >> +        else
> >> +            peer =3D qemu_get_peer(ncs, i < data_queue_pairs ? i : n-=
>max_queue_pairs);
> >>           vhost_net_stop_one(get_vhost_net(peer), dev);
> >>       }
> >>       e =3D k->set_guest_notifiers(qbus->parent, total_notifiers, fals=
e);
> >> @@ -409,6 +413,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientSt=
ate *ncs,
> >>       VirtioBusState *vbus =3D VIRTIO_BUS(qbus);
> >>       VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(vbus);
> >>       VirtIONet *n =3D VIRTIO_NET(dev);
> >> +    bool mq =3D virtio_host_has_feature(dev, VIRTIO_NET_F_MQ);
> >>       NetClientState *peer;
> >>       int total_notifiers =3D data_queue_pairs * 2 + cvq;
> >>       int nvhosts =3D data_queue_pairs + cvq;
> >> @@ -418,7 +423,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientSt=
ate *ncs,
> >>           if (i < data_queue_pairs) {
> >>               peer =3D qemu_get_peer(ncs, i);
> >>           } else {
> >> -            peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> >> +            peer =3D qemu_get_peer(ncs, mq ? data_queue_pairs : n->ma=
x_queue_pairs);
> >>           }
> >>           vhost_net_stop_one(get_vhost_net(peer), dev);
> >>       }
> >> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >> index 27ea706..623476e 100644
> >> --- a/hw/virtio/vhost-vdpa.c
> >> +++ b/hw/virtio/vhost-vdpa.c
> >> @@ -1097,7 +1097,30 @@ static int vhost_vdpa_dev_start(struct vhost_de=
v *dev, bool started)
> >>           vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> >>       }
> >>
> >> -    if (dev->vq_index + dev->nvqs !=3D dev->vq_index_end) {
> >> +    /* FIXME the vhost_dev group for the control vq may have bogus nv=
qs=3D2
> >> +     * value rather than nvqs=3D1. This can happen in case the guest =
doesn't
> >> +     * support multiqueue, as a result of virtio_net_change_num_queue=
_pairs()
> >> +     * destroying and rebuilding all the vqs, the guest index for con=
trol vq
> >> +     * will no longer align with the host's. Currently net_init_vhost=
_vdpa()
> >> +     * only initializes all vhost_dev's and net_clients once during
> >> +     * net_client_init1() time, way earlier before multiqueue feature
> >> +     * negotiation can kick in.
> > See below, it looks like the code doesn't find the correct vhost_dev.
> >
> >> +     *
> >> +     * Discussion - some possible fixes so far I can think of:
> >> +     *
> >> +     * option 1: fix vhost_net->dev.nvqs and nc->is_datapath in place=
 for
> >> +     * vdpa's ctrl vq, or rebuild all vdpa's vhost_dev groups and the
> >> +     * net_client array, in the virtio_net_set_multiqueue() path;
> >> +     *
> >> +     * option 2: fix vhost_dev->nvqs in place at vhost_vdpa_set_featu=
res()
> >> +     * before coming down to vhost_vdpa_dev_start() (Q: nc->is_datapa=
th
> >> +     * seems only used in virtio_net_device_realize, is it relevant?)=
;
> > Relevant but not directly related, for the vhost_dev where
> > nc->is_datapath is false, it will assume it is backed by a single
> > queue not a queue pair.
> >
> >> +     *
> >> +     * option 3: use host queue index all along in vhost-vdpa ioctls =
instead
> >> +     * of using guest vq index, so that vhost_net_start/stop() can re=
main
> >> +     * as-is today
> >> +     */
> > Note that the vq_index of each vhost_dev is assigned during
> > vhost_net_start() according to whether or not the MQ or CVQ is
> > negotiated in vhost_net_start()
> >
> >      for (i =3D 0; i < nvhosts; i++) {
> >
> >          if (i < data_queue_pairs) {
> >              peer =3D qemu_get_peer(ncs, i);
> >          } else { /* Control Virtqueue */
> >              peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> >          }
> >
> >          net =3D get_vhost_net(peer);
> >          vhost_net_set_vq_index(net, i * 2, index_end);
> >
> > It means some of the peers won't be used when MQ is not negotiated. So
> > it looks to me the evil came from virtio_net_get_notifier_mask().
> Yes, there it is. Where the control virtqueue first ever needs a
> guest_notifier for vhost_dev.
> > Where it doesn't mask the correct vhost dev when the guest doesn't
> > support MQ but the host does. So we had option 4:
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 2087516253..5e9ac019cd 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3179,7 +3179,13 @@ static void
> > virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
> >                                              bool mask)
> >   {
> >       VirtIONet *n =3D VIRTIO_NET(vdev);
> > -    NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> > +    NetClientState *nc;
> > +
> > +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx =3D=3D =
2) {
> Hmmm, I thought it would be more natural to align the layout of
> vhost_dev's with that of virtqueue's, not the other way around.

The problem is that we need to make sure it works for vhost_net as
well where it doesn't support cvq.

> Not sure
> how this vhost_dev selection scheme may work with additional queues
> discovered through transport specific mechanism, such as the admin
> virtqueue, but I can live with it for now:
>
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -244,7 +244,8 @@ static void virtio_net_vhost_status(VirtIONet *n,
> uint8_t status)
>       VirtIODevice *vdev =3D VIRTIO_DEVICE(n);
>       NetClientState *nc =3D qemu_get_queue(n->nic);
>       int queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> -    int cvq =3D n->max_ncs - n->max_queue_pairs;
> +    int cvq =3D virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> +              n->max_ncs - n->max_queue_pairs : 0;

Any reason for this line?

Btw, would you mind to post a formal patch for this?

Thanks

>
>       if (!get_vhost_net(nc->peer)) {
>           return;
> @@ -3161,8 +3162,14 @@ static NetClientInfo net_virtio_info =3D {
>   static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int i=
dx)
>   {
>       VirtIONet *n =3D VIRTIO_NET(vdev);
> -    NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> +    NetClientState *nc;
>       assert(n->vhost_started);
> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx =3D=3D 2)=
 {
> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
> +        nc =3D qemu_get_subqueue(n->nic, n->max_queue_pairs);
> +    } else {
> +        nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> +    }
>       return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>   }
>
> @@ -3170,8 +3177,14 @@ static void
> virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>                                              bool mask)
>   {
>       VirtIONet *n =3D VIRTIO_NET(vdev);
> -    NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> +    NetClientState *nc;
>       assert(n->vhost_started);
> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx =3D=3D 2)=
 {
> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
> +        nc =3D qemu_get_subqueue(n->nic, n->max_queue_pairs);
> +    } else {
> +        nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> +    }
>       vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
>                                vdev, idx, mask);
>   }
>
>
> Thanks,
> -Siwei
>
> > +        nc =3D qemu_get_subqueue(n->nic, n->max_queue_pairs);
> > +    } else {
> > +        nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> > +    }
> >       assert(n->vhost_started);
> >       vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
> >                                vdev, idx, mask);
> >
> > Thanks
> >
> >> +    if (dev->vq_index + dev->nvqs < dev->vq_index_end) {
> >>           return 0;
> >>       }
> >>
> >> --
> >> 1.8.3.1
> >>
>


