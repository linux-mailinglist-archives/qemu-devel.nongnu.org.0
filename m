Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826E25898EF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:02:54 +0200 (CEST)
Received: from localhost ([::1]:48528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJVoi-00040H-QS
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJVh1-0005Ht-OO
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJVgz-0007Jc-Ed
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659599692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJ16VF46u4pOdw/RGfqvVDi+9IGmgAsgCoVtqAp4xpg=;
 b=Y/sULk3GXMxWsTieX5r+y4R/zBgwiEsVU5wfwjM+x+AyBLnlNLdepX1vPDxsNjY+DZny+I
 mp0lprHxRYytOXvx7y1jcFM2/uulU/x6h1twPz2m8if9xOo/gYkH3YHhc2yDW0zYh1WT4+
 4lI5+v/tMDcQINgBu0FS4iRptyh3fL4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-4gW3pCZsO6y073zO9uuzpg-1; Thu, 04 Aug 2022 03:54:51 -0400
X-MC-Unique: 4gW3pCZsO6y073zO9uuzpg-1
Received: by mail-qk1-f197.google.com with SMTP id
 q20-20020a05620a0d9400b006b6540e8d79so15384720qkl.14
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 00:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bJ16VF46u4pOdw/RGfqvVDi+9IGmgAsgCoVtqAp4xpg=;
 b=3Zlj1XqcSwKeE9lZmMoqx5S7l40Q8zOKY7ppJc7dsQuTAlI/myAs6qBxb+yE6y0zxg
 4uGZoYYs6bi8Q69D3ztT3Fz3p81LCSKEjG8uJgnVHn4Ny7Lhmnh8uXYssdIrdNRe0i0v
 ktY3bs3y4zepZOL7jOHrH7W+0+FcBCj6WZMWNWa2uJoaq/cZPpyhywqXflxt149HPYbw
 lc+HBDZ2IoXu2R/yXAX/No1yxgfkeG9k7uD0+DdXKn8Ulp5fsdl49gzFmm4oGNb5MAj/
 EkXvJ25GIenFfp/seqhCltfw92SbDkxBLpFgazfIR2F5avN0nZBDwVDrbv2H+OgM0ECP
 1+Fg==
X-Gm-Message-State: ACgBeo39CiZFsPYEwvS+FdA3lWtiAOmEf6v2k7dGPwhDcYM3OVS5hUKf
 z/eWClRdImEgd8+pMWnda0JBjUsQ/PzGEFHNRRDSauLvOHuWGEMAa04wYGAzNwMgJ1joWqE9WHc
 Y2YVw9GtI1gC3x+hFEk+C/ZHOXMWly+I=
X-Received: by 2002:a05:6214:5003:b0:474:a0c1:99b2 with SMTP id
 jo3-20020a056214500300b00474a0c199b2mr335382qvb.64.1659599690926; 
 Thu, 04 Aug 2022 00:54:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4kUPdRZ6ttHQF1YrPpb+edyYW8adkT88spVcI4IWgoUmncK3hU4M1kaVTzNphQb2haNGv8mNzJUnLup4j+VH4=
X-Received: by 2002:a05:6214:5003:b0:474:a0c1:99b2 with SMTP id
 jo3-20020a056214500300b00474a0c199b2mr335363qvb.64.1659599690676; Thu, 04 Aug
 2022 00:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220803171821.481336-1-eperezma@redhat.com>
 <20220803171821.481336-8-eperezma@redhat.com>
 <dcc42e5b-cce7-63ed-5312-599b4a7a4a2d@redhat.com>
In-Reply-To: <dcc42e5b-cce7-63ed-5312-599b4a7a4a2d@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 4 Aug 2022 09:54:14 +0200
Message-ID: <CAJaqyWersesOBjai1EVQ5-8Z2DfjOwFdKd_86VdtbObuK8h88Q@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] vdpa: Always start CVQ in SVQ mode
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, kvm list <kvm@vger.kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
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

On Thu, Aug 4, 2022 at 6:44 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/8/4 01:18, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Isolate control virtqueue in its own group, allowing to intercept contr=
ol
> > commands but letting dataplane run totally passthrough to the guest.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> > v3:
> > * Make asid related queries print a warning instead of returning an
> >    error and stop the start of qemu.
> > ---
> >   hw/virtio/vhost-vdpa.c |   3 +-
> >   net/vhost-vdpa.c       | 144 +++++++++++++++++++++++++++++++++++++++-=
-
> >   2 files changed, 142 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 131100841c..a4cb68862b 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -674,7 +674,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_=
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
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index e3b65ed546..5f39f0edb5 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -37,6 +37,9 @@ typedef struct VhostVDPAState {
> >       /* Control commands shadow buffers */
> >       void *cvq_cmd_out_buffer, *cvq_cmd_in_buffer;
> >
> > +    /* Number of address spaces supported by the device */
> > +    unsigned address_space_num;
> > +
> >       /* The device always have SVQ enabled */
> >       bool always_svq;
> >       bool started;
> > @@ -100,6 +103,8 @@ static const uint64_t vdpa_svq_device_features =3D
> >       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> >       BIT_ULL(VIRTIO_NET_F_STANDBY);
> >
> > +#define VHOST_VDPA_NET_CVQ_ASID 1
> > +
> >   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> >   {
> >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > @@ -224,6 +229,101 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> >           .check_peer_type =3D vhost_vdpa_check_peer_type,
> >   };
> >
> > +static void vhost_vdpa_get_vring_group(int device_fd,
> > +                                       struct vhost_vring_state *state=
)
> > +{
> > +    int r =3D ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, state);
> > +    if (unlikely(r < 0)) {
> > +        /*
> > +         * Assume all groups are 0, the consequences are the same and =
we will
> > +         * not abort device creation
> > +         */
> > +        state->num =3D 0;
> > +    }
> > +}
> > +
> > +/**
> > + * Check if all the virtqueues of the virtio device are in a different=
 vq than
> > + * the last vq. VQ group of last group passed in cvq_group.
> > + */
> > +static bool vhost_vdpa_cvq_group_is_independent(struct vhost_vdpa *v,
> > +                                            struct vhost_vring_state c=
vq_group)
> > +{
> > +    struct vhost_dev *dev =3D v->dev;
> > +
> > +    for (int i =3D 0; i < (dev->vq_index_end - 1); ++i) {
> > +        struct vhost_vring_state vq_group =3D {
> > +            .index =3D i,
> > +        };
> > +
> > +        vhost_vdpa_get_vring_group(v->device_fd, &vq_group);
> > +        if (unlikely(vq_group.num =3D=3D cvq_group.num)) {
> > +            warn_report("CVQ %u group is the same as VQ %u one (%u)",
> > +                         cvq_group.index, vq_group.index, cvq_group.nu=
m);
>
>
> I don't get why we need warn here.
>

Is not mandatory, but vhost will set a migration blocker and there is
no way to trace it back to the cause without it.

>
> > +            return false;
> > +        }
> > +    }
> > +
> > +    return true;
> > +}
> > +
> > +static int vhost_vdpa_set_address_space_id(struct vhost_vdpa *v,
> > +                                           unsigned vq_group,
> > +                                           unsigned asid_num)
> > +{
> > +    struct vhost_vring_state asid =3D {
> > +        .index =3D vq_group,
> > +        .num =3D asid_num,
> > +    };
> > +    int ret;
> > +
> > +    ret =3D ioctl(v->device_fd, VHOST_VDPA_SET_GROUP_ASID, &asid);
> > +    if (unlikely(ret < 0)) {
> > +        warn_report("Can't set vq group %u asid %u, errno=3D%d (%s)",
> > +            asid.index, asid.num, errno, g_strerror(errno));
> > +    }
> > +    return ret;
> > +}
> > +
> > +static void vhost_vdpa_net_prepare(NetClientState *nc)
> > +{
> > +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > +    struct vhost_dev *dev =3D v->dev;
> > +    struct vhost_vring_state cvq_group =3D {
> > +        .index =3D v->dev->vq_index_end - 1,
> > +    };
> > +    int r;
> > +
> > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > +
> > +    if (dev->nvqs !=3D 1 || dev->vq_index + dev->nvqs !=3D dev->vq_ind=
ex_end) {
> > +        /* Only interested in CVQ */
> > +        return;
> > +    }
> > +
> > +    if (s->always_svq) {
> > +        /* SVQ is already enabled */
> > +        return;
> > +    }
> > +
> > +    if (s->address_space_num < 2) {
> > +        v->shadow_vqs_enabled =3D false;
> > +        return;
> > +    }
> > +
> > +    vhost_vdpa_get_vring_group(v->device_fd, &cvq_group);
> > +    if (!vhost_vdpa_cvq_group_is_independent(v, cvq_group)) {
>
>
> If there's no other caller of vhost_vdpa_cvq_group_is_independent(), I'd
> suggest to unitfy them into a single helper.
>

Sure, that can be done.

Thanks!

> (Btw, the name of the function is kind of too long).
>
> Thanks
>
>
> > +        v->shadow_vqs_enabled =3D false;
> > +        return;
> > +    }
> > +
> > +    r =3D vhost_vdpa_set_address_space_id(v, cvq_group.num,
> > +                                        VHOST_VDPA_NET_CVQ_ASID);
> > +    v->shadow_vqs_enabled =3D r =3D=3D 0;
> > +    s->vhost_vdpa.address_space_id =3D r =3D=3D 0 ? 1 : 0;
> > +}
> > +
> >   static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr=
)
> >   {
> >       VhostIOVATree *tree =3D v->iova_tree;
> > @@ -431,6 +531,7 @@ static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> >       .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> >       .size =3D sizeof(VhostVDPAState),
> >       .receive =3D vhost_vdpa_receive,
> > +    .prepare =3D vhost_vdpa_net_prepare,
> >       .load =3D vhost_vdpa_net_load,
> >       .cleanup =3D vhost_vdpa_cleanup,
> >       .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> > @@ -541,12 +642,38 @@ static const VhostShadowVirtqueueOps vhost_vdpa_n=
et_svq_ops =3D {
> >       .avail_handler =3D vhost_vdpa_net_handle_ctrl_avail,
> >   };
> >
> > +static uint32_t vhost_vdpa_get_as_num(int vdpa_device_fd)
> > +{
> > +    uint64_t features;
> > +    unsigned num_as;
> > +    int r;
> > +
> > +    r =3D ioctl(vdpa_device_fd, VHOST_GET_BACKEND_FEATURES, &features)=
;
> > +    if (unlikely(r < 0)) {
> > +        warn_report("Cannot get backend features");
> > +        return 1;
> > +    }
> > +
> > +    if (!(features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID))) {
> > +        return 1;
> > +    }
> > +
> > +    r =3D ioctl(vdpa_device_fd, VHOST_VDPA_GET_AS_NUM, &num_as);
> > +    if (unlikely(r < 0)) {
> > +        warn_report("Cannot retrieve number of supported ASs");
> > +        return 1;
> > +    }
> > +
> > +    return num_as;
> > +}
> > +
> >   static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> >                                              const char *device,
> >                                              const char *name,
> >                                              int vdpa_device_fd,
> >                                              int queue_pair_index,
> >                                              int nvqs,
> > +                                           unsigned nas,
> >                                              bool is_datapath,
> >                                              bool svq,
> >                                              VhostIOVATree *iova_tree)
> > @@ -565,6 +692,7 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >       snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
> >       s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >
> > +    s->address_space_num =3D nas;
> >       s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >       s->vhost_vdpa.index =3D queue_pair_index;
> >       s->always_svq =3D svq;
> > @@ -650,6 +778,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >       g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> >       NetClientState *nc;
> >       int queue_pairs, r, i =3D 0, has_cvq =3D 0;
> > +    unsigned num_as =3D 1;
> > +    bool svq_cvq;
> >
> >       assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >       opts =3D &netdev->u.vhost_vdpa;
> > @@ -674,7 +804,13 @@ int net_init_vhost_vdpa(const Netdev *netdev, cons=
t char *name,
> >           goto err;
> >       }
> >
> > -    if (opts->x_svq) {
> > +    svq_cvq =3D opts->x_svq;
> > +    if (has_cvq && !opts->x_svq) {
> > +        num_as =3D vhost_vdpa_get_as_num(vdpa_device_fd);
> > +        svq_cvq =3D num_as > 1;
> > +    }
> > +
> > +    if (opts->x_svq || svq_cvq) {
> >           struct vhost_vdpa_iova_range iova_range;
> >
> >           uint64_t invalid_dev_features =3D
> > @@ -697,15 +833,15 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >
> >       for (i =3D 0; i < queue_pairs; i++) {
> >           ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                     vdpa_device_fd, i, 2, true, opts-=
>x_svq,
> > -                                     iova_tree);
> > +                                     vdpa_device_fd, i, 2, num_as, tru=
e,
> > +                                     opts->x_svq, iova_tree);
> >           if (!ncs[i])
> >               goto err;
> >       }
> >
> >       if (has_cvq) {
> >           nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                 vdpa_device_fd, i, 1, false,
> > +                                 vdpa_device_fd, i, 1, num_as, false,
> >                                    opts->x_svq, iova_tree);
> >           if (!nc)
> >               goto err;
>


