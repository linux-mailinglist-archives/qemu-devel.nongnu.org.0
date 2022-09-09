Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7A05B318E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 10:22:11 +0200 (CEST)
Received: from localhost ([::1]:53082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWZH8-0005sw-AO
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 04:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oWYxZ-0002Nq-Us
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:01:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oWYxY-0001y7-40
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662710515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uf0EvTR/++PK+Z1P0PcX0DjmX2un1LejvAQjJNjm0Ek=;
 b=JzcHVOhQDEvOPOnF2e2Am7w+J7T7UbFU64KYT8tQ4dEfX7J3Ymja8XMwJ6htyHHU5BZCRn
 GLEFAA0W84bC1bJZn6b7ztiruARF5Tc3ve3ensMc3QShZpBaf4QInDTG7Dlw7YlEgXIwk7
 G0yQjWse4PYr5fgP20uG7JzDn1fM4lc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-d2hypZIYPcaUkzgIY9fQKg-1; Fri, 09 Sep 2022 04:01:54 -0400
X-MC-Unique: d2hypZIYPcaUkzgIY9fQKg-1
Received: by mail-qk1-f199.google.com with SMTP id
 h8-20020a05620a284800b006b5c98f09fbso817447qkp.21
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 01:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uf0EvTR/++PK+Z1P0PcX0DjmX2un1LejvAQjJNjm0Ek=;
 b=BFUFr4PWveEckIraB/PEs/DckxxqLyi/bGTatxF3XSDerndHpPvi/JTO7u1x7hB5D+
 RrqBiCT+7Qu6/ecnwDxIwZIAssmuRq9jT8nhFWTuwGNx0AWF6id6jb1FsqbwGneGG3gf
 SAxA3EwJj+2LIekLqD1R/NwZH18N0XV4j9H704nmrdqWahPmJFN38/JLzgDB2ACLv+Vr
 NEr4L8E7getOE7wCWgHs3TrXv8McMHiv0xGIqFF9BBpq2H1q/0BmVNWuvqQ+iFYEQv09
 hxAlGRTUI8SVZXJaSvBFDgj/0aagdNmKCecM8lO8hez1CQY9Kv3Ke6z1twoOEhMH1SDP
 xp+g==
X-Gm-Message-State: ACgBeo2RjhI77vbcfe2XqWjIZSDBkOWrg/lwiRGtrK2HAXucGOMY+VBu
 0PT6lDfg2JCUITf8Ma8x0OpOrsTdtSEF3vF9V21hvxjUHKHLXe88/oQebqB10E0/8jCbCmgjY/5
 ek8TQG4rLuCx7dObTbXWuRk8I8Lq/wuk=
X-Received: by 2002:a05:620a:246:b0:6cb:c0dd:2d7a with SMTP id
 q6-20020a05620a024600b006cbc0dd2d7amr5119368qkn.234.1662710513741; 
 Fri, 09 Sep 2022 01:01:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5wpLq8hAjsWm5MFzgU1KZNx0MMRsQkq0t+AH+1panEueJfGa2lA+LDS3U6lgbPwCo3t8ye6Dp2V9OtiD1G8UM=
X-Received: by 2002:a05:620a:246:b0:6cb:c0dd:2d7a with SMTP id
 q6-20020a05620a024600b006cbc0dd2d7amr5119347qkn.234.1662710513520; Fri, 09
 Sep 2022 01:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
In-Reply-To: <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 9 Sep 2022 10:01:16 +0200
Message-ID: <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Eli Cohen <eli@mellanox.com>, 
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

On Fri, Sep 9, 2022 at 8:40 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Sep 9, 2022 at 2:38 PM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Sep 7, 2022 at 12:36 AM Eugenio P=C3=A9rez <eperezma@redhat.com=
> wrote:
> > >
> > > To have enabled vlans at device startup may happen in the destination=
 of
> > > a live migration, so this configuration must be restored.
> > >
> > > At this moment the code is not accessible, since SVQ refuses to start=
 if
> > > vlan feature is exposed by the device.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  net/vhost-vdpa.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 44 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 4bc3fd01a8..ecbfd08eb9 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_features =
=3D
> > >      BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > >      BIT_ULL(VIRTIO_NET_F_STANDBY);
> > >
> > > +#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
> > > +
> > >  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> > >  {
> > >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > @@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPAState=
 *s,
> > >      return *s->status !=3D VIRTIO_NET_OK;
> > >  }
> > >
> > > +static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
> > > +                                           const VirtIONet *n,
> > > +                                           uint16_t vid)
> > > +{
> > > +    ssize_t dev_written =3D vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CT=
RL_VLAN,
> > > +                                                  VIRTIO_NET_CTRL_VL=
AN_ADD,
> > > +                                                  &vid, sizeof(vid))=
;
> > > +    if (unlikely(dev_written < 0)) {
> > > +        return dev_written;
> > > +    }
> > > +
> > > +    if (unlikely(*s->status !=3D VIRTIO_NET_OK)) {
> > > +        return -EINVAL;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
> > > +                                    const VirtIONet *n)
> > > +{
> > > +    uint64_t features =3D n->parent_obj.guest_features;
> > > +
> > > +    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    for (int i =3D 0; i < MAX_VLAN >> 5; i++) {
> > > +        for (int j =3D 0; n->vlans[i] && j <=3D 0x1f; j++) {
> > > +            if (n->vlans[i] & (1U << j)) {
> > > +                int r =3D vhost_vdpa_net_load_single_vlan(s, n, (i <=
< 5) + j);
> >
> > This seems to cause a lot of latency if the driver has a lot of vlans.
> >
> > I wonder if it's simply to let all vlan traffic go by disabling
> > CTRL_VLAN feature at vDPA layer.
>

The guest will not be able to recover that vlan configuration.

> Another idea is to extend the spec to allow us to accept a bitmap of
> the vlan ids via a single command, then we will be fine.
>

I'm not sure if adding more ways to configure something is the answer,
but I'd be ok to implement it.

Another idea is to allow the sending of many CVQ commands in parallel.
It shouldn't be very hard to achieve using exposed buffers as ring
buffers, and it will short down the start of the devices with many
features.

Thanks!

> Thanks
>
> >
> > Thanks
> >
> > > +                if (unlikely(r !=3D 0)) {
> > > +                    return r;
> > > +                }
> > > +            }
> > > +        }
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > >  static int vhost_vdpa_net_load(NetClientState *nc)
> > >  {
> > >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > @@ -445,8 +488,7 @@ static int vhost_vdpa_net_load(NetClientState *nc=
)
> > >      if (unlikely(r)) {
> > >          return r;
> > >      }
> > > -
> > > -    return 0;
> > > +    return vhost_vdpa_net_load_vlan(s, n);
> > >  }
> > >
> > >  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> > > --
> > > 2.31.1
> > >
>


