Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DA033DBB9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:58:51 +0100 (CET)
Received: from localhost ([::1]:46500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDxx-0005mH-QX
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lMDT0-0001ac-QN
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:26:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lMDSu-0003Gr-Si
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTM0LSYnEaZYvtIeykLAbf8YNdK5IkMLXyWgxrODQ6Q=;
 b=KIhQUbkBPWSUTe9g8Af3oxZ0OmlS54N9wC200N9p2Q8mPWLHJhihNfzWWHLfgOr0YLi7e8
 9YAnsdI/KigSaSbjgfldAYbf2IIixjMmK9iJ17eBfbbu9xtpGOXjGriEs8YJf0QWp/6Tk8
 WqUu90mfmGjcQeFS7vujp0epCexFM2I=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-vf3mjlAkPgq3Flgqro8iDQ-1; Tue, 16 Mar 2021 13:26:36 -0400
X-MC-Unique: vf3mjlAkPgq3Flgqro8iDQ-1
Received: by mail-qt1-f199.google.com with SMTP id m11so3340052qtx.19
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 10:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WTM0LSYnEaZYvtIeykLAbf8YNdK5IkMLXyWgxrODQ6Q=;
 b=gmgU/d6Bu4IlwG2CVmF2urBVys9gq+LCKFgKA32ypEtXCPs8wWZA4TNACF/xt0nxE8
 qg3xu//x82x1d5+XHrWviOj2h0DpTMe3amkXFPOFuDhwPpoQYUa6mIDGvPz1i7sumOFU
 SsV8M6thcenK1Ns6+gBBrC1vj9N2yGHzHe1h2tfLvkssYXOVoLQQS3MUaPoQQmIndIfl
 X8CwbsKsiwyfpAu0ANUvldcjWdbp2xZw1QdBo5clTqHD9k/J2r++Lx1eY8qcVubS+Kwe
 d8dRK9K09o/KPwGI5Vi0O2XKZmqxR1SB+miuQ/12EBgsOru3MIOjT1sZHk2vgcNyrh4Y
 sdbQ==
X-Gm-Message-State: AOAM532dz+xXw5dk9BXhJ4uJ6DpxoUHZVcvEBMihTDYfq2fn3HmG7HBX
 FyP99y/tjerlMsJVThm5vNlAh/sXquvFAA9hBWQQnUgH/keaNSFt+lT7Rqy3itVKXIXDNJFROt7
 Srm/oZ7ObzBGsaJGQuGiIyml7YvIxqE0=
X-Received: by 2002:a05:620a:941:: with SMTP id w1mr99392qkw.484.1615915595483; 
 Tue, 16 Mar 2021 10:26:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5OLCTvKdaU2szM19xIFwG/hq0OhSYFZHZKAleRaKBCaiaPIBJjkC3wYSy9LTHktHoGZEu8T9hod9zCAsXFMY=
X-Received: by 2002:a05:620a:941:: with SMTP id w1mr99356qkw.484.1615915595196; 
 Tue, 16 Mar 2021 10:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210315194842.277740-1-eperezma@redhat.com>
 <67a2525b-d0b2-dc7a-fa9d-f7c10ae22adf@redhat.com>
In-Reply-To: <67a2525b-d0b2-dc7a-fa9d-f7c10ae22adf@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 16 Mar 2021 18:25:59 +0100
Message-ID: <CAJaqyWcpKsD__Eg_e8DD9S2pdeJoSkPUK2zs48+Do9eSgZ2g+A@mail.gmail.com>
Subject: Re: [RFC v2 00/13] vDPA software assisted live migration
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 9:28 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/16 =E4=B8=8A=E5=8D=883:48, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This series enable shadow virtqueue for vhost-net devices. This is a
> > new method of vhost devices migration: Instead of relay on vhost
> > device's dirty logging capability, SW assisted LM intercepts dataplane,
> > forwarding the descriptors between VM and device. Is intended for vDPA
> > devices with no logging, but this address the basic platform to build
> > that support on.
> >
> > In this migration mode, qemu offers a new vring to the device to
> > read and write into, and disable vhost notifiers, processing guest and
> > vhost notifications in qemu. On used buffer relay, qemu will mark the
> > dirty memory as with plain virtio-net devices. This way, devices does
> > not need to have dirty page logging capability.
> >
> > This series is a POC doing SW LM for vhost-net devices, which already
> > have dirty page logging capabilities. For qemu to use shadow virtqueues
> > these vhost-net devices need to be instantiated:
> > * With IOMMU (iommu_platform=3Don,ats=3Don)
> > * Without event_idx (event_idx=3Doff)
> >
> > And shadow virtqueue needs to be enabled for them with QMP command
> > like:
> >
> > {
> >    "execute": "x-vhost-enable-shadow-vq",
> >    "arguments": {
> >      "name": "virtio-net",
> >      "enable": false
> >    }
> > }
> >
> > Just the notification forwarding (with no descriptor relay) can be
> > achieved with patches 5 and 6, and starting SVQ. Previous commits
> > are cleanup ones and declaration of QMP command.
> >
> > Commit 11 introduces the buffer forwarding. Previous one are for
> > preparations again, and laters are for enabling some obvious
> > optimizations.
> >
> > It is based on the ideas of DPDK SW assisted LM, in the series of
> > DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does
> > not map the shadow vq in guest's VA, but in qemu's.
> >
> > Comments are welcome! Especially on:
> > * Different/improved way of synchronization, particularly on the race
> >    of masking.
> >
> > TODO:
> > * Event, indirect, packed, and others features of virtio - Waiting for
> >    confirmation of the big picture.
>
>
> So two things in my mind after reviewing the seires:
>
> 1) which layer should we implement the shadow virtqueue. E.g if you want
> to do that at virtio level, you need to deal with a lot of
> synchronizations. I prefer to do it in vhost-vDPA.

I'm not sure how to do that and avoid the synchronization. Could you
expand on that point?

> 2) Using VA as IOVA which can not work for vhost-vDPA
>
>
> > * vDPA devices:
>
>
> So I think we can start from a vhost-vDPA specific shadow virtqueue
> first, then extending it to be a general one which might be much easier.
>
>
> > Developing solutions for tracking the available IOVA
> >    space for all devices.
>
>
> For vhost-net, you can assume that [0, ULLONG_MAX] is valid so you can
> simply use VA as IOVA.
>

In the future revision it will be that way unless vdpa device reports
limits on the range of addresses it can translate.

>
> > Small POC available, skipping the get/set
> >    status (since vDPA does not support it) and just allocating more and
> >    more IOVA addresses in a hardcoded range available for the device.
>
>
> I'm not sure this can work but you need make sure that range can fit the
> size of the all memory regions and need to deal with memory region add
> and del.
>
> I guess you probably need a full functional tree based IOVA allocator.
>

The vDPA POC I'm testing with does not free the used memory regions at all.

For future development I'm reusing qemu's iova-tree. Not sure if I
will keep with it until the end of development, but I'm open to better
suggestions of course.


> Thanks
>
>
> > * To sepparate buffers forwarding in its own AIO context, so we can
> >    throw more threads to that task and we don't need to stop the main
> >    event loop.
> > * IOMMU optimizations, so bacthing and bigger chunks of IOVA can be
> >    sent to device.
> > * Automatic kick-in on live-migration.
> > * Proper documentation.
> >
> > Thanks!
> >
> > Changes from v1 RFC:
> >    * Use QMP instead of migration to start SVQ mode.
> >    * Only accepting IOMMU devices, closer behavior with target devices
> >      (vDPA)
> >    * Fix invalid masking/unmasking of vhost call fd.
> >    * Use of proper methods for synchronization.
> >    * No need to modify VirtIO device code, all of the changes are
> >      contained in vhost code.
> >    * Delete superfluous code.
> >    * An intermediate RFC was sent with only the notifications forwardin=
g
> >      changes. It can be seen in
> >      https://patchew.org/QEMU/20210129205415.876290-1-eperezma@redhat.c=
om/
> >    * v1 at
> >      https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05372.htm=
l
> >
> > Eugenio P=C3=A9rez (13):
> >    virtio: Add virtio_queue_is_host_notifier_enabled
> >    vhost: Save masked_notifier state
> >    vhost: Add VhostShadowVirtqueue
> >    vhost: Add x-vhost-enable-shadow-vq qmp
> >    vhost: Route guest->host notification through shadow virtqueue
> >    vhost: Route host->guest notification through shadow virtqueue
> >    vhost: Avoid re-set masked notifier in shadow vq
> >    virtio: Add vhost_shadow_vq_get_vring_addr
> >    virtio: Add virtio_queue_full
> >    vhost: add vhost_kernel_set_vring_enable
> >    vhost: Shadow virtqueue buffers forwarding
> >    vhost: Check for device VRING_USED_F_NO_NOTIFY at shadow virtqueue
> >      kick
> >    vhost: Use VRING_AVAIL_F_NO_INTERRUPT at device call on shadow
> >      virtqueue
> >
> >   qapi/net.json                      |  22 ++
> >   hw/virtio/vhost-shadow-virtqueue.h |  36 ++
> >   include/hw/virtio/vhost.h          |   6 +
> >   include/hw/virtio/virtio.h         |   3 +
> >   hw/virtio/vhost-backend.c          |  29 ++
> >   hw/virtio/vhost-shadow-virtqueue.c | 551 ++++++++++++++++++++++++++++=
+
> >   hw/virtio/vhost.c                  | 283 +++++++++++++++
> >   hw/virtio/virtio.c                 |  23 +-
> >   hw/virtio/meson.build              |   2 +-
> >   9 files changed, 952 insertions(+), 3 deletions(-)
> >   create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
> >   create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
> >
>


