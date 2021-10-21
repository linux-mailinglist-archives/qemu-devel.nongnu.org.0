Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EF8435B51
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 09:07:02 +0200 (CEST)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdSAH-0006DZ-E1
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 03:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mdS7N-0004Z0-4d
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:04:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mdS7I-0002iX-3C
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634799833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0fT6QmXSKa/2SbZLULGP4b51pgE3O7bM/4K3VyoIQY4=;
 b=NnUcOQVHc3qnPEHzaf2OyT0h7Y/ANcJqF7SxJnQfnFLQfumCKMukPLzQ4bD3YhDGL5XQNO
 vCOQLMZkvi6r2GGSJOasgPHVUUMF3IUyn1Gm68r4vhZHFHJPZ89Jve4rlA086o+0nF5z+V
 TCPSBTjtLjJfg+ADluJ/z5gWLmkSHko=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-hpEum5YnOs6XJhSRG7p_mw-1; Thu, 21 Oct 2021 03:03:52 -0400
X-MC-Unique: hpEum5YnOs6XJhSRG7p_mw-1
Received: by mail-qt1-f200.google.com with SMTP id
 y25-20020ac87059000000b002a71d24c242so4026164qtm.0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 00:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0fT6QmXSKa/2SbZLULGP4b51pgE3O7bM/4K3VyoIQY4=;
 b=nwWfU1jihNGf3Mq3IKmB91cXKOgHd21kRh9xMkDKHaxUwCvUIuSQ3REdCCpFs03FZy
 AJ0/GCz6+WxSGs1AcCtHv70tI5wCfc/2YHDg2Gr+tb7/CmqApTmwcFO9Af2XGGy6xJvg
 /dBNzFbuVfRQi4xfMVfVV6+UDvphgSmAjchZeJAYT4wNaz2qEuY5AIWAmrPkvJjEGbeS
 MRyy156xvylZPlMvieg5HXNPWjb2MUr5MQBF/on9/Zle6Gqe1/TbuiBaE9/yNXKhre9L
 tZTBwlkekU3Oh3LNKCozivjhfKSEEzN40kEyy3djapf7ZCujYpsqe5mYxUxLa6zDMWac
 L95Q==
X-Gm-Message-State: AOAM531M+cOEXR794hdCQ0gd87DeGqjALRtM1ULXzGGDfY2hC7Miz5Lf
 Jcr536EJl0zKSCleDil5u5uoJGJoa696OGJcqop7H/ZHzqoRoLmpk2kFDDWSGjx1YwOVzO2gnTX
 FKPMoswkqNMBgYSTHttLMX5CEiliSe28=
X-Received: by 2002:a05:6214:1911:: with SMTP id
 er17mr1102501qvb.37.1634799831927; 
 Thu, 21 Oct 2021 00:03:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOl/uo8/rfd6H5MsYTNwsFpc9KpfZw+wOZ92iERxyLZIwiMyfb8f6LTDpZocm8tve48+3MAN4YQWS4erGqbpg=
X-Received: by 2002:a05:6214:1911:: with SMTP id
 er17mr1102483qvb.37.1634799831648; 
 Thu, 21 Oct 2021 00:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-19-eperezma@redhat.com>
 <79905c11-e313-ad60-17dc-1a47d35f12cc@redhat.com>
 <CACGkMEtc6tw5xauzw=1zSFUfC0oSRfokZbA6QsR7nEe5T7-4_A@mail.gmail.com>
 <CAJaqyWfvT36tbnSRhMoQcWXCYhjdkaOs_E3yKisPhv-o0oajCQ@mail.gmail.com>
 <CACGkMEvHopK4akFLeg56qN35AnJUHURs2MnFNwLWtOTvJ643uA@mail.gmail.com>
 <CAJaqyWdK6ZWeB3r2bU9SthL2Z9qWPR++km5QAzD48XH3Srv8mA@mail.gmail.com>
 <CACGkMEtFirKqFvS_wWu65wEDecSYwBo6Ke_H9eKzv5OrJzkwrw@mail.gmail.com>
In-Reply-To: <CACGkMEtFirKqFvS_wWu65wEDecSYwBo6Ke_H9eKzv5OrJzkwrw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 21 Oct 2021 09:03:15 +0200
Message-ID: <CAJaqyWeqK1tyHXuVub0G34s=tVPV9fq5BC7g5-Db4HAcZzyOTw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 18/20] vhost: Add VhostIOVATree
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
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

On Thu, Oct 21, 2021 at 4:34 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Oct 20, 2021 at 8:07 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Wed, Oct 20, 2021 at 11:01 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > >
> > > On Wed, Oct 20, 2021 at 3:54 PM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > On Tue, Oct 19, 2021 at 11:23 AM Jason Wang <jasowang@redhat.com> w=
rote:
> > > > >
> > > > > On Tue, Oct 19, 2021 at 4:32 PM Jason Wang <jasowang@redhat.com> =
wrote:
> > > > > >
> > > > > >
> > > > > > =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =
=E5=86=99=E9=81=93:
> > > > > > > This tree is able to look for a translated address from an IO=
VA address.
> > > > > > >
> > > > > > > At first glance is similar to util/iova-tree. However, SVQ wo=
rking on
> > > > > > > devices with limited IOVA space need more capabilities, like =
allocating
> > > > > > > IOVA chunks or perform reverse translations (qemu addresses t=
o iova).
> > > > > >
> > > > > >
> > > > > > I don't see any reverse translation is used in the shadow code.=
 Or
> > > > > > anything I missed?
> > > > >
> > > > > Ok, it looks to me that it is used in the iova allocator. But I t=
hink
> > > > > it's better to decouple it to an independent allocator instead of
> > > > > vhost iova tree.
> > > > >
> > > >
> > > > Reverse translation is used every time a buffer is made available,
> > > > since buffers content are not copied, only the descriptors to SVQ
> > > > vring.
> > >
> > > I may miss something but I didn't see the code? Qemu knows the VA of
> > > virtqueue, and the VA of the VQ is stored in the VirtQueueElem?
> > >
> >
> > It's used in the patch 20/20, could that be the misunderstanding? The
> > function calling it is vhost_svq_translate_addr.
> >
> > Qemu knows the VA address of the buffer, but it must offer a valid SVQ
> > iova to the device. That is the translation I mean.
>
> Ok, I get you. So if I understand correctly, what you did is:
>
> 1) allocate IOVA during region_add
> 2) preform VA->IOVA reverse lookup in handle_kick
>
> This should be fine, but here're some suggestions:
>
> 1) remove the assert(map) in vhost_svq_translate_addr() since guest
> can add e.g BAR address

Wouldn't VirtQueue block them in virtqueue_pop / address_space_read_*
functions? I'm fine to remove it but I would say it adds value against
coding error.

> 2) we probably need a better name vhost_iova_tree_alloc(), maybe
> "vhost_iova_tree_map_alloc()"
>

Ok I will change for the next version.

> There's actually another method.
>
> 1) don't do IOVA/map allocation in region_add()
> 2) do the allocation in handle_kick(), then we know the IOVA so no
> reverse lookup
>
> The advantage is that this can work for the case of vIOMMU. And they
> should perform the same:
>
> 1) you method avoid the iova allocation per sg
> 2) my method avoid the reverse lookup per sg
>

It's somehow doable, but we are replacing a tree search with a linear
insertion at this moment.

I would say that guest's IOVA -> qemu vaddr part works with no change
for vIOMMU, since VirtQueue's virtqueue_pop already gives us the vaddr
even in the case of vIOMMU. The only change I would add for that case
is the SVQ -> device map/unmapping part, so the device cannot access
random addresses but only the exposed ones. I'm assuming that part is
O(1).

This way, we already have a tree with all the possible guest's
addresses, and we only need to look for it's SVQ iova -> vaddr
translation. This is a O(log(N)) operation, and read only, so it's
easily parallelizable when we make each SVQ in it's own thread (if
needed). The only thing left is to expose that with an iommu miss
(O(1)) and unmap it on used buffers processing (also O(1)). The
domination operation keeps being VirtQueue's own code lookup for
guest's IOVA -> GPA, which I'm assuming is already well optimized and
will benefit from future optimizations since qemu's memory system is
frequently used.

To optimize your use case we would need to add a custom (and smarter
than the currently used) allocator to SVQ. I've been looking for ways
to reuse glibc or similar in our own arenas but with no luck. It will
be code that SVQ needs to maintain by and for itself anyway.

In either case it should not be hard to switch to your method, just a
few call changes in the future, if we achieve a faster allocator.

Would that make sense?

> >
> > > >
> > > > At this point all the limits are copied to vhost iova tree in the n=
ext
> > > > revision I will send, defined at its creation at
> > > > vhost_iova_tree_new(). They are outside of util/iova-tree, only sen=
t
> > > > to the latter at allocation time.
> > > >
> > > > Since vhost_iova_tree has its own vhost_iova_tree_alloc(), that wra=
ps
> > > > the iova_tree_alloc() [1], limits could be kept in vhost-vdpa and m=
ake
> > > > them an argument of vhost_iova_tree_alloc. But I'm not sure if it's
> > > > what you are proposing or I'm missing something.
> > >
> > > If the reverse translation is only used in iova allocation, I meant t=
o
> > > split the logic of IOVA allocation itself.
> > >
> >
> > Still don't understand it, sorry :). In SVQ setup we allocate an iova
> > address for every guest's GPA address its driver can use. After that
> > there should be no allocation unless memory is hotplugged.
> >
> > So the limits are only needed precisely at allocation time. Not sure
> > if that is what you mean here, but to first allocate and then check if
> > it is within the range could lead to false negatives, since there
> > could be a valid range *in* the address but the iova allocator
> > returned us another range that fell outside the range. How could we
> > know the cause if it is not using the range itself?
>
> See my above reply. And we can teach the iova allocator to return the
> IOVA in the range that vhost-vDPA supports.
>

Ok,

For the next series it will be that way. I'm pretty sure we are
aligned in this part, but the lack of code in this series makes it
very hard to discuss it :).

Thanks!

> Thanks
>
> >
> > > >
> > > > Either way, I think it is harder to talk about this specific case
> > > > without code, since this one still does not address the limits. Wou=
ld
> > > > you prefer me to send another RFC in WIP quality, with *not* all
> > > > comments addressed? I would say that there is not a lot of pending
> > > > work to send the next one, but it might be easier for all of us.
> > >
> > > I'd prefer to try to address them all, otherwise it's not easy to see
> > > what is missing.
> > >
> >
> > Got it, I will do it that way then!
> >
> > Thanks!
> >
> > > Thanks
> > >
> > > >
> > > > Thanks!
> > > >
> > > > [1] This util/iova-tree method will be proposed in the next series,
> > > > and vhost_iova_tree wraps it since it needs to keep in sync both
> > > > trees: iova->qemu vaddr for iova allocation and the reverse one to
> > > > translate available buffers.
> > > >
> > > > > Thanks
> > > > >
> > > >
> > >
> >
>


