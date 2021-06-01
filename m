Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E412C396E39
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 09:50:49 +0200 (CEST)
Received: from localhost ([::1]:55688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnzAk-0007TI-Sb
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 03:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lnz9n-0006nf-1J
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 03:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lnz9j-00045p-F1
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 03:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622533782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSDstF/MKIdl+qo8XRSc6uAnkXPkbkW8XERWyW4qWnw=;
 b=BqjCQaoSKwlAL2yVwC+YjV7yUGJhgPKZ7gYoBDcnlgPmyAMFiQQqTI1m9MoFTa92A5Y8Bq
 3Xb97u+ybVjBB12jKC/3mMpkWBo4axX34CcKXb9a/uKXuf7MQRLt79Dx+c+7DhTxMvG4Tr
 lZ8DQAUW1wFieiZJLsrWECdet/UuMmk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-n2fDWPiYN2a3aKi7Px7wUw-1; Tue, 01 Jun 2021 03:49:39 -0400
X-MC-Unique: n2fDWPiYN2a3aKi7Px7wUw-1
Received: by mail-qv1-f71.google.com with SMTP id
 h10-20020a0cab0a0000b029020282c64ecfso10841589qvb.19
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 00:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rSDstF/MKIdl+qo8XRSc6uAnkXPkbkW8XERWyW4qWnw=;
 b=qrdp9NZP9PLbNbrRigj1zXwkJFcJ3uut/k+aQQDk18Y25PmMMOuf8gy95/ZDnrfdIZ
 6uGXrMwIOFWDWnQrj7deLjblf9w0Z/LNB1nIJSwILu0PnFKTHFlbpeewVNniPiwFOwh6
 O5HkSr33jvJcFx1iavJsJGobsRMkWhxrrW0jxmU69psZk/hICZ4vZxlI79ihW5Kllq4R
 /aYtVZEsTsMhRwQuyByZtvtK5j1blgagWle1GbXFHkIwR70Fl6CW+l8oos3G5h9dt2mc
 op0FvjjSY4/FNDWmT4odkiXRGXuqzme9OXrIEkzsGWJNqINbdH8gT5UCoyN7rGABBJmz
 AVTA==
X-Gm-Message-State: AOAM530PTZpZkKbJRhfgcJuU1jumsVv/iptInDO4AUdxHEtN2fvQAuji
 o+oLIj93JdFLh8hwzQ/TW/jvUk/+N/7h7K1keM/Qy//cU/BaLzKTcyzqXq5Fm5T3au2SWulhad8
 btUdRQp/j4B7rXk9/p7o2ICwYAi1vtRk=
X-Received: by 2002:a0c:f4ca:: with SMTP id o10mr21151034qvm.9.1622533778738; 
 Tue, 01 Jun 2021 00:49:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3niCVUVFgzemBipEmvyjkDC/KJL0CLAHtS3COBdIJfPnvrmRGQWIds7pRuGHHzxPkkfBOkUaBIPxAzupjI/M=
X-Received: by 2002:a0c:f4ca:: with SMTP id o10mr21151012qvm.9.1622533778538; 
 Tue, 01 Jun 2021 00:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-16-eperezma@redhat.com>
 <8ba8f8fa-cab8-24c6-5226-b5ae372cd84b@redhat.com>
In-Reply-To: <8ba8f8fa-cab8-24c6-5226-b5ae372cd84b@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Jun 2021 09:49:02 +0200
Message-ID: <CAJaqyWcS5VgO7uK+wU_ENPNd4RAJOLTZo3j3+2XvRfPaT-HoAQ@mail.gmail.com>
Subject: Re: [RFC v3 15/29] vhost: Add enable_custom_iommu to VhostOps
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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

On Mon, May 31, 2021 at 11:02 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/5/20 =E4=B8=8A=E5=8D=8812:28, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This operation enable the backend-specific IOTLB entries.
> >
> > If a backend support this, it start managing its own entries, and vhost
> > can disable it through this operation and recover control.
> >
> > Every enable/disable operation must also clear all IOTLB device entries=
.
> >
> > At the moment, the only backend that does so is vhost-vdpa. To fully
> > support these, vdpa needs also to expose a way for vhost subsystem to
> > map and unmap entries. This will be done in future commits.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
>
> I think there's probably no need to introduce this helper.
>
> Instead, we can introduce ops like shadow_vq_start()/stop(). Then the
> details like this could be hided there.
>

I'm also fine with your approach, but then the ownership of the shadow
virtqueue would be splitted between vhost code and the vhost backend
code.

With the current code, vhost is in charge for mapping DMA entries, and
delegates in the backend when the latter has its own means of map [1].
If we just expose shadow_vq_start/stop, the logic of when to map gets
somehow duplicated in vhost and in the backend, and it is not obvious
that future code changes in one side need to be duplicated in the
backend.

I understand that this way needs to expose more vhost operations, but
I think each of these are smaller and fit better in "vhost backend
implementation of an operation" than just telling the backend that
shadow vq is started.

> (And hide the backend deatils (avoid calling vhost_vdpa_dma_map())
> directly from the vhost.c)
>

Sure, the direct call of vhost_vdpa_dma_map is not intended to be that
way in the final series, it's just an intermediate step. I could have
been more explicit about that, sorry.

[1] At the moment it just calls vhost_vdpa_dma_map directly, but this
should be changed by a vhost_ops, and that op is optional: If not
present, vIOMMU is used.

> Thanks
>
>
> > ---
> >   include/hw/virtio/vhost-backend.h | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhos=
t-backend.h
> > index bcb112c166..f8eed2ace5 100644
> > --- a/include/hw/virtio/vhost-backend.h
> > +++ b/include/hw/virtio/vhost-backend.h
> > @@ -128,6 +128,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_d=
ev *dev);
> >
> >   typedef int (*vhost_vring_pause_op)(struct vhost_dev *dev);
> >
> > +typedef int (*vhost_enable_custom_iommu_op)(struct vhost_dev *dev,
> > +                                            bool enable);
> > +
> >   typedef int (*vhost_get_iova_range)(struct vhost_dev *dev,
> >                                       hwaddr *first, hwaddr *last);
> >
> > @@ -177,6 +180,7 @@ typedef struct VhostOps {
> >       vhost_get_device_id_op vhost_get_device_id;
> >       vhost_vring_pause_op vhost_vring_pause;
> >       vhost_force_iommu_op vhost_force_iommu;
> > +    vhost_enable_custom_iommu_op vhost_enable_custom_iommu;
> >       vhost_get_iova_range vhost_get_iova_range;
> >   } VhostOps;
> >
>


