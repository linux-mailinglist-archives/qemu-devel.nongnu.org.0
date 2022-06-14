Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1DF54ABB8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 10:24:24 +0200 (CEST)
Received: from localhost ([::1]:38400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o11qZ-0006DP-B8
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 04:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o11mj-0005M8-Ig
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:20:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o11mf-0004B1-0A
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655194820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u2YuzkuHbpfAPiDUfABRUqQW6ABQF4rtinMS3EEaBko=;
 b=LTIJ0hZEnLd9ip6rZTzdtXMu+C6DDorpMOzCgGZEnWOa/dxOf2ipx2/Go3Q0TmhwGiCz3M
 rw3lehpD9QvVFGkJI0uWQVM2HqrX3bHQx/muzjqFA0ZN8a2bzalcH5S+iHFcE/Ub9otdpu
 0il03pNn+PvJTvrI3eNj8RICLNt4+Xc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-MOJ8M2E5OfmfjfmKcOj-rw-1; Tue, 14 Jun 2022 04:20:19 -0400
X-MC-Unique: MOJ8M2E5OfmfjfmKcOj-rw-1
Received: by mail-lf1-f70.google.com with SMTP id
 u5-20020a056512128500b00479784f526cso4177450lfs.13
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 01:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u2YuzkuHbpfAPiDUfABRUqQW6ABQF4rtinMS3EEaBko=;
 b=X7bh4mWC2KFeQX4vdRXiHVGm5v36SDZMdEvbo3H9go6kPY9U06AjEysqfGQzH5r//3
 eEUtGhOxgSCdhW1QgBzcJtba/Z7NnNFS3t5vCOJeymc7FNn1uJKmcluxzXx+FvvG44c5
 b6CLClbdD/OsveeAfRPgHlQdevrP/jDbaioWiL1hYRRMIMnk56NdbSj4DWPh8OI+Z/pu
 xP3BhpHv5bZM/iBo5cZq+9urUFMrQm3pwkqsePWJNYBPBVV3LtvN7S+pxM/EcPFmxFDd
 9SRVM8Htk9cpW3P8rR8MCNXwlzcofZ4BMWdGlMQc04najbGS/3NU/quvNTDWgl5WXJ/A
 1lLA==
X-Gm-Message-State: AJIora9yLjgThUlpVHJMPdgcYbgkn+JkH2GKCdINVXI3tXT+Rz4h7IiA
 vQrTKm263uG50bnsR2zkUjjLY/0SaYvFvb4VGp0rpv4QdUmbO56t+qga2If0D0hDSeJJ6U99GuR
 oWED/qXFV0rkVS4v4ORTUW7Xz2uveh8Y=
X-Received: by 2002:a05:651c:306:b0:258:f7fa:e549 with SMTP id
 a6-20020a05651c030600b00258f7fae549mr1750320ljp.243.1655194817346; 
 Tue, 14 Jun 2022 01:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sKQe9I0vHKZ/ojqifd1atazXiSfI1obeaLKvDX6NM7l9AuWnF0PEktCH+PHojVvlZ2dUT3htHCl04vtK5sIzc=
X-Received: by 2002:a05:651c:306:b0:258:f7fa:e549 with SMTP id
 a6-20020a05651c030600b00258f7fae549mr1750302ljp.243.1655194817005; Tue, 14
 Jun 2022 01:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <d34131b7-4193-d82c-056f-23b9d99f897a@redhat.com>
 <CAJaqyWefgjYioDsV4jraPLah_Ty_RPRm9r3etVYEu5Dade9feg@mail.gmail.com>
 <CAJaqyWfy4f579a-pH2rPMB7KBrZ+iiNwuUEn2Y2TDoxPjD3VUQ@mail.gmail.com>
 <CACGkMEutyK2AXZ6uMg2nioXnJoaONkC7u1gGCuzJmuem_OsLLg@mail.gmail.com>
 <CAJaqyWeED1Q0XvrJ1gyYkZxSGXPdUXY+7+UCWAhpiJ+CEjC=WQ@mail.gmail.com>
In-Reply-To: <CAJaqyWeED1Q0XvrJ1gyYkZxSGXPdUXY+7+UCWAhpiJ+CEjC=WQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 14 Jun 2022 16:20:05 +0800
Message-ID: <CACGkMEtqNz8b6U6Fzqj5fft8Ax_Evu1=ptGyMs7ACM0OVybmdA@mail.gmail.com>
Subject: Re: [RFC PATCH v8 00/21] Net Control VQ support with asid in vDPA SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Tue, Jun 14, 2022 at 4:14 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Jun 14, 2022 at 10:02 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, Jun 14, 2022 at 12:32 AM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Wed, Jun 8, 2022 at 9:28 PM Eugenio Perez Martin <eperezma@redhat.=
com> wrote:
> > > >
> > > > On Wed, Jun 8, 2022 at 7:51 AM Jason Wang <jasowang@redhat.com> wro=
te:
> > > > >
> > > > >
> > > > > =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > > > > Control virtqueue is used by networking device for accepting va=
rious
> > > > > > commands from the driver. It's a must to support multiqueue and=
 other
> > > > > > configurations.
> > > > > >
> > > > > > Shadow VirtQueue (SVQ) already makes possible migration of virt=
queue
> > > > > > states, effectively intercepting them so qemu can track what re=
gions of memory
> > > > > > are dirty because device action and needs migration. However, t=
his does not
> > > > > > solve networking device state seen by the driver because CVQ me=
ssages, like
> > > > > > changes on MAC addresses from the driver.
> > > > > >
> > > > > > To solve that, this series uses SVQ infraestructure proposed to=
 intercept
> > > > > > networking control messages used by the device. This way, qemu =
is able to
> > > > > > update VirtIONet device model and to migrate it.
> > > > > >
> > > > > > However, to intercept all queues would slow device data forward=
ing. To solve
> > > > > > that, only the CVQ must be intercepted all the time. This is ac=
hieved using
> > > > > > the ASID infraestructure, that allows different translations fo=
r different
> > > > > > virtqueues. The most updated kernel part of ASID is proposed at=
 [1].
> > > > > >
> > > > > > You can run qemu in two modes after applying this series: only =
intercepting
> > > > > > cvq with x-cvq-svq=3Don or intercept all the virtqueues adding =
cmdline x-svq=3Don:
> > > > > >
> > > > > > -netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=3Dvho=
st-vdpa0,x-cvq-svq=3Don,x-svq=3Don
> > > > > >
> > > > > > First three patches enable the update of the virtio-net device =
model for each
> > > > > > CVQ message acknoledged by the device.
> > > > > >
> > > > > > Patches from 5 to 9 enables individual SVQ to copy the buffers =
to QEMU's VA.
> > > > > > This allows simplyfing the memory mapping, instead of map all t=
he guest's
> > > > > > memory like in the data virtqueues.
> > > > > >
> > > > > > Patch 10 allows to inject control messages to the device. This =
allows to set
> > > > > > state to the device both at QEMU startup and at live migration =
destination. In
> > > > > > the future, this may also be used to emulate _F_ANNOUNCE.
> > > > > >
> > > > > > Patch 11 updates kernel headers, but it assign random numbers t=
o needed ioctls
> > > > > > because they are still not accepted in the kernel.
> > > > > >
> > > > > > Patches 12-16 enables the set of the features of the net device=
 model to the
> > > > > > vdpa device at device start.
> > > > > >
> > > > > > Last ones enables the sepparated ASID and SVQ.
> > > > > >
> > > > > > Comments are welcomed.
> > > > >
> > > > >
> > > > > As discussed, I think we need to split this huge series into smal=
ler ones:
> > > > >
> > > > > 1) shadow CVQ only, this makes rx-filter-event work
> > > > > 2) ASID support for CVQ
> > > > >
> > > > > And for 1) we need consider whether or not it could be simplified=
.
> > > > >
> > > > > Or do it in reverse order, since if we do 1) first, we may have s=
ecurity
> > > > > issues.
> > > > >
> > > >
> > > > I'm ok with both, but I also think 2) before 1) might make more sen=
se.
> > > > There is no way to only shadow CVQ otherwise ATM.
> > > >
> > >
> > > On second thought, that order is kind of harder.
> > >
> > > If we only map CVQ buffers, we need to either:
> > > a. Copy them to controlled buffers
> > > b. Track properly when to unmap them
> >
> > Just to make sure we're at the same page:
> >
> > I meant we can start with e.g having a dedicated ASID for CVQ but
> > still using CVQ passthrough.
> >
>
> That would imply duplicating all the memory listener updates to both
> ASIDs. That part of the code needs to be reverted. I'm ok with that,
> but I'm not sure if it's worth it to do it that way.

I don't get why it is related to memory listeners. The only change is

1) read the groups
2) set cvq to be an independent asid
3) update CVQ's IOTLB with its own ASID

?

>
> > Then do other stuff on top.
> >
> > >
> > > Alternative a. have the same problems exposed in this RFC: It's hard
> > > (and unneeded in the final version) to know the size to copy.
> > > Alternative b. also requires things not needed in the final version,
> > > like to count the number of times each page is mapped and unmapped.
> > >
> > > So I'll go to the first alternative, that is also the proposed order
> > > of the RFC. What security issues do you expect beyond the comments in
> > > this series?
> >
> > If we shadow CVQ without ASID. The guest may guess the IOVA of CVQ and
> > try to peek/modify it?
> >
>
> It works the same way as data vqs, we're just updating the device
> model in the middle. It should imply the exact same risk as updating
> an emulated NIC control plane (including vhost-kernel / vhost-user).

Not sure I got you here. For vhost-kernel and vhost-user, CVQ's buffer
is owned by guests.

But if we shadow CVQ without ASID, the CVQ buffer is owned by QEMU and
there's no way to prevent guests from accessing it?

If in the case of vhost-kernel/vhost-user, there's a way for the guest
to exploit buffers owned by Qemu, it should be a bug.

Thanks

>
> Roughly speaking, it's just to propose patches 01 to 03, with your
> comments. That already meets use cases like rx filter notifications
> for devices with only one ASID.
>
> Thanks!
>
> > Thanks
> >
> > >
> > > Thanks!
> > >
> > > > Can we do as with previous base SVQ patches? they were merged altho=
ugh
> > > > there is still no way to enable SVQ.
> > > >
> > > > Thanks!
> > > >
> > > > > Thoughts?
> > > > >
> > > > > Thanks
> > > > >
> > > > >
> > > > > >
> > > > > > TODO:
> > > > > > * Fallback on regular CVQ if QEMU cannot isolate in its own ASI=
D by any
> > > > > >    reason, blocking migration. This is tricky, since it can cau=
se that the VM
> > > > > >    cannot be migrated anymore, so some way of block it must be =
used.
> > > > > > * Review failure paths, some are with TODO notes, other don't.
> > > > > >
> > > > > > Changes from rfc v7:
> > > > > > * Don't map all guest space in ASID 1 but copy all the buffers.=
 No need for
> > > > > >    more memory listeners.
> > > > > > * Move net backend start callback to SVQ.
> > > > > > * Wait for device CVQ commands used by the device at SVQ start,=
 avoiding races.
> > > > > > * Changed ioctls, but they're provisional anyway.
> > > > > > * Reorder commits so refactor and code adding ones are closer t=
o usage.
> > > > > > * Usual cleaning: better tracing, doc, patches messages, ...
> > > > > >
> > > > > > Changes from rfc v6:
> > > > > > * Fix bad iotlb updates order when batching was enabled
> > > > > > * Add reference counting to iova_tree so cleaning is simpler.
> > > > > >
> > > > > > Changes from rfc v5:
> > > > > > * Fixes bad calculus of cvq end group when MQ is not acked by t=
he guest.
> > > > > >
> > > > > > Changes from rfc v4:
> > > > > > * Add missing tracing
> > > > > > * Add multiqueue support
> > > > > > * Use already sent version for replacing g_memdup
> > > > > > * Care with memory management
> > > > > >
> > > > > > Changes from rfc v3:
> > > > > > * Fix bad returning of descriptors to SVQ list.
> > > > > >
> > > > > > Changes from rfc v2:
> > > > > > * Fix use-after-free.
> > > > > >
> > > > > > Changes from rfc v1:
> > > > > > * Rebase to latest master.
> > > > > > * Configure ASID instead of assuming cvq asid !=3D data vqs asi=
d.
> > > > > > * Update device model so (MAC) state can be migrated too.
> > > > > >
> > > > > > [1] https://lkml.kernel.org/kvm/20220224212314.1326-1-gdawar@xi=
linx.com/
> > > > > >
> > > > > > Eugenio P=C3=A9rez (21):
> > > > > >    virtio-net: Expose ctrl virtqueue logic
> > > > > >    vhost: Add custom used buffer callback
> > > > > >    vdpa: control virtqueue support on shadow virtqueue
> > > > > >    virtio: Make virtqueue_alloc_element non-static
> > > > > >    vhost: Add vhost_iova_tree_find
> > > > > >    vdpa: Add map/unmap operation callback to SVQ
> > > > > >    vhost: move descriptor translation to vhost_svq_vring_write_=
descs
> > > > > >    vhost: Add SVQElement
> > > > > >    vhost: Add svq copy desc mode
> > > > > >    vhost: Add vhost_svq_inject
> > > > > >    vhost: Update kernel headers
> > > > > >    vdpa: delay set_vring_ready after DRIVER_OK
> > > > > >    vhost: Add ShadowVirtQueueStart operation
> > > > > >    vhost: Make possible to check for device exclusive vq group
> > > > > >    vhost: add vhost_svq_poll
> > > > > >    vdpa: Add vhost_vdpa_start_control_svq
> > > > > >    vdpa: Add asid attribute to vdpa device
> > > > > >    vdpa: Extract get features part from vhost_vdpa_get_max_queu=
e_pairs
> > > > > >    vhost: Add reference counting to vhost_iova_tree
> > > > > >    vdpa: Add x-svq to NetdevVhostVDPAOptions
> > > > > >    vdpa: Add x-cvq-svq
> > > > > >
> > > > > >   qapi/net.json                                |  13 +-
> > > > > >   hw/virtio/vhost-iova-tree.h                  |   7 +-
> > > > > >   hw/virtio/vhost-shadow-virtqueue.h           |  61 ++-
> > > > > >   include/hw/virtio/vhost-vdpa.h               |   3 +
> > > > > >   include/hw/virtio/vhost.h                    |   3 +
> > > > > >   include/hw/virtio/virtio-net.h               |   4 +
> > > > > >   include/hw/virtio/virtio.h                   |   1 +
> > > > > >   include/standard-headers/linux/vhost_types.h |  11 +-
> > > > > >   linux-headers/linux/vhost.h                  |  25 +-
> > > > > >   hw/net/vhost_net.c                           |   5 +-
> > > > > >   hw/net/virtio-net.c                          |  84 +++--
> > > > > >   hw/virtio/vhost-iova-tree.c                  |  35 +-
> > > > > >   hw/virtio/vhost-shadow-virtqueue.c           | 378 ++++++++++=
++++++---
> > > > > >   hw/virtio/vhost-vdpa.c                       | 206 +++++++++-
> > > > > >   hw/virtio/virtio.c                           |   2 +-
> > > > > >   net/vhost-vdpa.c                             | 294 ++++++++++=
++++-
> > > > > >   hw/virtio/trace-events                       |  10 +-
> > > > > >   17 files changed, 1012 insertions(+), 130 deletions(-)
> > > > > >
> > > > >
> > >
> >
>


