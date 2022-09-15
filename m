Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5997F5B92BB
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 04:47:48 +0200 (CEST)
Received: from localhost ([::1]:57456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYeup-00015m-E2
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 22:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYeso-00083n-UJ
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 22:45:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYesk-0000Q6-Dq
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 22:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663209937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aizA5HrtnEd1xPKm6ZHJ7KpXO6By3pjcp5bFcIhCnsw=;
 b=PVb8mCWp6xMv1vSzL4+oGyL91zy1xRBTPpvBLjyYxeXm19Eotn+sO/wFybEWn0Xgw1WGMD
 8bT1bGwlZasOphzd6nWjLQcgcucnK8F+2LH5WGlt7/WHkWehgh2EFoLFen2yDqvuoYwUxy
 K3+xqzcjGw69EMmof7yFEWolpzz4MUg=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-428-6Xc_4n1FNkaVar0GL3x1fQ-1; Wed, 14 Sep 2022 22:45:35 -0400
X-MC-Unique: 6Xc_4n1FNkaVar0GL3x1fQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 s6-20020a9f2986000000b003b3e759ed1aso4697500uas.14
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 19:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aizA5HrtnEd1xPKm6ZHJ7KpXO6By3pjcp5bFcIhCnsw=;
 b=svLYPPn5rQ3YbcdDCImaYY9NJteWAgHE5EZ1YwSZ/0okgyPN+0QJIt5m6EFDJCYcvN
 bCbtg510PK61d39v1cg2BIUlCVkf1H5UNBCUzQwyGJvXmrUgEQ/zjkI2xDCSIyedeFQz
 W9J0dLUc9RnVLfAakNz/kKLkB/e9FaO1GsT7FEqEwzKX3p8x6lsFzQsskhP5Kee0Ds+0
 1x4gREuKu1UOeROAcl3y7NwKo/hHLAK7QWueC4752qmXPtb2em6knLUPcyfuNGlbUq9v
 uByrxLPJIpFJb6z9R2bm4a6+DzlYr0ft5zu2Qclz6Vtq0lUpvI+nHy0aVeuS6BlFKI1X
 V0kQ==
X-Gm-Message-State: ACgBeo12Rr6JoTuqKoPRixrn6mGXmeoLtajwiZ4SleoWJbXhSCp/w6G2
 foOMENOIByD+7OCiCnJX5aBaFviORxXp2EImUwzeF5ZKHTJfKOYSdJPVxVFy1SfJymKF4EbAfoE
 dfk3l502IsHioBnyBYjp+8UUdvug0Pkk=
X-Received: by 2002:a1f:9cc5:0:b0:3a2:bd20:8fc6 with SMTP id
 f188-20020a1f9cc5000000b003a2bd208fc6mr1840064vke.22.1663209935264; 
 Wed, 14 Sep 2022 19:45:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5bLAeBraiB2dr6J1KzEIK8YRVgu70HfgCFfhuMLIXP1KsHY+vNxZwx3XmiC+cmG+bwDfXUxIlGzW2IDIvV3pk=
X-Received: by 2002:a1f:9cc5:0:b0:3a2:bd20:8fc6 with SMTP id
 f188-20020a1f9cc5000000b003a2bd208fc6mr1840049vke.22.1663209934993; Wed, 14
 Sep 2022 19:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
 <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
 <CACGkMEvW5ZUZEcx9COvwjAT5PUraoko8k1foBez=T1nmhjKpDw@mail.gmail.com>
 <34969f96-b7c4-c9f8-2248-3e84a84148b2@oracle.com>
 <CAJaqyWfZBHSTwY+WRDbwS+Sw0NsXsmpfhgpOtmLNM3dUWzrd7w@mail.gmail.com>
 <411586c9-22a2-1bd5-fbcd-a7658fd00446@oracle.com>
In-Reply-To: <411586c9-22a2-1bd5-fbcd-a7658fd00446@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 15 Sep 2022 10:45:23 +0800
Message-ID: <CACGkMEu6xfMY-gpf9x3EMYzf9kQrmvpk4rux3nUrAb366dYHJA@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Sep 14, 2022 at 11:44 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 9/14/2022 2:57 PM, Eugenio Perez Martin wrote:
> > On Wed, Sep 14, 2022 at 1:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrot=
e:
> >>
> >>
> >> On 9/14/2022 3:20 AM, Jason Wang wrote:
> >>> On Fri, Sep 9, 2022 at 4:02 PM Eugenio Perez Martin <eperezma@redhat.=
com> wrote:
> >>>> On Fri, Sep 9, 2022 at 8:40 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> >>>>> On Fri, Sep 9, 2022 at 2:38 PM Jason Wang <jasowang@redhat.com> wro=
te:
> >>>>>> On Wed, Sep 7, 2022 at 12:36 AM Eugenio P=C3=A9rez <eperezma@redha=
t.com> wrote:
> >>>>>>> To have enabled vlans at device startup may happen in the destina=
tion of
> >>>>>>> a live migration, so this configuration must be restored.
> >>>>>>>
> >>>>>>> At this moment the code is not accessible, since SVQ refuses to s=
tart if
> >>>>>>> vlan feature is exposed by the device.
> >>>>>>>
> >>>>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>>>> ---
> >>>>>>>    net/vhost-vdpa.c | 46 ++++++++++++++++++++++++++++++++++++++++=
++++--
> >>>>>>>    1 file changed, 44 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>>>>>> index 4bc3fd01a8..ecbfd08eb9 100644
> >>>>>>> --- a/net/vhost-vdpa.c
> >>>>>>> +++ b/net/vhost-vdpa.c
> >>>>>>> @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_feature=
s =3D
> >>>>>>>        BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> >>>>>>>        BIT_ULL(VIRTIO_NET_F_STANDBY);
> >>>>>>>
> >>>>>>> +#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
> >>>>>>> +
> >>>>>>>    VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> >>>>>>>    {
> >>>>>>>        VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>>>>>> @@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPAS=
tate *s,
> >>>>>>>        return *s->status !=3D VIRTIO_NET_OK;
> >>>>>>>    }
> >>>>>>>
> >>>>>>> +static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
> >>>>>>> +                                           const VirtIONet *n,
> >>>>>>> +                                           uint16_t vid)
> >>>>>>> +{
> >>>>>>> +    ssize_t dev_written =3D vhost_vdpa_net_load_cmd(s, VIRTIO_NE=
T_CTRL_VLAN,
> >>>>>>> +                                                  VIRTIO_NET_CTR=
L_VLAN_ADD,
> >>>>>>> +                                                  &vid, sizeof(v=
id));
> >>>>>>> +    if (unlikely(dev_written < 0)) {
> >>>>>>> +        return dev_written;
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    if (unlikely(*s->status !=3D VIRTIO_NET_OK)) {
> >>>>>>> +        return -EINVAL;
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
> >>>>>>> +                                    const VirtIONet *n)
> >>>>>>> +{
> >>>>>>> +    uint64_t features =3D n->parent_obj.guest_features;
> >>>>>>> +
> >>>>>>> +    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
> >>>>>>> +        return 0;
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    for (int i =3D 0; i < MAX_VLAN >> 5; i++) {
> >>>>>>> +        for (int j =3D 0; n->vlans[i] && j <=3D 0x1f; j++) {
> >>>>>>> +            if (n->vlans[i] & (1U << j)) {
> >>>>>>> +                int r =3D vhost_vdpa_net_load_single_vlan(s, n, =
(i << 5) + j);
> >>>>>> This seems to cause a lot of latency if the driver has a lot of vl=
ans.
> >>>>>>
> >>>>>> I wonder if it's simply to let all vlan traffic go by disabling
> >>>>>> CTRL_VLAN feature at vDPA layer.
> >>>> The guest will not be able to recover that vlan configuration.
> >>> Spec said it's best effort and we actually don't do this for
> >>> vhost-net/user for years and manage to survive.
> >> I thought there's a border line between best effort and do nothing. ;-=
)
> >>
> > I also think it is worth at least trying to migrate it for sure. For
> > MAC there may be too many entries, but VLAN should be totally
> > manageable (and the information is already there, the bitmap is
> > actually being migrated).
> The vlan bitmap is migrated, though you'd still need to add vlan filter
> one by one through ctrl vq commands, correct? AFAIK you can add one
> filter for one single vlan ID at a time via VIRTIO_NET_CTRL_VLAN_ADD.
>
> >
> >> I think that the reason this could survive is really software
> >> implementation specific - say if the backend doesn't start with VLAN
> >> filtering disabled (meaning allow all VLAN traffic to pass) then it
> >> would become a problem. This won't be a problem for almost PF NICs but
> >> may be problematic for vDPA e.g. VF backed VDPAs.
> > I'd say the driver would expect all vlan filters to be cleared after a
> > reset, isn't it?
> If I understand the intended behavior (from QEMU implementation)
> correctly, when VIRTIO_NET_F_CTRL_VLAN is negotiated it would start with
> all VLANs filtered (meaning only untagged traffic can be received and
> traffic with VLAN tag would get dropped). However, if
> VIRTIO_NET_F_CTRL_VLAN is not negotiated, all traffic including untagged
> and tagged can be received.
>
> >   The spec doesn't explicitly say anything about that
> > as far as I see.
> Here the spec is totally ruled by the (software artifact of)
> implementation rather than what a real device is expected to work with
> VLAN rx filters. Are we sure we'd stick to this flawed device
> implementation? The guest driver seems to be agnostic with this broken
> spec behavior so far, and I am afraid it's an overkill to add another
> feature bit or ctrl command to VLAN filter in clean way.
>
> >
> >>>>> Another idea is to extend the spec to allow us to accept a bitmap o=
f
> >>>>> the vlan ids via a single command, then we will be fine.
> >>>>>
> >>>> I'm not sure if adding more ways to configure something is the answe=
r,
> >>>> but I'd be ok to implement it.
> >>>>
> >>>> Another idea is to allow the sending of many CVQ commands in paralle=
l.
> >>>> It shouldn't be very hard to achieve using exposed buffers as ring
> >>>> buffers, and it will short down the start of the devices with many
> >>>> features.
> >>> In the extreme case, what if guests decide to filter all of the vlans=
?
> >>> It means we need MAX_VLAN commands which may exceeds the size of the
> >>> control virtqueue.
> >> Indeed, that's a case where a single flat device state blob would be
> >> more efficient for hardware drivers to apply than individual control
> >> command messages do.
> >>
> > If we're going that route, being able to set a bitmap for vlan
> > filtering (Jason's proposal) seems to solve more issues in the same
> > shot, doesn't it?
> If I understand correctly about Jason's proposal, it's a spec extension
> already to add multiple VLAN IDs in a row. This seems not much different
> than the device state blob for the resume API idea I just presented in
> the KVM forum (which also needs to extend the spec in another way)?
>
> struct virtio_mig_cfg_net_ctrl_vlan {
>      struct virtio_mig_state_header hdr;
>      le32 vlans[128];
> };
>

Some thoughts, actually, it's a choice of

1) trap and emulate

vs

2) load and save

So far vDPA chooses the way for method 1 (but it doesn't exclude the
possibility of method 2). The main "problem" in method 2 is that it
may not work or still require trap in the nesting layer.

For example, in the case of ctrl_vlan, if we simply extend the spec
with an additional command, trap and emulate still work like a charm.

For load and save, it looks to me it would be better to start the work
in the spec (NV is trying to do this). Going with vDPA is also fine if
spec turns out to be too hard.

Thanks

> What is additional benefit that makes it able to solve more issues?
>
>   -Siwei
>
> >
> > Thanks!
> >
>


