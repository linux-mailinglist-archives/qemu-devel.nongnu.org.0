Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0402A471F8D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 04:24:38 +0100 (CET)
Received: from localhost ([::1]:46498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwbx6-0000Kc-MY
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 22:24:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mwbw3-00086w-3w
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 22:23:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mwbvz-0000ZZ-49
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 22:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639365805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U3u4DCZFWxLt74hbYth15/tsx14E8mUx2nwKUDNZZIA=;
 b=TZOOIKTUGreQ6Xl5UbQDswPuSIujMssMtxqsMpUkjL9eUytCmxUWAXU+N2Km/z2FeH/Qgc
 1HwTz9Pjl2a3NnQZr+JBk3P7spsQ8K0vmxXOOOJogLQlY42BYeNx5fMu29Zerlfib/15RP
 uuoA4YZJLIzo+UrNy0++5/hsRsJp+Ag=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-HS440CRMPaqOjHw6v5jb-A-1; Sun, 12 Dec 2021 22:23:23 -0500
X-MC-Unique: HS440CRMPaqOjHw6v5jb-A-1
Received: by mail-lf1-f72.google.com with SMTP id
 e5-20020ac25ca5000000b0041bf2d8f2e1so6888129lfq.13
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 19:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U3u4DCZFWxLt74hbYth15/tsx14E8mUx2nwKUDNZZIA=;
 b=jvA89sk24aub+XytcmDctClKOcQLZIxf/3WDIT5bQJ4wA5sbbDRUIm0+B3qV3Zt1RV
 XXWuh/P41+9gh5Tm9V01gNgpUZyB6w5EANZfhO9E4NY5fZ7atUkB8AmNdKIMX1xqR0Nu
 /maJugwQQjl7IqpfKHjGyY7imU9kMQJiw9z6HlsRyhcA2Yu3JV836OXfl9sNpZvXZ8CD
 lg6FVuM3VlSIuYBGfLwXBfaZcXwJF1aUVzqf1QXHLeDw2sXLUSkao6FfCPUpDwLVmXIg
 kTlDEaiKTM5kuybEhb02NvbhO+oVQufUQcThvOx/BJ+R550rKUA351FP8dEEkO7r+Oui
 2IJw==
X-Gm-Message-State: AOAM533n/HpJFObYXXkCkbkJFhyw0CwmXi1PzTWEjJDqQw0Q3Dx1pa1M
 J1nKLnwVeWOpYCFpybS4UEkmj4s/eNgV0CXyzCIpDf8sa/g9L3gQiqKFCPLIibSieiyi8O0wn/9
 CLCaPyeU9KVPNbb7SOPoAhQZY/S4quQk=
X-Received: by 2002:a05:6512:3987:: with SMTP id
 j7mr25778194lfu.199.1639365802298; 
 Sun, 12 Dec 2021 19:23:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfT+9ZoSk9BLHSEY73qFkNF6Ak8c7zmdIOYFvaTmTPip6MTNdjfYl+mtS+XHahHkRHxuKX5FYquNIyiQlM25Y=
X-Received: by 2002:a05:6512:3987:: with SMTP id
 j7mr25778170lfu.199.1639365802043; 
 Sun, 12 Dec 2021 19:23:22 -0800 (PST)
MIME-Version: 1.0
References: <20211208052010.1719-1-longpeng2@huawei.com>
 <CACGkMEvW0W-mMU159bUyDo2jK03FYQEn3ZedbC9vaEvDj2v7KQ@mail.gmail.com>
 <293da14ee62f4cfca9a6cec73083e154@huawei.com>
In-Reply-To: <293da14ee62f4cfca9a6cec73083e154@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 13 Dec 2021 11:23:11 +0800
Message-ID: <CACGkMEsRzREaawCA9CWc7D9DV3S9CqDmrQhru_1d2bUduvALPQ@mail.gmail.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: mst <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Yechuan <yechuan@huawei.com>, Yongji Xie <xieyongji@bytedance.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Parav Pandit <parav@nvidia.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 11, 2021 at 1:23 PM Longpeng (Mike, Cloud Infrastructure
Service Product Dept.) <longpeng2@huawei.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jason Wang [mailto:jasowang@redhat.com]
> > Sent: Wednesday, December 8, 2021 2:27 PM
> > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > <longpeng2@huawei.com>
> > Cc: mst <mst@redhat.com>; Parav Pandit <parav@nvidia.com>; Yongji Xie
> > <xieyongji@bytedance.com>; Stefan Hajnoczi <stefanha@redhat.com>; Stefano
> > Garzarella <sgarzare@redhat.com>; Yechuan <yechuan@huawei.com>; Gonglei (Arei)
> > <arei.gonglei@huawei.com>; qemu-devel <qemu-devel@nongnu.org>
> > Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
> >
> > On Wed, Dec 8, 2021 at 1:20 PM Longpeng(Mike) <longpeng2@huawei.com> wrote:
> > >
> > > From: Longpeng <longpeng2@huawei.com>
> > >
> > > Hi guys,
> > >
> > > This patch introduces vhost-vdpa-net device, which is inspired
> > > by vhost-user-blk and the proposal of vhost-vdpa-blk device [1].
> > >
> > > I've tested this patch on Huawei's offload card:
> > > ./x86_64-softmmu/qemu-system-x86_64 \
> > >     -device vhost-vdpa-net-pci,vdpa-dev=/dev/vhost-vdpa-0
> > >
> > > For virtio hardware offloading, the most important requirement for us
> > > is to support live migration between offloading cards from different
> > > vendors, the combination of netdev and virtio-net seems too heavy, we
> > > prefer a lightweight way.
> >
> > Could you elaborate more on this? It's mainly the control path when
> > using with netdev, and it provides a lot of other benefits:
> >
> > - decouple the transport specific stuff out of the vhost abstraction,
> > mmio device is supported with 0 line of code
> > - migration compatibility, reuse the migration stream that is already
> > supported by Qemu virtio-net, this will allow migration among
> > different vhost backends.
> > - software mediation facility, not all the virtqueues are assigned to
> > guests directly. One example is the virtio-net cvq, qemu may want to
> > intercept and record the device state for migration. Reusing the
> > current virtio-net codes simplifies a lot of codes.
> > - transparent failover (in the future), the nic model can choose to
> > switch between vhost backends etc.
> >
>
> We want to use the vdpa framework instead of the vfio-pci framework in
> the virtio hardware offloading case, so maybe some of the benefits above
> are not needed in our case. But we need to migrate between different
> hardware, so I am not sure whether this approach would be harmful to the
> requirement.

It should not, but it needs to build the migration facility for the
net from the ground. And if we want to have a general migration
solution instead of a vendor specific one, it may duplicate some logic
of existing virtio-net implementation. The CVQ migration is an
example, we don't provide a dedicated migration facility in the spec.
So a more general way for live migration currently is using the shadow
virtqueue which is what Eugenio is doing. So thanks to the design
where we tried to do all the work in the vhost layer, this might not
be a problem for this approach. But talking about the CVQ migration,
things will be interesting. Qemu needs to decode the cvq commands in
the middle thus it can record the device state. For having a general
migration solution, vhost-vdpa-pci needs to do this as well.
Virtio-net has the full CVQ logic so it's much easier, for
vhost-vdpa-pci, it needs to duplicate them all in its own logic.

>
> > >
> > > Maybe we could support both in the future ?
> >
> > For the net, we need to figure out the advantages of this approach
> > first. Note that we didn't have vhost-user-net-pci or vhost-pci in the
> > past.
> >
>
> Why didn't support vhost-user-net-pci in history ? Because its control
> path is much more complex than the block ?

I don't know, it may be simply because no one tries to do that.

>
> > For the block, I will leave Stefan and Stefano to comment.
> >
> > > Such as:
> > >
> > > * Lightweight
> > >  Net: vhost-vdpa-net
> > >  Storage: vhost-vdpa-blk
> > >
> > > * Heavy but more powerful
> > >  Net: netdev + virtio-net + vhost-vdpa
> > >  Storage: bdrv + virtio-blk + vhost-vdpa
> > >
> > > [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
> > >
> > > Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> > > ---
> > >  hw/net/meson.build                 |   1 +
> > >  hw/net/vhost-vdpa-net.c            | 338
> > +++++++++++++++++++++++++++++++++++++
> > >  hw/virtio/Kconfig                  |   5 +
> > >  hw/virtio/meson.build              |   1 +
> > >  hw/virtio/vhost-vdpa-net-pci.c     | 118 +++++++++++++
> >
> > I'd expect there's no device type specific code in this approach and
> > any kind of vDPA devices could be used with a general pci device.
> >
> > Any reason for having net specific types here?
> >
>
> No, just because there already has the proposal of vhost-vdpa-blk, so I
> developed the vhost-vdpa-net correspondingly.
>
> I pretty agree with your suggestion. If feasible, likes vfio-pci, we don't
> need to maintain the device type specific code in QEMU, what's more, it's
> possible to support the live migration of different virtio hardware.
>

See above, we probably need type specific migration code.

[...]

Thanks


