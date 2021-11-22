Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F481458811
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 03:40:47 +0100 (CET)
Received: from localhost ([::1]:60440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mozG9-0007s2-Uu
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 21:40:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mozEr-0007Ag-Qo
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 21:39:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mozEo-0004eJ-Mn
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 21:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637548761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZAS6VPVC4xbyBpmnXtA/4cQjhQMU8BS4oZU4EziAUA=;
 b=XKn18jLURdhOIuGafCa/8J8xuW563EvDt02ZvJf1LXBXNCnEWLWskjzC6k4iAz/AQUMAkJ
 w4s/lli4J486kzkv96EQL0T/QbfzvY92q6YpxlEB/ZbNbNWb68s7R2YnoGRrg8q75dxc0n
 AAY0+zVTQ7bYtgl+4PixnzHW4chM8hk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-AvjdWNBhOMC9nlUE1Y7rLA-1; Sun, 21 Nov 2021 21:39:20 -0500
X-MC-Unique: AvjdWNBhOMC9nlUE1Y7rLA-1
Received: by mail-lf1-f69.google.com with SMTP id
 z1-20020a056512308100b003ff78e6402bso10955531lfd.4
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 18:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+ZAS6VPVC4xbyBpmnXtA/4cQjhQMU8BS4oZU4EziAUA=;
 b=j3KchBWyXv3gC99UkjGBofUMNA3EXF/6OI1t1L4jz4xZzTqCRN7lalE2Ba/GZB/1ED
 UvxE3B1lqdg1MlgW0YlaIcjGcDAGPLmCATbIRr979tpbO1h5dykqiy37MfZ1XBnR8Feh
 p18QRlFP0i3rRE+53+M4llfiD4wL3dvJc4xqFiB+g+LwcdzKTmj4NIbLUD9fz4gvCA5e
 XaeNU2+Aoops4QlOsTqSvN0IZv+3krZJNTjpRNbyPWDwHvjSg+yV71DZFaWKHVuxEErP
 EQ8QLOiTLWruhScBBRvUesNneD20DxHMHGXCmgp7binIrYhTp/LZz6ukP+311CoezfTE
 i/MQ==
X-Gm-Message-State: AOAM530lRmO0IklkiXZ31rHZx4YV2+AN6KNQ/83gF8Y8GZPMjEg5QsW2
 HMstVxCiU2GszQ2FoN3eNs/O0vKEA0IfypD2Po04Wm1sng2RKDOxuDasE2xaKzCfMEd9cHi3Dzz
 fX26ObvsEVkdc8MHuox9l9ne600tYZKs=
X-Received: by 2002:ac2:5310:: with SMTP id c16mr54762226lfh.580.1637548758879; 
 Sun, 21 Nov 2021 18:39:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx02ASyY/0rF9xz0QTPdXfcK//Y1xsXzJ2VRdkxWT8ojAKRAtGYYv7S97JYj7M9olDAcvah1cNU4GlGj9dmSeI=
X-Received: by 2002:ac2:5310:: with SMTP id c16mr54762198lfh.580.1637548758537; 
 Sun, 21 Nov 2021 18:39:18 -0800 (PST)
MIME-Version: 1.0
References: <20211117192851.65529-1-eperezma@redhat.com>
 <20211117192851.65529-3-eperezma@redhat.com>
 <CACGkMEtad_+DBt4NJcjtRfPYXPUn6BVCUses7yeb8sMVhQL58g@mail.gmail.com>
 <CAJaqyWfYiG1LJV=26Zn5KDMYnGYuB2fDOVQBUz4snnXJq=UVSg@mail.gmail.com>
 <CACGkMEtxoqEAn3C10DxcC-xdJKJ+YpoVbUY+C88=_L7dkv=cbw@mail.gmail.com>
 <CAJaqyWfH2vFxf+qpBfwbi2m5GQGegDs1MbJmofuCs4V0e9U4pA@mail.gmail.com>
In-Reply-To: <CAJaqyWfH2vFxf+qpBfwbi2m5GQGegDs1MbJmofuCs4V0e9U4pA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 22 Nov 2021 10:39:07 +0800
Message-ID: <CACGkMEvSF1E2eHT8NpiePPTnjUrjDMazp2O_SiyPzfpCTYfpYw@mail.gmail.com>
Subject: Re: [PATCH 2/3] virtio-net: Only enable userland vq if using tap
 backend
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 3:50 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Nov 19, 2021 at 3:44 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Thu, Nov 18, 2021 at 3:57 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Thu, Nov 18, 2021 at 6:06 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > On Thu, Nov 18, 2021 at 3:29 AM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
> > > > >
> > > > > Qemu falls back on userland handlers even if vhost-user and vhost=
-vdpa
> > > > > cases. These assumes a tap device can handle the packets.
> > > > >
> > > > > If a vdpa device fail to start, it can trigger a sigsegv because =
of
> > > > > that. Do not resort on them unless actually possible.
> > > >
> > > > It would be better to show the calltrace here then we can see the r=
oot cause.
> > > >
> > >
> > > Sure, I'll paste here and I'll resend to the next version:
> > > #1  0x000055955f696e92 in nc_sendv_compat (flags=3D<optimized out>,
> > > iovcnt=3D2, iov=3D0x7ffe73abe300, nc=3D0x7fcf22d6d010) at ../net/net.=
c:756
> > > #2  qemu_deliver_packet_iov (sender=3D<optimized out>,
> > > opaque=3D0x7fcf22d6d010, iovcnt=3D2, iov=3D0x7ffe73abe300, flags=3D<o=
ptimized
> > > out>) at ../net/net.c:784
> > > #3  qemu_deliver_packet_iov (sender=3D<optimized out>, flags=3D<optim=
ized
> > > out>, iov=3D0x7ffe73abe300, iovcnt=3D2, opaque=3D0x7fcf22d6d010) at
> > > ../net/net.c:763
> > > #4  0x000055955f69a078 in qemu_net_queue_deliver_iov (iovcnt=3D2,
> > > iov=3D0x7ffe73abe300, flags=3D0, sender=3D0x5595631f5ac0,
> > >     queue=3D0x559561c7baa0) at ../net/queue.c:179
> > > #5  qemu_net_queue_send_iov (queue=3D0x559561c7baa0,
> > > sender=3D0x5595631f5ac0, flags=3Dflags@entry=3D0,
> > > iov=3Diov@entry=3D0x7ffe73abe300,
> > >     iovcnt=3Diovcnt@entry=3D2, sent_cb=3Dsent_cb@entry=3D0x55955f82ae=
60
> > > <virtio_net_tx_complete>) at ../net/queue.c:246
> > > #6  0x000055955f697d43 in qemu_sendv_packet_async
> > > (sent_cb=3D0x55955f82ae60 <virtio_net_tx_complete>, iovcnt=3D2,
> > > iov=3D0x7ffe73abe300,
> > >     sender=3D<optimized out>) at ../net/net.c:825
> > > #7  qemu_sendv_packet_async (sender=3D<optimized out>,
> > > iov=3Diov@entry=3D0x7ffe73abe300, iovcnt=3Diovcnt@entry=3D1662966768,
> > >     sent_cb=3Dsent_cb@entry=3D0x55955f82ae60 <virtio_net_tx_complete>=
) at
> > > ../net/net.c:794
> > > #8  0x000055955f82aba9 in virtio_net_flush_tx (q=3D0x0,
> > > q@entry=3D0x5595631edbf0) at ../hw/net/virtio-net.c:2577
> > > #9  0x000055955f82ade8 in virtio_net_tx_bh (opaque=3D0x5595631edbf0) =
at
> > > ../hw/net/virtio-net.c:2694
> > > #10 0x000055955f9e847d in aio_bh_call (bh=3D0x559561c7e590) at ../uti=
l/async.c:169
> > > #11 aio_bh_poll (ctx=3Dctx@entry=3D0x559561c81650) at ../util/async.c=
:169
> > > #12 0x000055955f9d6912 in aio_dispatch (ctx=3D0x559561c81650) at
> > > ../util/aio-posix.c:381
> > > #13 0x000055955f9e8322 in aio_ctx_dispatch (source=3D<optimized out>,
> > > callback=3D<optimized out>, user_data=3D<optimized out>)
> > >     at ../util/async.c:311
> > > #14 0x00007fcf20a5495d in g_main_context_dispatch () from
> > > /lib64/libglib-2.0.so.0
> > > #15 0x000055955f9f2fc0 in glib_pollfds_poll () at ../util/main-loop.c=
:232
> > > #16 os_host_main_loop_wait (timeout=3D<optimized out>) at ../util/mai=
n-loop.c:255
> > > #17 main_loop_wait (nonblocking=3Dnonblocking@entry=3D0) at ../util/m=
ain-loop.c:531
> > > #18 0x000055955f7eee49 in qemu_main_loop () at ../softmmu/runstate.c:=
726
> > > #19 0x000055955f6235c2 in main (argc=3D<optimized out>, argv=3D<optim=
ized
> > > out>, envp=3D<optimized out>) at ../softmmu/main.c:50
> > >
> > > In nc_sendv_compat, nc->info is net_vhost_vdpa_info, so
> > > nc->info->receive is NULL.
> > >
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >  include/hw/virtio/virtio.h |  2 ++
> > > > >  hw/net/virtio-net.c        |  4 ++++
> > > > >  hw/virtio/virtio.c         | 21 +++++++++++++--------
> > > > >  3 files changed, 19 insertions(+), 8 deletions(-)
> > > > >
> > > > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virti=
o.h
> > > > > index 8bab9cfb75..1712ba0b4c 100644
> > > > > --- a/include/hw/virtio/virtio.h
> > > > > +++ b/include/hw/virtio/virtio.h
> > > > > @@ -105,6 +105,8 @@ struct VirtIODevice
> > > > >      VMChangeStateEntry *vmstate;
> > > > >      char *bus_name;
> > > > >      uint8_t device_endian;
> > > > > +    /* backend does not support userspace handler */
> > > > > +    bool disable_ioeventfd_handler;
> > > > >      bool use_guest_notifier_mask;
> > > > >      AddressSpace *dma_as;
> > > > >      QLIST_HEAD(, VirtQueue) *vector_queues;
> > > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > > index 004acf858f..8c5c4e5a9d 100644
> > > > > --- a/hw/net/virtio-net.c
> > > > > +++ b/hw/net/virtio-net.c
> > > > > @@ -3501,6 +3501,10 @@ static void virtio_net_device_realize(Devi=
ceState *dev, Error **errp)
> > > > >      nc =3D qemu_get_queue(n->nic);
> > > > >      nc->rxfilter_notify_enabled =3D 1;
> > > > >
> > > > > +    if (!nc->peer || nc->peer->info->type !=3D NET_CLIENT_DRIVER=
_TAP) {
> > > > > +        /* Only tap can use userspace networking */
> > > > > +        vdev->disable_ioeventfd_handler =3D true;
> > > > > +    }
> > > > >      if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVE=
R_VHOST_VDPA) {
> > > > >          struct virtio_net_config netcfg =3D {};
> > > > >          memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
> > > > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > > > index ea7c079fb0..1e04db6650 100644
> > > > > --- a/hw/virtio/virtio.c
> > > > > +++ b/hw/virtio/virtio.c
> > > > > @@ -3734,17 +3734,22 @@ static int virtio_device_start_ioeventfd_=
impl(VirtIODevice *vdev)
> > > > >              err =3D r;
> > > > >              goto assign_error;
> > > > >          }
> > > > > -        event_notifier_set_handler(&vq->host_notifier,
> > > > > -                                   virtio_queue_host_notifier_re=
ad);
> > > > > +
> > > > > +        if (!vdev->disable_ioeventfd_handler) {
> > > > > +            event_notifier_set_handler(&vq->host_notifier,
> > > > > +                                       virtio_queue_host_notifie=
r_read);
> > > >
> > > > This is just about not responding to ioeventfd. Does this happen on=
ly
> > > > when ioeventfd is enabled? If yes, we probably need a consistent wa=
y
> > > > to deal with that. Will having a dummy receiver be more simpler?
> > > >
> > >
> > > If you mean NetClientInfo receiver, that would make qemu to actually
> > > read from the virtqueue, I'm not sure if that is the right behavior
> > > even for net devices. I see way simpler for qemu not to monitor
> > > virtqueue kicks at all, isn't it?
> >
> > It looks not easy, the ioeventfd or vmexit monitoring is set up by the
> > virtio-pci. As you've seen, even if you disable ioeventfd it can still
> > come from the slow vmexit path.
> >
>
> Yes, but there are only two paths of that
>
> > And virtio-pci is loosely coupled with its peer, which makes it even
> > more tricky to do that.
> >
>
> That's right, but vhost_user already does that to the guest notifier
> with use_guest_notifier_mask.

I don't get this. Maybe you can point out the codes? (I think we only
need to deal with kicks instead of interrupts).

>
> I agree that introducing a dummy receiver is way less change, but I
> still feel that qemu can do nothing with that notification, so the
> right change is to totally disable it.

It depends on how to define "disabling".

And what's more important I think vhost-vDPA should deal with RARP as
what vhost-user did, otherwise we breaks the migration without
GUEST_ANNOUNCE. Any idea on how to fix this?

> However, it's not like it's
> going to be on the hot path anyway...
>
> > >
> > > net_vhost_user_info has a receiver to treat the special case of
> > > reverse ARP. But I think vhost-user can't fall back to qemu userspace
> > > networking at all.
> > >
> > > But the crash is still reproducible with ioeventfd=3Doff, so I need t=
o
> > > improve the patch either way.
> >
> > So I wonder if we can simply use receive_disabled of the netclient.
> >
>
> I missed that, but in a second review receive_disabled can be clear if
> the code calls to qemu_flush_or_purge_queued_packets.

To say the truth I don't get why receive_disabled needs to be clear in
that case.

> To that point,
> it would be better the dummy receiver that always return 0.

That's fine.

Thanks

>
> Thanks!
>
> > Thanks
> >
> > >
> > > Thanks!
> > >
> > > > Thanks
> > > >
> > > > > +        }
> > > > >      }
> > > > >
> > > > > -    for (n =3D 0; n < VIRTIO_QUEUE_MAX; n++) {
> > > > > -        /* Kick right away to begin processing requests already =
in vring */
> > > > > -        VirtQueue *vq =3D &vdev->vq[n];
> > > > > -        if (!vq->vring.num) {
> > > > > -            continue;
> > > > > +    if (!vdev->disable_ioeventfd_handler) {
> > > > > +        for (n =3D 0; n < VIRTIO_QUEUE_MAX; n++) {
> > > > > +            /* Kick right away to begin processing requests alre=
ady in vring */
> > > > > +            VirtQueue *vq =3D &vdev->vq[n];
> > > > > +            if (!vq->vring.num) {
> > > > > +                continue;
> > > > > +            }
> > > > > +            event_notifier_set(&vq->host_notifier);
> > > > >          }
> > > > > -        event_notifier_set(&vq->host_notifier);
> > > > >      }
> > > > >      memory_region_transaction_commit();
> > > > >      return 0;
> > > > > --
> > > > > 2.27.0
> > > > >
> > > >
> > >
> >
>


