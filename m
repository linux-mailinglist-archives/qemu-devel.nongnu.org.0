Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326CF3991F7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:53:48 +0200 (CEST)
Received: from localhost ([::1]:55686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loV3r-0007Zs-9q
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1loV2X-0005K3-Tb
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:52:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1loV2W-0001Te-8N
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622656343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mY/QN8qQJ4iisNz3w/uF2nEXM8rzTTVyrHWBOfpsBw=;
 b=O7vX2PunrLu8f/HDBitd+P4wrpKNt9CmOk/7+kM5QlMfOPDipk5ZxT9EkAZWtAlX/RLTIy
 53mUFVLhgqFrsG0f3PG4aYiJ2x/LoMsinGRzlVVizppr/tgFRs6ePt4qouzkfpVgZUa4zK
 oSpVvd/oASXVg12pm/Z61CZvBRgeLVo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-7imbS_wCPHG8lRrA5CeONw-1; Wed, 02 Jun 2021 13:52:22 -0400
X-MC-Unique: 7imbS_wCPHG8lRrA5CeONw-1
Received: by mail-qk1-f197.google.com with SMTP id
 y5-20020a37af050000b02903a9c3f8b89fso2112057qke.2
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 10:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5mY/QN8qQJ4iisNz3w/uF2nEXM8rzTTVyrHWBOfpsBw=;
 b=faS3Fbh64XYs+kjdnz6nePXSz7HhyoXsuv/vfQ/ihGziWfJHMFWqI29+NKcasHtRSf
 AxqUA4Kr2iGDqVWA1tDAezcOAh/VC8xJCrd42WhAOFvtNWCCJOycWoSwwRcq30cVfWkn
 xsVBZPuUsgZZiLluPc4mq5Sz0OdXaLUNuiehJNt74B6iyN4/tgaKq/VR6KpiR3TSlebt
 XfqAlj8+MjXDgnqjjLnYFduyAvo5TD1gD/Fq/JFYd1GXJ+C1ZSSLv9HfphWIiRDmN8JU
 ImdRkPZFXjmJHaa9LITiamcllAoWmAexE1PEqeAuHDMHBZEQYsJcvcKOa7XERI4y0rDw
 +w/A==
X-Gm-Message-State: AOAM530HXsfuQFqXQUJyg1LBdIKqCaTslVfcGrCSvVjTGzrjkLJ72Vs9
 yIDDPAMTC6sv3Q3Ik+rMCi98yqO9HdijSdQj+heozkRumAGyC54CpTu+hIKPeM6jYn7OL0upMzH
 1eMJOlp7k5uqJe4Ep5/ekgEpDjFTyGIA=
X-Received: by 2002:ad4:4e47:: with SMTP id eb7mr6727825qvb.40.1622656341909; 
 Wed, 02 Jun 2021 10:52:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+bhf1O547JpLMGQ/axoL8DR+/r3Tak0UZKjplLdFJ1XoVezPANHBOfdnLaPkucYVsyEtTmpd1cgMe2Sp7tWM=
X-Received: by 2002:ad4:4e47:: with SMTP id eb7mr6727804qvb.40.1622656341678; 
 Wed, 02 Jun 2021 10:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-26-eperezma@redhat.com>
 <ae560866-4598-3157-a0cb-e0e79b4dca42@redhat.com>
In-Reply-To: <ae560866-4598-3157-a0cb-e0e79b4dca42@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 2 Jun 2021 19:51:45 +0200
Message-ID: <CAJaqyWc7OWeQnXHihY=mYp=N+rRJLcbFUsJA-OszD6tyr6v-FQ@mail.gmail.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

On Wed, Jun 2, 2021 at 11:52 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/5/20 =E4=B8=8A=E5=8D=8812:28, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Use translations added in IOVAReverseMaps in SVQ if the vhost device
> > does not support the mapping of the full qemu's virtual address space.
> > In other cases, Shadow Virtqueue still uses the qemu's virtual address
> > of the buffer pointed by the descriptor, which has been translated
> > already by qemu's VirtQueue machinery.
>
>
> I'd say let stick to a single kind of translation (iova allocator) that
> works for all the cases first and add optimizations on top.
>

Ok, I will start from here for the next revision.

>
> >
> > Now every element needs to store the previous address also, so VirtQueu=
e
> > can consume the elements properly. This adds a little overhead per VQ
> > element, having to allocate more memory to stash them. As a possible
> > optimization, this allocation could be avoided if the descriptor is not
> > a chain but a single one, but this is left undone.
> >
> > Checking also for vhost_set_iotlb_callback to send used ring remapping.
> > This is only needed for kernel, and would print an error in case of
> > vhost devices with its own mapping (vdpa).
> >
> > This could change for other callback, like checking for
> > vhost_force_iommu, enable_custom_iommu, or another. Another option coul=
d
> > be to, at least, extract the check of "is map(used, writable) needed?"
> > in another function. But at the moment just copy the check used in
> > vhost_dev_start here.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.c | 134 ++++++++++++++++++++++++++--=
-
> >   hw/virtio/vhost.c                  |  29 +++++--
> >   2 files changed, 145 insertions(+), 18 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 934d3bb27b..a92da979d1 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -10,12 +10,19 @@
> >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> >   #include "hw/virtio/vhost.h"
> >   #include "hw/virtio/virtio-access.h"
> > +#include "hw/virtio/vhost-iova-tree.h"
> >
> >   #include "standard-headers/linux/vhost_types.h"
> >
> >   #include "qemu/error-report.h"
> >   #include "qemu/main-loop.h"
> >
> > +typedef struct SVQElement {
> > +    VirtQueueElement elem;
> > +    void **in_sg_stash;
> > +    void **out_sg_stash;
>
>
> Any reason for the trick like this?
>
> Can we simply use iovec and iov_copy() here?
>

At the moment the device writes the buffer directly to the guest's
memory, and SVQ only translates the descriptor. In this scenario,
there would be no need for iov_copy, isn't it?

The reason for stash and unstash them was to allow the 1:1 mapping
with qemu memory and IOMMU and iova allocator to work with less
changes, In particular, the reason for unstash is that virtqueue_fill,
expects qemu pointers to set the guest memory page as dirty in
virtqueue_unmap_sg->dma_memory_unmap.

Now I think that just storing the iova address from the allocator in a
separated field and using a wrapper to get the IOVA addresses in SVQ
would be a better idea, so I would change to this if everyone agrees.

Thanks!

> Thanks
>
>


