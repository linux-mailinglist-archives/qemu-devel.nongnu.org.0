Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43954AB8B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 10:17:38 +0200 (CEST)
Received: from localhost ([::1]:34020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o11k0-00031s-5b
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 04:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o11VB-0007Lp-1L
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o11V2-00016R-H1
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:02:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655193725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+EjT819nYq5pza6SWzHVqzUte4sK98xohINYutrSd4Y=;
 b=CGMC2dR39lD9yd1CKaVn6sV8fxex0ilfMQQfYcxc7rIUoGrW45ZX2BRFXuLX4TpICcvSap
 0EWj0zfTz4mK9u/gI42vu3iFul/gf1plGwc0nKNFrz+Kd7GYfP9m8YI/Y8ugkKCabd1c9O
 XEVIHq5rATEfQDSS49qLMxYNLa6TH48=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-g7PDAVQ3P2Gmb0efPX7PFg-1; Tue, 14 Jun 2022 04:02:04 -0400
X-MC-Unique: g7PDAVQ3P2Gmb0efPX7PFg-1
Received: by mail-lf1-f69.google.com with SMTP id
 c25-20020ac25f79000000b00478f05f8f49so4153984lfc.20
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 01:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+EjT819nYq5pza6SWzHVqzUte4sK98xohINYutrSd4Y=;
 b=piF7T2v4A56DqsRfBjhI+t/MH1Gkz28ywSsiLLcDRqV7UBy4XcWf1BhqkXuLrj+ibY
 1RcvCy2IR7IgvEdNjxK4ERhQmyMHSJmUp2bNxZ/TZnqHwjLCxSqzEp3U1q8GBWmzi0or
 Vbx5au0AurZaLTy2bI4+zEWJUFYAWwHpwI+fF0VSmV+k6BMJ17q4aNvMq0UdPIvpOeln
 /mCv6HfQaL6V4148a5L+SHk6Hwy5BPl+K0d2glCzP0KMc+AazBgW8I8KnZiyX5TMiFeD
 e3mFzLdJ8hybCbGbdREgPYns8Fv0emn9QUaCVJCismp/nuxOczAI6ecLQWum02Gy6stl
 97BQ==
X-Gm-Message-State: AOAM531H/iGmivTK9zTqjBKfJaAlXUkOj3rCAYB4ZGwulON1g1xerczf
 JqAUmLc1G4kzFgIqtdyPmlF7rD5faHL2EnjdbH5EZhHk+JhiArw/7oeJ+L5qnJ7vx/zdTkZtI59
 g4jdK4+HVfAbyx5gY9d+DFvuRW9VPRCs=
X-Received: by 2002:a05:6512:5cc:b0:47a:bf7:f1ab with SMTP id
 o12-20020a05651205cc00b0047a0bf7f1abmr2295438lfo.397.1655193722516; 
 Tue, 14 Jun 2022 01:02:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tER/Ue71CHKTQgfgEYPMScKqiGbuLlumvzHC4SUt6KMxwi3HEaxvKnudwCdSmOcuHBb25Tbn8JuVsDPz4uc1U=
X-Received: by 2002:a05:6512:5cc:b0:47a:bf7:f1ab with SMTP id
 o12-20020a05651205cc00b0047a0bf7f1abmr2295413lfo.397.1655193722190; Tue, 14
 Jun 2022 01:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <d34131b7-4193-d82c-056f-23b9d99f897a@redhat.com>
 <CAJaqyWefgjYioDsV4jraPLah_Ty_RPRm9r3etVYEu5Dade9feg@mail.gmail.com>
 <CAJaqyWfy4f579a-pH2rPMB7KBrZ+iiNwuUEn2Y2TDoxPjD3VUQ@mail.gmail.com>
In-Reply-To: <CAJaqyWfy4f579a-pH2rPMB7KBrZ+iiNwuUEn2Y2TDoxPjD3VUQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 14 Jun 2022 16:01:51 +0800
Message-ID: <CACGkMEutyK2AXZ6uMg2nioXnJoaONkC7u1gGCuzJmuem_OsLLg@mail.gmail.com>
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

On Tue, Jun 14, 2022 at 12:32 AM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Jun 8, 2022 at 9:28 PM Eugenio Perez Martin <eperezma@redhat.com>=
 wrote:
> >
> > On Wed, Jun 8, 2022 at 7:51 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > >
> > > =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > > Control virtqueue is used by networking device for accepting variou=
s
> > > > commands from the driver. It's a must to support multiqueue and oth=
er
> > > > configurations.
> > > >
> > > > Shadow VirtQueue (SVQ) already makes possible migration of virtqueu=
e
> > > > states, effectively intercepting them so qemu can track what region=
s of memory
> > > > are dirty because device action and needs migration. However, this =
does not
> > > > solve networking device state seen by the driver because CVQ messag=
es, like
> > > > changes on MAC addresses from the driver.
> > > >
> > > > To solve that, this series uses SVQ infraestructure proposed to int=
ercept
> > > > networking control messages used by the device. This way, qemu is a=
ble to
> > > > update VirtIONet device model and to migrate it.
> > > >
> > > > However, to intercept all queues would slow device data forwarding.=
 To solve
> > > > that, only the CVQ must be intercepted all the time. This is achiev=
ed using
> > > > the ASID infraestructure, that allows different translations for di=
fferent
> > > > virtqueues. The most updated kernel part of ASID is proposed at [1]=
.
> > > >
> > > > You can run qemu in two modes after applying this series: only inte=
rcepting
> > > > cvq with x-cvq-svq=3Don or intercept all the virtqueues adding cmdl=
ine x-svq=3Don:
> > > >
> > > > -netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=3Dvhost-v=
dpa0,x-cvq-svq=3Don,x-svq=3Don
> > > >
> > > > First three patches enable the update of the virtio-net device mode=
l for each
> > > > CVQ message acknoledged by the device.
> > > >
> > > > Patches from 5 to 9 enables individual SVQ to copy the buffers to Q=
EMU's VA.
> > > > This allows simplyfing the memory mapping, instead of map all the g=
uest's
> > > > memory like in the data virtqueues.
> > > >
> > > > Patch 10 allows to inject control messages to the device. This allo=
ws to set
> > > > state to the device both at QEMU startup and at live migration dest=
ination. In
> > > > the future, this may also be used to emulate _F_ANNOUNCE.
> > > >
> > > > Patch 11 updates kernel headers, but it assign random numbers to ne=
eded ioctls
> > > > because they are still not accepted in the kernel.
> > > >
> > > > Patches 12-16 enables the set of the features of the net device mod=
el to the
> > > > vdpa device at device start.
> > > >
> > > > Last ones enables the sepparated ASID and SVQ.
> > > >
> > > > Comments are welcomed.
> > >
> > >
> > > As discussed, I think we need to split this huge series into smaller =
ones:
> > >
> > > 1) shadow CVQ only, this makes rx-filter-event work
> > > 2) ASID support for CVQ
> > >
> > > And for 1) we need consider whether or not it could be simplified.
> > >
> > > Or do it in reverse order, since if we do 1) first, we may have secur=
ity
> > > issues.
> > >
> >
> > I'm ok with both, but I also think 2) before 1) might make more sense.
> > There is no way to only shadow CVQ otherwise ATM.
> >
>
> On second thought, that order is kind of harder.
>
> If we only map CVQ buffers, we need to either:
> a. Copy them to controlled buffers
> b. Track properly when to unmap them

Just to make sure we're at the same page:

I meant we can start with e.g having a dedicated ASID for CVQ but
still using CVQ passthrough.

Then do other stuff on top.

>
> Alternative a. have the same problems exposed in this RFC: It's hard
> (and unneeded in the final version) to know the size to copy.
> Alternative b. also requires things not needed in the final version,
> like to count the number of times each page is mapped and unmapped.
>
> So I'll go to the first alternative, that is also the proposed order
> of the RFC. What security issues do you expect beyond the comments in
> this series?

If we shadow CVQ without ASID. The guest may guess the IOVA of CVQ and
try to peek/modify it?

Thanks

>
> Thanks!
>
> > Can we do as with previous base SVQ patches? they were merged although
> > there is still no way to enable SVQ.
> >
> > Thanks!
> >
> > > Thoughts?
> > >
> > > Thanks
> > >
> > >
> > > >
> > > > TODO:
> > > > * Fallback on regular CVQ if QEMU cannot isolate in its own ASID by=
 any
> > > >    reason, blocking migration. This is tricky, since it can cause t=
hat the VM
> > > >    cannot be migrated anymore, so some way of block it must be used=
.
> > > > * Review failure paths, some are with TODO notes, other don't.
> > > >
> > > > Changes from rfc v7:
> > > > * Don't map all guest space in ASID 1 but copy all the buffers. No =
need for
> > > >    more memory listeners.
> > > > * Move net backend start callback to SVQ.
> > > > * Wait for device CVQ commands used by the device at SVQ start, avo=
iding races.
> > > > * Changed ioctls, but they're provisional anyway.
> > > > * Reorder commits so refactor and code adding ones are closer to us=
age.
> > > > * Usual cleaning: better tracing, doc, patches messages, ...
> > > >
> > > > Changes from rfc v6:
> > > > * Fix bad iotlb updates order when batching was enabled
> > > > * Add reference counting to iova_tree so cleaning is simpler.
> > > >
> > > > Changes from rfc v5:
> > > > * Fixes bad calculus of cvq end group when MQ is not acked by the g=
uest.
> > > >
> > > > Changes from rfc v4:
> > > > * Add missing tracing
> > > > * Add multiqueue support
> > > > * Use already sent version for replacing g_memdup
> > > > * Care with memory management
> > > >
> > > > Changes from rfc v3:
> > > > * Fix bad returning of descriptors to SVQ list.
> > > >
> > > > Changes from rfc v2:
> > > > * Fix use-after-free.
> > > >
> > > > Changes from rfc v1:
> > > > * Rebase to latest master.
> > > > * Configure ASID instead of assuming cvq asid !=3D data vqs asid.
> > > > * Update device model so (MAC) state can be migrated too.
> > > >
> > > > [1] https://lkml.kernel.org/kvm/20220224212314.1326-1-gdawar@xilinx=
.com/
> > > >
> > > > Eugenio P=C3=A9rez (21):
> > > >    virtio-net: Expose ctrl virtqueue logic
> > > >    vhost: Add custom used buffer callback
> > > >    vdpa: control virtqueue support on shadow virtqueue
> > > >    virtio: Make virtqueue_alloc_element non-static
> > > >    vhost: Add vhost_iova_tree_find
> > > >    vdpa: Add map/unmap operation callback to SVQ
> > > >    vhost: move descriptor translation to vhost_svq_vring_write_desc=
s
> > > >    vhost: Add SVQElement
> > > >    vhost: Add svq copy desc mode
> > > >    vhost: Add vhost_svq_inject
> > > >    vhost: Update kernel headers
> > > >    vdpa: delay set_vring_ready after DRIVER_OK
> > > >    vhost: Add ShadowVirtQueueStart operation
> > > >    vhost: Make possible to check for device exclusive vq group
> > > >    vhost: add vhost_svq_poll
> > > >    vdpa: Add vhost_vdpa_start_control_svq
> > > >    vdpa: Add asid attribute to vdpa device
> > > >    vdpa: Extract get features part from vhost_vdpa_get_max_queue_pa=
irs
> > > >    vhost: Add reference counting to vhost_iova_tree
> > > >    vdpa: Add x-svq to NetdevVhostVDPAOptions
> > > >    vdpa: Add x-cvq-svq
> > > >
> > > >   qapi/net.json                                |  13 +-
> > > >   hw/virtio/vhost-iova-tree.h                  |   7 +-
> > > >   hw/virtio/vhost-shadow-virtqueue.h           |  61 ++-
> > > >   include/hw/virtio/vhost-vdpa.h               |   3 +
> > > >   include/hw/virtio/vhost.h                    |   3 +
> > > >   include/hw/virtio/virtio-net.h               |   4 +
> > > >   include/hw/virtio/virtio.h                   |   1 +
> > > >   include/standard-headers/linux/vhost_types.h |  11 +-
> > > >   linux-headers/linux/vhost.h                  |  25 +-
> > > >   hw/net/vhost_net.c                           |   5 +-
> > > >   hw/net/virtio-net.c                          |  84 +++--
> > > >   hw/virtio/vhost-iova-tree.c                  |  35 +-
> > > >   hw/virtio/vhost-shadow-virtqueue.c           | 378 ++++++++++++++=
++---
> > > >   hw/virtio/vhost-vdpa.c                       | 206 +++++++++-
> > > >   hw/virtio/virtio.c                           |   2 +-
> > > >   net/vhost-vdpa.c                             | 294 ++++++++++++++=
-
> > > >   hw/virtio/trace-events                       |  10 +-
> > > >   17 files changed, 1012 insertions(+), 130 deletions(-)
> > > >
> > >
>


