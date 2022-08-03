Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8310558918E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 19:37:11 +0200 (CEST)
Received: from localhost ([::1]:59100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJIIw-000449-Gn
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 13:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJI2z-0006Lb-Jo
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJI2r-00052n-0Y
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659547231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vuhwdTX0wXRrP+4KI6h6ILzKQcEMf3oiCXMexdQGlEY=;
 b=SOdxMnr596+aosvV0jZBxE2aoVhEKqBUQIXtt9SCwst1zdkNB6C6WFRNA2LgwBZPzJ8RNk
 8+3tevHwVU1rhOQsexD66l8bTFGIHkvFtxusyVPRhdgPOxAkskh5NqQgIXaZBIsM3F0lug
 M34DaCD0B/gTLpD4ztC/w2iJHTMIqE4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-Qi1FzVwnPUWspMjBH-i8oA-1; Wed, 03 Aug 2022 13:19:10 -0400
X-MC-Unique: Qi1FzVwnPUWspMjBH-i8oA-1
Received: by mail-qv1-f70.google.com with SMTP id
 e1-20020ad44181000000b00472f8ad6e71so10513236qvp.20
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 10:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vuhwdTX0wXRrP+4KI6h6ILzKQcEMf3oiCXMexdQGlEY=;
 b=1AVuyFZmpsBRovPeFLQ8kY+Hw++zjVlJazhjqWfDQPyYlxjhyuUzM3XtRdvvJD7MQ5
 KF+RcvqyfQHoFWsRUV4LdbG48eqN6pQ4wZS9Gk5W/RgzGiWJOa9GvVXIji81F7rSZcVV
 wi4g0YRYCtVtxNSnDngXGiM7jfC3gZadk7/3FDqc2B4g6BMB1vpIYuPccL3gUkr74/vI
 JuFoWfU6WuaP/Q1trkpnFZzF14yi0oTLnjkuIL2KZ38gFvSc31wfYZ74lY9mLKkPQ3j5
 iz8ItXAYD0Uxi/0+1ueIi3fPIkiuDShtJ+LJjq6Z+Uhb8wMYUu3Zjx/rS1I7uj7TAovZ
 5Ghw==
X-Gm-Message-State: AJIora/H4ICDwJ3QqUoEYcjr6nqg8BT2St2gJjsAyCPkqZ3YhG04L7Bz
 rncLEjSJZT/IQAlwKUmugdaez19q1HZrMnI7jnPwrGGLFc54uapHVfjaoAgkEeXx19B8HGqCpq7
 ichkXQSxYUJpZ3p9saGhOYA++4FalvbY=
X-Received: by 2002:a05:622a:110f:b0:31e:e0ae:a734 with SMTP id
 e15-20020a05622a110f00b0031ee0aea734mr23428592qty.495.1659547148120; 
 Wed, 03 Aug 2022 10:19:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ufJksWzdavDrqY3Yb9EETqZOGirllZNT7peEoEfMrXHQWLtci9nIvAu5fb22UHBdVH/zipd+HoD3uWthN0g58=
X-Received: by 2002:a05:622a:110f:b0:31e:e0ae:a734 with SMTP id
 e15-20020a05622a110f00b0031ee0aea734mr23428565qty.495.1659547147816; Wed, 03
 Aug 2022 10:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220722134318.3430667-1-eperezma@redhat.com>
 <20220722134318.3430667-8-eperezma@redhat.com>
 <74d24a62-7017-e937-3bcb-af8f6b605fee@redhat.com>
 <CAJaqyWf3Ua5LFxO9E-nJ+2DD0_nEX_-aK=Gw+R20TBcYnwr2Ng@mail.gmail.com>
In-Reply-To: <CAJaqyWf3Ua5LFxO9E-nJ+2DD0_nEX_-aK=Gw+R20TBcYnwr2Ng@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 3 Aug 2022 19:18:31 +0200
Message-ID: <CAJaqyWdkENm=xseXMLC12VNBfvxFiSENeQ8Rna5SRSJ-5e=PLA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] vdpa: Always start CVQ in SVQ mode
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, kvm list <kvm@vger.kernel.org>, 
 Parav Pandit <parav@mellanox.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Aug 1, 2022 at 9:50 AM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Tue, Jul 26, 2022 at 5:04 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/7/22 21:43, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > Isolate control virtqueue in its own group, allowing to intercept con=
trol
> > > commands but letting dataplane run totally passthrough to the guest.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >   hw/virtio/vhost-vdpa.c |   3 +-
> > >   net/vhost-vdpa.c       | 158 ++++++++++++++++++++++++++++++++++++++=
+--
> > >   2 files changed, 156 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index 79623badf2..fe1c85b086 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -668,7 +668,8 @@ static int vhost_vdpa_set_backend_cap(struct vhos=
t_dev *dev)
> > >   {
> > >       uint64_t features;
> > >       uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> > > -        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
> > > +        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> > > +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
> > >       int r;
> > >
> > >       if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)=
) {
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 6c1c64f9b1..f5075ef487 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -37,6 +37,9 @@ typedef struct VhostVDPAState {
> > >       /* Control commands shadow buffers */
> > >       void *cvq_cmd_out_buffer, *cvq_cmd_in_buffer;
> > >
> > > +    /* Number of address spaces supported by the device */
> > > +    unsigned address_space_num;
> > > +
> > >       /* The device always have SVQ enabled */
> > >       bool always_svq;
> > >       bool started;
> > > @@ -100,6 +103,8 @@ static const uint64_t vdpa_svq_device_features =
=3D
> > >       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > >       BIT_ULL(VIRTIO_NET_F_STANDBY);
> > >
> > > +#define VHOST_VDPA_NET_CVQ_ASID 1
> > > +
> > >   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> > >   {
> > >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > @@ -214,6 +219,109 @@ static ssize_t vhost_vdpa_receive(NetClientStat=
e *nc, const uint8_t *buf,
> > >       return 0;
> > >   }
> > >
> > > +static int vhost_vdpa_get_vring_group(int device_fd,
> > > +                                      struct vhost_vring_state *stat=
e)
> > > +{
> > > +    int r =3D ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, state);
> > > +    return r < 0 ? -errno : 0;
> > > +}
> >
> >
> > It would be more convenient for the caller if we can simply return 0 he=
re.
> >
>
> I don't follow this, how do we know if the call failed then?
>
> >
> > > +
> > > +/**
> > > + * Check if all the virtqueues of the virtio device are in a differe=
nt vq than
> > > + * the last vq. VQ group of last group passed in cvq_group.
> > > + */
> > > +static bool vhost_vdpa_cvq_group_is_independent(struct vhost_vdpa *v=
,
> > > +                                            struct vhost_vring_state=
 cvq_group)
> > > +{
> > > +    struct vhost_dev *dev =3D v->dev;
> > > +    int ret;
> > > +
> > > +    for (int i =3D 0; i < (dev->vq_index_end - 1); ++i) {
> > > +        struct vhost_vring_state vq_group =3D {
> > > +            .index =3D i,
> > > +        };
> > > +
> > > +        ret =3D vhost_vdpa_get_vring_group(v->device_fd, &vq_group);
> > > +        if (unlikely(ret)) {
> > > +            goto call_err;
> > > +        }
> > > +        if (unlikely(vq_group.num =3D=3D cvq_group.num)) {
> > > +            error_report("CVQ %u group is the same as VQ %u one (%u)=
",
> > > +                         cvq_group.index, vq_group.index, cvq_group.=
num);
> >
> >
> > Any reason we need error_report() here?
> >
>
> We can move it to a migration blocker.
>
> > Btw, I'd suggest to introduce new field in vhost_vdpa, then we can get
> > and store the group_id there during init.
> >
> > This could be useful for the future e.g PASID virtualization.
> >
>
> Answering below.
>
> >
> > > +            return false;
> > > +        }
> > > +    }
> > > +
> > > +    return true;
> > > +
> > > +call_err:
> > > +    error_report("Can't read vq group, errno=3D%d (%s)", -ret, g_str=
error(-ret));
> > > +    return false;
> > > +}
> > > +
> > > +static int vhost_vdpa_set_address_space_id(struct vhost_vdpa *v,
> > > +                                           unsigned vq_group,
> > > +                                           unsigned asid_num)
> > > +{
> > > +    struct vhost_vring_state asid =3D {
> > > +        .index =3D vq_group,
> > > +        .num =3D asid_num,
> > > +    };
> > > +    int ret;
> > > +
> > > +    ret =3D ioctl(v->device_fd, VHOST_VDPA_SET_GROUP_ASID, &asid);
> > > +    if (unlikely(ret < 0)) {
> > > +        error_report("Can't set vq group %u asid %u, errno=3D%d (%s)=
",
> > > +            asid.index, asid.num, errno, g_strerror(errno));
> > > +    }
> > > +    return ret;
> > > +}
> > > +
> > > +static void vhost_vdpa_net_prepare(NetClientState *nc)
> > > +{
> > > +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > > +    struct vhost_dev *dev =3D v->dev;
> > > +    struct vhost_vring_state cvq_group =3D {
> > > +        .index =3D v->dev->vq_index_end - 1,
> > > +    };
> > > +    int r;
> > > +
> > > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > > +
> > > +    if (dev->nvqs !=3D 1 || dev->vq_index + dev->nvqs !=3D dev->vq_i=
ndex_end) {
> > > +        /* Only interested in CVQ */
> > > +        return;
> > > +    }
> > > +
> > > +    if (s->always_svq) {
> > > +        /* SVQ is already enabled */
> > > +        return;
> > > +    }
> > > +
> > > +    if (s->address_space_num < 2) {
> > > +        v->shadow_vqs_enabled =3D false;
> > > +        return;
> > > +    }
> > > +
> > > +    r =3D vhost_vdpa_get_vring_group(v->device_fd, &cvq_group);
> > > +    if (unlikely(r)) {
> > > +        error_report("Can't read cvq group, errno=3D%d (%s)", r, g_s=
trerror(-r));
> > > +        v->shadow_vqs_enabled =3D false;
> > > +        return;
> > > +    }
> > > +
> > > +    if (!vhost_vdpa_cvq_group_is_independent(v, cvq_group)) {
> > > +        v->shadow_vqs_enabled =3D false;
> > > +        return;
> > > +    }
> > > +
> > > +    r =3D vhost_vdpa_set_address_space_id(v, cvq_group.num,
> > > +                                        VHOST_VDPA_NET_CVQ_ASID);
> > > +    v->shadow_vqs_enabled =3D r =3D=3D 0;
> > > +    s->vhost_vdpa.address_space_id =3D r =3D=3D 0 ? 1 : 0;
> >
> >
> > I'd expect this to be done net_init_vhost_vdpa(). Or any advantage of
> > initializing thing here?
> >
>
> We don't know the CVQ index at initialization time, since the guest is
> not even running so it has not acked the features. So we cannot know
> its VQ group, which is needed to call set_address_space_id.
>
> In my opinion, we shouldn't even cache "cvq has group id N", since the
> device could return a different group id between resets (for example,
> because the negotiation of different features).
>
> >
> > > +}
> > > +
> > >   static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *ad=
dr)
> > >   {
> > >       VhostIOVATree *tree =3D v->iova_tree;
> > > @@ -432,6 +540,7 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> > >           .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> > >           .size =3D sizeof(VhostVDPAState),
> > >           .receive =3D vhost_vdpa_receive,
> > > +        .prepare =3D vhost_vdpa_net_prepare,
> > >           .start =3D vhost_vdpa_net_start,
> > >           .cleanup =3D vhost_vdpa_cleanup,
> > >           .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> > > @@ -542,12 +651,40 @@ static const VhostShadowVirtqueueOps vhost_vdpa=
_net_svq_ops =3D {
> > >       .avail_handler =3D vhost_vdpa_net_handle_ctrl_avail,
> > >   };
> > >
> > > +static bool vhost_vdpa_get_as_num(int vdpa_device_fd, unsigned *num_=
as,
> > > +                                  Error **errp)
> >
> >
> > Let's simply return int as the #as here.
> >
>
> If as is uint32_t, should we return int64_t and both leave negative
> values for errors and check that #as <=3D UINT32_MAX then?
>
> Thanks!
>

I think a few of the previous comments are on the line of "do not fail
the initialization but allow it with default values (num_as =3D 1,
vq_group =3D 0)".

I think that is ok, but in my opinion we need to add enough tracing
for the user to know what is failing in the environment. Unless more
debugging, the only information they have is that the device does not
support migration, but not what step is failing.

I'll move all the errors to simple warnings for the next version, let
me know if you think we need to omit those warnings too.

Thanks!


