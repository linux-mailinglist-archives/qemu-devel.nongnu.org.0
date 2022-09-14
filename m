Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D0C5B8725
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 13:20:38 +0200 (CEST)
Received: from localhost ([::1]:50030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYQRZ-0004zO-A4
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 07:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oYQJW-0007YD-4Q
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:12:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oYQJS-0000ca-GN
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663153933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xD+gvkG3a1/itjX+eL/Tffy7clVVh/C6YoeuHURW3b4=;
 b=cIwY/BN9oHZKc4jeYtdX8xsTHxaw7ky5N7jbLwalDphEHeMWybB38bm3go55Uw22TmVAsm
 YrnIdwmRKmlQbepQrOu/k4IO6U6xk8xLEImX+Q87pP8jg4lE9yklTrYI00WAMioqx1lv0z
 xp91gbWqvqm87hBH+lfGm106TSKosO8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-127-smHio5OwMFq8dvoHsoL3Kw-1; Wed, 14 Sep 2022 07:12:12 -0400
X-MC-Unique: smHio5OwMFq8dvoHsoL3Kw-1
Received: by mail-qt1-f200.google.com with SMTP id
 o22-20020ac85a56000000b0034481129ce6so12142057qta.19
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xD+gvkG3a1/itjX+eL/Tffy7clVVh/C6YoeuHURW3b4=;
 b=f5Cbaf1ahBMnaI1fD9ZFu3Hu1gb0WTQNFUzkanf8SMw/JaUZpX/n4VZQ7nTIekrXN4
 ne7cI3efag3d8WmJ+uEGC6Eqr/thYSu328+khUTg3KwC9yZ8EgVzneX3buwb0dJ3Y9jp
 3iF+04ntzD7ZUC+QgIUB3ZWEwj5W9Q4oDBWwNuAlc8CFmwKDPXJhF+M6N2E28IjAJbAW
 UwkDZJ80NkFv3l03Hp8RMerBhNnGVZPHN1hx4oVHuvcqoOfgLtKSYUikARdYVGeBF/u5
 Zh/itb5GcYj3kYvFfkkV9IDYfqgNg2UBfhM+X2H6QNi2rRudiJvBw8PfYEm0XrN6d0fL
 hAHA==
X-Gm-Message-State: ACgBeo2/f9aVEvlPGsblp6PA5dm3+KPEVNwg0CuwIe0WgOmsCPs6JMHR
 2wLIIUJCVq/khlYwZTVpFw+/l6qgWJ283Ly0iLUzVeNv/TPfIoa/OeQ0oq37JsllaFep/BXSCe/
 ZPgSD4tSrDpnDM4FzPwnHoKX4apI6wEc=
X-Received: by 2002:a05:6214:b6c:b0:4a6:be2e:1413 with SMTP id
 ey12-20020a0562140b6c00b004a6be2e1413mr31893600qvb.129.1663153931478; 
 Wed, 14 Sep 2022 04:12:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5DZzLAJtLRBPp3vXjxeDPLNUz71pAMZZBRlMxAJqPc7+LQVRdQD+cvHMn1iaIxdzc75zv3+XPqS23cu8PBqBc=
X-Received: by 2002:a05:6214:b6c:b0:4a6:be2e:1413 with SMTP id
 ey12-20020a0562140b6c00b004a6be2e1413mr31893582qvb.129.1663153931232; Wed, 14
 Sep 2022 04:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
 <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
 <20220909043707-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220909043707-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 14 Sep 2022 13:11:34 +0200
Message-ID: <CAJaqyWfD=zvQFmtsS_=2prH4H7LhWVAAjpDQ7_K73s55Ze7rww@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Fri, Sep 9, 2022 at 10:38 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Sep 09, 2022 at 10:01:16AM +0200, Eugenio Perez Martin wrote:
> > On Fri, Sep 9, 2022 at 8:40 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Sep 9, 2022 at 2:38 PM Jason Wang <jasowang@redhat.com> wrote=
:
> > > >
> > > > On Wed, Sep 7, 2022 at 12:36 AM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
> > > > >
> > > > > To have enabled vlans at device startup may happen in the destina=
tion of
> > > > > a live migration, so this configuration must be restored.
> > > > >
> > > > > At this moment the code is not accessible, since SVQ refuses to s=
tart if
> > > > > vlan feature is exposed by the device.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >  net/vhost-vdpa.c | 46 ++++++++++++++++++++++++++++++++++++++++++=
++--
> > > > >  1 file changed, 44 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > index 4bc3fd01a8..ecbfd08eb9 100644
> > > > > --- a/net/vhost-vdpa.c
> > > > > +++ b/net/vhost-vdpa.c
> > > > > @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_feature=
s =3D
> > > > >      BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > > > >      BIT_ULL(VIRTIO_NET_F_STANDBY);
> > > > >
> > > > > +#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
> > > > > +
> > > > >  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> > > > >  {
> > > > >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > > > @@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPAS=
tate *s,
> > > > >      return *s->status !=3D VIRTIO_NET_OK;
> > > > >  }
> > > > >
> > > > > +static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
> > > > > +                                           const VirtIONet *n,
> > > > > +                                           uint16_t vid)
> > > > > +{
> > > > > +    ssize_t dev_written =3D vhost_vdpa_net_load_cmd(s, VIRTIO_NE=
T_CTRL_VLAN,
> > > > > +                                                  VIRTIO_NET_CTR=
L_VLAN_ADD,
> > > > > +                                                  &vid, sizeof(v=
id));
> > > > > +    if (unlikely(dev_written < 0)) {
> > > > > +        return dev_written;
> > > > > +    }
> > > > > +
> > > > > +    if (unlikely(*s->status !=3D VIRTIO_NET_OK)) {
> > > > > +        return -EINVAL;
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
> > > > > +                                    const VirtIONet *n)
> > > > > +{
> > > > > +    uint64_t features =3D n->parent_obj.guest_features;
> > > > > +
> > > > > +    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
> > > > > +        return 0;
> > > > > +    }
> > > > > +
> > > > > +    for (int i =3D 0; i < MAX_VLAN >> 5; i++) {
> > > > > +        for (int j =3D 0; n->vlans[i] && j <=3D 0x1f; j++) {
> > > > > +            if (n->vlans[i] & (1U << j)) {
> > > > > +                int r =3D vhost_vdpa_net_load_single_vlan(s, n, =
(i << 5) + j);
> > > >
> > > > This seems to cause a lot of latency if the driver has a lot of vla=
ns.
> > > >
> > > > I wonder if it's simply to let all vlan traffic go by disabling
> > > > CTRL_VLAN feature at vDPA layer.
> > >
> >
> > The guest will not be able to recover that vlan configuration.
> >
> > > Another idea is to extend the spec to allow us to accept a bitmap of
> > > the vlan ids via a single command, then we will be fine.
> > >
> >
> > I'm not sure if adding more ways to configure something is the answer,
> > but I'd be ok to implement it.
> >
> > Another idea is to allow the sending of many CVQ commands in parallel.
> > It shouldn't be very hard to achieve using exposed buffers as ring
> > buffers, and it will short down the start of the devices with many
> > features.
>
> This would seem like a reasonable second step.  A first step would be to
> measure the overhead to make sure there's actually a need to optimize
> this.
>

I totally agree.

The processing time of each command is limited by the device. Taking
this to the extreme, we could achieve almost instantaneous
configuration for vdpa_sim_net, but a new device could take forever to
configure each mac.

So I think it should be considered as an optimization on top too, and
apply only if we see the initialization is slow on any devices.

Thanks!


