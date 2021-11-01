Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2085E441D88
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 16:43:49 +0100 (CET)
Received: from localhost ([::1]:41594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhZTO-0004a5-TC
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 11:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhZSN-0003qV-ER
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhZSJ-0003Wj-Rr
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635781358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRgxRkhnNlJip694lx1uE29yW3HTEaldikOTkZLBW0c=;
 b=EaGN1ALH8cqB2MRAKkDJk4O/MFKfG2HjboszM7sQA5v/A4AwTXcqdzPi2GlbYB0Vd2Fctg
 VuKYVHZq3fzSUCljkXdGu89AbwOVJjYey6RCD/21kQJUDn4Rz6xK845FYNPXFzIwm2VVCZ
 gpfLODkVCbNTC1sUGn0vIaMYR7gi+8M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-xt4llyMBMemXK4jfL95bWg-1; Mon, 01 Nov 2021 11:42:37 -0400
X-MC-Unique: xt4llyMBMemXK4jfL95bWg-1
Received: by mail-qv1-f70.google.com with SMTP id
 ib13-20020a0562141c8d00b003958b43bcf2so10511914qvb.1
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 08:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NRgxRkhnNlJip694lx1uE29yW3HTEaldikOTkZLBW0c=;
 b=GlJG9TXAXg0PxrKno80JoVLrachOeN7UYb0d4dS2mEXGCM3W5HBhscnmO9gKqkqNx1
 xkectr2p7AY1f+ngVN8NW6arcuwY1HXCuf0yzfTYv3nVrKtJuCynKX4mveXIOLD2Te5b
 o+8w/93yJIsHu7iyxxViD4Yi2zYYxAPtB20S1WW3n/nYh3MeMNe1x7F7myP/SqJBpH0a
 eZsOrbF7uHs29xt6iCDWAkXmBxmWGMlF0PlXlQxPZj22SwF6u1cUnmfcDfletHu8BNf/
 94zcrlniXozlAajipPoCWCFHQFr0z/ewyoyVR//D1RJkDSUVzQ+rOZjyPnf50scbB/lb
 EgWg==
X-Gm-Message-State: AOAM532ETfwp5jeM/iR/02K84QP8dYppKNTu8NbmIzzn3WlJ/y8V3cHW
 60QxtBVOlTIyTdd88FWnrZ1CPU6AWhu+cgcZkxMWD+2CI8+NRRvfz48dB+P+icYmqghk4MhK5Vw
 4aRExag9k8ItD7LCKMZk98ypyqhUxQ98=
X-Received: by 2002:a0c:80e4:: with SMTP id 91mr28652683qvb.57.1635781357170; 
 Mon, 01 Nov 2021 08:42:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4imJJMcJo8vh27GC33cMndX50TWRQCEIATzWWyvWC+zFXShm8HH2FbFjwTNmLdCLg49nagRnwgq3dD1b6KPo=
X-Received: by 2002:a0c:80e4:: with SMTP id 91mr28652653qvb.57.1635781356833; 
 Mon, 01 Nov 2021 08:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211029141608.1728855-1-eperezma@redhat.com>
 <CACGkMEss8Xq8WYUkDkLaYx-XBW6GADDAjH1mwmpBdxKc2wsRAQ@mail.gmail.com>
 <CAJaqyWcsbtOoLGkCW6J_9M8qR1-yvbQmWq1rU0y+8Y=BhPeRWw@mail.gmail.com>
In-Reply-To: <CAJaqyWcsbtOoLGkCW6J_9M8qR1-yvbQmWq1rU0y+8Y=BhPeRWw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Nov 2021 16:42:01 +0100
Message-ID: <CAJaqyWdBMCeFZ4yARpezqmZSSoiLKBStNDm_CLJPrZRDx7X4wg@mail.gmail.com>
Subject: Re: [PATCH] vhost: Fix last queue index of devices with no cvq
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 1, 2021 at 9:58 AM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Mon, Nov 1, 2021 at 4:34 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Oct 29, 2021 at 10:16 PM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> > >
> > > The -1 assumes that all devices with no cvq have an spare vq allocate=
d
> > > for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not be =
the
> > > case, and the device may have a pair number of queues.
> > >
> > > To fix this, just resort to the lower even number of queues.
> > >
> > > Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the =
virtio device")
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  hw/net/vhost_net.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > index 0d888f29a6..edf56a597f 100644
> > > --- a/hw/net/vhost_net.c
> > > +++ b/hw/net/vhost_net.c
> > > @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientS=
tate *ncs,
> > >      NetClientState *peer;
> > >
> > >      if (!cvq) {
> > > -        last_index -=3D 1;
> > > +        last_index &=3D ~1ULL;
> > >      }
> >
> > The math here looks correct but we need to fix vhost_vdpa_dev_start() i=
nstead?
> >
> > if (dev->vq_index + dev->nvqs - 1 !=3D dev->last_index) {
> > ...
> > }
> >
>
> If we just do that, devices that offer an odd number of queues but do
> not offer ctrl vq would never enable the last vq pair, isn't it?
>

To expand the issue,

With that condition it is not possible to make vp_vdpa work on devices
with no cvq. If I set the L0 guest's device with no cvq (with -device
virtio-net-pci,...,ctrl_vq=3Doff,mq=3Doff). The nested VM will enter that
conditional in vhost_net_start, and will mark last_index=3D1, making it
impossible to start a vhost_vdpa device.

However, re-reading the standard:

controlq only exists if VIRTIO_NET_F_CTRL_VQ set.

So the code is actually handling an invalid device: The device set
VIRTIO_NET_F_CTRL_VQ but offered an odd number of VQs.

Do we have an example of such a device? It's not the case on qemu
virtio-net, with or without vhost-net in L0 device. The operation &=3D
~1ULL is an intended noop in case the queues are already even. I'm
fine to keep making last_index even, so we have that safety net, with
further clarifications as MST said, just in case the device is not
behaving well. But maybe it's even better just to delete that
conditional entirely?

Thanks!




> Also, I would say that the right place for the solution of this
> problem should not be virtio/vhost-vdpa: This is highly dependent on
> having cvq, and this implies a knowledge about the use of each
> virtqueue. Another kind of device could have an odd number of
> virtqueues naturally, and that (-1) would not work for them, isn't it?
>
> Thanks!
>
> > Thanks
> >
> > >
> > >      if (!k->set_guest_notifiers) {
> > > --
> > > 2.27.0
> > >
> >


