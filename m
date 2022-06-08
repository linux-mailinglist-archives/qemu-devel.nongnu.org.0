Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635C6543CE5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 21:30:49 +0200 (CEST)
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz1OA-0006le-5v
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 15:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nz1ME-0005cx-4r
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:28:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nz1MB-0007FZ-0H
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654716522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+J3gxvxhFOMhsCMj5i3+Fatu9A40xnbxg98ZuOk0/s=;
 b=R+4VPE+mPoXwjoGqQJHllAXtuCY4FceA1eVmzxQzLly1MIX1QW0iz0Fs6v4VnnXG9Kc8Bw
 qv85R4WNOkEa5l5SGN5xkFyClbgv1AJUXhHpfKi4etpvcs5fvAyl3cJpVS+NWUYLuV8uZ7
 SZfjYtV7ebeuJEzg95iG+I0ZYJ3aQKI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-x86NU6qMNKKdXxH1HqVzBg-1; Wed, 08 Jun 2022 15:28:41 -0400
X-MC-Unique: x86NU6qMNKKdXxH1HqVzBg-1
Received: by mail-qv1-f71.google.com with SMTP id
 gw7-20020a0562140f0700b0046c1b8431d5so1400757qvb.0
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 12:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I+J3gxvxhFOMhsCMj5i3+Fatu9A40xnbxg98ZuOk0/s=;
 b=Hc+4za2b5MtwTXgLBbeQ3nXuTH04gQDGhf0g0Rg75L3IobrGvpd5QfxU6TmKcpR0U5
 K6K41PnfsrPzfm/J/3/gWHwynnsaKzhLY2rz0ILLxjzVwDJNm3/71eYpSN9n9HoEhdBS
 9tFrUrmFta7GS6EZnnt7IpGLOMAVM3zYAAwlFeJGGpeXIQTQ9S4GxKRqOWBMN+Up9y5A
 J2Ty0Xe8vLr+9zBFugOBq97bU2FLsJq+Ey9iO9gOnULvL0RsQDurw/Ntw6+q6K3K59eQ
 HfT7HAXEPCYO4Ic+WnBO8qFtQehnsnGvhEOeYvK1AGQc5iWo7f5q+HADfLUr5+SrPEW1
 ReAw==
X-Gm-Message-State: AOAM531PTjypIQw956bHvHAohSKgUW6L66Jq/RcnFl1OfLiok6li6ApF
 5W3oZ9TApvdB/FsM90HrnCrYBRWgQrz7JL0P9s9xiQfeNSjpWy0nT/cDfJhak8GFkZq/ZyrgVmY
 DitNAwSQbcUICZpUTShX//pEsjvyCNtM=
X-Received: by 2002:a05:622a:14c6:b0:2f4:730e:40fa with SMTP id
 u6-20020a05622a14c600b002f4730e40famr28690965qtx.495.1654716519298; 
 Wed, 08 Jun 2022 12:28:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybNvPhzvl0C83K/l8CFP8Od/8fkpvk0Zg0c1Qyl/flK60m8QMPWn+SJmVDBoRJvt+dcz9R52Z3WoNvtbB/908=
X-Received: by 2002:a05:622a:14c6:b0:2f4:730e:40fa with SMTP id
 u6-20020a05622a14c600b002f4730e40famr28690907qtx.495.1654716518272; Wed, 08
 Jun 2022 12:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <d34131b7-4193-d82c-056f-23b9d99f897a@redhat.com>
In-Reply-To: <d34131b7-4193-d82c-056f-23b9d99f897a@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 8 Jun 2022 21:28:02 +0200
Message-ID: <CAJaqyWefgjYioDsV4jraPLah_Ty_RPRm9r3etVYEu5Dade9feg@mail.gmail.com>
Subject: Re: [RFC PATCH v8 00/21] Net Control VQ support with asid in vDPA SVQ
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eric Blake <eblake@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jun 8, 2022 at 7:51 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Control virtqueue is used by networking device for accepting various
> > commands from the driver. It's a must to support multiqueue and other
> > configurations.
> >
> > Shadow VirtQueue (SVQ) already makes possible migration of virtqueue
> > states, effectively intercepting them so qemu can track what regions of=
 memory
> > are dirty because device action and needs migration. However, this does=
 not
> > solve networking device state seen by the driver because CVQ messages, =
like
> > changes on MAC addresses from the driver.
> >
> > To solve that, this series uses SVQ infraestructure proposed to interce=
pt
> > networking control messages used by the device. This way, qemu is able =
to
> > update VirtIONet device model and to migrate it.
> >
> > However, to intercept all queues would slow device data forwarding. To =
solve
> > that, only the CVQ must be intercepted all the time. This is achieved u=
sing
> > the ASID infraestructure, that allows different translations for differ=
ent
> > virtqueues. The most updated kernel part of ASID is proposed at [1].
> >
> > You can run qemu in two modes after applying this series: only intercep=
ting
> > cvq with x-cvq-svq=3Don or intercept all the virtqueues adding cmdline =
x-svq=3Don:
> >
> > -netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=3Dvhost-vdpa0=
,x-cvq-svq=3Don,x-svq=3Don
> >
> > First three patches enable the update of the virtio-net device model fo=
r each
> > CVQ message acknoledged by the device.
> >
> > Patches from 5 to 9 enables individual SVQ to copy the buffers to QEMU'=
s VA.
> > This allows simplyfing the memory mapping, instead of map all the guest=
's
> > memory like in the data virtqueues.
> >
> > Patch 10 allows to inject control messages to the device. This allows t=
o set
> > state to the device both at QEMU startup and at live migration destinat=
ion. In
> > the future, this may also be used to emulate _F_ANNOUNCE.
> >
> > Patch 11 updates kernel headers, but it assign random numbers to needed=
 ioctls
> > because they are still not accepted in the kernel.
> >
> > Patches 12-16 enables the set of the features of the net device model t=
o the
> > vdpa device at device start.
> >
> > Last ones enables the sepparated ASID and SVQ.
> >
> > Comments are welcomed.
>
>
> As discussed, I think we need to split this huge series into smaller ones=
:
>
> 1) shadow CVQ only, this makes rx-filter-event work
> 2) ASID support for CVQ
>
> And for 1) we need consider whether or not it could be simplified.
>
> Or do it in reverse order, since if we do 1) first, we may have security
> issues.
>

I'm ok with both, but I also think 2) before 1) might make more sense.
There is no way to only shadow CVQ otherwise ATM.

Can we do as with previous base SVQ patches? they were merged although
there is still no way to enable SVQ.

Thanks!

> Thoughts?
>
> Thanks
>
>
> >
> > TODO:
> > * Fallback on regular CVQ if QEMU cannot isolate in its own ASID by any
> >    reason, blocking migration. This is tricky, since it can cause that =
the VM
> >    cannot be migrated anymore, so some way of block it must be used.
> > * Review failure paths, some are with TODO notes, other don't.
> >
> > Changes from rfc v7:
> > * Don't map all guest space in ASID 1 but copy all the buffers. No need=
 for
> >    more memory listeners.
> > * Move net backend start callback to SVQ.
> > * Wait for device CVQ commands used by the device at SVQ start, avoidin=
g races.
> > * Changed ioctls, but they're provisional anyway.
> > * Reorder commits so refactor and code adding ones are closer to usage.
> > * Usual cleaning: better tracing, doc, patches messages, ...
> >
> > Changes from rfc v6:
> > * Fix bad iotlb updates order when batching was enabled
> > * Add reference counting to iova_tree so cleaning is simpler.
> >
> > Changes from rfc v5:
> > * Fixes bad calculus of cvq end group when MQ is not acked by the guest=
.
> >
> > Changes from rfc v4:
> > * Add missing tracing
> > * Add multiqueue support
> > * Use already sent version for replacing g_memdup
> > * Care with memory management
> >
> > Changes from rfc v3:
> > * Fix bad returning of descriptors to SVQ list.
> >
> > Changes from rfc v2:
> > * Fix use-after-free.
> >
> > Changes from rfc v1:
> > * Rebase to latest master.
> > * Configure ASID instead of assuming cvq asid !=3D data vqs asid.
> > * Update device model so (MAC) state can be migrated too.
> >
> > [1] https://lkml.kernel.org/kvm/20220224212314.1326-1-gdawar@xilinx.com=
/
> >
> > Eugenio P=C3=A9rez (21):
> >    virtio-net: Expose ctrl virtqueue logic
> >    vhost: Add custom used buffer callback
> >    vdpa: control virtqueue support on shadow virtqueue
> >    virtio: Make virtqueue_alloc_element non-static
> >    vhost: Add vhost_iova_tree_find
> >    vdpa: Add map/unmap operation callback to SVQ
> >    vhost: move descriptor translation to vhost_svq_vring_write_descs
> >    vhost: Add SVQElement
> >    vhost: Add svq copy desc mode
> >    vhost: Add vhost_svq_inject
> >    vhost: Update kernel headers
> >    vdpa: delay set_vring_ready after DRIVER_OK
> >    vhost: Add ShadowVirtQueueStart operation
> >    vhost: Make possible to check for device exclusive vq group
> >    vhost: add vhost_svq_poll
> >    vdpa: Add vhost_vdpa_start_control_svq
> >    vdpa: Add asid attribute to vdpa device
> >    vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs
> >    vhost: Add reference counting to vhost_iova_tree
> >    vdpa: Add x-svq to NetdevVhostVDPAOptions
> >    vdpa: Add x-cvq-svq
> >
> >   qapi/net.json                                |  13 +-
> >   hw/virtio/vhost-iova-tree.h                  |   7 +-
> >   hw/virtio/vhost-shadow-virtqueue.h           |  61 ++-
> >   include/hw/virtio/vhost-vdpa.h               |   3 +
> >   include/hw/virtio/vhost.h                    |   3 +
> >   include/hw/virtio/virtio-net.h               |   4 +
> >   include/hw/virtio/virtio.h                   |   1 +
> >   include/standard-headers/linux/vhost_types.h |  11 +-
> >   linux-headers/linux/vhost.h                  |  25 +-
> >   hw/net/vhost_net.c                           |   5 +-
> >   hw/net/virtio-net.c                          |  84 +++--
> >   hw/virtio/vhost-iova-tree.c                  |  35 +-
> >   hw/virtio/vhost-shadow-virtqueue.c           | 378 ++++++++++++++++--=
-
> >   hw/virtio/vhost-vdpa.c                       | 206 +++++++++-
> >   hw/virtio/virtio.c                           |   2 +-
> >   net/vhost-vdpa.c                             | 294 ++++++++++++++-
> >   hw/virtio/trace-events                       |  10 +-
> >   17 files changed, 1012 insertions(+), 130 deletions(-)
> >
>


