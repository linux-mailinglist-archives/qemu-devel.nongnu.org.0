Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EC7625D3D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:39:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVBk-0000DO-No; Fri, 11 Nov 2022 09:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1otVBU-0000CZ-9d
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:39:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1otVBO-0003MU-Js
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668177541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9XmMCTPQHcU1z5v8migrGk0/aDcB1ztbfAH7wAVUad0=;
 b=PfdInVJmczc7bDgk5TbNGZmkEXZlrMTjUJbA+DpqRkwNRwvg1KWm0AUfcJHrFAHuPp+/Vg
 1tDo+3WbGPdTbfUhshuz89PDyKhPjIyvoZ1X/Mj1Urm8g1T/VWAliFkeq9eGQHvpaG5Qb+
 q8A6GTBfdmdCpEF7SPbcW+YtsQuoFU0=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-5-IWRvgwylMyG2yUrWnkjhFw-1; Fri, 11 Nov 2022 09:39:00 -0500
X-MC-Unique: IWRvgwylMyG2yUrWnkjhFw-1
Received: by mail-pf1-f200.google.com with SMTP id
 cw4-20020a056a00450400b00561ec04e77aso2854247pfb.12
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:39:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9XmMCTPQHcU1z5v8migrGk0/aDcB1ztbfAH7wAVUad0=;
 b=a+Kis3pGWFnLWeHN4iXVqld+7A0FrpYFsQkoDR7A1vZUsZiKkA39OG15pxGN8ZnWkg
 ZrMg0x5pXeuZyVKPmwazNEI/5f7DHWgFJxRivwYwCoFtysjj0EzC0dHItGWdJEMcPo7i
 SyD4LhP7/GV6PS1/mE9b8Z6WkmC5D3wNGKH1etMflZeBdFf9TElUnBDFb+RrYJj4AUlA
 cbrcYYAwbzszILL3iccS8oNY2JamCPleG5h+EMZ7b2ebALszD57f3zOZrn1Ca/JlzZcy
 QW71BUkqzrRq9qHh0negyz/8oLbF6ysPsLS6SOcC1msakP2CgMjrvEJZ7BQ4uIJezcMb
 esFw==
X-Gm-Message-State: ANoB5pkUSsMSwEbsCyqLOIs1HNVR4WBxckcZs1ODaQhT2AjjmzJVmAsp
 rx590Nw44eG5M1HaDRXZpJNAY+34XcSEIbXPmFg7J97dn5gD+cGUZopWux9fhaYHFj2XMItANMd
 8IAH415z7ogUoLZTmbYA+O4H0wP6aOw4=
X-Received: by 2002:a17:90a:d342:b0:213:13ab:c309 with SMTP id
 i2-20020a17090ad34200b0021313abc309mr2214213pjx.80.1668177539268; 
 Fri, 11 Nov 2022 06:38:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5mTG64kl82Ho4eXJYmi9kI0C0xy5OkLP+JmOeBIHiz+Zq+mpkoIBh/ni+ggSH+osDfGWtuGhOAHyqo8WDDtBU=
X-Received: by 2002:a17:90a:d342:b0:213:13ab:c309 with SMTP id
 i2-20020a17090ad34200b0021313abc309mr2214151pjx.80.1668177538765; Fri, 11 Nov
 2022 06:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-11-eperezma@redhat.com>
 <5eb848d8-eb27-4c27-377d-cb6edfe3718c@redhat.com>
 <CAJaqyWdj-EG==hs8D_G6rZOC=20V1fxoBwXqbeU119_EVtOWGw@mail.gmail.com>
 <4b1df7b5-2ecd-0ab2-3192-dfd76aafa5e4@redhat.com>
In-Reply-To: <4b1df7b5-2ecd-0ab2-3192-dfd76aafa5e4@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 11 Nov 2022 15:38:22 +0100
Message-ID: <CAJaqyWe__Z9x+1NxCLd1a-8v6Bd43+xOVLSq2Qs807T4tVZoCw@mail.gmail.com>
Subject: Re: [PATCH v6 10/10] vdpa: Always start CVQ in SVQ mode
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 11, 2022 at 9:03 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/11/11 00:07, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Thu, Nov 10, 2022 at 7:25 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2022/11/9 01:07, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> >>> Isolate control virtqueue in its own group, allowing to intercept con=
trol
> >>> commands but letting dataplane run totally passthrough to the guest.
> >>
> >> I think we need to tweak the title to "vdpa: Always start CVQ in SVQ
> >> mode if possible". Since SVQ for CVQ can't be enabled without ASID sup=
port?
> >>
> > Yes, I totally agree.
>
>
> Btw, I wonder if it's worth to remove the "x-" prefix for the shadow
> virtqueue. It can help for the devices without ASID support but want do
> live migration.
>

Sure I can propose on top.

>
> >
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>> v6:
> >>> * Disable control SVQ if the device does not support it because of
> >>> features.
> >>>
> >>> v5:
> >>> * Fixing the not adding cvq buffers when x-svq=3Don is specified.
> >>> * Move vring state in vhost_vdpa_get_vring_group instead of using a
> >>>     parameter.
> >>> * Rename VHOST_VDPA_NET_CVQ_PASSTHROUGH to VHOST_VDPA_NET_DATA_ASID
> >>>
> >>> v4:
> >>> * Squash vhost_vdpa_cvq_group_is_independent.
> >>> * Rebased on last CVQ start series, that allocated CVQ cmd bufs at lo=
ad
> >>> * Do not check for cvq index on vhost_vdpa_net_prepare, we only have =
one
> >>>     that callback registered in that NetClientInfo.
> >>>
> >>> v3:
> >>> * Make asid related queries print a warning instead of returning an
> >>>     error and stop the start of qemu.
> >>> ---
> >>>    hw/virtio/vhost-vdpa.c |   3 +-
> >>>    net/vhost-vdpa.c       | 138 +++++++++++++++++++++++++++++++++++++=
+---
> >>>    2 files changed, 132 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index e3914fa40e..6401e7efb1 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -648,7 +648,8 @@ static int vhost_vdpa_set_backend_cap(struct vhos=
t_dev *dev)
> >>>    {
> >>>        uint64_t features;
> >>>        uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> >>> -        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
> >>> +        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> >>> +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
> >>>        int r;
> >>>
> >>>        if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features=
)) {
> >>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>> index 02780ee37b..7245ea70c6 100644
> >>> --- a/net/vhost-vdpa.c
> >>> +++ b/net/vhost-vdpa.c
> >>> @@ -38,6 +38,9 @@ typedef struct VhostVDPAState {
> >>>        void *cvq_cmd_out_buffer;
> >>>        virtio_net_ctrl_ack *status;
> >>>
> >>> +    /* Number of address spaces supported by the device */
> >>> +    unsigned address_space_num;
> >>
> >> I'm not sure this is the best place to store thing like this since it
> >> can cause confusion. We will have multiple VhostVDPAState when
> >> multiqueue is enabled.
> >>
> > I think we can delete this and ask it on each device start.
> >
> >>> +
> >>>        /* The device always have SVQ enabled */
> >>>        bool always_svq;
> >>>        bool started;
> >>> @@ -101,6 +104,9 @@ static const uint64_t vdpa_svq_device_features =
=3D
> >>>        BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> >>>        BIT_ULL(VIRTIO_NET_F_STANDBY);
> >>>
> >>> +#define VHOST_VDPA_NET_DATA_ASID 0
> >>> +#define VHOST_VDPA_NET_CVQ_ASID 1
> >>> +
> >>>    VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> >>>    {
> >>>        VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>> @@ -242,6 +248,34 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> >>>            .check_peer_type =3D vhost_vdpa_check_peer_type,
> >>>    };
> >>>
> >>> +static uint32_t vhost_vdpa_get_vring_group(int device_fd, unsigned v=
q_index)
> >>> +{
> >>> +    struct vhost_vring_state state =3D {
> >>> +        .index =3D vq_index,
> >>> +    };
> >>> +    int r =3D ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, &state);
> >>> +
> >>> +    return r < 0 ? 0 : state.num;
> >>
> >> Assume 0 when ioctl() fail is probably not a good idea: errors in ioct=
l
> >> might be hidden. It would be better to fallback to 0 when ASID is not
> >> supported.
> >>
> > Did I misunderstand you on [1]?
>
>
> Nope. I think I was wrong at that time then :( Sorry for that.
>
> We should differ from the case
>
> 1) no ASID support so 0 is assumed
>
> 2) something wrong in the case of ioctl, it's not necessarily a ENOTSUPP.
>

What action should we take here? Isn't it better to disable SVQ and
let the device run?

>
> >
> >>> +}
> >>> +
> >>> +static int vhost_vdpa_set_address_space_id(struct vhost_vdpa *v,
> >>> +                                           unsigned vq_group,
> >>> +                                           unsigned asid_num)
> >>> +{
> >>> +    struct vhost_vring_state asid =3D {
> >>> +        .index =3D vq_group,
> >>> +        .num =3D asid_num,
> >>> +    };
> >>> +    int ret;
> >>> +
> >>> +    ret =3D ioctl(v->device_fd, VHOST_VDPA_SET_GROUP_ASID, &asid);
> >>> +    if (unlikely(ret < 0)) {
> >>> +        warn_report("Can't set vq group %u asid %u, errno=3D%d (%s)"=
,
> >>> +            asid.index, asid.num, errno, g_strerror(errno));
> >>> +    }
> >>> +    return ret;
> >>> +}
> >>> +
> >>>    static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *a=
ddr)
> >>>    {
> >>>        VhostIOVATree *tree =3D v->iova_tree;
> >>> @@ -316,11 +350,54 @@ dma_map_err:
> >>>    static int vhost_vdpa_net_cvq_start(NetClientState *nc)
> >>>    {
> >>>        VhostVDPAState *s;
> >>> -    int r;
> >>> +    struct vhost_vdpa *v;
> >>> +    uint32_t cvq_group;
> >>> +    int cvq_index, r;
> >>>
> >>>        assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >>>
> >>>        s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>> +    v =3D &s->vhost_vdpa;
> >>> +
> >>> +    v->listener_shadow_vq =3D s->always_svq;
> >>> +    v->shadow_vqs_enabled =3D s->always_svq;
> >>> +    s->vhost_vdpa.address_space_id =3D VHOST_VDPA_NET_DATA_ASID;
> >>> +
> >>> +    if (s->always_svq) {
> >>> +        goto out;
> >>> +    }
> >>> +
> >>> +    if (s->address_space_num < 2) {
> >>> +        return 0;
> >>> +    }
> >>> +
> >>> +    if (!vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) =
{
> >>> +        return 0;
> >>> +    }
> >>
> >> Any reason we do the above check during the start/stop? It should be
> >> easier to do that in the initialization.
> >>
> > We can store it as a member of VhostVDPAState maybe? They will be
> > duplicated like the current number of AS.
>
>
> I meant each VhostVDPAState just need to know the ASID it needs to use.
> There's no need to know the total number of address spaces or do the
> validation on it during start (the validation could be done during
> initialization).
>

I thought we were talking about the virtio features.

So let's omit this check and simply try to set ASID? The worst case is
an -ENOTSUPP or -EINVAL, so the actions to take are the same as if we
don't have enough AS.

>
> >
> >>> +
> >>> +    /**
> >>> +     * Check if all the virtqueues of the virtio device are in a dif=
ferent vq
> >>> +     * than the last vq. VQ group of last group passed in cvq_group.
> >>> +     */
> >>> +    cvq_index =3D v->dev->vq_index_end - 1;
> >>> +    cvq_group =3D vhost_vdpa_get_vring_group(v->device_fd, cvq_index=
);
> >>> +    for (int i =3D 0; i < cvq_index; ++i) {
> >>> +        uint32_t group =3D vhost_vdpa_get_vring_group(v->device_fd, =
i);
> >>> +
> >>> +        if (unlikely(group =3D=3D cvq_group)) {
> >>> +            warn_report("CVQ %u group is the same as VQ %u one (%u)"=
, cvq_group,
> >>> +                        i, group);
> >>> +            return 0;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    r =3D vhost_vdpa_set_address_space_id(v, cvq_group, VHOST_VDPA_N=
ET_CVQ_ASID);
> >>> +    if (r =3D=3D 0) {
> >>> +        v->shadow_vqs_enabled =3D true;
> >>> +        s->vhost_vdpa.address_space_id =3D VHOST_VDPA_NET_CVQ_ASID;
> >>> +    }
> >>> +
> >>> +out:
> >>>        if (!s->vhost_vdpa.shadow_vqs_enabled) {
> >>>            return 0;
> >>>        }
> >>> @@ -542,12 +619,38 @@ static const VhostShadowVirtqueueOps vhost_vdpa=
_net_svq_ops =3D {
> >>>        .avail_handler =3D vhost_vdpa_net_handle_ctrl_avail,
> >>>    };
> >>>
> >>> +static uint32_t vhost_vdpa_get_as_num(int vdpa_device_fd)
> >>> +{
> >>> +    uint64_t features;
> >>> +    unsigned num_as;
> >>> +    int r;
> >>> +
> >>> +    r =3D ioctl(vdpa_device_fd, VHOST_GET_BACKEND_FEATURES, &feature=
s);
> >>> +    if (unlikely(r < 0)) {
> >>> +        warn_report("Cannot get backend features");
> >>> +        return 1;
> >>> +    }
> >>> +
> >>> +    if (!(features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID))) {
> >>> +        return 1;
> >>> +    }
> >>> +
> >>> +    r =3D ioctl(vdpa_device_fd, VHOST_VDPA_GET_AS_NUM, &num_as);
> >>> +    if (unlikely(r < 0)) {
> >>> +        warn_report("Cannot retrieve number of supported ASs");
> >>> +        return 1;
> >>
> >> Let's return error here. This help. to identify bugs of qemu or kernel=
.
> >>
> > Same comment as with VHOST_VDPA_GET_VRING_GROUP.
> >
> >>> +    }
> >>> +
> >>> +    return num_as;
> >>> +}
> >>> +
> >>>    static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> >>>                                               const char *device,
> >>>                                               const char *name,
> >>>                                               int vdpa_device_fd,
> >>>                                               int queue_pair_index,
> >>>                                               int nvqs,
> >>> +                                           unsigned nas,
> >>>                                               bool is_datapath,
> >>>                                               bool svq,
> >>>                                               VhostIOVATree *iova_tre=
e)
> >>> @@ -566,6 +669,7 @@ static NetClientState *net_vhost_vdpa_init(NetCli=
entState *peer,
> >>>        qemu_set_info_str(nc, TYPE_VHOST_VDPA);
> >>>        s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>>
> >>> +    s->address_space_num =3D nas;
> >>>        s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >>>        s->vhost_vdpa.index =3D queue_pair_index;
> >>>        s->always_svq =3D svq;
> >>> @@ -652,6 +756,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >>>        g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> >>>        NetClientState *nc;
> >>>        int queue_pairs, r, i =3D 0, has_cvq =3D 0;
> >>> +    unsigned num_as =3D 1;
> >>> +    bool svq_cvq;
> >>>
> >>>        assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >>>        opts =3D &netdev->u.vhost_vdpa;
> >>> @@ -693,12 +799,28 @@ int net_init_vhost_vdpa(const Netdev *netdev, c=
onst char *name,
> >>>            return queue_pairs;
> >>>        }
> >>>
> >>> -    if (opts->x_svq) {
> >>> -        struct vhost_vdpa_iova_range iova_range;
> >>> +    svq_cvq =3D opts->x_svq;
> >>> +    if (has_cvq && !opts->x_svq) {
> >>> +        num_as =3D vhost_vdpa_get_as_num(vdpa_device_fd);
> >>> +        svq_cvq =3D num_as > 1;
> >>> +    }
> >>
> >> The above check is not easy to follow, how about?
> >>
> >> svq_cvq =3D vhost_vdpa_get_as_num() > 1 ? true : opts->x_svq;
> >>
> > That would allocate the iova tree even if CVQ is not used in the
> > guest. And num_as is reused later, although we can ask it to the
> > device at device start to avoid this.
>
>
> Ok.
>
>
> >
> > If any, the linear conversion would be:
> > svq_cvq =3D opts->x_svq || (has_cvq && vhost_vdpa_get_as_num(vdpa_devic=
e_fd))
> >
> > So we avoid the AS_NUM ioctl if not needed.
>
>
> So when !opts->x_svq, we need to check num_as is at least 2?
>

As I think you proposed, we can simply try to set CVQ ASID and react to -EI=
NVAL.

But this code here is trying to not to allocate iova_tree if we're
sure it will not be needed. Maybe it is easier to always allocate the
empty iova tree and only fill it if needed?

>
> >
> >>> +
> >>> +    if (opts->x_svq || svq_cvq) {
> >>
> >> Any chance we can have opts->x_svq =3D true but svq_cvq =3D false? Che=
cking
> >> svq_cvq seems sufficient here.
> >>
> > The reverse is possible, to have svq_cvq but no opts->x_svq.
> >
> > Depending on that, this code emits a warning or a fatal error.
>
>
> Ok, as replied in the previous patch, I think we need a better name for
> those ones.
>

cvq_svq can be renamed for sure. x_svq can be aliased with other
variable if needed too.

> if (opts->x_svq) {
>          shadow_data_vq =3D true;
>          if(has_cvq) shadow_cvq =3D true;
> } else if (num_as >=3D 2 && has_cvq) {
>          shadow_cvq =3D true;
> }
>
> The other logic can just check shadow_cvq or shadow_data_vq individually.
>

Not sure if shadow_data_vq is accurate. It sounds to me as "Only
shadow data virtqueues but not CVQ".

shadow_device and shadow_cvq?

>
> >
> >>> +        Error *warn =3D NULL;
> >>>
> >>> -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
> >>> -            goto err_svq;
> >>> +        svq_cvq =3D vhost_vdpa_net_valid_svq_features(features,
> >>> +                                                   opts->x_svq ? err=
p : &warn);
> >>> +        if (!svq_cvq) {
> >>
> >> Same question as above.
> >>
> >>
> >>> +            if (opts->x_svq) {
> >>> +                goto err_svq;
> >>> +            } else {
> >>> +                warn_reportf_err(warn, "Cannot shadow CVQ: ");
> >>> +            }
> >>>            }
> >>> +    }
> >>> +
> >>> +    if (opts->x_svq || svq_cvq) {
> >>> +        struct vhost_vdpa_iova_range iova_range;
> >>>
> >>>            vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> >>>            iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_r=
ange.last);
> >>> @@ -708,15 +830,15 @@ int net_init_vhost_vdpa(const Netdev *netdev, c=
onst char *name,
> >>>
> >>>        for (i =3D 0; i < queue_pairs; i++) {
> >>>            ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name=
,
> >>> -                                     vdpa_device_fd, i, 2, true, opt=
s->x_svq,
> >>> -                                     iova_tree);
> >>> +                                     vdpa_device_fd, i, 2, num_as, t=
rue,
> >>
> >> I don't get why we need pass num_as to a specific vhost_vdpa structure=
.
> >> It should be sufficient to pass asid there.
> >>
> > ASID is not known at this time, but at device's start. This is because
> > we cannot ask if the CVQ is in its own vq group, because we don't know
> > the control virtqueue index until the guest acknowledges the different
> > features.
>
>
> We can probe those during initialization I think. E.g doing some
> negotiation in the initialization phase.
>

We've developed this idea in other threads, let's continue there better.

Thanks!

> Thanks
>
>
> >
> > Thanks!
> >
> > [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg901685.html
> >
> >
> >>> +                                     opts->x_svq, iova_tree);
> >>>            if (!ncs[i])
> >>>                goto err;
> >>>        }
> >>>
> >>>        if (has_cvq) {
> >>>            nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >>> -                                 vdpa_device_fd, i, 1, false,
> >>> +                                 vdpa_device_fd, i, 1, num_as, false=
,
> >>>                                     opts->x_svq, iova_tree);
> >>>            if (!nc)
> >>>                goto err;
>


