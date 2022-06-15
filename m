Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F7A54BFFF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 05:08:15 +0200 (CEST)
Received: from localhost ([::1]:35414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1JOA-0006kV-Gj
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 23:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o1JKe-0004dS-4g
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 23:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o1JKZ-0005rF-JN
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 23:04:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655262270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuW3aNqJ2V/7lGZ48/PfvoE1AE+QzE5xf6TYhJ7+NNQ=;
 b=bM87EbSxBPUkDI4rOVISQTiLhZN2Q/5KFWuFLgtvz1DUTs3ltGrivhRuAAJnkYKUjHaugR
 3ia4LGisqGjhG235ZnsRqEVi9AMmtx33vi6Afook+aeC/Arp/96cSaVUqIaz03jHT5mVmz
 bZKghvnr+8khAT+ivCWvI2wPsB6VA8Y=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-c9rmg8UuPOyvuQQU3D8GmQ-1; Tue, 14 Jun 2022 23:04:27 -0400
X-MC-Unique: c9rmg8UuPOyvuQQU3D8GmQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 z23-20020a2e8857000000b00259ff472fc3so186668ljj.23
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 20:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kuW3aNqJ2V/7lGZ48/PfvoE1AE+QzE5xf6TYhJ7+NNQ=;
 b=XSqoYDvKj/a3IT8hw3Imhr4cnMxjdwJ+Oh8vRb0zZDhUo13l6CpIqPzkrj7Zr9o1Bf
 1dF9mwrTJFHNqi0W85lYBhMQfaTp10/xCLZ7DQO88Ht1zHj5ifhLrEbRUidpCUghUL2P
 p3KNBglKmcWphp6TUXmyBX1AFv2VljG8mtGGw9e5qfdUyHOqii8/TrakU0sertGnkTJS
 LTsozrErF3ye9WA2bMsE0AF1cLCXNxv3Ac42fY1yjHmbapnY58FDCY1EvoEHBXWYHTbe
 wlJYhj6P1Eyhmhccij1cM+B25fgAQbQWor/mHiw+e/oUucJKp4p02Ite82faoSpsJD79
 Yx2g==
X-Gm-Message-State: AJIora93gth35eDo4wRr/eyZTTX2OwgOfHRJREdd3izrJR0SgjcOazNh
 Ql2xJyEnJrlaJ/pLSxlXXM3yXFxM5drvPX4UoZECoSZCYyqLojW+fY3KdXinVaAxM54LP0t3Qad
 iL7Vr+PKh2Vv+GKWEiPgNh+bTDR8A75c=
X-Received: by 2002:a05:6512:a8f:b0:479:63e5:d59f with SMTP id
 m15-20020a0565120a8f00b0047963e5d59fmr4902616lfu.124.1655262265767; 
 Tue, 14 Jun 2022 20:04:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBwv/+um727fcWpTfj3UqXwQP5WfUZJDEu2isyHxIiQK4aA20NrM78lxS8ZOOz3y1Biy0pFCKJuca7oSWuO64=
X-Received: by 2002:a05:6512:a8f:b0:479:63e5:d59f with SMTP id
 m15-20020a0565120a8f00b0047963e5d59fmr4902593lfu.124.1655262265355; Tue, 14
 Jun 2022 20:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <d34131b7-4193-d82c-056f-23b9d99f897a@redhat.com>
 <CAJaqyWefgjYioDsV4jraPLah_Ty_RPRm9r3etVYEu5Dade9feg@mail.gmail.com>
 <CAJaqyWfy4f579a-pH2rPMB7KBrZ+iiNwuUEn2Y2TDoxPjD3VUQ@mail.gmail.com>
 <CACGkMEutyK2AXZ6uMg2nioXnJoaONkC7u1gGCuzJmuem_OsLLg@mail.gmail.com>
 <CAJaqyWeED1Q0XvrJ1gyYkZxSGXPdUXY+7+UCWAhpiJ+CEjC=WQ@mail.gmail.com>
 <CACGkMEtqNz8b6U6Fzqj5fft8Ax_Evu1=ptGyMs7ACM0OVybmdA@mail.gmail.com>
 <CAJaqyWdoGixF9-Vwfhti4aW8X-qpDma2wVBUrB7of7BxstwAQQ@mail.gmail.com>
In-Reply-To: <CAJaqyWdoGixF9-Vwfhti4aW8X-qpDma2wVBUrB7of7BxstwAQQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 15 Jun 2022 11:04:13 +0800
Message-ID: <CACGkMEtAExGWKrwmXFJXOCpaGdD3bvnHfbaAmKeco8ZrL4CYJQ@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 14, 2022 at 5:32 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Jun 14, 2022 at 10:20 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, Jun 14, 2022 at 4:14 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Tue, Jun 14, 2022 at 10:02 AM Jason Wang <jasowang@redhat.com> wro=
te:
> > > >
> > > > On Tue, Jun 14, 2022 at 12:32 AM Eugenio Perez Martin
> > > > <eperezma@redhat.com> wrote:
> > > > >
> > > > > On Wed, Jun 8, 2022 at 9:28 PM Eugenio Perez Martin <eperezma@red=
hat.com> wrote:
> > > > > >
> > > > > > On Wed, Jun 8, 2022 at 7:51 AM Jason Wang <jasowang@redhat.com>=
 wrote:
> > > > > > >
> > > > > > >
> > > > > > > =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=
=93:
> > > > > > > > Control virtqueue is used by networking device for acceptin=
g various
> > > > > > > > commands from the driver. It's a must to support multiqueue=
 and other
> > > > > > > > configurations.
> > > > > > > >
> > > > > > > > Shadow VirtQueue (SVQ) already makes possible migration of =
virtqueue
> > > > > > > > states, effectively intercepting them so qemu can track wha=
t regions of memory
> > > > > > > > are dirty because device action and needs migration. Howeve=
r, this does not
> > > > > > > > solve networking device state seen by the driver because CV=
Q messages, like
> > > > > > > > changes on MAC addresses from the driver.
> > > > > > > >
> > > > > > > > To solve that, this series uses SVQ infraestructure propose=
d to intercept
> > > > > > > > networking control messages used by the device. This way, q=
emu is able to
> > > > > > > > update VirtIONet device model and to migrate it.
> > > > > > > >
> > > > > > > > However, to intercept all queues would slow device data for=
warding. To solve
> > > > > > > > that, only the CVQ must be intercepted all the time. This i=
s achieved using
> > > > > > > > the ASID infraestructure, that allows different translation=
s for different
> > > > > > > > virtqueues. The most updated kernel part of ASID is propose=
d at [1].
> > > > > > > >
> > > > > > > > You can run qemu in two modes after applying this series: o=
nly intercepting
> > > > > > > > cvq with x-cvq-svq=3Don or intercept all the virtqueues add=
ing cmdline x-svq=3Don:
> > > > > > > >
> > > > > > > > -netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=
=3Dvhost-vdpa0,x-cvq-svq=3Don,x-svq=3Don
> > > > > > > >
> > > > > > > > First three patches enable the update of the virtio-net dev=
ice model for each
> > > > > > > > CVQ message acknoledged by the device.
> > > > > > > >
> > > > > > > > Patches from 5 to 9 enables individual SVQ to copy the buff=
ers to QEMU's VA.
> > > > > > > > This allows simplyfing the memory mapping, instead of map a=
ll the guest's
> > > > > > > > memory like in the data virtqueues.
> > > > > > > >
> > > > > > > > Patch 10 allows to inject control messages to the device. T=
his allows to set
> > > > > > > > state to the device both at QEMU startup and at live migrat=
ion destination. In
> > > > > > > > the future, this may also be used to emulate _F_ANNOUNCE.
> > > > > > > >
> > > > > > > > Patch 11 updates kernel headers, but it assign random numbe=
rs to needed ioctls
> > > > > > > > because they are still not accepted in the kernel.
> > > > > > > >
> > > > > > > > Patches 12-16 enables the set of the features of the net de=
vice model to the
> > > > > > > > vdpa device at device start.
> > > > > > > >
> > > > > > > > Last ones enables the sepparated ASID and SVQ.
> > > > > > > >
> > > > > > > > Comments are welcomed.
> > > > > > >
> > > > > > >
> > > > > > > As discussed, I think we need to split this huge series into =
smaller ones:
> > > > > > >
> > > > > > > 1) shadow CVQ only, this makes rx-filter-event work
> > > > > > > 2) ASID support for CVQ
> > > > > > >
> > > > > > > And for 1) we need consider whether or not it could be simpli=
fied.
> > > > > > >
> > > > > > > Or do it in reverse order, since if we do 1) first, we may ha=
ve security
> > > > > > > issues.
> > > > > > >
> > > > > >
> > > > > > I'm ok with both, but I also think 2) before 1) might make more=
 sense.
> > > > > > There is no way to only shadow CVQ otherwise ATM.
> > > > > >
> > > > >
> > > > > On second thought, that order is kind of harder.
> > > > >
> > > > > If we only map CVQ buffers, we need to either:
> > > > > a. Copy them to controlled buffers
> > > > > b. Track properly when to unmap them
> > > >
> > > > Just to make sure we're at the same page:
> > > >
> > > > I meant we can start with e.g having a dedicated ASID for CVQ but
> > > > still using CVQ passthrough.
> > > >
> > >
> > > That would imply duplicating all the memory listener updates to both
> > > ASIDs. That part of the code needs to be reverted. I'm ok with that,
> > > but I'm not sure if it's worth it to do it that way.
> >
> > I don't get why it is related to memory listeners. The only change is
> >
> > 1) read the groups
> > 2) set cvq to be an independent asid
> > 3) update CVQ's IOTLB with its own ASID
> >
>
> How to track the mappings of step 3) without a copy?

So let me try to explain, what I propose is to split the patches. So
the above could be the first part. Since we know:

1) CVQ is passthrough to guest right now
2) We know CVQ will use an independent ASID

It doesn't harm to implement those first. It's unrelated to the policy
(e.g how to shadow CVQ).

>
> If we don't copy the buffers to qemu's IOVA, we need to track when to
> unmap CVQ buffers memory. Many CVQ buffers could be in the same page,
> so we need to refcount them (or similar solution).

Can we use fixed mapping instead of the dynamic ones?

>
> This series copies the buffers to an independent buffer in qemu memory
> to avoid that. Once you copy them, we have the problem you point at
> some patch later: The guest control buffers, so qemu must understand
> CVQ so the guest cannot trick it. All of this is orthogonal to ASID.
> At that point, we have this series except for the asid part and the
> injection of CVQ buffers at the LM destination, isn't it?

So we have several stuffs:

1) ASID support
2) Shadow CVQ only
3) State restoring

I hope we can split them into independent series. If we want to shadow
CVQ first, we need to prove that it is safe without ASID.

>
> CVQ buffers can be copied in the qemu IOVA space and be offered to the
> device. Much like SVQ vrings, the copied buffers will not be
> accessible from the guest. The hw device (as "non emulated cvq") will
> receive a lot of dma updates, but it's temporary. We can add ASID on
> top of that as a mean to:
> - Not to SVQ data plane (fundamental to the intended use case of vdpa).
> - Not to pollute data plane DMA mappings.
>
> > ?
> >
> > >
> > > > Then do other stuff on top.
> > > >
> > > > >
> > > > > Alternative a. have the same problems exposed in this RFC: It's h=
ard
> > > > > (and unneeded in the final version) to know the size to copy.
> > > > > Alternative b. also requires things not needed in the final versi=
on,
> > > > > like to count the number of times each page is mapped and unmappe=
d.
> > > > >
> > > > > So I'll go to the first alternative, that is also the proposed or=
der
> > > > > of the RFC. What security issues do you expect beyond the comment=
s in
> > > > > this series?
> > > >
> > > > If we shadow CVQ without ASID. The guest may guess the IOVA of CVQ =
and
> > > > try to peek/modify it?
> > > >
> > >
> > > It works the same way as data vqs, we're just updating the device
> > > model in the middle. It should imply the exact same risk as updating
> > > an emulated NIC control plane (including vhost-kernel / vhost-user).
> >
> > Not sure I got you here. For vhost-kernel and vhost-user, CVQ's buffer
> > is owned by guests.
> >
>
> The same way they control the data plane when all data virtqueues are
> shadowed for dirty page tracking (more on the risk of qemu updating
> the device model below).

Ok.

>
> > But if we shadow CVQ without ASID, the CVQ buffer is owned by QEMU and
> > there's no way to prevent guests from accessing it?
> >
>
> With SVQ the memory exposed to the device is already shadowed. They
> cannot access the CVQ buffers memory the same way they cannot access
> the SVQ vrings.

Ok, I think I kind of get you, it looks like we have different
assumptions here: So if we only shadow CVQ, it will have security
issues, since RX/TX is not shadowed. If we shadow CVQ as well as
TX/RX, there's no security issue, since each IOVA is validated and the
descriptors are prepared by Qemu.

This goes back to another question, what's the order of the series.

Thanks


>
> > If in the case of vhost-kernel/vhost-user, there's a way for the guest
> > to exploit buffers owned by Qemu, it should be a bug.
> >
>
> The only extra step is the call to virtio_net_handle_ctrl_iov
> (extracted from virtio_net_handle_ctrl). If a guest can exploit that
> in SVQ mode, it can exploit it too with other vhost backends as far as
> I see.
>
> > Thanks
> >
> > >
> > > Roughly speaking, it's just to propose patches 01 to 03, with your
> > > comments. That already meets use cases like rx filter notifications
> > > for devices with only one ASID.
> > >
>
> This part of my mail is not correct, we need to add a few patches of
> this series on top :). If not, it would be exploitable.
>
> Thanks!
>
> > > Thanks!
> > >
> > > > Thanks
> > > >
> > > > >
> > > > > Thanks!
> > > > >
> > > > > > Can we do as with previous base SVQ patches? they were merged a=
lthough
> > > > > > there is still no way to enable SVQ.
> > > > > >
> > > > > > Thanks!
> > > > > >
> > > > > > > Thoughts?
> > > > > > >
> > > > > > > Thanks
> > > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > TODO:
> > > > > > > > * Fallback on regular CVQ if QEMU cannot isolate in its own=
 ASID by any
> > > > > > > >    reason, blocking migration. This is tricky, since it can=
 cause that the VM
> > > > > > > >    cannot be migrated anymore, so some way of block it must=
 be used.
> > > > > > > > * Review failure paths, some are with TODO notes, other don=
't.
> > > > > > > >
> > > > > > > > Changes from rfc v7:
> > > > > > > > * Don't map all guest space in ASID 1 but copy all the buff=
ers. No need for
> > > > > > > >    more memory listeners.
> > > > > > > > * Move net backend start callback to SVQ.
> > > > > > > > * Wait for device CVQ commands used by the device at SVQ st=
art, avoiding races.
> > > > > > > > * Changed ioctls, but they're provisional anyway.
> > > > > > > > * Reorder commits so refactor and code adding ones are clos=
er to usage.
> > > > > > > > * Usual cleaning: better tracing, doc, patches messages, ..=
.
> > > > > > > >
> > > > > > > > Changes from rfc v6:
> > > > > > > > * Fix bad iotlb updates order when batching was enabled
> > > > > > > > * Add reference counting to iova_tree so cleaning is simple=
r.
> > > > > > > >
> > > > > > > > Changes from rfc v5:
> > > > > > > > * Fixes bad calculus of cvq end group when MQ is not acked =
by the guest.
> > > > > > > >
> > > > > > > > Changes from rfc v4:
> > > > > > > > * Add missing tracing
> > > > > > > > * Add multiqueue support
> > > > > > > > * Use already sent version for replacing g_memdup
> > > > > > > > * Care with memory management
> > > > > > > >
> > > > > > > > Changes from rfc v3:
> > > > > > > > * Fix bad returning of descriptors to SVQ list.
> > > > > > > >
> > > > > > > > Changes from rfc v2:
> > > > > > > > * Fix use-after-free.
> > > > > > > >
> > > > > > > > Changes from rfc v1:
> > > > > > > > * Rebase to latest master.
> > > > > > > > * Configure ASID instead of assuming cvq asid !=3D data vqs=
 asid.
> > > > > > > > * Update device model so (MAC) state can be migrated too.
> > > > > > > >
> > > > > > > > [1] https://lkml.kernel.org/kvm/20220224212314.1326-1-gdawa=
r@xilinx.com/
> > > > > > > >
> > > > > > > > Eugenio P=C3=A9rez (21):
> > > > > > > >    virtio-net: Expose ctrl virtqueue logic
> > > > > > > >    vhost: Add custom used buffer callback
> > > > > > > >    vdpa: control virtqueue support on shadow virtqueue
> > > > > > > >    virtio: Make virtqueue_alloc_element non-static
> > > > > > > >    vhost: Add vhost_iova_tree_find
> > > > > > > >    vdpa: Add map/unmap operation callback to SVQ
> > > > > > > >    vhost: move descriptor translation to vhost_svq_vring_wr=
ite_descs
> > > > > > > >    vhost: Add SVQElement
> > > > > > > >    vhost: Add svq copy desc mode
> > > > > > > >    vhost: Add vhost_svq_inject
> > > > > > > >    vhost: Update kernel headers
> > > > > > > >    vdpa: delay set_vring_ready after DRIVER_OK
> > > > > > > >    vhost: Add ShadowVirtQueueStart operation
> > > > > > > >    vhost: Make possible to check for device exclusive vq gr=
oup
> > > > > > > >    vhost: add vhost_svq_poll
> > > > > > > >    vdpa: Add vhost_vdpa_start_control_svq
> > > > > > > >    vdpa: Add asid attribute to vdpa device
> > > > > > > >    vdpa: Extract get features part from vhost_vdpa_get_max_=
queue_pairs
> > > > > > > >    vhost: Add reference counting to vhost_iova_tree
> > > > > > > >    vdpa: Add x-svq to NetdevVhostVDPAOptions
> > > > > > > >    vdpa: Add x-cvq-svq
> > > > > > > >
> > > > > > > >   qapi/net.json                                |  13 +-
> > > > > > > >   hw/virtio/vhost-iova-tree.h                  |   7 +-
> > > > > > > >   hw/virtio/vhost-shadow-virtqueue.h           |  61 ++-
> > > > > > > >   include/hw/virtio/vhost-vdpa.h               |   3 +
> > > > > > > >   include/hw/virtio/vhost.h                    |   3 +
> > > > > > > >   include/hw/virtio/virtio-net.h               |   4 +
> > > > > > > >   include/hw/virtio/virtio.h                   |   1 +
> > > > > > > >   include/standard-headers/linux/vhost_types.h |  11 +-
> > > > > > > >   linux-headers/linux/vhost.h                  |  25 +-
> > > > > > > >   hw/net/vhost_net.c                           |   5 +-
> > > > > > > >   hw/net/virtio-net.c                          |  84 +++--
> > > > > > > >   hw/virtio/vhost-iova-tree.c                  |  35 +-
> > > > > > > >   hw/virtio/vhost-shadow-virtqueue.c           | 378 ++++++=
++++++++++---
> > > > > > > >   hw/virtio/vhost-vdpa.c                       | 206 ++++++=
+++-
> > > > > > > >   hw/virtio/virtio.c                           |   2 +-
> > > > > > > >   net/vhost-vdpa.c                             | 294 ++++++=
++++++++-
> > > > > > > >   hw/virtio/trace-events                       |  10 +-
> > > > > > > >   17 files changed, 1012 insertions(+), 130 deletions(-)
> > > > > > > >
> > > > > > >
> > > > >
> > > >
> > >
> >
>


