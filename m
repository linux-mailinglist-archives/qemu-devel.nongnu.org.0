Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B2F5B7EEB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 04:24:33 +0200 (CEST)
Received: from localhost ([::1]:50798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYI4m-0003vA-KY
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 22:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYI2d-0000PG-9V
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 22:22:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYI2b-0003Km-55
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 22:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663122136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wI7qmHl68LaGyHDDf4iv1v6DGyst7EEWBEWZUHTjbbY=;
 b=UmyHmM/+B1VyrNXaFhuGN9CpHpKFbff/WVcRpJWeLR1biYDLphpRXUA7vJlYzhKB5knnZQ
 aORfDmisH8s9uwhd2i1cFSrNnu1DlGVw2qIzUtzhHyr60rkb4qf8fEvdblLPJXtxOg538y
 V09ar14EI9hMhEfYvtVS92qj6pQtMr4=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-gGPE8IBlNNihsNzMCGLXbg-1; Tue, 13 Sep 2022 22:22:15 -0400
X-MC-Unique: gGPE8IBlNNihsNzMCGLXbg-1
Received: by mail-vs1-f71.google.com with SMTP id
 c129-20020a671c87000000b0038ae002e7a6so1389229vsc.14
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 19:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wI7qmHl68LaGyHDDf4iv1v6DGyst7EEWBEWZUHTjbbY=;
 b=ZIl+pZ6TKCPV2pgig0kfKcqdX7+C1giLtUjCqSSIeICNlO5lMXoehS42AwxGE1di1c
 8mLKMVl+kt1U8sG3MLoZuyhMM8uGHRwrjp/5+5JSsQVwGY7axVldO6lP0Q78/YKQwmPF
 1qsFa8Ew40bFueheJqcLu6YwK5OwoO29qo8HHYPQ/7d36BWcY45vC0GitVlX2zZW7rn+
 B1ui9mmYJBuRH7PIuqSly2OgyLN6h3xBLGNXfSxM4ZBabb1dQKIhcEFMEZzIYXh2QEeE
 1bBZk0k0LGhlQqzclaryhTwGlFRRlYkhU5zhbRZ2nRj3FUdkvegujIHGGJT6fWeG3Fhb
 3Jyw==
X-Gm-Message-State: ACgBeo3MQp/1NfQHcAigrkfqqr7skIjYOjAXnHiCf2V80ihef2k7hNmP
 rj3SB2Ftdsutb7oQ2hkNZrkIVjQt3Cpb2S1ZSuJgnhTPdTJs1H2cg6mGINKcaOok7FfiZQ0ncPZ
 Awvf7FO+/drjVJaifHbn7wiMoukvrBno=
X-Received: by 2002:a05:6102:1341:b0:398:889e:7f28 with SMTP id
 j1-20020a056102134100b00398889e7f28mr4799541vsl.21.1663122134911; 
 Tue, 13 Sep 2022 19:22:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5k4XckeRxrRby/mPlmRGBD5wvNRHfdJVqBDPqTDjlCPpkzrnilgKZ5/xmtqYu14a7T0TiZwPTkpSIS+9FVHoQ=
X-Received: by 2002:a05:6102:1341:b0:398:889e:7f28 with SMTP id
 j1-20020a056102134100b00398889e7f28mr4799528vsl.21.1663122134710; Tue, 13 Sep
 2022 19:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
 <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
 <20220909043707-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220909043707-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 14 Sep 2022 10:22:03 +0800
Message-ID: <CACGkMEtkphsV2XkyBRfp7OK5zpW5VWS5zHOusLYcHj5w6e6tdA@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, 
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

On Fri, Sep 9, 2022 at 4:38 PM Michael S. Tsirkin <mst@redhat.com> wrote:
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

+1.

Thanks

>
>
> > Thanks!
> >
> > > Thanks
> > >
> > > >
> > > > Thanks
> > > >
> > > > > +                if (unlikely(r !=3D 0)) {
> > > > > +                    return r;
> > > > > +                }
> > > > > +            }
> > > > > +        }
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > >  static int vhost_vdpa_net_load(NetClientState *nc)
> > > > >  {
> > > > >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > > > @@ -445,8 +488,7 @@ static int vhost_vdpa_net_load(NetClientState=
 *nc)
> > > > >      if (unlikely(r)) {
> > > > >          return r;
> > > > >      }
> > > > > -
> > > > > -    return 0;
> > > > > +    return vhost_vdpa_net_load_vlan(s, n);
> > > > >  }
> > > > >
> > > > >  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> > > > > --
> > > > > 2.31.1
> > > > >
> > >
>


