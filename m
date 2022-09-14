Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF80C5B89EA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 16:08:18 +0200 (CEST)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYT3o-0007N1-HU
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 10:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oYSuN-0001HI-N6
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:58:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oYSuI-00075w-Qg
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663163904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tcL1phHYD4H09F+OiNxGdj6Ys8EL5ZuNPYH/XwV2/N4=;
 b=bOV2pRgXNz53nrZiS6vbNpQ26ObfyWqjO7XPadHTQjxG2xlIFM/JrAJjG2eEwy1qvWajrc
 ltMZp6CK/k8FX7JY7xhqFdn1QKC90agyE5JX5Pn1hQ6o7DwYta+v5iRZ9F0XHveM8VVM+P
 dHq+sXPPZg/I/iZfa0/+rn32/Km8ers=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-438-VPogDY5qP9GXEhct6ZcY6Q-1; Wed, 14 Sep 2022 09:58:23 -0400
X-MC-Unique: VPogDY5qP9GXEhct6ZcY6Q-1
Received: by mail-qt1-f198.google.com with SMTP id
 cg13-20020a05622a408d00b0035bb2f77e7eso7782820qtb.10
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 06:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tcL1phHYD4H09F+OiNxGdj6Ys8EL5ZuNPYH/XwV2/N4=;
 b=KbRxkQqViHyK0y71+7Bcy/0EMDbBiSq4r9SufAo1nOM5rfAEtyNdPZTk7ep7ZhGjPT
 bl3MvTaPjRYjSkKQN440WW17x20ILeH+x3pJCggXfL3BBXXh+byt+OKGFjH9QPUXttjo
 HItrsHXSs4s4okWF0Lz+pG1/qLEMkM13IF1XWdBf6PYDhzyODJKRVk4s8ooDu6l/BRzm
 j/nF7M5nQhEIjCHXW/7lyrS6yaiggFwuzfM1hKkNQgc/f32RCI0IA3oifmTAgBmT1qTA
 XoOUvaqfjl5kUQAdcQLf0kNN+2TMlhvYyvi4s9kybLoW5zmM1TzobDGtAQ4K4Tgggue9
 4TOw==
X-Gm-Message-State: ACgBeo24CcpWvnSoRnVUVYFNBkWYWYwzXIrnSJM5hh57hF24madjcpNS
 NmvOwhhTIOxZNC7MsEMAshoaiiScaAzOwTeKyCe6e0ET4Bg294os7oM6mOl0p2ZNLnUc6/O/Qp+
 9+GjOrZMDI2a7Tdqh9Guq8ARUJlUFkog=
X-Received: by 2002:a05:620a:29d1:b0:6bb:6c7a:34c2 with SMTP id
 s17-20020a05620a29d100b006bb6c7a34c2mr26271772qkp.743.1663163903220; 
 Wed, 14 Sep 2022 06:58:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4sp3sqX7a0x7zxcl18sNH4i1Ekz5R6oWIzJa1IaCnfdpl+Vs9qSvAs4p2H/E3yRdOuBYqOwoBr+9/aiwFXVPA=
X-Received: by 2002:a05:620a:29d1:b0:6bb:6c7a:34c2 with SMTP id
 s17-20020a05620a29d100b006bb6c7a34c2mr26271742qkp.743.1663163902987; Wed, 14
 Sep 2022 06:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
 <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
 <CACGkMEvW5ZUZEcx9COvwjAT5PUraoko8k1foBez=T1nmhjKpDw@mail.gmail.com>
 <34969f96-b7c4-c9f8-2248-3e84a84148b2@oracle.com>
In-Reply-To: <34969f96-b7c4-c9f8-2248-3e84a84148b2@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 14 Sep 2022 15:57:46 +0200
Message-ID: <CAJaqyWfZBHSTwY+WRDbwS+Sw0NsXsmpfhgpOtmLNM3dUWzrd7w@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Wed, Sep 14, 2022 at 1:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
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

I also think it is worth at least trying to migrate it for sure. For
MAC there may be too many entries, but VLAN should be totally
manageable (and the information is already there, the bitmap is
actually being migrated).

> I think that the reason this could survive is really software
> implementation specific - say if the backend doesn't start with VLAN
> filtering disabled (meaning allow all VLAN traffic to pass) then it
> would become a problem. This won't be a problem for almost PF NICs but
> may be problematic for vDPA e.g. VF backed VDPAs.

I'd say the driver would expect all vlan filters to be cleared after a
reset, isn't it? The spec doesn't explicitly say anything about that
as far as I see.

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
>

If we're going that route, being able to set a bitmap for vlan
filtering (Jason's proposal) seems to solve more issues in the same
shot, doesn't it?

Thanks!


