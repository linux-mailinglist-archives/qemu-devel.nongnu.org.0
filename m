Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CCF4C939A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 19:54:19 +0100 (CET)
Received: from localhost ([::1]:55102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP7da-0002Ep-Dx
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 13:54:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nP7Zt-0008HI-Vi
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:50:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nP7Zi-00053Q-Op
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:50:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646160617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/ihOLDf14JAjfovUoKZPuyWfOKFwYj9Gu7jEtDTYwg=;
 b=U6RDFLoCEwh6dA9w+BXAYc9ssC1bFEbXU6pbQvJE+quEYJIUG3Ng35B6OtsnQ6+fIxKV7U
 ZVEMAlGeGBA1qP9TaYd5vcE8mqKRjxaIzPsaXt5LApxWmyUYi16YrJ2ZOsuqqqzYPhOzDw
 FjksGIB1TalVSwFdLnW3HerWsoKoGFw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-anIhsMZDMMKmSV3NDNEIuw-1; Tue, 01 Mar 2022 13:50:12 -0500
X-MC-Unique: anIhsMZDMMKmSV3NDNEIuw-1
Received: by mail-qk1-f199.google.com with SMTP id
 199-20020a3703d0000000b005f17c5b0356so14567182qkd.16
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 10:50:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4/ihOLDf14JAjfovUoKZPuyWfOKFwYj9Gu7jEtDTYwg=;
 b=QYyS5UibWqBR6czxdIxgiRGn8sKLrrpU6j9UwA9YOrBpV108mnU8uoSCgl6z+k5QtH
 YlH0/9AeazxZNj/zp1LdgL/n5Um1K5C/QpQEGfXVxhf7VHYn8oYT3IDkpYPH5OCQ1xFt
 4lcU620RKbwNQtv9NKOYpebAxBVvj3dJc4iPizFgPriitsNYWphz9niyjijWNSVH9Q0L
 gggPKzhYxB4VZ17//zBozbkd8nS5JYX0LxI/W+pLR+gHpVWLTZjAeS2ciZtDT2sYPAjp
 66LFz5CvIAl7d0SEnjps2TkGyl266GzKUP+NNN5bp0/xIXTeUzqi9mx/wTFkHhEc5G+o
 qC8g==
X-Gm-Message-State: AOAM532uJYsbk8BwQJKQgKbDaob28vaOka/a28Rr8rIHRTjT4fC5nY8Z
 B9gm4ezik4KIOvdYZxtSf7rU3PhM4XBdn2ZpeOxYOd7rDHkQBtsBXGp6I3OT4ao/TFLao9kxhD/
 ueIYZ1E5unAylVeC17HZDEpWc66y+2ks=
X-Received: by 2002:a05:6214:19cd:b0:433:2eca:f77a with SMTP id
 j13-20020a05621419cd00b004332ecaf77amr5811583qvc.26.1646160612113; 
 Tue, 01 Mar 2022 10:50:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNGDQ1hd+8fg14iNi7A7+sBR5D0zQLmxfW+tFYTQelJG5u5/Ss/SqxjtZpsTvArQz78o/Wuk6CqRDjApdgnrI=
X-Received: by 2002:a05:6214:19cd:b0:433:2eca:f77a with SMTP id
 j13-20020a05621419cd00b004332ecaf77amr5811557qvc.26.1646160611825; Tue, 01
 Mar 2022 10:50:11 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-3-eperezma@redhat.com>
 <40c5bb81-b33a-9a4a-8ce0-20289b13b907@redhat.com>
In-Reply-To: <40c5bb81-b33a-9a4a-8ce0-20289b13b907@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Mar 2022 19:49:35 +0100
Message-ID: <CAJaqyWezcrc=iPLe=Y7+g9oBYfUY9pK8OM4=ZUeRgXqr9ZUWkg@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] vhost: Add Shadow VirtQueue kick forwarding
 capabilities
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Mon, Feb 28, 2022 at 3:57 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:40, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > At this mode no buffer forwarding will be performed in SVQ mode: Qemu
> > will just forward the guest's kicks to the device.
> >
> > Host memory notifiers regions are left out for simplicity, and they wil=
l
> > not be addressed in this series.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  14 +++
> >   include/hw/virtio/vhost-vdpa.h     |   4 +
> >   hw/virtio/vhost-shadow-virtqueue.c |  52 +++++++++++
> >   hw/virtio/vhost-vdpa.c             | 145 ++++++++++++++++++++++++++++=
-
> >   4 files changed, 213 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index f1519e3c7b..1cbc87d5d8 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -18,8 +18,22 @@ typedef struct VhostShadowVirtqueue {
> >       EventNotifier hdev_kick;
> >       /* Shadow call notifier, sent to vhost */
> >       EventNotifier hdev_call;
> > +
> > +    /*
> > +     * Borrowed virtqueue's guest to host notifier. To borrow it in th=
is event
> > +     * notifier allows to recover the VhostShadowVirtqueue from the ev=
ent loop
> > +     * easily. If we use the VirtQueue's one, we don't have an easy wa=
y to
> > +     * retrieve VhostShadowVirtqueue.
> > +     *
> > +     * So shadow virtqueue must not clean it, or we would lose VirtQue=
ue one.
> > +     */
> > +    EventNotifier svq_kick;
> >   } VhostShadowVirtqueue;
> >
> > +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick=
_fd);
> > +
> > +void vhost_svq_stop(VhostShadowVirtqueue *svq);
> > +
> >   VhostShadowVirtqueue *vhost_svq_new(void);
> >
> >   void vhost_svq_free(gpointer vq);
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index 3ce79a646d..009a9f3b6b 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -12,6 +12,8 @@
> >   #ifndef HW_VIRTIO_VHOST_VDPA_H
> >   #define HW_VIRTIO_VHOST_VDPA_H
> >
> > +#include <gmodule.h>
> > +
> >   #include "hw/virtio/virtio.h"
> >   #include "standard-headers/linux/vhost_types.h"
> >
> > @@ -27,6 +29,8 @@ typedef struct vhost_vdpa {
> >       bool iotlb_batch_begin_sent;
> >       MemoryListener listener;
> >       struct vhost_vdpa_iova_range iova_range;
> > +    bool shadow_vqs_enabled;
> > +    GPtrArray *shadow_vqs;
> >       struct vhost_dev *dev;
> >       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >   } VhostVDPA;
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 019cf1950f..a5d0659f86 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -11,6 +11,56 @@
> >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> >
> >   #include "qemu/error-report.h"
> > +#include "qemu/main-loop.h"
> > +#include "linux-headers/linux/vhost.h"
> > +
> > +/** Forward guest notifications */
> > +static void vhost_handle_guest_kick(EventNotifier *n)
> > +{
> > +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueue=
,
> > +                                             svq_kick);
> > +    event_notifier_test_and_clear(n);
> > +    event_notifier_set(&svq->hdev_kick);
> > +}
> > +
> > +/**
> > + * Set a new file descriptor for the guest to kick the SVQ and notify =
for avail
> > + *
> > + * @svq          The svq
> > + * @svq_kick_fd  The svq kick fd
> > + *
> > + * Note that the SVQ will never close the old file descriptor.
> > + */
> > +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick=
_fd)
> > +{
> > +    EventNotifier *svq_kick =3D &svq->svq_kick;
> > +    bool poll_stop =3D VHOST_FILE_UNBIND !=3D event_notifier_get_fd(sv=
q_kick);
>
>
> I wonder if this is robust. E.g is there any chance that may end up with
> both poll_stop and poll_start are false?
>

I cannot make that happen in qemu, but the function supports that case
well: It will do nothing. It's more or less the same code as used in
the vhost kernel, and is the expected behaviour if you send two
VHOST_FILE_UNBIND one right after another to me.

> If not, can we simple detect poll_stop as below and treat !poll_start
> and poll_stop?
>

I'm not sure what does it add. Is there an unexpected consequence with
the current do-nothing behavior I've missed?

Thanks!

> Other looks good.
>
> Thanks
>
>
> > +    bool poll_start =3D svq_kick_fd !=3D VHOST_FILE_UNBIND;
> > +
> > +    if (poll_stop) {
> > +        event_notifier_set_handler(svq_kick, NULL);
> > +    }
> > +
> > +    /*
> > +     * event_notifier_set_handler already checks for guest's notificat=
ions if
> > +     * they arrive at the new file descriptor in the switch, so there =
is no
> > +     * need to explicitly check for them.
> > +     */
> > +    if (poll_start) {
> > +        event_notifier_init_fd(svq_kick, svq_kick_fd);
> > +        event_notifier_set(svq_kick);
> > +        event_notifier_set_handler(svq_kick, vhost_handle_guest_kick);
> > +    }
> > +}
> > +
> > +/**
> > + * Stop the shadow virtqueue operation.
> > + * @svq Shadow Virtqueue
> > + */
> > +void vhost_svq_stop(VhostShadowVirtqueue *svq)
> > +{
> > +    event_notifier_set_handler(&svq->svq_kick, NULL);
> > +}
> >
> >   /**
> >    * Creates vhost shadow virtqueue, and instructs the vhost device to =
use the
> > @@ -39,6 +89,7 @@ VhostShadowVirtqueue *vhost_svq_new(void)
> >           goto err_init_hdev_call;
> >       }
> >
> > +    event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
> >       return g_steal_pointer(&svq);
> >
> >   err_init_hdev_call:
> > @@ -56,6 +107,7 @@ err_init_hdev_kick:
> >   void vhost_svq_free(gpointer pvq)
> >   {
> >       VhostShadowVirtqueue *vq =3D pvq;
> > +    vhost_svq_stop(vq);
> >       event_notifier_cleanup(&vq->hdev_kick);
> >       event_notifier_cleanup(&vq->hdev_call);
> >       g_free(vq);
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 04ea43704f..454bf50735 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -17,12 +17,14 @@
> >   #include "hw/virtio/vhost.h"
> >   #include "hw/virtio/vhost-backend.h"
> >   #include "hw/virtio/virtio-net.h"
> > +#include "hw/virtio/vhost-shadow-virtqueue.h"
> >   #include "hw/virtio/vhost-vdpa.h"
> >   #include "exec/address-spaces.h"
> >   #include "qemu/main-loop.h"
> >   #include "cpu.h"
> >   #include "trace.h"
> >   #include "qemu-common.h"
> > +#include "qapi/error.h"
> >
> >   /*
> >    * Return one past the end of the end of section. Be careful with uin=
t64_t
> > @@ -342,6 +344,30 @@ static bool vhost_vdpa_one_time_request(struct vho=
st_dev *dev)
> >       return v->index !=3D 0;
> >   }
> >
> > +static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vd=
pa *v,
> > +                               Error **errp)
> > +{
> > +    g_autoptr(GPtrArray) shadow_vqs =3D NULL;
> > +
> > +    if (!v->shadow_vqs_enabled) {
> > +        return 0;
> > +    }
> > +
> > +    shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
> > +    for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> > +        g_autoptr(VhostShadowVirtqueue) svq =3D vhost_svq_new();
> > +
> > +        if (unlikely(!svq)) {
> > +            error_setg(errp, "Cannot create svq %u", n);
> > +            return -1;
> > +        }
> > +        g_ptr_array_add(shadow_vqs, g_steal_pointer(&svq));
> > +    }
> > +
> > +    v->shadow_vqs =3D g_steal_pointer(&shadow_vqs);
> > +    return 0;
> > +}
> > +
> >   static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error=
 **errp)
> >   {
> >       struct vhost_vdpa *v;
> > @@ -364,6 +390,10 @@ static int vhost_vdpa_init(struct vhost_dev *dev, =
void *opaque, Error **errp)
> >       dev->opaque =3D  opaque ;
> >       v->listener =3D vhost_vdpa_memory_listener;
> >       v->msg_type =3D VHOST_IOTLB_MSG_V2;
> > +    ret =3D vhost_vdpa_init_svq(dev, v, errp);
> > +    if (ret) {
> > +        goto err;
> > +    }
> >
> >       vhost_vdpa_get_iova_range(v);
> >
> > @@ -375,6 +405,10 @@ static int vhost_vdpa_init(struct vhost_dev *dev, =
void *opaque, Error **errp)
> >                                  VIRTIO_CONFIG_S_DRIVER);
> >
> >       return 0;
> > +
> > +err:
> > +    ram_block_discard_disable(false);
> > +    return ret;
> >   }
> >
> >   static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
> > @@ -444,8 +478,14 @@ err:
> >
> >   static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
> >   {
> > +    struct vhost_vdpa *v =3D dev->opaque;
> >       int i;
> >
> > +    if (v->shadow_vqs_enabled) {
> > +        /* FIXME SVQ is not compatible with host notifiers mr */
> > +        return;
> > +    }
> > +
> >       for (i =3D dev->vq_index; i < dev->vq_index + dev->nvqs; i++) {
> >           if (vhost_vdpa_host_notifier_init(dev, i)) {
> >               goto err;
> > @@ -459,6 +499,21 @@ err:
> >       return;
> >   }
> >
> > +static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    size_t idx;
> > +
> > +    if (!v->shadow_vqs) {
> > +        return;
> > +    }
> > +
> > +    for (idx =3D 0; idx < v->shadow_vqs->len; ++idx) {
> > +        vhost_svq_stop(g_ptr_array_index(v->shadow_vqs, idx));
> > +    }
> > +    g_ptr_array_free(v->shadow_vqs, true);
> > +}
> > +
> >   static int vhost_vdpa_cleanup(struct vhost_dev *dev)
> >   {
> >       struct vhost_vdpa *v;
> > @@ -467,6 +522,7 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev=
)
> >       trace_vhost_vdpa_cleanup(dev, v);
> >       vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> >       memory_listener_unregister(&v->listener);
> > +    vhost_vdpa_svq_cleanup(dev);
> >
> >       dev->opaque =3D NULL;
> >       ram_block_discard_disable(false);
> > @@ -558,11 +614,26 @@ static int vhost_vdpa_get_device_id(struct vhost_=
dev *dev,
> >       return ret;
> >   }
> >
> > +static void vhost_vdpa_reset_svq(struct vhost_vdpa *v)
> > +{
> > +    if (!v->shadow_vqs_enabled) {
> > +        return;
> > +    }
> > +
> > +    for (unsigned i =3D 0; i < v->shadow_vqs->len; ++i) {
> > +        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 i);
> > +        vhost_svq_stop(svq);
> > +    }
> > +}
> > +
> >   static int vhost_vdpa_reset_device(struct vhost_dev *dev)
> >   {
> > +    struct vhost_vdpa *v =3D dev->opaque;
> >       int ret;
> >       uint8_t status =3D 0;
> >
> > +    vhost_vdpa_reset_svq(v);
> > +
> >       ret =3D vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
> >       trace_vhost_vdpa_reset_device(dev, status);
> >       return ret;
> > @@ -646,13 +717,75 @@ static int vhost_vdpa_get_config(struct vhost_dev=
 *dev, uint8_t *config,
> >       return ret;
> >    }
> >
> > +static int vhost_vdpa_set_vring_dev_kick(struct vhost_dev *dev,
> > +                                         struct vhost_vring_file *file=
)
> > +{
> > +    trace_vhost_vdpa_set_vring_kick(dev, file->index, file->fd);
> > +    return vhost_vdpa_call(dev, VHOST_SET_VRING_KICK, file);
> > +}
> > +
> > +/**
> > + * Set the shadow virtqueue descriptors to the device
> > + *
> > + * @dev   The vhost device model
> > + * @svq   The shadow virtqueue
> > + * @idx   The index of the virtqueue in the vhost device
> > + * @errp  Error
> > + */
> > +static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
> > +                                 VhostShadowVirtqueue *svq,
> > +                                 unsigned idx,
> > +                                 Error **errp)
> > +{
> > +    struct vhost_vring_file file =3D {
> > +        .index =3D dev->vq_index + idx,
> > +    };
> > +    const EventNotifier *event_notifier =3D &svq->hdev_kick;
> > +    int r;
> > +
> > +    file.fd =3D event_notifier_get_fd(event_notifier);
> > +    r =3D vhost_vdpa_set_vring_dev_kick(dev, &file);
> > +    if (unlikely(r !=3D 0)) {
> > +        error_setg_errno(errp, -r, "Can't set device kick fd");
> > +    }
> > +
> > +    return r =3D=3D 0;
> > +}
> > +
> > +static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    Error *err =3D NULL;
> > +    unsigned i;
> > +
> > +    if (!v->shadow_vqs) {
> > +        return true;
> > +    }
> > +
> > +    for (i =3D 0; i < v->shadow_vqs->len; ++i) {
> > +        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 i);
> > +        bool ok =3D vhost_vdpa_svq_setup(dev, svq, i, &err);
> > +        if (unlikely(!ok)) {
> > +            error_reportf_err(err, "Cannot setup SVQ %u: ", i);
> > +            return false;
> > +        }
> > +    }
> > +
> > +    return true;
> > +}
> > +
> >   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> >   {
> >       struct vhost_vdpa *v =3D dev->opaque;
> > +    bool ok;
> >       trace_vhost_vdpa_dev_start(dev, started);
> >
> >       if (started) {
> >           vhost_vdpa_host_notifiers_init(dev);
> > +        ok =3D vhost_vdpa_svqs_start(dev);
> > +        if (unlikely(!ok)) {
> > +            return -1;
> > +        }
> >           vhost_vdpa_set_vring_ready(dev);
> >       } else {
> >           vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> > @@ -724,8 +857,16 @@ static int vhost_vdpa_get_vring_base(struct vhost_=
dev *dev,
> >   static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
> >                                          struct vhost_vring_file *file)
> >   {
> > -    trace_vhost_vdpa_set_vring_kick(dev, file->index, file->fd);
> > -    return vhost_vdpa_call(dev, VHOST_SET_VRING_KICK, file);
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    int vdpa_idx =3D file->index - dev->vq_index;
> > +
> > +    if (v->shadow_vqs_enabled) {
> > +        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 vdpa_idx);
> > +        vhost_svq_set_svq_kick_fd(svq, file->fd);
> > +        return 0;
> > +    } else {
> > +        return vhost_vdpa_set_vring_dev_kick(dev, file);
> > +    }
> >   }
> >
> >   static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>


