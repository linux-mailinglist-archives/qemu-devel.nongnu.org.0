Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC05549509
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 18:33:37 +0200 (CEST)
Received: from localhost ([::1]:43348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0n0S-0006u2-1L
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 12:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o0mzL-0005Qm-Em
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 12:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o0mzI-0000k3-15
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 12:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655137942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88iXXFCUUWWr3EbZG1LfCOfy3qYXWJxMyEG9HO++VI0=;
 b=DyioiWuetWcEPLlPUp2RMfLqXkXYPB5FrRTm7hOCUO5mKTXjHQLuO7FGu6cwapmAZajVUq
 CSARNxGOaLwV1c21g0HnZRwsqpFNnHPcAKrE9eGv5LXwHlKnENaIXNxh8ffHnM7XjJXQdX
 K9UKVZZb/Mk15CSBWXAv+738oJe98Y4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-jBoiMpkfNniC_QlS9hWA5A-1; Mon, 13 Jun 2022 12:32:21 -0400
X-MC-Unique: jBoiMpkfNniC_QlS9hWA5A-1
Received: by mail-qv1-f72.google.com with SMTP id
 jt10-20020a05621427ea00b0046e41613270so1963859qvb.5
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 09:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=88iXXFCUUWWr3EbZG1LfCOfy3qYXWJxMyEG9HO++VI0=;
 b=aDk5T5bptjF6V9qHCZ98qFBNVcmgenTP26N5B7RF3QPszOzWaIqmAUbzFyZa/Ibr8F
 oLs/w6UYQMof5tYkGFljQ5WCzeADubnsDs3PkkEmET3PXqtFSuGWPOSEcfosnsphI7iz
 zYFmbgajfa1/t6f/dclsf3PY0OBilnS3pUQO0AmZ7Zjs2VQ64rXmiOSVhSf09jOiyYZQ
 oNk0kDWM5/NJJ9+opk/5WWe1r62dhzRGu3PB8gEvk6xSy2nD0QoP2SgT/RRWoGNOSPDx
 U4zBUMpjBfzD+uFEed7yq2mqpGdviksofUCLAVZWAsGAgTMWVUxi6Y6zY0yjlRVuWnGh
 1l0w==
X-Gm-Message-State: AOAM533+YWbKLMmam1qRFmdaoW06HsyjknnqjbGyf5lEAKBH6ldDrzKD
 6zTB3NZtafHL1n3a4OCCRvFztYv0bskKtw7Lgn7R1b6sDQl0s8Jh+rN5ZdK/y3ZYvQfwU+igWEX
 sQLY5XeGbGXb9aEhMkZIUE5i2wOpNDnE=
X-Received: by 2002:a05:620a:14b8:b0:6a6:aea2:1c58 with SMTP id
 x24-20020a05620a14b800b006a6aea21c58mr649109qkj.255.1655137940336; 
 Mon, 13 Jun 2022 09:32:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4UJVIttbA58mXVvBO5BXCasLPGGuOkkkyZsmbcOU/OTSN2h3oSHDBoIwnR0o4Jg543lHppcN7rrwrhANF+L4=
X-Received: by 2002:a05:620a:14b8:b0:6a6:aea2:1c58 with SMTP id
 x24-20020a05620a14b800b006a6aea21c58mr649072qkj.255.1655137939947; Mon, 13
 Jun 2022 09:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <d34131b7-4193-d82c-056f-23b9d99f897a@redhat.com>
 <CAJaqyWefgjYioDsV4jraPLah_Ty_RPRm9r3etVYEu5Dade9feg@mail.gmail.com>
In-Reply-To: <CAJaqyWefgjYioDsV4jraPLah_Ty_RPRm9r3etVYEu5Dade9feg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 13 Jun 2022 18:31:43 +0200
Message-ID: <CAJaqyWfy4f579a-pH2rPMB7KBrZ+iiNwuUEn2Y2TDoxPjD3VUQ@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Wed, Jun 8, 2022 at 9:28 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Wed, Jun 8, 2022 at 7:51 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > Control virtqueue is used by networking device for accepting various
> > > commands from the driver. It's a must to support multiqueue and other
> > > configurations.
> > >
> > > Shadow VirtQueue (SVQ) already makes possible migration of virtqueue
> > > states, effectively intercepting them so qemu can track what regions =
of memory
> > > are dirty because device action and needs migration. However, this do=
es not
> > > solve networking device state seen by the driver because CVQ messages=
, like
> > > changes on MAC addresses from the driver.
> > >
> > > To solve that, this series uses SVQ infraestructure proposed to inter=
cept
> > > networking control messages used by the device. This way, qemu is abl=
e to
> > > update VirtIONet device model and to migrate it.
> > >
> > > However, to intercept all queues would slow device data forwarding. T=
o solve
> > > that, only the CVQ must be intercepted all the time. This is achieved=
 using
> > > the ASID infraestructure, that allows different translations for diff=
erent
> > > virtqueues. The most updated kernel part of ASID is proposed at [1].
> > >
> > > You can run qemu in two modes after applying this series: only interc=
epting
> > > cvq with x-cvq-svq=3Don or intercept all the virtqueues adding cmdlin=
e x-svq=3Don:
> > >
> > > -netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=3Dvhost-vdp=
a0,x-cvq-svq=3Don,x-svq=3Don
> > >
> > > First three patches enable the update of the virtio-net device model =
for each
> > > CVQ message acknoledged by the device.
> > >
> > > Patches from 5 to 9 enables individual SVQ to copy the buffers to QEM=
U's VA.
> > > This allows simplyfing the memory mapping, instead of map all the gue=
st's
> > > memory like in the data virtqueues.
> > >
> > > Patch 10 allows to inject control messages to the device. This allows=
 to set
> > > state to the device both at QEMU startup and at live migration destin=
ation. In
> > > the future, this may also be used to emulate _F_ANNOUNCE.
> > >
> > > Patch 11 updates kernel headers, but it assign random numbers to need=
ed ioctls
> > > because they are still not accepted in the kernel.
> > >
> > > Patches 12-16 enables the set of the features of the net device model=
 to the
> > > vdpa device at device start.
> > >
> > > Last ones enables the sepparated ASID and SVQ.
> > >
> > > Comments are welcomed.
> >
> >
> > As discussed, I think we need to split this huge series into smaller on=
es:
> >
> > 1) shadow CVQ only, this makes rx-filter-event work
> > 2) ASID support for CVQ
> >
> > And for 1) we need consider whether or not it could be simplified.
> >
> > Or do it in reverse order, since if we do 1) first, we may have securit=
y
> > issues.
> >
>
> I'm ok with both, but I also think 2) before 1) might make more sense.
> There is no way to only shadow CVQ otherwise ATM.
>

On second thought, that order is kind of harder.

If we only map CVQ buffers, we need to either:
a. Copy them to controlled buffers
b. Track properly when to unmap them

Alternative a. have the same problems exposed in this RFC: It's hard
(and unneeded in the final version) to know the size to copy.
Alternative b. also requires things not needed in the final version,
like to count the number of times each page is mapped and unmapped.

So I'll go to the first alternative, that is also the proposed order
of the RFC. What security issues do you expect beyond the comments in
this series?

Thanks!

> Can we do as with previous base SVQ patches? they were merged although
> there is still no way to enable SVQ.
>
> Thanks!
>
> > Thoughts?
> >
> > Thanks
> >
> >
> > >
> > > TODO:
> > > * Fallback on regular CVQ if QEMU cannot isolate in its own ASID by a=
ny
> > >    reason, blocking migration. This is tricky, since it can cause tha=
t the VM
> > >    cannot be migrated anymore, so some way of block it must be used.
> > > * Review failure paths, some are with TODO notes, other don't.
> > >
> > > Changes from rfc v7:
> > > * Don't map all guest space in ASID 1 but copy all the buffers. No ne=
ed for
> > >    more memory listeners.
> > > * Move net backend start callback to SVQ.
> > > * Wait for device CVQ commands used by the device at SVQ start, avoid=
ing races.
> > > * Changed ioctls, but they're provisional anyway.
> > > * Reorder commits so refactor and code adding ones are closer to usag=
e.
> > > * Usual cleaning: better tracing, doc, patches messages, ...
> > >
> > > Changes from rfc v6:
> > > * Fix bad iotlb updates order when batching was enabled
> > > * Add reference counting to iova_tree so cleaning is simpler.
> > >
> > > Changes from rfc v5:
> > > * Fixes bad calculus of cvq end group when MQ is not acked by the gue=
st.
> > >
> > > Changes from rfc v4:
> > > * Add missing tracing
> > > * Add multiqueue support
> > > * Use already sent version for replacing g_memdup
> > > * Care with memory management
> > >
> > > Changes from rfc v3:
> > > * Fix bad returning of descriptors to SVQ list.
> > >
> > > Changes from rfc v2:
> > > * Fix use-after-free.
> > >
> > > Changes from rfc v1:
> > > * Rebase to latest master.
> > > * Configure ASID instead of assuming cvq asid !=3D data vqs asid.
> > > * Update device model so (MAC) state can be migrated too.
> > >
> > > [1] https://lkml.kernel.org/kvm/20220224212314.1326-1-gdawar@xilinx.c=
om/
> > >
> > > Eugenio P=C3=A9rez (21):
> > >    virtio-net: Expose ctrl virtqueue logic
> > >    vhost: Add custom used buffer callback
> > >    vdpa: control virtqueue support on shadow virtqueue
> > >    virtio: Make virtqueue_alloc_element non-static
> > >    vhost: Add vhost_iova_tree_find
> > >    vdpa: Add map/unmap operation callback to SVQ
> > >    vhost: move descriptor translation to vhost_svq_vring_write_descs
> > >    vhost: Add SVQElement
> > >    vhost: Add svq copy desc mode
> > >    vhost: Add vhost_svq_inject
> > >    vhost: Update kernel headers
> > >    vdpa: delay set_vring_ready after DRIVER_OK
> > >    vhost: Add ShadowVirtQueueStart operation
> > >    vhost: Make possible to check for device exclusive vq group
> > >    vhost: add vhost_svq_poll
> > >    vdpa: Add vhost_vdpa_start_control_svq
> > >    vdpa: Add asid attribute to vdpa device
> > >    vdpa: Extract get features part from vhost_vdpa_get_max_queue_pair=
s
> > >    vhost: Add reference counting to vhost_iova_tree
> > >    vdpa: Add x-svq to NetdevVhostVDPAOptions
> > >    vdpa: Add x-cvq-svq
> > >
> > >   qapi/net.json                                |  13 +-
> > >   hw/virtio/vhost-iova-tree.h                  |   7 +-
> > >   hw/virtio/vhost-shadow-virtqueue.h           |  61 ++-
> > >   include/hw/virtio/vhost-vdpa.h               |   3 +
> > >   include/hw/virtio/vhost.h                    |   3 +
> > >   include/hw/virtio/virtio-net.h               |   4 +
> > >   include/hw/virtio/virtio.h                   |   1 +
> > >   include/standard-headers/linux/vhost_types.h |  11 +-
> > >   linux-headers/linux/vhost.h                  |  25 +-
> > >   hw/net/vhost_net.c                           |   5 +-
> > >   hw/net/virtio-net.c                          |  84 +++--
> > >   hw/virtio/vhost-iova-tree.c                  |  35 +-
> > >   hw/virtio/vhost-shadow-virtqueue.c           | 378 ++++++++++++++++=
---
> > >   hw/virtio/vhost-vdpa.c                       | 206 +++++++++-
> > >   hw/virtio/virtio.c                           |   2 +-
> > >   net/vhost-vdpa.c                             | 294 ++++++++++++++-
> > >   hw/virtio/trace-events                       |  10 +-
> > >   17 files changed, 1012 insertions(+), 130 deletions(-)
> > >
> >


