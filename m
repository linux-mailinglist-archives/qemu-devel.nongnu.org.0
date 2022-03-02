Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2694B4CADBF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:41:38 +0100 (CET)
Received: from localhost ([::1]:33816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTur-0000gu-88
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:41:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPTdy-0007nX-8u
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:24:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPTdt-0004dL-C4
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lTmh3Kw86GRu9M4Y2BtlXUUljfEf93NHdXH9cARqWUM=;
 b=HHtnfnfrhMj7W+WGEUfyLOMZR5noKfeW1CUXWnlC3yplnooAtbm/IV5S+NJ7MiLek7bvnL
 K7e8jqRly3IzsjfhDPFojarSIm1z1zWZ5EJvwI50XFDs/Jm0UtQ2XLGRMhM8P/bZEeZ0kF
 sRYEnVmh9WUxQM1mc79iKQbUR4nmzNM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-1s5YJaf0MxO3B19fxsDTLg-1; Wed, 02 Mar 2022 13:24:02 -0500
X-MC-Unique: 1s5YJaf0MxO3B19fxsDTLg-1
Received: by mail-qk1-f199.google.com with SMTP id
 a15-20020a05620a066f00b0060c66d84489so1652500qkh.19
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lTmh3Kw86GRu9M4Y2BtlXUUljfEf93NHdXH9cARqWUM=;
 b=ngon4WVh2EwLPb/jjfBfKyW/eUTCQUvuGznK0e6YBdzAYsRlf2VdwgwDIUTawZjihw
 Oa0889A+VUY798QXDC+tUofhSg/t/CED1XUFQE+XOdAqsSk7roC3oizeCjsFAviTr/Gg
 1R+vZ41xq/SCC06ExWWWV4xHdXRfytkya7RsRcS4C2cIpfVFtWb8i2Eh0iSIuT10HehC
 BlzvS9124l/gwsK/pC9qGUz/mc1KwdT2axkg2DqUxUKegAWJuZzXKBcZzN0vMJfwxJTJ
 pG4aEtCENBY9ck+eZlr+hSAuZ3n69a5Govt9XojORBdk9YEKdpJzbvcsQ41L68UgQfIP
 xMjg==
X-Gm-Message-State: AOAM531S0yNiJJ6unWaYvQgsvd/JEpjFAM63c4Mc0VgSq4EP2iHsbG/A
 9EuCF6SY/n/8Js9T7yONHc2L6QjYw/y7xxAgT6a27okCoCZSpHQMqFjgKK2oTX7lzM+UJD4L+q5
 W48BfCR1bY0XndqcGUiSDwupwiNnKP8c=
X-Received: by 2002:a05:620a:807:b0:46c:e3c1:7241 with SMTP id
 s7-20020a05620a080700b0046ce3c17241mr16852222qks.764.1646245442164; 
 Wed, 02 Mar 2022 10:24:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhazlbWDU0tYvLCXfVwcknyHr2WsBdc7DsVcJhB2w00vEl/cUVwsqHBMxgf/OP/uq40QnoYLPI/yEmaUm7jDU=
X-Received: by 2002:a05:620a:807:b0:46c:e3c1:7241 with SMTP id
 s7-20020a05620a080700b0046ce3c17241mr16852184qks.764.1646245441663; Wed, 02
 Mar 2022 10:24:01 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-8-eperezma@redhat.com>
 <56fa64c3-416a-c748-4495-744b2f804aeb@redhat.com>
In-Reply-To: <56fa64c3-416a-c748-4495-744b2f804aeb@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 2 Mar 2022 19:23:25 +0100
Message-ID: <CAJaqyWe=hGmAvU_Fr34fecbF_7kUYqcm-EOdHJOo47TtddPwLw@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] vhost: Shadow virtqueue buffers forwarding
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 6:39 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:41, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Initial version of shadow virtqueue that actually forward buffers. Ther=
e
> > is no iommu support at the moment, and that will be addressed in future
> > patches of this series. Since all vhost-vdpa devices use forced IOMMU,
> > this means that SVQ is not usable at this point of the series on any
> > device.
> >
> > For simplicity it only supports modern devices, that expects vring
> > in little endian, with split ring and no event idx or indirect
> > descriptors. Support for them will not be added in this series.
> >
> > It reuses the VirtQueue code for the device part. The driver part is
> > based on Linux's virtio_ring driver, but with stripped functionality
> > and optimizations so it's easier to review.
> >
> > However, forwarding buffers have some particular pieces: One of the mos=
t
> > unexpected ones is that a guest's buffer can expand through more than
> > one descriptor in SVQ. While this is handled gracefully by qemu's
> > emulated virtio devices, it may cause unexpected SVQ queue full. This
> > patch also solves it by checking for this condition at both guest's
> > kicks and device's calls. The code may be more elegant in the future if
> > SVQ code runs in its own iocontext.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  29 +++
> >   hw/virtio/vhost-shadow-virtqueue.c | 360 ++++++++++++++++++++++++++++=
-
> >   hw/virtio/vhost-vdpa.c             | 165 ++++++++++++-
> >   3 files changed, 542 insertions(+), 12 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 3bbea77082..04c67685fd 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -36,6 +36,33 @@ typedef struct VhostShadowVirtqueue {
> >
> >       /* Guest's call notifier, where the SVQ calls guest. */
> >       EventNotifier svq_call;
> > +
> > +    /* Virtio queue shadowing */
> > +    VirtQueue *vq;
> > +
> > +    /* Virtio device */
> > +    VirtIODevice *vdev;
> > +
> > +    /* Map for use the guest's descriptors */
> > +    VirtQueueElement **ring_id_maps;
> > +
> > +    /* Next VirtQueue element that guest made available */
> > +    VirtQueueElement *next_guest_avail_elem;
> > +
> > +    /* Next head to expose to the device */
> > +    uint16_t avail_idx_shadow;
> > +
> > +    /* Next free descriptor */
> > +    uint16_t free_head;
> > +
> > +    /* Last seen used idx */
> > +    uint16_t shadow_used_idx;
>
>
> I suggest to have a consistent name for avail and used instead of using
> one "shadow" as prefix and other as suffix
>

Right, I'll fix that.

>
> > +
> > +    /* Next head to consume from the device */
> > +    uint16_t last_used_idx;
> > +
> > +    /* Cache for the exposed notification flag */
> > +    bool notification;
> >   } VhostShadowVirtqueue;
> >
> >   bool vhost_svq_valid_features(uint64_t *features);
> > @@ -47,6 +74,8 @@ void vhost_svq_get_vring_addr(const VhostShadowVirtqu=
eue *svq,
> >   size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq);
> >   size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
> >
> > +void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
> > +                     VirtQueue *vq);
> >   void vhost_svq_stop(VhostShadowVirtqueue *svq);
> >
> >   VhostShadowVirtqueue *vhost_svq_new(void);
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 2150e2b071..a38d313755 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -12,6 +12,7 @@
> >
> >   #include "qemu/error-report.h"
> >   #include "qemu/main-loop.h"
> > +#include "qemu/log.h"
> >   #include "linux-headers/linux/vhost.h"
> >
> >   /**
> > @@ -53,22 +54,309 @@ bool vhost_svq_valid_features(uint64_t *features)
> >       return r;
> >   }
> >
> > -/** Forward guest notifications */
> > -static void vhost_handle_guest_kick(EventNotifier *n)
> > +/**
> > + * Number of descriptors that the SVQ can make available from the gues=
t.
> > + *
> > + * @svq   The svq
>
>
> Btw, I notice most of function there will be a colon in the middle of
> the parameter and it's documentation.  Maybe we should follow that.
>

Sure, it seems I picked the uncommon template without realizing.


>
> > + */
> > +static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue *=
svq)
> > +{
> > +    return svq->vring.num - (svq->avail_idx_shadow - svq->shadow_used_=
idx);
> > +}
> > +
> > +static void vhost_svq_set_notification(VhostShadowVirtqueue *svq, bool=
 enable)
> > +{
> > +    uint16_t notification_flag;
> > +
> > +    if (svq->notification =3D=3D enable) {
> > +        return;
> > +    }
> > +
> > +    notification_flag =3D cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > +
> > +    svq->notification =3D enable;
> > +    if (enable) {
> > +        svq->vring.avail->flags &=3D ~notification_flag;
> > +    } else {
> > +        svq->vring.avail->flags |=3D notification_flag;
> > +        /* Make sure the flag is written before the read of used_idx *=
/
> > +        smp_mb();
>
>
> So the comment assumes that a reading of used_idx will come. This makes
> me wonder if we can simply split this function as:
>
> vhost_svq_disable_notification() and vhost_svq_enable_notification()
>
> and in the vhost_svq_enable_notification, we simply return
> vhost_svq_more_used() after smp_mb().
>
> (Not a must but just feel it might be more clear)
>

Ok, like kernel's virtio_ring.c I suppose.

>
> > +    }
> > +}
> > +
> > +static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
> > +                                    const struct iovec *iovec,
> > +                                    size_t num, bool more_descs, bool =
write)
> > +{
> > +    uint16_t i =3D svq->free_head, last =3D svq->free_head;
> > +    unsigned n;
> > +    uint16_t flags =3D write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
> > +    vring_desc_t *descs =3D svq->vring.desc;
> > +
> > +    if (num =3D=3D 0) {
> > +        return;
> > +    }
> > +
> > +    for (n =3D 0; n < num; n++) {
> > +        if (more_descs || (n + 1 < num)) {
> > +            descs[i].flags =3D flags | cpu_to_le16(VRING_DESC_F_NEXT);
> > +        } else {
> > +            descs[i].flags =3D flags;
> > +        }
> > +        descs[i].addr =3D cpu_to_le64((hwaddr)iovec[n].iov_base);
> > +        descs[i].len =3D cpu_to_le32(iovec[n].iov_len);
> > +
> > +        last =3D i;
> > +        i =3D cpu_to_le16(descs[i].next);
> > +    }
> > +
> > +    svq->free_head =3D le16_to_cpu(descs[last].next);
> > +}
> > +
> > +static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
> > +                                VirtQueueElement *elem,
> > +                                unsigned *head)
> > +{
> > +    unsigned avail_idx;
> > +    vring_avail_t *avail =3D svq->vring.avail;
> > +
> > +    *head =3D svq->free_head;
> > +
> > +    /* We need some descriptors here */
> > +    if (unlikely(!elem->out_num && !elem->in_num)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +            "Guest provided element with no descriptors");
> > +        return false;
> > +    }
> > +
> > +    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
> > +                            elem->in_num > 0, false);
> > +    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, tru=
e);
>
>
> I wonder instead of passing in/out separately and using the hint like
> more_descs, is it better to simply pass the elem to
> vhost_vrign_write_descs() then we know which one is the last that
> doesn't depend on more_descs.
>

I'm not sure I follow this.

The purpose of vhost_vring_write_descs is to abstract the writing of a
batch of descriptors, its chaining, etc. It accepts the write
parameter just for the write flag. If we make elem as a parameter, we
would need to duplicate that for loop for read and for write
descriptors, isn't it?

To duplicate the for loop is the way it is done in the kernel, but I
actually think the kernel could benefit from abstracting both in the
same function too. Please let me know if you think otherwise or I've
missed your point.

>
> > +
> > +    /*
> > +     * Put the entry in the available array (but don't update avail->i=
dx until
> > +     * they do sync).
> > +     */
> > +    avail_idx =3D svq->avail_idx_shadow & (svq->vring.num - 1);
> > +    avail->ring[avail_idx] =3D cpu_to_le16(*head);
> > +    svq->avail_idx_shadow++;
> > +
> > +    /* Update the avail index after write the descriptor */
> > +    smp_wmb();
> > +    avail->idx =3D cpu_to_le16(svq->avail_idx_shadow);
> > +
> > +    return true;
> > +}
> > +
> > +static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement =
*elem)
> > +{
> > +    unsigned qemu_head;
> > +    bool ok =3D vhost_svq_add_split(svq, elem, &qemu_head);
> > +    if (unlikely(!ok)) {
> > +        return false;
> > +    }
> > +
> > +    svq->ring_id_maps[qemu_head] =3D elem;
> > +    return true;
> > +}
> > +
> > +static void vhost_svq_kick(VhostShadowVirtqueue *svq)
> > +{
> > +    /*
> > +     * We need to expose the available array entries before checking t=
he used
> > +     * flags
> > +     */
> > +    smp_mb();
> > +    if (svq->vring.used->flags & VRING_USED_F_NO_NOTIFY) {
> > +        return;
> > +    }
> > +
> > +    event_notifier_set(&svq->hdev_kick);
> > +}
> > +
> > +/**
> > + * Forward available buffers.
> > + *
> > + * @svq Shadow VirtQueue
> > + *
> > + * Note that this function does not guarantee that all guest's availab=
le
> > + * buffers are available to the device in SVQ avail ring. The guest ma=
y have
> > + * exposed a GPA / GIOVA contiguous buffer, but it may not be contiguo=
us in
> > + * qemu vaddr.
> > + *
> > + * If that happens, guest's kick notifications will be disabled until =
the
> > + * device uses some buffers.
> > + */
> > +static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
> > +{
> > +    /* Clear event notifier */
> > +    event_notifier_test_and_clear(&svq->svq_kick);
> > +
> > +    /* Forward to the device as many available buffers as possible */
> > +    do {
> > +        virtio_queue_set_notification(svq->vq, false);
> > +
> > +        while (true) {
> > +            VirtQueueElement *elem;
> > +            bool ok;
> > +
> > +            if (svq->next_guest_avail_elem) {
> > +                elem =3D g_steal_pointer(&svq->next_guest_avail_elem);
> > +            } else {
> > +                elem =3D virtqueue_pop(svq->vq, sizeof(*elem));
> > +            }
> > +
> > +            if (!elem) {
> > +                break;
> > +            }
> > +
> > +            if (elem->out_num + elem->in_num >
> > +                vhost_svq_available_slots(svq)) {
> > +                /*
> > +                 * This condition is possible since a contiguous buffe=
r in GPA
> > +                 * does not imply a contiguous buffer in qemu's VA
> > +                 * scatter-gather segments. If that happens, the buffe=
r exposed
> > +                 * to the device needs to be a chain of descriptors at=
 this
> > +                 * moment.
> > +                 *
> > +                 * SVQ cannot hold more available buffers if we are he=
re:
> > +                 * queue the current guest descriptor and ignore furth=
er kicks
> > +                 * until some elements are used.
> > +                 */
> > +                svq->next_guest_avail_elem =3D elem;
> > +                return;
> > +            }
> > +
> > +            ok =3D vhost_svq_add(svq, elem);
> > +            if (unlikely(!ok)) {
> > +                /* VQ is broken, just return and ignore any other kick=
s */
> > +                return;
> > +            }
> > +            vhost_svq_kick(svq);
> > +        }
> > +
> > +        virtio_queue_set_notification(svq->vq, true);
> > +    } while (!virtio_queue_empty(svq->vq));
> > +}
> > +
> > +/**
> > + * Handle guest's kick.
> > + *
> > + * @n guest kick event notifier, the one that guest set to notify svq.
> > + */
> > +static void vhost_handle_guest_kick_notifier(EventNotifier *n)
> >   {
> >       VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueu=
e,
> >                                                svq_kick);
> >       event_notifier_test_and_clear(n);
> > -    event_notifier_set(&svq->hdev_kick);
> > +    vhost_handle_guest_kick(svq);
> > +}
> > +
> > +static bool vhost_svq_more_used(VhostShadowVirtqueue *svq)
> > +{
> > +    if (svq->last_used_idx !=3D svq->shadow_used_idx) {
> > +        return true;
> > +    }
> > +
> > +    svq->shadow_used_idx =3D cpu_to_le16(svq->vring.used->idx);
> > +
> > +    return svq->last_used_idx !=3D svq->shadow_used_idx;
> >   }
> >
> > -/* Forward vhost notifications */
> > +static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
> > +{
> > +    vring_desc_t *descs =3D svq->vring.desc;
> > +    const vring_used_t *used =3D svq->vring.used;
> > +    vring_used_elem_t used_elem;
> > +    uint16_t last_used;
> > +
> > +    if (!vhost_svq_more_used(svq)) {
> > +        return NULL;
> > +    }
> > +
> > +    /* Only get used array entries after they have been exposed by dev=
 */
> > +    smp_rmb();
> > +    last_used =3D svq->last_used_idx & (svq->vring.num - 1);
> > +    used_elem.id =3D le32_to_cpu(used->ring[last_used].id);
> > +    used_elem.len =3D le32_to_cpu(used->ring[last_used].len);
> > +
> > +    svq->last_used_idx++;
> > +    if (unlikely(used_elem.id >=3D svq->vring.num)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "Device %s says index %u is use=
d",
> > +                      svq->vdev->name, used_elem.id);
> > +        return NULL;
> > +    }
> > +
> > +    if (unlikely(!svq->ring_id_maps[used_elem.id])) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +            "Device %s says index %u is used, but it was not available=
",
> > +            svq->vdev->name, used_elem.id);
> > +        return NULL;
> > +    }
> > +
> > +    descs[used_elem.id].next =3D svq->free_head;
> > +    svq->free_head =3D used_elem.id;
> > +
> > +    svq->ring_id_maps[used_elem.id]->len =3D used_elem.len;
>
>
> It looks to me we'd better not modify the elem here, otherwise we may
> leak mapping during virtqueue_unmap_sg()?
>

Right, it's better to track it separately.

>
> > +    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
> > +}
> > +
> > +static void vhost_svq_flush(VhostShadowVirtqueue *svq,
> > +                            bool check_for_avail_queue)
> > +{
> > +    VirtQueue *vq =3D svq->vq;
> > +
> > +    /* Forward as many used buffers as possible. */
> > +    do {
> > +        unsigned i =3D 0;
> > +
> > +        vhost_svq_set_notification(svq, false);
> > +        while (true) {
> > +            g_autofree VirtQueueElement *elem =3D vhost_svq_get_buf(sv=
q);
> > +            if (!elem) {
> > +                break;
> > +            }
> > +
> > +            if (unlikely(i >=3D svq->vring.num)) {
> > +                qemu_log_mask(LOG_GUEST_ERROR,
> > +                         "More than %u used buffers obtained in a %u s=
ize SVQ",
> > +                         i, svq->vring.num);
> > +                virtqueue_fill(vq, elem, elem->len, i);
> > +                virtqueue_flush(vq, i);
> > +                return;
> > +            }
> > +            virtqueue_fill(vq, elem, elem->len, i++);
> > +        }
> > +
> > +        virtqueue_flush(vq, i);
> > +        event_notifier_set(&svq->svq_call);
> > +
> > +        if (check_for_avail_queue && svq->next_guest_avail_elem) {
> > +            /*
> > +             * Avail ring was full when vhost_svq_flush was called, so=
 it's a
> > +             * good moment to make more descriptors available if possi=
ble.
> > +             */
> > +            vhost_handle_guest_kick(svq);
> > +        }
> > +
> > +        vhost_svq_set_notification(svq, true);
> > +    } while (vhost_svq_more_used(svq));
> > +}
> > +
> > +/**
> > + * Forward used buffers.
> > + *
> > + * @n hdev call event notifier, the one that device set to notify svq.
> > + *
> > + * Note that we are not making any buffers available in the loop, ther=
e is no
> > + * way that it runs more than virtqueue size times.
> > + */
> >   static void vhost_svq_handle_call(EventNotifier *n)
> >   {
> >       VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueu=
e,
> >                                                hdev_call);
> >       event_notifier_test_and_clear(n);
> > -    event_notifier_set(&svq->svq_call);
> > +    vhost_svq_flush(svq, true);
> >   }
> >
> >   /**
> > @@ -149,7 +437,41 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueu=
e *svq, int svq_kick_fd)
> >       if (poll_start) {
> >           event_notifier_init_fd(svq_kick, svq_kick_fd);
> >           event_notifier_set(svq_kick);
> > -        event_notifier_set_handler(svq_kick, vhost_handle_guest_kick);
> > +        event_notifier_set_handler(svq_kick, vhost_handle_guest_kick_n=
otifier);
> > +    }
> > +}
> > +
> > +/**
> > + * Start the shadow virtqueue operation.
> > + *
> > + * @svq Shadow Virtqueue
> > + * @vdev        VirtIO device
> > + * @vq          Virtqueue to shadow
> > + */
> > +void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
> > +                     VirtQueue *vq)
> > +{
> > +    size_t desc_size, driver_size, device_size;
> > +
> > +    svq->next_guest_avail_elem =3D NULL;
> > +    svq->avail_idx_shadow =3D 0;
> > +    svq->shadow_used_idx =3D 0;
> > +    svq->last_used_idx =3D 0;
> > +    svq->vdev =3D vdev;
> > +    svq->vq =3D vq;
> > +
> > +    svq->vring.num =3D virtio_queue_get_num(vdev, virtio_get_queue_ind=
ex(vq));
> > +    driver_size =3D vhost_svq_driver_area_size(svq);
> > +    device_size =3D vhost_svq_device_area_size(svq);
> > +    svq->vring.desc =3D qemu_memalign(qemu_real_host_page_size, driver=
_size);
> > +    desc_size =3D sizeof(vring_desc_t) * svq->vring.num;
> > +    svq->vring.avail =3D (void *)((char *)svq->vring.desc + desc_size)=
;
> > +    memset(svq->vring.desc, 0, driver_size);
> > +    svq->vring.used =3D qemu_memalign(qemu_real_host_page_size, device=
_size);
> > +    memset(svq->vring.used, 0, device_size);
> > +    svq->ring_id_maps =3D g_new0(VirtQueueElement *, svq->vring.num);
> > +    for (unsigned i =3D 0; i < svq->vring.num - 1; i++) {
> > +        svq->vring.desc[i].next =3D cpu_to_le16(i + 1);
> >       }
> >   }
> >
> > @@ -160,6 +482,32 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueu=
e *svq, int svq_kick_fd)
> >   void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >   {
> >       event_notifier_set_handler(&svq->svq_kick, NULL);
> > +    g_autofree VirtQueueElement *next_avail_elem =3D NULL;
> > +
> > +    if (!svq->vq) {
> > +        return;
> > +    }
> > +
> > +    /* Send all pending used descriptors to guest */
> > +    vhost_svq_flush(svq, false);
> > +
> > +    for (unsigned i =3D 0; i < svq->vring.num; ++i) {
> > +        g_autofree VirtQueueElement *elem =3D NULL;
> > +        elem =3D g_steal_pointer(&svq->ring_id_maps[i]);
> > +        if (elem) {
> > +            virtqueue_detach_element(svq->vq, elem, elem->len);
> > +        }
> > +    }
> > +
> > +    next_avail_elem =3D g_steal_pointer(&svq->next_guest_avail_elem);
> > +    if (next_avail_elem) {
> > +        virtqueue_detach_element(svq->vq, next_avail_elem,
> > +                                 next_avail_elem->len);
> > +    }
> > +    svq->vq =3D NULL;
> > +    g_free(svq->ring_id_maps);
> > +    qemu_vfree(svq->vring.desc);
> > +    qemu_vfree(svq->vring.used);
> >   }
> >
> >   /**
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index b2c4e92fcf..435b9c2e9e 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -803,10 +803,10 @@ static int vhost_vdpa_set_vring_dev_addr(struct v=
host_dev *dev,
> >    * Note that this function does not rewind kick file descriptor if ca=
nnot set
> >    * call one.
> >    */
> > -static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
> > -                                 VhostShadowVirtqueue *svq,
> > -                                 unsigned idx,
> > -                                 Error **errp)
> > +static int vhost_vdpa_svq_set_fds(struct vhost_dev *dev,
> > +                                  VhostShadowVirtqueue *svq,
> > +                                  unsigned idx,
> > +                                  Error **errp)
> >   {
> >       struct vhost_vring_file file =3D {
> >           .index =3D dev->vq_index + idx,
> > @@ -818,7 +818,7 @@ static bool vhost_vdpa_svq_setup(struct vhost_dev *=
dev,
> >       r =3D vhost_vdpa_set_vring_dev_kick(dev, &file);
> >       if (unlikely(r !=3D 0)) {
> >           error_setg_errno(errp, -r, "Can't set device kick fd");
> > -        return false;
> > +        return r;
> >       }
> >
> >       event_notifier =3D &svq->hdev_call;
> > @@ -828,6 +828,119 @@ static bool vhost_vdpa_svq_setup(struct vhost_dev=
 *dev,
> >           error_setg_errno(errp, -r, "Can't set device call fd");
> >       }
> >
> > +    return r;
> > +}
> > +
> > +/**
> > + * Unmap a SVQ area in the device
> > + */
> > +static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v, hwaddr iov=
a,
> > +                                      hwaddr size)
> > +{
> > +    int r;
> > +
> > +    size =3D ROUND_UP(size, qemu_real_host_page_size);
> > +    r =3D vhost_vdpa_dma_unmap(v, iova, size);
> > +    return r =3D=3D 0;
> > +}
> > +
> > +static bool vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
> > +                                       const VhostShadowVirtqueue *svq=
)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    struct vhost_vring_addr svq_addr;
> > +    size_t device_size =3D vhost_svq_device_area_size(svq);
> > +    size_t driver_size =3D vhost_svq_driver_area_size(svq);
> > +    bool ok;
> > +
> > +    vhost_svq_get_vring_addr(svq, &svq_addr);
> > +
> > +    ok =3D vhost_vdpa_svq_unmap_ring(v, svq_addr.desc_user_addr, drive=
r_size);
> > +    if (unlikely(!ok)) {
> > +        return false;
> > +    }
> > +
> > +    return vhost_vdpa_svq_unmap_ring(v, svq_addr.used_user_addr, devic=
e_size);
> > +}
> > +
> > +/**
> > + * Map shadow virtqueue rings in device
> > + *
> > + * @dev   The vhost device
> > + * @svq   The shadow virtqueue
> > + * @addr  Assigned IOVA addresses
> > + * @errp  Error pointer
> > + */
> > +static bool vhost_vdpa_svq_map_rings(struct vhost_dev *dev,
> > +                                     const VhostShadowVirtqueue *svq,
> > +                                     struct vhost_vring_addr *addr,
> > +                                     Error **errp)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    size_t device_size =3D vhost_svq_device_area_size(svq);
> > +    size_t driver_size =3D vhost_svq_driver_area_size(svq);
> > +    int r;
> > +
> > +    ERRP_GUARD();
> > +    vhost_svq_get_vring_addr(svq, addr);
> > +
> > +    r =3D vhost_vdpa_dma_map(v, addr->desc_user_addr, driver_size,
> > +                           (void *)addr->desc_user_addr, true);
> > +    if (unlikely(r !=3D 0)) {
> > +        error_setg_errno(errp, -r, "Cannot create vq driver region: ")=
;
> > +        return false;
> > +    }
> > +
> > +    r =3D vhost_vdpa_dma_map(v, addr->used_user_addr, device_size,
> > +                           (void *)addr->used_user_addr, false);
> > +    if (unlikely(r !=3D 0)) {
> > +        error_setg_errno(errp, -r, "Cannot create vq device region: ")=
;
> > +    }
> > +
> > +    return r =3D=3D 0;
> > +}
> > +
> > +static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
> > +                                 VhostShadowVirtqueue *svq,
> > +                                 unsigned idx,
> > +                                 Error **errp)
> > +{
> > +    uint16_t vq_index =3D dev->vq_index + idx;
> > +    struct vhost_vring_state s =3D {
> > +        .index =3D vq_index,
> > +    };
> > +    int r;
> > +
> > +    r =3D vhost_vdpa_set_dev_vring_base(dev, &s);
> > +    if (unlikely(r)) {
> > +        error_setg_errno(errp, -r, "Cannot set vring base");
> > +        return false;
> > +    }
> > +
> > +    r =3D vhost_vdpa_svq_set_fds(dev, svq, idx, errp);
> > +    return r =3D=3D 0;
> > +}
> > +
> > +static bool vhost_vdpa_svq_set_addr(struct vhost_dev *dev, unsigned id=
x,
> > +                                    VhostShadowVirtqueue *svq,
> > +                                    Error **errp)
> > +{
> > +    struct vhost_vring_addr addr =3D {
> > +        .index =3D idx,
> > +    };
> > +    int r;
> > +
> > +    bool ok =3D vhost_vdpa_svq_map_rings(dev, svq, &addr, errp);
> > +    if (unlikely(!ok)) {
> > +        return false;
> > +    }
> > +
> > +    /* Override vring GPA set by vhost subsystem */
> > +    r =3D vhost_vdpa_set_vring_dev_addr(dev, &addr);
> > +    if (unlikely(r !=3D 0)) {
> > +        error_setg_errno(errp, -r, "Cannot set device address");
> > +    }
> > +
> >       return r =3D=3D 0;
> >   }
> >
> > @@ -842,10 +955,46 @@ static bool vhost_vdpa_svqs_start(struct vhost_de=
v *dev)
> >       }
> >
> >       for (i =3D 0; i < v->shadow_vqs->len; ++i) {
> > +        VirtQueue *vq =3D virtio_get_queue(dev->vdev, dev->vq_index + =
i);
> >           VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs=
, i);
> >           bool ok =3D vhost_vdpa_svq_setup(dev, svq, i, &err);
> >           if (unlikely(!ok)) {
> > -            error_reportf_err(err, "Cannot setup SVQ %u: ", i);
> > +            goto err;
> > +        }
> > +        vhost_svq_start(svq, dev->vdev, vq);
> > +        ok =3D vhost_vdpa_svq_set_addr(dev, i, svq, &err);
> > +        if (unlikely(!ok)) {
> > +            vhost_svq_stop(svq);
> > +            goto err;
>
>
> Nit: let's introduce a new error label for this?
>

I'm fine with that, but this unwinding index i, calling vhost_svq_stop
on svqs[i]. The code at err label works on j < i.

So there would be something like:

err_mapping:
  /* Unwind current starting SVQ */
  vhost_svq_stop(svqs[i]);

err:
for j in [0, i) {
  vhost_svq_stop(svqs[j]);
  unmap_rings(svqs[j]);
}

Repeating the vhost_svq_stop calling on different indexes.

>
> > +        }
> > +    }
> > +
> > +    return true;
> > +
> > +err:
> > +    error_reportf_err(err, "Cannot setup SVQ %u: ", i);
> > +    for (unsigned j =3D 0; j < i; ++j) {
> > +        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 j);
> > +        vhost_vdpa_svq_unmap_rings(dev, svq);
>
>
> I wonder if it's better to move the vhost_vdpa_svq_map_rings() out of
> vhost_vdpa_svq_set_addr(). (This function seems to be the only user for
> that). This will makes the error handling logic more clear.
>

Yes, I'll move it out.

Thanks!

> Thanks
>
>
> > +        vhost_svq_stop(svq);
> > +    }
> > +
> > +    return false;
> > +}
> > +
> > +static bool vhost_vdpa_svqs_stop(struct vhost_dev *dev)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +
> > +    if (!v->shadow_vqs) {
> > +        return true;
> > +    }
> > +
> > +    for (unsigned i =3D 0; i < v->shadow_vqs->len; ++i) {
> > +        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,
> > +                                                      i);
> > +        bool ok =3D vhost_vdpa_svq_unmap_rings(dev, svq);
> > +        if (unlikely(!ok)) {
> >               return false;
> >           }
> >       }
> > @@ -867,6 +1016,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev =
*dev, bool started)
> >           }
> >           vhost_vdpa_set_vring_ready(dev);
> >       } else {
> > +        ok =3D vhost_vdpa_svqs_stop(dev);
> > +        if (unlikely(!ok)) {
> > +            return -1;
> > +        }
> >           vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> >       }
> >
>


