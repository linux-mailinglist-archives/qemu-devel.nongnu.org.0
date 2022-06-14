Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8DE54AB8C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 10:17:48 +0200 (CEST)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o11kA-0003JM-Ou
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 04:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o11h2-0001lr-QO
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o11gz-00032i-P4
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655194468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3NivluRrE1xf3LV6la9i1inkvNGjVvKQ2u2xqLJCsBo=;
 b=XaNqVxVx96HZL2wN8L1qSmtL+JtmxHON0WxgWDmlRxYvjikwoBBVjJ6dZVpFP4/Ka4GoNC
 grn26Ug7mqBkjdcfrhkiJN2H+T9Dxb80K6k0JtEsWV7J8aWqyuVhRITrrRVfsOs2CgMdy9
 EGBfaY0g01iRci7PXMQ/a7xIqpgvvj0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-Xakx9DWrPy2aLlb_M_wFgA-1; Tue, 14 Jun 2022 04:14:27 -0400
X-MC-Unique: Xakx9DWrPy2aLlb_M_wFgA-1
Received: by mail-qk1-f197.google.com with SMTP id
 t15-20020a05620a450f00b006a75bf35680so6940387qkp.1
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 01:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3NivluRrE1xf3LV6la9i1inkvNGjVvKQ2u2xqLJCsBo=;
 b=IB5Jb15Y/o1zMPFsTWqH0zCNFen15sKjexKcDYl5QxNRMXTJQJ6G4ELwXI5dYUDneG
 yxNG7VR9lvmiin6D2vqips1YGqo9LSAgyQSkeD3bOIka5jVhRGJFnJ0y7J3y2E9IMWip
 Dm9EqRQJgdzLqOJZckictN2TsI5OdDxV8RZzBBgEt7f2N9iPay+ovEubd7RH5IhV64cH
 jvzaGfxstQMi4N2aK9ruCuaJudN/pmkKvATBHV/6s0zdBEln1QyYi+Z1LgEZjtcHbd1L
 auDd8MP94wBJV2jFLr+toMMG18KItgi+XsTmspmzhL6WaEyWSILlh7fm5EyPzPV2N4dK
 My3Q==
X-Gm-Message-State: AOAM530buURESPmUrafnfYlF6BPruyMVQdIiohAzlellbzxT5Vi9dM8n
 MMBsmSxCl+9ZN1i76D4U2NPdNgL4zllUMlXNdpbHc5FzKcB9Sf3hZwjc+CsGehx5uRSjpppN9ee
 wJULQXHkUarlOJRxpDgekdma+5cxoQB8=
X-Received: by 2002:ac8:598f:0:b0:305:8f8:2069 with SMTP id
 e15-20020ac8598f000000b0030508f82069mr3104594qte.370.1655194466851; 
 Tue, 14 Jun 2022 01:14:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9GRV4M69/1vnWtt0eCOW+CqOarZiJeV4Twy6zruVmrQjfHT+XZ4M0LfPtGNxFp6m0blsxSrKZzcxYEQaBGuE=
X-Received: by 2002:ac8:598f:0:b0:305:8f8:2069 with SMTP id
 e15-20020ac8598f000000b0030508f82069mr3104577qte.370.1655194466562; Tue, 14
 Jun 2022 01:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <d34131b7-4193-d82c-056f-23b9d99f897a@redhat.com>
 <CAJaqyWefgjYioDsV4jraPLah_Ty_RPRm9r3etVYEu5Dade9feg@mail.gmail.com>
 <CAJaqyWfy4f579a-pH2rPMB7KBrZ+iiNwuUEn2Y2TDoxPjD3VUQ@mail.gmail.com>
 <CACGkMEutyK2AXZ6uMg2nioXnJoaONkC7u1gGCuzJmuem_OsLLg@mail.gmail.com>
In-Reply-To: <CACGkMEutyK2AXZ6uMg2nioXnJoaONkC7u1gGCuzJmuem_OsLLg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 14 Jun 2022 10:13:50 +0200
Message-ID: <CAJaqyWeED1Q0XvrJ1gyYkZxSGXPdUXY+7+UCWAhpiJ+CEjC=WQ@mail.gmail.com>
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

On Tue, Jun 14, 2022 at 10:02 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Jun 14, 2022 at 12:32 AM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Wed, Jun 8, 2022 at 9:28 PM Eugenio Perez Martin <eperezma@redhat.co=
m> wrote:
> > >
> > > On Wed, Jun 8, 2022 at 7:51 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > > >
> > > >
> > > > =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > > > Control virtqueue is used by networking device for accepting vari=
ous
> > > > > commands from the driver. It's a must to support multiqueue and o=
ther
> > > > > configurations.
> > > > >
> > > > > Shadow VirtQueue (SVQ) already makes possible migration of virtqu=
eue
> > > > > states, effectively intercepting them so qemu can track what regi=
ons of memory
> > > > > are dirty because device action and needs migration. However, thi=
s does not
> > > > > solve networking device state seen by the driver because CVQ mess=
ages, like
> > > > > changes on MAC addresses from the driver.
> > > > >
> > > > > To solve that, this series uses SVQ infraestructure proposed to i=
ntercept
> > > > > networking control messages used by the device. This way, qemu is=
 able to
> > > > > update VirtIONet device model and to migrate it.
> > > > >
> > > > > However, to intercept all queues would slow device data forwardin=
g. To solve
> > > > > that, only the CVQ must be intercepted all the time. This is achi=
eved using
> > > > > the ASID infraestructure, that allows different translations for =
different
> > > > > virtqueues. The most updated kernel part of ASID is proposed at [=
1].
> > > > >
> > > > > You can run qemu in two modes after applying this series: only in=
tercepting
> > > > > cvq with x-cvq-svq=3Don or intercept all the virtqueues adding cm=
dline x-svq=3Don:
> > > > >
> > > > > -netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=3Dvhost=
-vdpa0,x-cvq-svq=3Don,x-svq=3Don
> > > > >
> > > > > First three patches enable the update of the virtio-net device mo=
del for each
> > > > > CVQ message acknoledged by the device.
> > > > >
> > > > > Patches from 5 to 9 enables individual SVQ to copy the buffers to=
 QEMU's VA.
> > > > > This allows simplyfing the memory mapping, instead of map all the=
 guest's
> > > > > memory like in the data virtqueues.
> > > > >
> > > > > Patch 10 allows to inject control messages to the device. This al=
lows to set
> > > > > state to the device both at QEMU startup and at live migration de=
stination. In
> > > > > the future, this may also be used to emulate _F_ANNOUNCE.
> > > > >
> > > > > Patch 11 updates kernel headers, but it assign random numbers to =
needed ioctls
> > > > > because they are still not accepted in the kernel.
> > > > >
> > > > > Patches 12-16 enables the set of the features of the net device m=
odel to the
> > > > > vdpa device at device start.
> > > > >
> > > > > Last ones enables the sepparated ASID and SVQ.
> > > > >
> > > > > Comments are welcomed.
> > > >
> > > >
> > > > As discussed, I think we need to split this huge series into smalle=
r ones:
> > > >
> > > > 1) shadow CVQ only, this makes rx-filter-event work
> > > > 2) ASID support for CVQ
> > > >
> > > > And for 1) we need consider whether or not it could be simplified.
> > > >
> > > > Or do it in reverse order, since if we do 1) first, we may have sec=
urity
> > > > issues.
> > > >
> > >
> > > I'm ok with both, but I also think 2) before 1) might make more sense=
.
> > > There is no way to only shadow CVQ otherwise ATM.
> > >
> >
> > On second thought, that order is kind of harder.
> >
> > If we only map CVQ buffers, we need to either:
> > a. Copy them to controlled buffers
> > b. Track properly when to unmap them
>
> Just to make sure we're at the same page:
>
> I meant we can start with e.g having a dedicated ASID for CVQ but
> still using CVQ passthrough.
>

That would imply duplicating all the memory listener updates to both
ASIDs. That part of the code needs to be reverted. I'm ok with that,
but I'm not sure if it's worth it to do it that way.

> Then do other stuff on top.
>
> >
> > Alternative a. have the same problems exposed in this RFC: It's hard
> > (and unneeded in the final version) to know the size to copy.
> > Alternative b. also requires things not needed in the final version,
> > like to count the number of times each page is mapped and unmapped.
> >
> > So I'll go to the first alternative, that is also the proposed order
> > of the RFC. What security issues do you expect beyond the comments in
> > this series?
>
> If we shadow CVQ without ASID. The guest may guess the IOVA of CVQ and
> try to peek/modify it?
>

It works the same way as data vqs, we're just updating the device
model in the middle. It should imply the exact same risk as updating
an emulated NIC control plane (including vhost-kernel / vhost-user).

Roughly speaking, it's just to propose patches 01 to 03, with your
comments. That already meets use cases like rx filter notifications
for devices with only one ASID.

Thanks!

> Thanks
>
> >
> > Thanks!
> >
> > > Can we do as with previous base SVQ patches? they were merged althoug=
h
> > > there is still no way to enable SVQ.
> > >
> > > Thanks!
> > >
> > > > Thoughts?
> > > >
> > > > Thanks
> > > >
> > > >
> > > > >
> > > > > TODO:
> > > > > * Fallback on regular CVQ if QEMU cannot isolate in its own ASID =
by any
> > > > >    reason, blocking migration. This is tricky, since it can cause=
 that the VM
> > > > >    cannot be migrated anymore, so some way of block it must be us=
ed.
> > > > > * Review failure paths, some are with TODO notes, other don't.
> > > > >
> > > > > Changes from rfc v7:
> > > > > * Don't map all guest space in ASID 1 but copy all the buffers. N=
o need for
> > > > >    more memory listeners.
> > > > > * Move net backend start callback to SVQ.
> > > > > * Wait for device CVQ commands used by the device at SVQ start, a=
voiding races.
> > > > > * Changed ioctls, but they're provisional anyway.
> > > > > * Reorder commits so refactor and code adding ones are closer to =
usage.
> > > > > * Usual cleaning: better tracing, doc, patches messages, ...
> > > > >
> > > > > Changes from rfc v6:
> > > > > * Fix bad iotlb updates order when batching was enabled
> > > > > * Add reference counting to iova_tree so cleaning is simpler.
> > > > >
> > > > > Changes from rfc v5:
> > > > > * Fixes bad calculus of cvq end group when MQ is not acked by the=
 guest.
> > > > >
> > > > > Changes from rfc v4:
> > > > > * Add missing tracing
> > > > > * Add multiqueue support
> > > > > * Use already sent version for replacing g_memdup
> > > > > * Care with memory management
> > > > >
> > > > > Changes from rfc v3:
> > > > > * Fix bad returning of descriptors to SVQ list.
> > > > >
> > > > > Changes from rfc v2:
> > > > > * Fix use-after-free.
> > > > >
> > > > > Changes from rfc v1:
> > > > > * Rebase to latest master.
> > > > > * Configure ASID instead of assuming cvq asid !=3D data vqs asid.
> > > > > * Update device model so (MAC) state can be migrated too.
> > > > >
> > > > > [1] https://lkml.kernel.org/kvm/20220224212314.1326-1-gdawar@xili=
nx.com/
> > > > >
> > > > > Eugenio P=C3=A9rez (21):
> > > > >    virtio-net: Expose ctrl virtqueue logic
> > > > >    vhost: Add custom used buffer callback
> > > > >    vdpa: control virtqueue support on shadow virtqueue
> > > > >    virtio: Make virtqueue_alloc_element non-static
> > > > >    vhost: Add vhost_iova_tree_find
> > > > >    vdpa: Add map/unmap operation callback to SVQ
> > > > >    vhost: move descriptor translation to vhost_svq_vring_write_de=
scs
> > > > >    vhost: Add SVQElement
> > > > >    vhost: Add svq copy desc mode
> > > > >    vhost: Add vhost_svq_inject
> > > > >    vhost: Update kernel headers
> > > > >    vdpa: delay set_vring_ready after DRIVER_OK
> > > > >    vhost: Add ShadowVirtQueueStart operation
> > > > >    vhost: Make possible to check for device exclusive vq group
> > > > >    vhost: add vhost_svq_poll
> > > > >    vdpa: Add vhost_vdpa_start_control_svq
> > > > >    vdpa: Add asid attribute to vdpa device
> > > > >    vdpa: Extract get features part from vhost_vdpa_get_max_queue_=
pairs
> > > > >    vhost: Add reference counting to vhost_iova_tree
> > > > >    vdpa: Add x-svq to NetdevVhostVDPAOptions
> > > > >    vdpa: Add x-cvq-svq
> > > > >
> > > > >   qapi/net.json                                |  13 +-
> > > > >   hw/virtio/vhost-iova-tree.h                  |   7 +-
> > > > >   hw/virtio/vhost-shadow-virtqueue.h           |  61 ++-
> > > > >   include/hw/virtio/vhost-vdpa.h               |   3 +
> > > > >   include/hw/virtio/vhost.h                    |   3 +
> > > > >   include/hw/virtio/virtio-net.h               |   4 +
> > > > >   include/hw/virtio/virtio.h                   |   1 +
> > > > >   include/standard-headers/linux/vhost_types.h |  11 +-
> > > > >   linux-headers/linux/vhost.h                  |  25 +-
> > > > >   hw/net/vhost_net.c                           |   5 +-
> > > > >   hw/net/virtio-net.c                          |  84 +++--
> > > > >   hw/virtio/vhost-iova-tree.c                  |  35 +-
> > > > >   hw/virtio/vhost-shadow-virtqueue.c           | 378 ++++++++++++=
++++---
> > > > >   hw/virtio/vhost-vdpa.c                       | 206 +++++++++-
> > > > >   hw/virtio/virtio.c                           |   2 +-
> > > > >   net/vhost-vdpa.c                             | 294 ++++++++++++=
++-
> > > > >   hw/virtio/trace-events                       |  10 +-
> > > > >   17 files changed, 1012 insertions(+), 130 deletions(-)
> > > > >
> > > >
> >
>


