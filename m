Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BCC5B92B7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 04:42:38 +0200 (CEST)
Received: from localhost ([::1]:45194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYepp-0007lN-7M
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 22:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYeoP-0006NZ-Qg
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 22:41:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYeoJ-0007vG-Fi
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 22:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663209657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a2fQ65DMR+6wbwrE8qaoku1D15jtqlRLd0IjsR1dI2k=;
 b=BIklWX4wgJMRe4y7bcMQVkxowqxT2JVYk7GK3wJn0mXInTSneOxGpa7QB8aXvegG2WGr4Z
 hK8M+1HDETvUh4JGxOrCAgJ/H9kpAWRJQlxSi8MhdjsZ88uFP7ZZCEQ2SS7XDSHHhCfNIS
 wjuQZpBq+epmLdQbMFZQKRef04nQSiI=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-501-MX9z4OpGM92uXMtIo3I93g-1; Wed, 14 Sep 2022 22:40:56 -0400
X-MC-Unique: MX9z4OpGM92uXMtIo3I93g-1
Received: by mail-vs1-f69.google.com with SMTP id
 d187-20020a671dc4000000b0038e312cde86so1807107vsd.13
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 19:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=a2fQ65DMR+6wbwrE8qaoku1D15jtqlRLd0IjsR1dI2k=;
 b=q1TBAGRwW9qHxchNfiKD1B4sETlr+ojIAixi9JHiDP8lfcxQ5MAfxL6Hvoao183KkY
 P8F1Bq6EPGhjxJiQnQX9LRuSTWUyG0Jk+wtMHQsqrET5ISn54J1snzuDbwi9c6eRU9ET
 pdbc7sO9Hpy0J/xCNv4j3fyD0ZvL1DDqCfdOAAYwGvB/AB2SbkqEls21r7nQmzS+e4Hu
 1zVBJUCT7Oi2nc3PQZzwPUYqE6rtX5im6JQz27rXcc6lpKDkphYLFJBVBs42ZHbtOahs
 o3Nr3HrGe6QUfbxvVFw4Szh8JGaYBFAGi4ZKSArq7U562XlBVVSSw04pB5iatjU2frrd
 f/1g==
X-Gm-Message-State: ACgBeo36Eatw4TPhnP7V7w/ZfQp9SRCNGg4X6j8fjVChHOYC/z0f6oB1
 ZGysTurrb4ZyfJj/AsJWdnuazLnZqWf5mPNInd0ObSbgtaNKfBnnW+xismfTUQ2eeq4vomb+NsA
 V2HHYG+LWeEwWIsIgs7/IhID0ay6Xcfs=
X-Received: by 2002:a05:6102:a84:b0:357:c234:8041 with SMTP id
 n4-20020a0561020a8400b00357c2348041mr12764919vsg.25.1663209655743; 
 Wed, 14 Sep 2022 19:40:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5/TOJtOmNglOhJ4nrDs0X3abVMfuWyhzUdbVdvcLsVpyb2M76MNixLcvEVB6Lu+vvSHkEMmR8qW7t3Qw0rZFw=
X-Received: by 2002:a05:6102:a84:b0:357:c234:8041 with SMTP id
 n4-20020a0561020a8400b00357c2348041mr12764912vsg.25.1663209655514; Wed, 14
 Sep 2022 19:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
 <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
 <CACGkMEvW5ZUZEcx9COvwjAT5PUraoko8k1foBez=T1nmhjKpDw@mail.gmail.com>
 <34969f96-b7c4-c9f8-2248-3e84a84148b2@oracle.com>
In-Reply-To: <34969f96-b7c4-c9f8-2248-3e84a84148b2@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 15 Sep 2022 10:40:44 +0800
Message-ID: <CACGkMEvUuhLeXxFZzGHh9kAe0n9_6jTtN7YXpThDRqkhsRsfxQ@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Wed, Sep 14, 2022 at 7:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 9/14/2022 3:20 AM, Jason Wang wrote:
> > On Fri, Sep 9, 2022 at 4:02 PM Eugenio Perez Martin <eperezma@redhat.co=
m> wrote:
> >> On Fri, Sep 9, 2022 at 8:40 AM Jason Wang <jasowang@redhat.com> wrote:
> >>> On Fri, Sep 9, 2022 at 2:38 PM Jason Wang <jasowang@redhat.com> wrote=
:
> >>>> On Wed, Sep 7, 2022 at 12:36 AM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
> >>>>> To have enabled vlans at device startup may happen in the destinati=
on of
> >>>>> a live migration, so this configuration must be restored.
> >>>>>
> >>>>> At this moment the code is not accessible, since SVQ refuses to sta=
rt if
> >>>>> vlan feature is exposed by the device.
> >>>>>
> >>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>> ---
> >>>>>   net/vhost-vdpa.c | 46 +++++++++++++++++++++++++++++++++++++++++++=
+--
> >>>>>   1 file changed, 44 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>>>> index 4bc3fd01a8..ecbfd08eb9 100644
> >>>>> --- a/net/vhost-vdpa.c
> >>>>> +++ b/net/vhost-vdpa.c
> >>>>> @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_features =
=3D
> >>>>>       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> >>>>>       BIT_ULL(VIRTIO_NET_F_STANDBY);
> >>>>>
> >>>>> +#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
> >>>>> +
> >>>>>   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> >>>>>   {
> >>>>>       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>>>> @@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPASta=
te *s,
> >>>>>       return *s->status !=3D VIRTIO_NET_OK;
> >>>>>   }
> >>>>>
> >>>>> +static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
> >>>>> +                                           const VirtIONet *n,
> >>>>> +                                           uint16_t vid)
> >>>>> +{
> >>>>> +    ssize_t dev_written =3D vhost_vdpa_net_load_cmd(s, VIRTIO_NET_=
CTRL_VLAN,
> >>>>> +                                                  VIRTIO_NET_CTRL_=
VLAN_ADD,
> >>>>> +                                                  &vid, sizeof(vid=
));
> >>>>> +    if (unlikely(dev_written < 0)) {
> >>>>> +        return dev_written;
> >>>>> +    }
> >>>>> +
> >>>>> +    if (unlikely(*s->status !=3D VIRTIO_NET_OK)) {
> >>>>> +        return -EINVAL;
> >>>>> +    }
> >>>>> +
> >>>>> +    return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
> >>>>> +                                    const VirtIONet *n)
> >>>>> +{
> >>>>> +    uint64_t features =3D n->parent_obj.guest_features;
> >>>>> +
> >>>>> +    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
> >>>>> +        return 0;
> >>>>> +    }
> >>>>> +
> >>>>> +    for (int i =3D 0; i < MAX_VLAN >> 5; i++) {
> >>>>> +        for (int j =3D 0; n->vlans[i] && j <=3D 0x1f; j++) {
> >>>>> +            if (n->vlans[i] & (1U << j)) {
> >>>>> +                int r =3D vhost_vdpa_net_load_single_vlan(s, n, (i=
 << 5) + j);
> >>>> This seems to cause a lot of latency if the driver has a lot of vlan=
s.
> >>>>
> >>>> I wonder if it's simply to let all vlan traffic go by disabling
> >>>> CTRL_VLAN feature at vDPA layer.
> >> The guest will not be able to recover that vlan configuration.
> > Spec said it's best effort and we actually don't do this for
> > vhost-net/user for years and manage to survive.
> I thought there's a border line between best effort and do nothing. ;-)
>
> I think that the reason this could survive is really software
> implementation specific - say if the backend doesn't start with VLAN
> filtering disabled (meaning allow all VLAN traffic to pass) then it
> would become a problem. This won't be a problem for almost PF NICs but
> may be problematic for vDPA e.g. VF backed VDPAs.

So it looks like an issue of the implementation. If CTRL_VLAN is not
negotiated, the device should disable vlan filters.


> >
> >>> Another idea is to extend the spec to allow us to accept a bitmap of
> >>> the vlan ids via a single command, then we will be fine.
> >>>
> >> I'm not sure if adding more ways to configure something is the answer,
> >> but I'd be ok to implement it.
> >>
> >> Another idea is to allow the sending of many CVQ commands in parallel.
> >> It shouldn't be very hard to achieve using exposed buffers as ring
> >> buffers, and it will short down the start of the devices with many
> >> features.
> > In the extreme case, what if guests decide to filter all of the vlans?
> > It means we need MAX_VLAN commands which may exceeds the size of the
> > control virtqueue.
> Indeed, that's a case where a single flat device state blob would be
> more efficient for hardware drivers to apply than individual control
> command messages do.

Right, so we can optimize the spec for this.

Thanks

>
> -Siwei
> >
> > Thanks
> >
> >> Thanks!
> >>
> >>> Thanks
> >>>
> >>>> Thanks
> >>>>
> >>>>> +                if (unlikely(r !=3D 0)) {
> >>>>> +                    return r;
> >>>>> +                }
> >>>>> +            }
> >>>>> +        }
> >>>>> +    }
> >>>>> +
> >>>>> +    return 0;
> >>>>> +}
> >>>>> +
> >>>>>   static int vhost_vdpa_net_load(NetClientState *nc)
> >>>>>   {
> >>>>>       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>>>> @@ -445,8 +488,7 @@ static int vhost_vdpa_net_load(NetClientState *=
nc)
> >>>>>       if (unlikely(r)) {
> >>>>>           return r;
> >>>>>       }
> >>>>> -
> >>>>> -    return 0;
> >>>>> +    return vhost_vdpa_net_load_vlan(s, n);
> >>>>>   }
> >>>>>
> >>>>>   static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> >>>>> --
> >>>>> 2.31.1
> >>>>>
>


