Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBF639B582
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 11:09:45 +0200 (CEST)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp5po-000248-NH
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 05:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lp5oe-0001CE-Aw
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 05:08:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lp5oZ-00054C-UV
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 05:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622797706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWHDjY1Tb/SObcrBR82cQ8DhE1k0VePqR0dWrT0cmAU=;
 b=HJAO6qPIW14oiLY8TLoAUPzpY/7g9+d1Yokcl/taRI1QsXokcXiUob2kxdSV94DmmPxuBp
 fP2FgM5WdlFozlqEt99VdanuvgVXMkcLi4f79OsqrVrSgOJ+5BoiPlmQWGilhjHa9F6EI7
 4x933kzGhti7nRgxhkq0zOsVf8ZXUH8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-8nCoq8H9Ot27vQOJg3-dhg-1; Fri, 04 Jun 2021 05:08:22 -0400
X-MC-Unique: 8nCoq8H9Ot27vQOJg3-dhg-1
Received: by mail-qk1-f197.google.com with SMTP id
 l6-20020a3770060000b02902fa5329f2b4so6081916qkc.18
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 02:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mWHDjY1Tb/SObcrBR82cQ8DhE1k0VePqR0dWrT0cmAU=;
 b=DVapnVQM55d4qQ4jYNZduiY2nPlrSNcXhykPC14AK8KheSpG/vSAy+618+QloC1BUe
 fKLWnydk8LPF64Y8Ys+FJvfz05j+YmUZ2eQxgU5oDJHVaAeT+qm0rgukU4F0t3AKbcNu
 B98viq/9YwojnP+/dzWAASyohk9LlIYdMAts2lV2Oydrq3XN7ITdDDtI1oEu+4vT+QrL
 SDtwcbb94T5TnTK1qqxMMmpA6umdjF2InYo05xNm/YOjtSIB9dSoReDwSczSra5zbUW7
 IvkbHeq18DEHaiRe+I5900L/QuOK5Gyw5VhJvlLforcZq8LRW5U4mNwoDrBgskAB1bX4
 zUFQ==
X-Gm-Message-State: AOAM532MfCxEX2uAEwoPdYuYUA8RFZlkVunxuBH1fqIGcPXfF4amqQy+
 o3caYlWIv3vhLvaDeHGYa3jvdxxuAzt5YD7miAPbuRn6tsI8AHIsiTKKVH7ZmNBRywc3oGbSfDs
 wvDbEabCckpwdNQrU5GAbAueIgOcZcYQ=
X-Received: by 2002:ad4:4e47:: with SMTP id eb7mr3533925qvb.40.1622797702121; 
 Fri, 04 Jun 2021 02:08:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBqrPbVIW9sKIDbCk4epPX5SZkvbzpBqdvWSL9X9YNWY3qFoPHK9qzVr5suxOaMc5c5Y8KrslJm76jNRmRohM=
X-Received: by 2002:ad4:4e47:: with SMTP id eb7mr3533906qvb.40.1622797701888; 
 Fri, 04 Jun 2021 02:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-26-eperezma@redhat.com>
 <ae560866-4598-3157-a0cb-e0e79b4dca42@redhat.com>
 <CAJaqyWc7OWeQnXHihY=mYp=N+rRJLcbFUsJA-OszD6tyr6v-FQ@mail.gmail.com>
 <316a88dc-2d78-e36b-50d7-d0243bceb898@redhat.com>
In-Reply-To: <316a88dc-2d78-e36b-50d7-d0243bceb898@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 4 Jun 2021 11:07:45 +0200
Message-ID: <CAJaqyWfHhiiktOw_zVJoT8MPA2_JpADN44fw+nZLLY4387kNHA@mail.gmail.com>
Subject: Re: [RFC v3 25/29] vhost: Add custom IOTLB translations to SVQ
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Harpreet Singh Anand <hanand@xilinx.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 3, 2021 at 5:39 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/6/3 =E4=B8=8A=E5=8D=881:51, Eugenio Perez Martin =E5=86=99=
=E9=81=93:
> > On Wed, Jun 2, 2021 at 11:52 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2021/5/20 =E4=B8=8A=E5=8D=8812:28, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> >>> Use translations added in IOVAReverseMaps in SVQ if the vhost device
> >>> does not support the mapping of the full qemu's virtual address space=
.
> >>> In other cases, Shadow Virtqueue still uses the qemu's virtual addres=
s
> >>> of the buffer pointed by the descriptor, which has been translated
> >>> already by qemu's VirtQueue machinery.
> >>
> >> I'd say let stick to a single kind of translation (iova allocator) tha=
t
> >> works for all the cases first and add optimizations on top.
> >>
> > Ok, I will start from here for the next revision.
> >
> >>> Now every element needs to store the previous address also, so VirtQu=
eue
> >>> can consume the elements properly. This adds a little overhead per VQ
> >>> element, having to allocate more memory to stash them. As a possible
> >>> optimization, this allocation could be avoided if the descriptor is n=
ot
> >>> a chain but a single one, but this is left undone.
> >>>
> >>> Checking also for vhost_set_iotlb_callback to send used ring remappin=
g.
> >>> This is only needed for kernel, and would print an error in case of
> >>> vhost devices with its own mapping (vdpa).
> >>>
> >>> This could change for other callback, like checking for
> >>> vhost_force_iommu, enable_custom_iommu, or another. Another option co=
uld
> >>> be to, at least, extract the check of "is map(used, writable) needed?=
"
> >>> in another function. But at the moment just copy the check used in
> >>> vhost_dev_start here.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    hw/virtio/vhost-shadow-virtqueue.c | 134 +++++++++++++++++++++++++=
+---
> >>>    hw/virtio/vhost.c                  |  29 +++++--
> >>>    2 files changed, 145 insertions(+), 18 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> >>> index 934d3bb27b..a92da979d1 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> >>> @@ -10,12 +10,19 @@
> >>>    #include "hw/virtio/vhost-shadow-virtqueue.h"
> >>>    #include "hw/virtio/vhost.h"
> >>>    #include "hw/virtio/virtio-access.h"
> >>> +#include "hw/virtio/vhost-iova-tree.h"
> >>>
> >>>    #include "standard-headers/linux/vhost_types.h"
> >>>
> >>>    #include "qemu/error-report.h"
> >>>    #include "qemu/main-loop.h"
> >>>
> >>> +typedef struct SVQElement {
> >>> +    VirtQueueElement elem;
> >>> +    void **in_sg_stash;
> >>> +    void **out_sg_stash;
> >>
> >> Any reason for the trick like this?
> >>
> >> Can we simply use iovec and iov_copy() here?
> >>
> > At the moment the device writes the buffer directly to the guest's
> > memory, and SVQ only translates the descriptor. In this scenario,
> > there would be no need for iov_copy, isn't it?
>
>
> It depends on which kinds of translation you used.
>
> If I read the code correctly, stash is used for storing HVAs after the
> HVA->IOVA translation.
>
> This looks exactly the work of iov (and do we guarantee the there will
> be a 1:1 translation?)
>
> And if the mapping is 1:1 you can simply use iov_copy().
>
> But this wont' be a option if we will always use iova allocator.
>

Right, the stash is only used in case of iova allocator. In case of
1:1 translation, svq->iova_map is never !NULL and _stash/_unstash
functions are never called.

And yes, I could have used iov_copy [1], but the check of overlapping
would have been unnecessary. It was like using memmove vs memset in my
head.

Thanks!

[1] I thought you meant iov_to_buf in your last mail, so please omit
the part of the buffer copy in my answer :).

>
> >
> > The reason for stash and unstash them was to allow the 1:1 mapping
> > with qemu memory and IOMMU and iova allocator to work with less
> > changes, In particular, the reason for unstash is that virtqueue_fill,
> > expects qemu pointers to set the guest memory page as dirty in
> > virtqueue_unmap_sg->dma_memory_unmap.
> >
> > Now I think that just storing the iova address from the allocator in a
> > separated field and using a wrapper to get the IOVA addresses in SVQ
> > would be a better idea, so I would change to this if everyone agrees.
>
>
> I agree.
>
> Thanks
>
>
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>
>


