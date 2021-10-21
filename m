Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BCE43646F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 16:37:04 +0200 (CEST)
Received: from localhost ([::1]:48538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZBm-00081d-V3
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 10:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mdZ97-0006yG-5L
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mdZ92-0002P6-Rn
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634826851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ouk2F/HKxGt1GVXNBAutxytiS4Dl7ApjUBowh8BRxpI=;
 b=ROF7xqkkXkzMVABIo9HQXDuDNAgpqqj0c3hJ1Vv5On2h4r7azqXBrQKRFD4xwqSL9kLop6
 /EfpsCBIyfdLtz+VEWlXN7aSFXMOhIyUPOPIiCrPVbLWTbzbKM5e12H6vpwRmR7qq2PifT
 HphPELDTfN9Fl1ZvUgC9RRmsxyARphQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-Zku5eKtvNTaA7osA-qZnGw-1; Thu, 21 Oct 2021 10:34:09 -0400
X-MC-Unique: Zku5eKtvNTaA7osA-qZnGw-1
Received: by mail-qt1-f197.google.com with SMTP id
 y25-20020ac87059000000b002a71d24c242so689954qtm.0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 07:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ouk2F/HKxGt1GVXNBAutxytiS4Dl7ApjUBowh8BRxpI=;
 b=wfhUx4PP1E56SyfFj1sSL370Vr9qWcJ9tqlN7wZE5pxjKDAnbmC3jVNm0xroqJFE/j
 Sf+ayvt+aslCqnuGX7FxXI4wSd0v71dEyKU6noMBqfD9Xg5DaDhJaiQc38fLIEbxCSeR
 YByl5gyH1L4f/bOhZ98dos8s11eQ1Xo6xaLXylmBcCgSJlNLkb8+M5fK55jQbmBMIJml
 VRYZZmuUgxIkbD6Qjx69IZwmgA3Ex+bf/KTmIUi/eJ0BaT4wfo/hDU8JujEwf6j3ds0I
 DooM7vZhxVQ9b0G5pn5EPDgoqpxSdMY54NhLZTz8X9IRFTVz1c5IFN7fQojrATvd04Ua
 XgYw==
X-Gm-Message-State: AOAM531vdZ1nWAXGNOeRt2PU+4Bz5GFm6IwOAaOiNDSpbBXo+MiIv/Dq
 akSGG4bouXGB0HeedmopaYEWVmDrRPcDxs1BL4DwP4GGIS80lC4LDjGiVxwrIOaxQT4eNHxgs/L
 nwnAzuECjFaHPNVxhPVTWzZyBzko95wY=
X-Received: by 2002:a05:6214:1911:: with SMTP id
 er17mr3078670qvb.37.1634826846093; 
 Thu, 21 Oct 2021 07:34:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvPQ1xS6reAajx0hq2oRDvKVIFkdIVzbjc9xuBbcOYoqAjkSBOcl8wsGL7eq0eKH31cQ59IwuQ+sZPxBsNp/M=
X-Received: by 2002:a05:6214:1911:: with SMTP id
 er17mr3078434qvb.37.1634826842880; 
 Thu, 21 Oct 2021 07:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-19-eperezma@redhat.com>
 <79905c11-e313-ad60-17dc-1a47d35f12cc@redhat.com>
 <CACGkMEtc6tw5xauzw=1zSFUfC0oSRfokZbA6QsR7nEe5T7-4_A@mail.gmail.com>
 <CAJaqyWfvT36tbnSRhMoQcWXCYhjdkaOs_E3yKisPhv-o0oajCQ@mail.gmail.com>
 <CACGkMEvHopK4akFLeg56qN35AnJUHURs2MnFNwLWtOTvJ643uA@mail.gmail.com>
 <CAJaqyWdK6ZWeB3r2bU9SthL2Z9qWPR++km5QAzD48XH3Srv8mA@mail.gmail.com>
 <CACGkMEtFirKqFvS_wWu65wEDecSYwBo6Ke_H9eKzv5OrJzkwrw@mail.gmail.com>
 <CAJaqyWeqK1tyHXuVub0G34s=tVPV9fq5BC7g5-Db4HAcZzyOTw@mail.gmail.com>
 <CACGkMEuSCSaF4LDUe+X+KFuxGupYDUuNTO=FQUo5oir9pM=b8w@mail.gmail.com>
In-Reply-To: <CACGkMEuSCSaF4LDUe+X+KFuxGupYDUuNTO=FQUo5oir9pM=b8w@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 21 Oct 2021 16:33:26 +0200
Message-ID: <CAJaqyWfuJUX3TMDeRxYVZDwU+iwPsNoaUtMwMedEbg1fYz8cSQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 18/20] vhost: Add VhostIOVATree
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 10:12 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Oct 21, 2021 at 3:03 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Thu, Oct 21, 2021 at 4:34 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Wed, Oct 20, 2021 at 8:07 PM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > On Wed, Oct 20, 2021 at 11:01 AM Jason Wang <jasowang@redhat.com> w=
rote:
> > > > >
> > > > > On Wed, Oct 20, 2021 at 3:54 PM Eugenio Perez Martin
> > > > > <eperezma@redhat.com> wrote:
> > > > > >
> > > > > > On Tue, Oct 19, 2021 at 11:23 AM Jason Wang <jasowang@redhat.co=
m> wrote:
> > > > > > >
> > > > > > > On Tue, Oct 19, 2021 at 4:32 PM Jason Wang <jasowang@redhat.c=
om> wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > > =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9=
rez =E5=86=99=E9=81=93:
> > > > > > > > > This tree is able to look for a translated address from a=
n IOVA address.
> > > > > > > > >
> > > > > > > > > At first glance is similar to util/iova-tree. However, SV=
Q working on
> > > > > > > > > devices with limited IOVA space need more capabilities, l=
ike allocating
> > > > > > > > > IOVA chunks or perform reverse translations (qemu address=
es to iova).
> > > > > > > >
> > > > > > > >
> > > > > > > > I don't see any reverse translation is used in the shadow c=
ode. Or
> > > > > > > > anything I missed?
> > > > > > >
> > > > > > > Ok, it looks to me that it is used in the iova allocator. But=
 I think
> > > > > > > it's better to decouple it to an independent allocator instea=
d of
> > > > > > > vhost iova tree.
> > > > > > >
> > > > > >
> > > > > > Reverse translation is used every time a buffer is made availab=
le,
> > > > > > since buffers content are not copied, only the descriptors to S=
VQ
> > > > > > vring.
> > > > >
> > > > > I may miss something but I didn't see the code? Qemu knows the VA=
 of
> > > > > virtqueue, and the VA of the VQ is stored in the VirtQueueElem?
> > > > >
> > > >
> > > > It's used in the patch 20/20, could that be the misunderstanding? T=
he
> > > > function calling it is vhost_svq_translate_addr.
> > > >
> > > > Qemu knows the VA address of the buffer, but it must offer a valid =
SVQ
> > > > iova to the device. That is the translation I mean.
> > >
> > > Ok, I get you. So if I understand correctly, what you did is:
> > >
> > > 1) allocate IOVA during region_add
> > > 2) preform VA->IOVA reverse lookup in handle_kick
> > >
> > > This should be fine, but here're some suggestions:
> > >
> > > 1) remove the assert(map) in vhost_svq_translate_addr() since guest
> > > can add e.g BAR address
> >
> > Wouldn't VirtQueue block them in virtqueue_pop / address_space_read_*
> > functions? I'm fine to remove it but I would say it adds value against
> > coding error.
>
> I think not. Though these addresses were excluded in
> vhost_vdpa_listener_skipped_section(). For Qemu memory core, they are
> valid addresses. Qemu emulate how hardware work (e.g pci p2p), so dma
> to bar is allowed.
>

Ok I will treat them as errors.

> >
> > > 2) we probably need a better name vhost_iova_tree_alloc(), maybe
> > > "vhost_iova_tree_map_alloc()"
> > >
> >
> > Ok I will change for the next version.
> >
> > > There's actually another method.
> > >
> > > 1) don't do IOVA/map allocation in region_add()
> > > 2) do the allocation in handle_kick(), then we know the IOVA so no
> > > reverse lookup
> > >
> > > The advantage is that this can work for the case of vIOMMU. And they
> > > should perform the same:
> > >
> > > 1) you method avoid the iova allocation per sg
> > > 2) my method avoid the reverse lookup per sg
> > >
> >
> > It's somehow doable, but we are replacing a tree search with a linear
> > insertion at this moment.
> >
> > I would say that guest's IOVA -> qemu vaddr part works with no change
> > for vIOMMU, since VirtQueue's virtqueue_pop already gives us the vaddr
> > even in the case of vIOMMU.
>
> So in this case:
>
> 1) listener gives us GPA->host IOVA (host IOVA is allocated per GPA)

Right, that was a miss from my side, I think I get your point way better no=
w.

So now vhost-iova-tree translates GPA -> host IOVA in vIOMMU case, and
it is updated at the same frequency than guest physical memory hotplug
/ unplug (little during migration, I guess). There are special entries
for SVQ vrings, that the tree does not map with GPA for obvious
reasons, and you cannot locate them when looking by GPA.

Let's assume too that only SVQ vrings have been sent as IOMMU / IOTLB
map, with the relation Host iova -> qemu's VA.

> 2) virtqueue_pop gives us guest IOVA -> VA
>
> We still need extra logic to lookup the vIOMMU to get the guest IOVA
> GPA then we can know the host IOVA.
>

That's somehow right, but I think this does not need to be *another*
search, insertion, etc. Please see below.

> If we allocate after virtqueue_pop(), we can follow the same logic as
> without vIOMMU. Just allocate an host IOVA then all is done.
>
> > The only change I would add for that case
> > is the SVQ -> device map/unmapping part, so the device cannot access
> > random addresses but only the exposed ones. I'm assuming that part is
> > O(1).
> >
> > This way, we already have a tree with all the possible guest's
> > addresses, and we only need to look for it's SVQ iova -> vaddr
> > translation. This is a O(log(N)) operation,
>
> Yes, but it's requires traverse the vIOMMU page table which should be
> slower than our own iova tree?
>

The lookup over vIOMMU is not needed (to perform twice), since
virtqueue_pop already do it. We already have that data here, just need
to extract it. Not saying that is complicated, just saying that I
didn't dedicate a lot of time to figure out how. The calltrace of it
is:

#0  address_space_translate_iommu
    (iommu_mr, xlat, plen_out, page_mask_out, is_write, is_mmio,
target_as, attrs) at ../softmmu/physmem.c:418
#1  flatview_do_translate
    (fv, addr, xlat, plen_out, page_mask_out, is_write, is_mmio,
target_as, attrs) at ../softmmu/physmem.c:505
#2  flatview_translate
    (fv, addr, xlat, plen, is_write, attrs) at ../softmmu/physmem.c:565
#3  address_space_map (as, addr, plen, is_write, attrs)
    at ../softmmu/physmem.c:3183
#4  dma_memory_map (as, addr, len, dir)
    at /home/qemu/svq/include/sysemu/dma.h:202
#5  virtqueue_map_desc
    (vdev, p_num_sg, addr, iov, max_num_sg, is_write, pa, sz) at
../hw/virtio/virtio.c:1314
#6  virtqueue_split_pop (vq, sz) at ../hw/virtio/virtio.c:1488

So with that GPA we can locate its correspond entry in the
vhost-iova-tree, in a read-only operation, O(log(N)). And element
address in qemu's va is not going to change until we mark it as used.

This process (all the stack call trace) needs to be serialized somehow
in qemu's memory system internals, I'm just assuming that it will be
faster than the one we can do in SVQ with little effort, and it will
help to reduce duplication. If is not the case, I think it is even
more beneficial to improve it, than to reinvent it in SVQ.

After that, an iommu map needs to be sent to the device, as (qemu's
iommu obtained from the tree, qemu's VA, length, ...). We may even
batch them. Another option is to wait for the miss(), but I think that
would be a waste of resources.

The reverse is also true with the unmapping: When we see an used
descriptor, IOTLB unmap(s) will be sent before send the descriptor to
guest as used.

> > and read only, so it's
> > easily parallelizable when we make each SVQ in it's own thread (if
> > needed).
>
> Yes, this is because the host IOVA was allocated before by the memory lis=
tener.
>

Right.

> > The only thing left is to expose that with an iommu miss
> > (O(1)) and unmap it on used buffers processing (also O(1)). The
> > domination operation keeps being VirtQueue's own code lookup for
> > guest's IOVA -> GPA, which I'm assuming is already well optimized and
> > will benefit from future optimizations since qemu's memory system is
> > frequently used.
> >
> > To optimize your use case we would need to add a custom (and smarter
> > than the currently used) allocator to SVQ. I've been looking for ways
> > to reuse glibc or similar in our own arenas but with no luck. It will
> > be code that SVQ needs to maintain by and for itself anyway.
>
> The benefit is to have separate iova allocation from the tree.
>
> >
> > In either case it should not be hard to switch to your method, just a
> > few call changes in the future, if we achieve a faster allocator.
> >
> > Would that make sense?
>
> Yes, feel free to choose any method you wish or feel simpler in the next =
series.
>
> >
> > > >
> > > > > >
> > > > > > At this point all the limits are copied to vhost iova tree in t=
he next
> > > > > > revision I will send, defined at its creation at
> > > > > > vhost_iova_tree_new(). They are outside of util/iova-tree, only=
 sent
> > > > > > to the latter at allocation time.
> > > > > >
> > > > > > Since vhost_iova_tree has its own vhost_iova_tree_alloc(), that=
 wraps
> > > > > > the iova_tree_alloc() [1], limits could be kept in vhost-vdpa a=
nd make
> > > > > > them an argument of vhost_iova_tree_alloc. But I'm not sure if =
it's
> > > > > > what you are proposing or I'm missing something.
> > > > >
> > > > > If the reverse translation is only used in iova allocation, I mea=
nt to
> > > > > split the logic of IOVA allocation itself.
> > > > >
> > > >
> > > > Still don't understand it, sorry :). In SVQ setup we allocate an io=
va
> > > > address for every guest's GPA address its driver can use. After tha=
t
> > > > there should be no allocation unless memory is hotplugged.
> > > >
> > > > So the limits are only needed precisely at allocation time. Not sur=
e
> > > > if that is what you mean here, but to first allocate and then check=
 if
> > > > it is within the range could lead to false negatives, since there
> > > > could be a valid range *in* the address but the iova allocator
> > > > returned us another range that fell outside the range. How could we
> > > > know the cause if it is not using the range itself?
> > >
> > > See my above reply. And we can teach the iova allocator to return the
> > > IOVA in the range that vhost-vDPA supports.
> > >
> >
> > Ok,
> >
> > For the next series it will be that way. I'm pretty sure we are
> > aligned in this part, but the lack of code in this series makes it
> > very hard to discuss it :).
>
> Fine. Let's see.
>
> Thanks
>
> >
> > Thanks!
> >
> > > Thanks
> > >
> > > >
> > > > > >
> > > > > > Either way, I think it is harder to talk about this specific ca=
se
> > > > > > without code, since this one still does not address the limits.=
 Would
> > > > > > you prefer me to send another RFC in WIP quality, with *not* al=
l
> > > > > > comments addressed? I would say that there is not a lot of pend=
ing
> > > > > > work to send the next one, but it might be easier for all of us=
.
> > > > >
> > > > > I'd prefer to try to address them all, otherwise it's not easy to=
 see
> > > > > what is missing.
> > > > >
> > > >
> > > > Got it, I will do it that way then!
> > > >
> > > > Thanks!
> > > >
> > > > > Thanks
> > > > >
> > > > > >
> > > > > > Thanks!
> > > > > >
> > > > > > [1] This util/iova-tree method will be proposed in the next ser=
ies,
> > > > > > and vhost_iova_tree wraps it since it needs to keep in sync bot=
h
> > > > > > trees: iova->qemu vaddr for iova allocation and the reverse one=
 to
> > > > > > translate available buffers.
> > > > > >
> > > > > > > Thanks
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
> >
>


