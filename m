Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0628C543CB9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 21:23:57 +0200 (CEST)
Received: from localhost ([::1]:51282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz1HX-0008NF-IG
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 15:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nz1Fm-0007eD-5K
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nz1Fi-0006Rh-46
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654716121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mEpFv4npusFLRTE+V/azp9UjwE04d4y9My7FsjzNFoQ=;
 b=HUOrsLF2NovPBK5sbhagCDHC51Uev24kKg8ag6R04nV8XggveJWPAO9L1l0KsTkX4pX7FZ
 Hzu79F2Fa65I4UeIGD11lrGfnjnW/o4pdgZ5pDJg3679CaBlI0loEElbDJqnE3/g6A1ihV
 ukgCuuBFvXEBDfVLNWy2GBLW2HbKHUM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-lF8oNwprP_-kuYvQ7umk2w-1; Wed, 08 Jun 2022 15:21:59 -0400
X-MC-Unique: lF8oNwprP_-kuYvQ7umk2w-1
Received: by mail-qt1-f200.google.com with SMTP id
 c16-20020a05622a059000b002f93304d0d8so17076183qtb.14
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 12:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mEpFv4npusFLRTE+V/azp9UjwE04d4y9My7FsjzNFoQ=;
 b=JXak628RjFTPSgcpcGN3ZI6CMkRN4+L2Wcj9E54UyD79dN4wO7ZiBL33Qci6csJYTw
 oSL/a/XFpIu2EI+DN9VC12edjTdEpHXcw42RS44jL+XSgsk37BvwxsFXlXkZBr/ARM8O
 4G6t0oEMAEFR+hFxzyU+Os7Fnv+QD/yeWlGALehgGyTZI2Vp6lRI/TkUZG+gO89TF08S
 HTaQIm89Fix6f2bp3eZ5+DcQUPa7FVf0/fXT/0udCC7pZgwVU9JkkeC1Wa6A7hZHAJkB
 J00XbMf/fx8Q6qzvLb/XIH9cOI5/V8uo01439y7qiHpulXXYZHUIOGxAgLbZ0mUkZ3PJ
 RPNw==
X-Gm-Message-State: AOAM533xg8Izf7ZCaDSnJQaT5ANRvdkKfNg/zQf3ZihxuW/u7VT8mwVS
 EWCJkAkUcf9nu/mfLeuYVzY/00pYvllmhy6wPu74hpEz/Nvp9MrVYBZ7gPonwmfggpF+NNZ/NP/
 h1fXkxTskDX9xGubZ/4zKfE3zWqaav7M=
X-Received: by 2002:a05:6214:1c83:b0:46b:a79a:2f0b with SMTP id
 ib3-20020a0562141c8300b0046ba79a2f0bmr11443549qvb.103.1654716119245; 
 Wed, 08 Jun 2022 12:21:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPnohQyfvnN8NBJjQAIod/0/m+Q5sMSNZuPuSi2dye7mLi8ccHRyBrOGdM9yEoSsjxA6AxHmHE8BBoLoKMR2I=
X-Received: by 2002:a05:6214:1c83:b0:46b:a79a:2f0b with SMTP id
 ib3-20020a0562141c8300b0046ba79a2f0bmr11443523qvb.103.1654716118951; Wed, 08
 Jun 2022 12:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-15-eperezma@redhat.com>
 <7a8468b5-f709-4b74-cbe3-8e87b257e41c@redhat.com>
In-Reply-To: <7a8468b5-f709-4b74-cbe3-8e87b257e41c@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 8 Jun 2022 21:21:22 +0200
Message-ID: <CAJaqyWcidiP+YsOnh6LN4_AKFfxtjbSUDVOuMe9jFuJ1go_zeg@mail.gmail.com>
Subject: Re: [RFC PATCH v8 14/21] vhost: Make possible to check for device
 exclusive vq group
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eric Blake <eblake@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 8, 2022 at 6:25 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > CVQ needs to be in its own group, not shared with any data vq. Enable
> > the checking of it here, before introducing address space id concepts.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   include/hw/virtio/vhost.h |  2 +
> >   hw/net/vhost_net.c        |  4 +-
> >   hw/virtio/vhost-vdpa.c    | 79 ++++++++++++++++++++++++++++++++++++++=
-
> >   hw/virtio/trace-events    |  1 +
> >   4 files changed, 84 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> > index b291fe4e24..cebec1d817 100644
> > --- a/include/hw/virtio/vhost.h
> > +++ b/include/hw/virtio/vhost.h
> > @@ -84,6 +84,8 @@ struct vhost_dev {
> >       int vq_index_end;
> >       /* if non-zero, minimum required value for max_queues */
> >       int num_queues;
> > +    /* Must be a vq group different than any other vhost dev */
> > +    bool independent_vq_group;
>
>
> We probably need a better abstraction here.
>
> E.g having a parent vhost_dev_group structure.
>

I think there is room for improvement too, but to make this work we
don't need the device model to know all the other devices at this
moment. I'm open to implementing it if we decide that solution is more
maintainable or whatever other reason though.

>
> >       uint64_t features;
> >       uint64_t acked_features;
> >       uint64_t backend_features;
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index ccac5b7a64..1c2386c01c 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -339,14 +339,16 @@ int vhost_net_start(VirtIODevice *dev, NetClientS=
tate *ncs,
> >       }
> >
> >       for (i =3D 0; i < nvhosts; i++) {
> > +        bool cvq_idx =3D i >=3D data_queue_pairs;
> >
> > -        if (i < data_queue_pairs) {
> > +        if (!cvq_idx) {
> >               peer =3D qemu_get_peer(ncs, i);
> >           } else { /* Control Virtqueue */
> >               peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> >           }
> >
> >           net =3D get_vhost_net(peer);
> > +        net->dev.independent_vq_group =3D !!cvq_idx;
> >           vhost_net_set_vq_index(net, i * 2, index_end);
> >
> >           /* Suppress the masking guest notifiers on vhost user
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index eec6d544e9..52dd8baa8d 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -685,7 +685,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_=
dev *dev)
> >   {
> >       uint64_t features;
> >       uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> > -        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
> > +        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> > +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
> >       int r;
> >
> >       if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) =
{
> > @@ -1110,6 +1111,78 @@ static bool vhost_vdpa_svqs_stop(struct vhost_de=
v *dev)
> >       return true;
> >   }
> >
> > +static int vhost_vdpa_get_vring_group(struct vhost_dev *dev,
> > +                                      struct vhost_vring_state *state)
> > +{
> > +    int ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_VRING_GROUP, state=
);
> > +    trace_vhost_vdpa_get_vring_group(dev, state->index, state->num);
> > +    return ret;
> > +}
> > +
> > +static bool vhost_dev_is_independent_group(struct vhost_dev *dev)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    struct vhost_vring_state this_vq_group =3D {
> > +        .index =3D dev->vq_index,
> > +    };
> > +    int ret;
> > +
> > +    if (!(dev->backend_cap & VHOST_BACKEND_F_IOTLB_ASID)) {
> > +        return true;
> > +    }
>
>
> This should be false?
>
>
> > +
> > +    if (!v->shadow_vqs_enabled) {
> > +        return true;
> > +    }
>
>
> And here?
>

They're true so it doesn't get in the middle if the device already
knows there is no need to check vhost_dev for an independent group.

With recent mq changes, I think I can delete these checks and move
them to net/vhost-vdpa.

>
> > +
> > +    ret =3D vhost_vdpa_get_vring_group(dev, &this_vq_group);
> > +    if (unlikely(ret)) {
> > +        goto call_err;
> > +    }
> > +
> > +    for (int i =3D 1; i < dev->nvqs; ++i) {
> > +        struct vhost_vring_state vq_group =3D {
> > +            .index =3D dev->vq_index + i,
> > +        };
> > +
> > +        ret =3D vhost_vdpa_get_vring_group(dev, &vq_group);
> > +        if (unlikely(ret)) {
> > +            goto call_err;
> > +        }
> > +        if (unlikely(vq_group.num !=3D this_vq_group.num)) {
> > +            error_report("VQ %d group is different than VQ %d one",
> > +                         this_vq_group.index, vq_group.index);
>
>
> Not sure this is needed. The group id is not tied to vq index if I
> understand correctly.
>
> E.g we have 1 qp with cvq, we can have
>
> group 0 cvq
>
> group 1 tx/rx
>

This function is severly undocumented, thanks for pointing out :).

It checks if the virtqueues that belong to this vhost_dev does not
share vq group with any other virtqueue in the device. We need to
check it at device startup, since cvq index changes depending on _F_MQ
negotiated.

Since we're going to check all other virtqueues, we don't need to know
other vhost_dev individually: We know the set of vqs to check is all
vqs but our vhost_dev one.

Does it make it more clear?

Thanks!

> Thanks
>
>
> > +            return false;
> > +        }
> > +    }
> > +
> > +    for (int i =3D 0; i < dev->vq_index_end; ++i) {
> > +        struct vhost_vring_state vq_group =3D {
> > +            .index =3D i,
> > +        };
> > +
> > +        if (dev->vq_index <=3D i && i < dev->vq_index + dev->nvqs) {
> > +            continue;
> > +        }
> > +
> > +        ret =3D vhost_vdpa_get_vring_group(dev, &vq_group);
> > +        if (unlikely(ret)) {
> > +            goto call_err;
> > +        }
> > +        if (unlikely(vq_group.num =3D=3D this_vq_group.num)) {
> > +            error_report("VQ %d group is the same as VQ %d one",
> > +                         this_vq_group.index, vq_group.index);
> > +            return false;
> > +        }
> > +    }
> > +
> > +    return true;
> > +
> > +call_err:
> > +    error_report("Can't read vq group, errno=3D%d (%s)", ret, g_strerr=
or(-ret));
> > +    return false;
> > +}
> > +
> >   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> >   {
> >       struct vhost_vdpa *v =3D dev->opaque;
> > @@ -1118,6 +1191,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev=
 *dev, bool started)
> >
> >       if (started) {
> >           vhost_vdpa_host_notifiers_init(dev);
> > +        if (dev->independent_vq_group &&
> > +            !vhost_dev_is_independent_group(dev)) {
> > +            return -1;
> > +        }
> >           ok =3D vhost_vdpa_svqs_start(dev);
> >           if (unlikely(!ok)) {
> >               return -1;
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index ab8e095b73..ffb8eb26e7 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -46,6 +46,7 @@ vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
> >   vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
> >   vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, uint=
32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 0x%"PRIx32
> >   vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len) "=
dev: %p config: %p config_len: %"PRIu32
> > +vhost_vdpa_get_vring_group(void *dev, unsigned int index, unsigned int=
 num) "dev: %p index: %u num: %u"
> >   vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
> >   vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long long =
size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %llu =
refcnt: %d fd: %d log: %p"
> >   vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned int=
 flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t avail_us=
er_addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 0x%x desc_user_=
addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" =
log_guest_addr: 0x%"PRIx64
>


