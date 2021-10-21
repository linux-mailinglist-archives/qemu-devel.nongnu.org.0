Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F4435CBB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 10:14:26 +0200 (CEST)
Received: from localhost ([::1]:52638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdTDV-0003db-FZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 04:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mdTBW-0002Se-Ex
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:12:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mdTBS-0002z9-4A
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:12:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634803936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=471735USZlz/g8J1PakqvbU/oTW4yDGXODD8VOlK93A=;
 b=EYZyKBo075ITFwakgZQXJn5N6C4SRMY0gZGTbBcW2i9p4ZPXSOPlPNQD2ANy3J14vqWIPs
 MXrHEArozfWGrRIInuWij0955V/uIq8/a1ML0s859JuA8443wLnhaHO3BWIMmQVjTCznPe
 X67aldTqeLg7wwMmLEjfhO7rd1peQdw=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-Bbcc83vXM3e2rgZt0Vka5Q-1; Thu, 21 Oct 2021 04:12:13 -0400
X-MC-Unique: Bbcc83vXM3e2rgZt0Vka5Q-1
Received: by mail-lf1-f69.google.com with SMTP id
 k8-20020a0565123d8800b003fd6e160c77so4309578lfv.17
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 01:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=471735USZlz/g8J1PakqvbU/oTW4yDGXODD8VOlK93A=;
 b=kHszTu3TyHH+OfKPgtsPnRx2arntJShuYn4wWRlXrR2qoGsPxQnClx8BUlXkFVdd70
 tSQ4CzJZkHbs0YPBfW8XtToAbD3GpssVRNTrYawR1QuKF5CBActkdVcS57K2D7sKUB0V
 /kxR5Ba/sR4skLaTDl3E/0etIKhoBltWU7h3yUjjLVU7fjdgyYxJfWM6p2bSF8aHoldZ
 +cpw00czIxhGObBiPd4vX7L9fs7IGeLj5nc1Q1tNX9Ayu3iO60Lfw2uftCfzextGHIv6
 MyFEa8WpJjEL5V5xr/kNXamFJ462aqXaNaRbNTG2YChwTiKYfDRKGBsRs+TPEdo2eOPG
 1lBA==
X-Gm-Message-State: AOAM533LVC/HgB4P8ygdVu33cIkEGxzM4qlzlTFHOOMU9PgOnZre633V
 Flmfwy/78KafCc4Oo3liv4RFdRO6hzETN62L2Lb7Lbpag62Q4qwp10SJyBVVgoxIu+zjDCzS+HU
 5ieM1F/vBq3VEEkYP06BgtA7ycgkhckE=
X-Received: by 2002:a05:6512:3d29:: with SMTP id
 d41mr4276887lfv.481.1634803931610; 
 Thu, 21 Oct 2021 01:12:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNg2ECTidhPO9at7CxtTZSTYn/GjP1WQxkqB+2C7tAG6XB+5NHSCojB0zzegStjLabtnxa5iymNOauVgIIP7k=
X-Received: by 2002:a05:6512:3d29:: with SMTP id
 d41mr4276861lfv.481.1634803931242; 
 Thu, 21 Oct 2021 01:12:11 -0700 (PDT)
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
In-Reply-To: <CAJaqyWeqK1tyHXuVub0G34s=tVPV9fq5BC7g5-Db4HAcZzyOTw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 21 Oct 2021 16:12:00 +0800
Message-ID: <CACGkMEuSCSaF4LDUe+X+KFuxGupYDUuNTO=FQUo5oir9pM=b8w@mail.gmail.com>
Subject: Re: [RFC PATCH v4 18/20] vhost: Add VhostIOVATree
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Thu, Oct 21, 2021 at 3:03 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Thu, Oct 21, 2021 at 4:34 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Oct 20, 2021 at 8:07 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Wed, Oct 20, 2021 at 11:01 AM Jason Wang <jasowang@redhat.com> wro=
te:
> > > >
> > > > On Wed, Oct 20, 2021 at 3:54 PM Eugenio Perez Martin
> > > > <eperezma@redhat.com> wrote:
> > > > >
> > > > > On Tue, Oct 19, 2021 at 11:23 AM Jason Wang <jasowang@redhat.com>=
 wrote:
> > > > > >
> > > > > > On Tue, Oct 19, 2021 at 4:32 PM Jason Wang <jasowang@redhat.com=
> wrote:
> > > > > > >
> > > > > > >
> > > > > > > =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9re=
z =E5=86=99=E9=81=93:
> > > > > > > > This tree is able to look for a translated address from an =
IOVA address.
> > > > > > > >
> > > > > > > > At first glance is similar to util/iova-tree. However, SVQ =
working on
> > > > > > > > devices with limited IOVA space need more capabilities, lik=
e allocating
> > > > > > > > IOVA chunks or perform reverse translations (qemu addresses=
 to iova).
> > > > > > >
> > > > > > >
> > > > > > > I don't see any reverse translation is used in the shadow cod=
e. Or
> > > > > > > anything I missed?
> > > > > >
> > > > > > Ok, it looks to me that it is used in the iova allocator. But I=
 think
> > > > > > it's better to decouple it to an independent allocator instead =
of
> > > > > > vhost iova tree.
> > > > > >
> > > > >
> > > > > Reverse translation is used every time a buffer is made available=
,
> > > > > since buffers content are not copied, only the descriptors to SVQ
> > > > > vring.
> > > >
> > > > I may miss something but I didn't see the code? Qemu knows the VA o=
f
> > > > virtqueue, and the VA of the VQ is stored in the VirtQueueElem?
> > > >
> > >
> > > It's used in the patch 20/20, could that be the misunderstanding? The
> > > function calling it is vhost_svq_translate_addr.
> > >
> > > Qemu knows the VA address of the buffer, but it must offer a valid SV=
Q
> > > iova to the device. That is the translation I mean.
> >
> > Ok, I get you. So if I understand correctly, what you did is:
> >
> > 1) allocate IOVA during region_add
> > 2) preform VA->IOVA reverse lookup in handle_kick
> >
> > This should be fine, but here're some suggestions:
> >
> > 1) remove the assert(map) in vhost_svq_translate_addr() since guest
> > can add e.g BAR address
>
> Wouldn't VirtQueue block them in virtqueue_pop / address_space_read_*
> functions? I'm fine to remove it but I would say it adds value against
> coding error.

I think not. Though these addresses were excluded in
vhost_vdpa_listener_skipped_section(). For Qemu memory core, they are
valid addresses. Qemu emulate how hardware work (e.g pci p2p), so dma
to bar is allowed.

>
> > 2) we probably need a better name vhost_iova_tree_alloc(), maybe
> > "vhost_iova_tree_map_alloc()"
> >
>
> Ok I will change for the next version.
>
> > There's actually another method.
> >
> > 1) don't do IOVA/map allocation in region_add()
> > 2) do the allocation in handle_kick(), then we know the IOVA so no
> > reverse lookup
> >
> > The advantage is that this can work for the case of vIOMMU. And they
> > should perform the same:
> >
> > 1) you method avoid the iova allocation per sg
> > 2) my method avoid the reverse lookup per sg
> >
>
> It's somehow doable, but we are replacing a tree search with a linear
> insertion at this moment.
>
> I would say that guest's IOVA -> qemu vaddr part works with no change
> for vIOMMU, since VirtQueue's virtqueue_pop already gives us the vaddr
> even in the case of vIOMMU.

So in this case:

1) listener gives us GPA->host IOVA (host IOVA is allocated per GPA)
2) virtqueue_pop gives us guest IOVA -> VA

We still need extra logic to lookup the vIOMMU to get the guest IOVA
-> GPA then we can know the host IOVA.

If we allocate after virtqueue_pop(), we can follow the same logic as
without vIOMMU. Just allocate an host IOVA then all is done.

> The only change I would add for that case
> is the SVQ -> device map/unmapping part, so the device cannot access
> random addresses but only the exposed ones. I'm assuming that part is
> O(1).
>
> This way, we already have a tree with all the possible guest's
> addresses, and we only need to look for it's SVQ iova -> vaddr
> translation. This is a O(log(N)) operation,

Yes, but it's requires traverse the vIOMMU page table which should be
slower than our own iova tree?

> and read only, so it's
> easily parallelizable when we make each SVQ in it's own thread (if
> needed).

Yes, this is because the host IOVA was allocated before by the memory liste=
ner.

> The only thing left is to expose that with an iommu miss
> (O(1)) and unmap it on used buffers processing (also O(1)). The
> domination operation keeps being VirtQueue's own code lookup for
> guest's IOVA -> GPA, which I'm assuming is already well optimized and
> will benefit from future optimizations since qemu's memory system is
> frequently used.
>
> To optimize your use case we would need to add a custom (and smarter
> than the currently used) allocator to SVQ. I've been looking for ways
> to reuse glibc or similar in our own arenas but with no luck. It will
> be code that SVQ needs to maintain by and for itself anyway.

The benefit is to have separate iova allocation from the tree.

>
> In either case it should not be hard to switch to your method, just a
> few call changes in the future, if we achieve a faster allocator.
>
> Would that make sense?

Yes, feel free to choose any method you wish or feel simpler in the next se=
ries.

>
> > >
> > > > >
> > > > > At this point all the limits are copied to vhost iova tree in the=
 next
> > > > > revision I will send, defined at its creation at
> > > > > vhost_iova_tree_new(). They are outside of util/iova-tree, only s=
ent
> > > > > to the latter at allocation time.
> > > > >
> > > > > Since vhost_iova_tree has its own vhost_iova_tree_alloc(), that w=
raps
> > > > > the iova_tree_alloc() [1], limits could be kept in vhost-vdpa and=
 make
> > > > > them an argument of vhost_iova_tree_alloc. But I'm not sure if it=
's
> > > > > what you are proposing or I'm missing something.
> > > >
> > > > If the reverse translation is only used in iova allocation, I meant=
 to
> > > > split the logic of IOVA allocation itself.
> > > >
> > >
> > > Still don't understand it, sorry :). In SVQ setup we allocate an iova
> > > address for every guest's GPA address its driver can use. After that
> > > there should be no allocation unless memory is hotplugged.
> > >
> > > So the limits are only needed precisely at allocation time. Not sure
> > > if that is what you mean here, but to first allocate and then check i=
f
> > > it is within the range could lead to false negatives, since there
> > > could be a valid range *in* the address but the iova allocator
> > > returned us another range that fell outside the range. How could we
> > > know the cause if it is not using the range itself?
> >
> > See my above reply. And we can teach the iova allocator to return the
> > IOVA in the range that vhost-vDPA supports.
> >
>
> Ok,
>
> For the next series it will be that way. I'm pretty sure we are
> aligned in this part, but the lack of code in this series makes it
> very hard to discuss it :).

Fine. Let's see.

Thanks

>
> Thanks!
>
> > Thanks
> >
> > >
> > > > >
> > > > > Either way, I think it is harder to talk about this specific case
> > > > > without code, since this one still does not address the limits. W=
ould
> > > > > you prefer me to send another RFC in WIP quality, with *not* all
> > > > > comments addressed? I would say that there is not a lot of pendin=
g
> > > > > work to send the next one, but it might be easier for all of us.
> > > >
> > > > I'd prefer to try to address them all, otherwise it's not easy to s=
ee
> > > > what is missing.
> > > >
> > >
> > > Got it, I will do it that way then!
> > >
> > > Thanks!
> > >
> > > > Thanks
> > > >
> > > > >
> > > > > Thanks!
> > > > >
> > > > > [1] This util/iova-tree method will be proposed in the next serie=
s,
> > > > > and vhost_iova_tree wraps it since it needs to keep in sync both
> > > > > trees: iova->qemu vaddr for iova allocation and the reverse one t=
o
> > > > > translate available buffers.
> > > > >
> > > > > > Thanks
> > > > > >
> > > > >
> > > >
> > >
> >
>


