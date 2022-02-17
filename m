Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708C84B9BEE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:22:58 +0100 (CET)
Received: from localhost ([::1]:43182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKczz-0000c5-Hy
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:22:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nKcZ8-0001K7-Gw
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:55:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nKcZ5-0005UV-0m
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645088102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VuHPvh8jMesmesnvZmft1qawCPi7ywtaX7tAOV83p3M=;
 b=MRocNdxw8pTBvSHJIy2i3+eXunAIXJI4p8lfMZ5IKGdltuYOyT1NQkAwsBDC5uOuqCZGSX
 IBib1JHW7j5hV/3Yjn3en777a3++NWQ1nSjxDAgWisAhtUWtyQTBTc2WEj+VFtjKHySMdX
 Jq/vzZoA3KZA17QSXchau3gNbKz8knw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-9PXY3746Pjaqix-imGy8PA-1; Thu, 17 Feb 2022 03:54:55 -0500
X-MC-Unique: 9PXY3746Pjaqix-imGy8PA-1
Received: by mail-qk1-f200.google.com with SMTP id
 3-20020a370603000000b0060de5e49129so215713qkg.2
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 00:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VuHPvh8jMesmesnvZmft1qawCPi7ywtaX7tAOV83p3M=;
 b=WRQaMJmUUulecYGoUk6gGzWWFs0zRKiqndVw/vGiQNrZ8/CntQzmbPt4pIE6preURO
 s+qDnq1TsRcaFV+R7elvg4LeDVpx4N35lTZNm0/iVhk3QHjs++uWGzPxgHn94iOvSgcf
 EdttXIKNamipZGLnaypXVCK2l07YcMtB4QazLQZUiHTAi+mS61Q3DL74xbf3CR7E+Tme
 xjZImu1v7j0aHpwCcSRJQj2PQW6p/MbJfyrXLpyhhLwi/mq8dUstnw4l9ZtE7/XkQbVx
 NjfWZUcmMqxzjt1gco+sCv3booJVCeI+zmQ1cF4MyQmbzT62ARPQhcI9hbFbmwMu72rl
 elTQ==
X-Gm-Message-State: AOAM533dfZ6JZPWjeC8e244w36gDrIqLxD98rdVRHnHLZr/s4/gUJ/DK
 NsyKgr+LQDWq7Br3yvTsXoXuC1FC5tsCG1IYiJuwVV4H02HUav2tpNiYOT0NZiZOvPkwzMZYZML
 rE7m2zrJ+NqNVh6x/gVMqhBGFKwCYtHU=
X-Received: by 2002:ac8:5a01:0:b0:2dd:2de2:58cf with SMTP id
 n1-20020ac85a01000000b002dd2de258cfmr1475060qta.199.1645088095121; 
 Thu, 17 Feb 2022 00:54:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6r3UQ47l9vT9Y4lBu1FoPXLAdDPOAq/Ya/Rthd1iGWi+1/6ZLOg9GHLz9lZzVb0AgAaM/ad+8eQp0buz2dlo=
X-Received: by 2002:ac8:5a01:0:b0:2dd:2de2:58cf with SMTP id
 n1-20020ac85a01000000b002dd2de258cfmr1475043qta.199.1645088094903; Thu, 17
 Feb 2022 00:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20220215072231.2498-1-gdawar@xilinx.com>
 <20220215072231.2498-3-gdawar@xilinx.com>
 <CACGkMEt8UN8vd4KNKM7=Kcx28J2ANvLYN62NNzg9d5pHKhK4sQ@mail.gmail.com>
In-Reply-To: <CACGkMEt8UN8vd4KNKM7=Kcx28J2ANvLYN62NNzg9d5pHKhK4sQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 17 Feb 2022 09:54:18 +0100
Message-ID: <CAJaqyWetnJHx-hY=PFaydh0qa8w_GNtvMo01viwkBj4RzSpPmw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: mst <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gautam Dawar <gdawar@xilinx.com>,
 Martin Petrus Hubertus Habets <martinh@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, tanujk@xilinx.com, pabloc@xilinx.com,
 Gautam Dawar <gautam.dawar@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 8:16 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Feb 15, 2022 at 3:23 PM Gautam Dawar <gautam.dawar@xilinx.com> wrote:
> >
> > This patch adds the ability to negotiate VIRTIO_F_IN_ORDER bit
> > for vhost-vdpa backend when the underlying device supports this
> > feature.
> > This would aid in reaping performance benefits with HW devices
> > that implement this feature. At the same time, it shouldn't have
> > any negative impact as vhost-vdpa backend doesn't involve any
> > userspace virtqueue operations.
> >
> > Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
> > ---
> >  hw/net/virtio-net.c | 10 ++++++++++
> >  net/vhost-vdpa.c    |  1 +
> >  2 files changed, 11 insertions(+)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index cf8ab0f8af..a1089d06f6 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3507,11 +3507,21 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> >      nc->rxfilter_notify_enabled = 1;
> >
> >     if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> > +        uint64_t features = BIT_ULL(VIRTIO_F_IN_ORDER);
> >          struct virtio_net_config netcfg = {};
> > +
> >          memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
> >          vhost_net_set_config(get_vhost_net(nc->peer),
> >              (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER);
> > +
> > +       /*
> > +         * For vhost-vdpa, if underlying device supports IN_ORDER feature,
> > +         * make it available for negotiation.
> > +         */
> > +       features = vhost_net_get_features(get_vhost_net(nc->peer), features);
> > +       n->host_features |= features;
>
> This looks like a hack, considering we will finally support in_order.
> I wonder if it's better to
>
> 1) introduce command line parameters "in_order"
> 2) fail without vhost-vdpa
>
> ?
>

Do you mean this steps?:
- Add the cmdline parameter, defaulting it to false.
- Even if it's set to true in cmdline, set to false as long as the
backend is different from vDPA. Since we're only scoping for net
devices, this means to add this feature bit check at this same place
at virtio_net_device_realize only if device property has been set to
true, actually.

Have I understood correctly?

Thanks!


> Thanks
>
> >      }
> > +
> >      QTAILQ_INIT(&n->rsc_chains);
> >      n->qdev = dev;
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 25dd6dd975..2886cba5ec 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -62,6 +62,7 @@ const int vdpa_feature_bits[] = {
> >      VIRTIO_NET_F_CTRL_VQ,
> >      VIRTIO_F_IOMMU_PLATFORM,
> >      VIRTIO_F_RING_PACKED,
> > +    VIRTIO_F_IN_ORDER,
> >      VIRTIO_NET_F_RSS,
> >      VIRTIO_NET_F_HASH_REPORT,
> >      VIRTIO_NET_F_GUEST_ANNOUNCE,
> > --
> > 2.30.1
> >
>


