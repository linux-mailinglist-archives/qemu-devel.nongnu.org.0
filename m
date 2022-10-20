Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088596057B8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 08:56:18 +0200 (CEST)
Received: from localhost ([::1]:46662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olPTD-0007V5-Ga
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 02:56:12 -0400
Received: from [::1] (port=48462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olPSf-0006wU-Nz
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 02:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olPA3-0003Rf-Ia
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 02:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olP9v-0005eu-Vy
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 02:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666247762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/zf+o6/K3fbMORDx/HrhbLq0wLj3t4PGPCXuWR06Cnw=;
 b=JY/2zBYCQZbAwbym5YCsgKdDZV5+oDOqmcEdi62Z49FQ9adGzmEdbHgJ7wArziI8pqhc6W
 qtJf9ASaqzopaQ+VCq0+ABJ5GLeXRFKG+fK04fN6QmLWGVjO9mErkmysSmAovBystG7B1N
 ADL8IRQ2C/ACJjSWtyKaVEmnzTm1qBg=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-444-H2ec6aGoOQGWDKE-hTfN5w-1; Thu, 20 Oct 2022 02:36:01 -0400
X-MC-Unique: H2ec6aGoOQGWDKE-hTfN5w-1
Received: by mail-pf1-f197.google.com with SMTP id
 cu10-20020a056a00448a00b00562f2ff1058so10753829pfb.23
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 23:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/zf+o6/K3fbMORDx/HrhbLq0wLj3t4PGPCXuWR06Cnw=;
 b=Aw+csItefYu8fJoL4Xx0wg2PF0N9k7L7WUc0QUO28iG6GQdwbS2I3nxsuEui7WCHIr
 Oejv7vfq5G+VFv+vg9s9btguicosTJE/odoJ65KOH9URaPdxanV2JHC0RhbEAPhWxxaZ
 B3BkGQ2J6aH5xX4EQA02/8VGJg+OEEqfa5HJ0T01wBZ1O2lumtum9zyGMcdryeGjq5ab
 H6qmomqmhDNu2iJBQrYAott9Tx4bEqPcdvSkud12NGYAkuefO/OgUJQkKD226J7x3Rub
 SIvOP+VyShufH8Tc/YcdCwQw61yWDDuco3KlG3Rb9iLsuNWrKOgoEBmWcqSF6OR9QOim
 iC3g==
X-Gm-Message-State: ACrzQf3lbELmYUzUeEfQ5f37DQxFRcCQ4Qs3t+lx4262zi4Fw3sxDdL/
 ScQj7y+pRGqj2oTIEm45/46ZDbyyumYKB+p+z7qmtX6VhZ8MXRvAfqCyk1yTlS3YV/cTvrmDhBV
 N9nhRm5CvnzEPRpubTtNofeZ6Rf0G/FM=
X-Received: by 2002:a17:90b:190c:b0:211:ab56:35e6 with SMTP id
 mp12-20020a17090b190c00b00211ab5635e6mr2659774pjb.159.1666247760251; 
 Wed, 19 Oct 2022 23:36:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5fURNG8W/QvpklVOFHdW+bMI+l6XBXCFT9JHpoKxyIfnjbhwYf0N6hFJiRBzc9yqs6sGACSzkKjovNgXdpnsg=
X-Received: by 2002:a17:90b:190c:b0:211:ab56:35e6 with SMTP id
 mp12-20020a17090b190c00b00211ab5635e6mr2659740pjb.159.1666247759992; Wed, 19
 Oct 2022 23:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-4-eperezma@redhat.com>
 <CACGkMEtTG1YnqtTWs_1feAfdL=m9tiJxGX118fDCTUd2onPnPg@mail.gmail.com>
In-Reply-To: <CACGkMEtTG1YnqtTWs_1feAfdL=m9tiJxGX118fDCTUd2onPnPg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 20 Oct 2022 08:35:23 +0200
Message-ID: <CAJaqyWfOADNwUXCLcqr0MpJSdndXheni60vMH3PVc1C9qQt8Ug@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/8] vhost_net: Emulate link state up if backend
 doesn't expose it
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 6:30 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > At this moment this code path is not reached, but vdpa devices can offe=
r
> > VIRTIO_NET_F_STATUS unconditionally.
>
> So I guess what you mean is that, for the parent that doesn't support
> VIRTIO_NET_F_STATUS, emulate one for making sure the ANNOUCNE to work.
> This is safe since the spec said the driver will assume the link is
> always up if without this feature.
>

Right.

> > While the guest must assume that
> > link is always up by the standard, qemu will set the status bit to 1
> > always in this case.
> >
> > This makes little use by itself, but VIRTIO_NET_F_STATUS is needed for
> > the guest to read status bit VIRTIO_NET_F_GUEST_ANNOUNCE, used by featu=
re
> > VIRTIO_NET_F_GUEST_ANNOUNCE. So qemu must emulate status feature in cas=
e
> > it needs to emulate the guest announce feature.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/net/vhost_net.c | 27 ++++++++++++++++++++++++++-
> >  1 file changed, 26 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index d28f8b974b..5660606c1d 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -117,7 +117,32 @@ uint64_t vhost_net_get_features(struct vhost_net *=
net, uint64_t features)
> >  int vhost_net_get_config(struct vhost_net *net,  uint8_t *config,
> >                           uint32_t config_len)
> >  {
> > -    return vhost_dev_get_config(&net->dev, config, config_len, NULL);
> > +    VirtIODevice *vdev;
> > +    int r =3D vhost_dev_get_config(&net->dev, config, config_len, NULL=
);
> > +
> > +    if (unlikely(r !=3D 0)) {
> > +        return r;
> > +    }
> > +
> > +    if (config_len < endof(struct virtio_net_config, status)) {
> > +        return 0;
> > +    }
> > +
> > +    /*
> > +     * TODO: Perform this only if vhost_vdpa.
> > +     */
>
> Cindy adds some mediation codes for vhost-vDPA in
> virtio_net_get_config(), so I believe it can be done there?
>

Sure, let me take a look.

Thanks!


> Thanks
>
> > +    vdev =3D net->dev.vdev;
> > +    if (!vdev) {
> > +        /* Device is starting */
> > +        return 0;
> > +    }
> > +
> > +    if ((net->dev.acked_features & BIT_ULL(VIRTIO_NET_F_STATUS)) &&
> > +        !(net->dev.features & BIT_ULL(VIRTIO_NET_F_STATUS))) {
> > +        ((struct virtio_net_config *)config)->status |=3D VIRTIO_NET_S=
_LINK_UP;
> > +    }
> > +
> > +    return 0;
> >  }
> >  int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
> >                           uint32_t offset, uint32_t size, uint32_t flag=
s)
> > --
> > 2.31.1
> >
>


