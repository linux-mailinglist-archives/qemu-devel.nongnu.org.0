Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD05F33D1D8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:33:19 +0100 (CET)
Received: from localhost ([::1]:40706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM70o-0002jq-OY
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lM6zP-0002Fy-AH
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:31:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lM6zL-00070w-Jw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615890705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9sFZ4WNhtfBoDxdXkxCK4SpKPNmZn2d1VXRIwyIgLXA=;
 b=jURF1oPpsLZsZl0zIm9hpsbhopn+cPZGRRTUMA064WK+hNJemXerwdzCtpe7Aj3ZXXym05
 te3qalYMjvVomzTV8TwzyK7clFtK4j42v4mp9Fhlg2TQIdb+hduK7Lz4DYMKAsV2kAODr8
 EFMYw9N3/VNbcGktJko8L9eaYMntQ7U=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-b_8VBjVHPYa61jkhmv2wmA-1; Tue, 16 Mar 2021 06:31:43 -0400
X-MC-Unique: b_8VBjVHPYa61jkhmv2wmA-1
Received: by mail-qk1-f199.google.com with SMTP id u5so26365543qkj.10
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 03:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9sFZ4WNhtfBoDxdXkxCK4SpKPNmZn2d1VXRIwyIgLXA=;
 b=S1kc7xjcXB2VGnbYcqGGPgJVscrtKNLSG8ho1PiFgUSpc6aNpv8lZNqHJtA6yq0vm1
 IgH2pOwAw0HmCuZgnv5DUurtth8q4uPtL1T/nbtlwovRzlChbD/RCbdCGPbfisE8Bvwy
 png7B9MUAEc2jBUhmlZpfyMAPvB2Q48/OqVbYdjiinfJMCEmpucfevOiLXxbr7F3W9Po
 v8gzQimzPIz+TwbZ+kLu7aJLZERLgnygl315i3KCFP3mzfZj9HSgAJwjsAGk72kUgZ5T
 6R9rQZxt21YtgnrgIizEAp3jdVAZnjLxO/jntZF4PZZjWzJe44e+K0c5kxCrBSbi+Dpq
 phaQ==
X-Gm-Message-State: AOAM530RBlyPGmw8l4bzp3x2IjC5ktMGIS2xzAamQA1LifrEOmmRqD/z
 v/i+WvLthdDBKKNSSrjYQNMvPofUNcQMIZQMVtOqzuQrTe7zZvVEV7MJKlwT4mAM+a164akufH/
 2XAw7hNZPko6cVgguIYop0At4KysqMLY=
X-Received: by 2002:a37:a785:: with SMTP id
 q127mr28624833qke.425.1615890703202; 
 Tue, 16 Mar 2021 03:31:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/1MAkn7s5+JzsGvK5eOvuFV8TOCsLNGjtgALJoLtlMsaxGxA3/p8EtPJOiMnqpW1PGkX4KJteoi4yMdynPio=
X-Received: by 2002:a37:a785:: with SMTP id
 q127mr28624796qke.425.1615890702756; 
 Tue, 16 Mar 2021 03:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-6-eperezma@redhat.com>
 <23e492d1-9e86-20d3-e2b3-b3d7c8c6da9c@redhat.com>
In-Reply-To: <23e492d1-9e86-20d3-e2b3-b3d7c8c6da9c@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 16 Mar 2021 11:31:06 +0100
Message-ID: <CAJaqyWf6Vec1B+ybHdHoUVOG8Ga8hO0=ub8eVou+S0PfgyW+2A@mail.gmail.com>
Subject: Re: [RFC v2 05/13] vhost: Route guest->host notification through
 shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Guru Prasad <guru.prasad@broadcom.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 8:18 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/16 =E4=B8=8A=E5=8D=883:48, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Shadow virtqueue notifications forwarding is disabled when vhost_dev
> > stops, so code flow follows usual cleanup.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |   7 ++
> >   include/hw/virtio/vhost.h          |   4 +
> >   hw/virtio/vhost-shadow-virtqueue.c | 113 ++++++++++++++++++++++-
> >   hw/virtio/vhost.c                  | 143 ++++++++++++++++++++++++++++=
-
> >   4 files changed, 265 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 6cc18d6acb..c891c6510d 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -17,6 +17,13 @@
> >
> >   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> >
> > +bool vhost_shadow_vq_start(struct vhost_dev *dev,
> > +                           unsigned idx,
> > +                           VhostShadowVirtqueue *svq);
> > +void vhost_shadow_vq_stop(struct vhost_dev *dev,
> > +                          unsigned idx,
> > +                          VhostShadowVirtqueue *svq);
> > +
> >   VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int =
idx);
> >
> >   void vhost_shadow_vq_free(VhostShadowVirtqueue *vq);
> > diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> > index ac963bf23d..7ffdf9aea0 100644
> > --- a/include/hw/virtio/vhost.h
> > +++ b/include/hw/virtio/vhost.h
> > @@ -55,6 +55,8 @@ struct vhost_iommu {
> >       QLIST_ENTRY(vhost_iommu) iommu_next;
> >   };
> >
> > +typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> > +
> >   typedef struct VhostDevConfigOps {
> >       /* Vhost device config space changed callback
> >        */
> > @@ -83,7 +85,9 @@ struct vhost_dev {
> >       uint64_t backend_cap;
> >       bool started;
> >       bool log_enabled;
> > +    bool shadow_vqs_enabled;
> >       uint64_t log_size;
> > +    VhostShadowVirtqueue **shadow_vqs;
>
>
> Any reason that you don't embed the shadow virtqueue into
> vhost_virtqueue structure?
>

Not really, it could be relatively big and I would prefer SVQ
members/methods to remain hidden from any other part that includes
vhost.h. But it could be changed, for sure.

> (Note that there's a masked_notifier in struct vhost_virtqueue).
>

They are used differently: in SVQ the masked notifier is a pointer,
and if it's NULL the SVQ code knows that device is not masked. The
vhost_virtqueue is the real owner.

It could be replaced by a boolean in SVQ or something like that, I
experimented with a tri-state too (UNMASKED, MASKED, MASKED_NOTIFIED)
and let vhost.c code to manage all the transitions. But I find clearer
the pointer use, since it's the more natural for the
vhost_virtqueue_mask, vhost_virtqueue_pending existing functions.

This masking/unmasking is the part I dislike the most from this
series, so I'm very open to alternatives.

>
> >       Error *migration_blocker;
> >       const VhostOps *vhost_ops;
> >       void *opaque;
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 4512e5b058..3e43399e9c 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -8,9 +8,12 @@
> >    */
> >
> >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> > +#include "hw/virtio/vhost.h"
> > +
> > +#include "standard-headers/linux/vhost_types.h"
> >
> >   #include "qemu/error-report.h"
> > -#include "qemu/event_notifier.h"
> > +#include "qemu/main-loop.h"
> >
> >   /* Shadow virtqueue to relay notifications */
> >   typedef struct VhostShadowVirtqueue {
> > @@ -18,14 +21,121 @@ typedef struct VhostShadowVirtqueue {
> >       EventNotifier kick_notifier;
> >       /* Shadow call notifier, sent to vhost */
> >       EventNotifier call_notifier;
> > +
> > +    /*
> > +     * Borrowed virtqueue's guest to host notifier.
> > +     * To borrow it in this event notifier allows to register on the e=
vent
> > +     * loop and access the associated shadow virtqueue easily. If we u=
se the
> > +     * VirtQueue, we don't have an easy way to retrieve it.
>
>
> So this is something that worries me. It looks like a layer violation
> that makes the codes harder to work correctly.
>

I don't follow you here.

The vhost code already depends on virtqueue in the same sense:
virtio_queue_get_host_notifier is called on vhost_virtqueue_start. So
if this behavior ever changes it is unlikely for vhost to keep working
without changes. vhost_virtqueue has a kick/call int where I think it
should be stored actually, but they are never used as far as I see.

Previous RFC did rely on vhost_dev_disable_notifiers. From its documentatio=
n:
/* Stop processing guest IO notifications in vhost.
 * Start processing them in qemu.
 ...
But it was easier for this mode to miss a notification, since they
create a new host_notifier in virtio_bus_set_host_notifier right away.
So I decided to use the file descriptor already sent to vhost in
regular operation mode, so guest-related resources change less.

Having said that, maybe it's useful to assert that
vhost_dev_{enable,disable}_notifiers are never called on shadow
virtqueue mode. Also, it could be useful to retrieve it from
virtio_bus, not raw shadow virtqueue, so all get/set are performed
from it. Would that make more sense?

> I wonder if it would be simpler to start from a vDPA dedicated shadow
> virtqueue implementation:
>
> 1) have the above fields embeded in vhost_vdpa structure
> 2) Work at the level of
> vhost_vdpa_set_vring_kick()/vhost_vdpa_set_vring_call()
>

This notifier is never sent to the device in shadow virtqueue mode.
It's for SVQ to react to guest's notifications, registering it on its
main event loop [1]. So if I perform these changes the way I
understand them, SVQ would still rely on this borrowed EventNotifier,
and it would send to the vDPA device the newly created kick_notifier
of VhostShadowVirtqueue.

> Then the layer is still isolated and you have a much simpler context to
> work that you don't need to care a lot of synchornization:
>
> 1) vq masking

This EventNotifier is not used for masking, it does not change from
the start of the shadow virtqueue operation through its end. Call fd
sent to vhost/vdpa device does not change either in shadow virtqueue
mode operation with masking/unmasking. I will try to document it
better.

I think that we will need to handle synchronization with
masking/unmasking from the guest and dynamically enabling SVQ
operation mode, since they can happen at the same time as long as we
let the guest run. There may be better ways of synchronizing them of
course, but I don't see how moving to the vhost-vdpa backend helps
with this. Please expand if I've missed it.

Or do you mean to forbid regular <-> SVQ operation mode transitions and del=
ay it
to future patchsets?

> 2) vhost dev start and stop
>
> ?
>
>
> > +     *
> > +     * So shadow virtqueue must not clean it, or we would lose VirtQue=
ue one.
> > +     */
> > +    EventNotifier host_notifier;
> > +
> > +    /* Virtio queue shadowing */
> > +    VirtQueue *vq;
> >   } VhostShadowVirtqueue;
> >
> > +/* Forward guest notifications */
> > +static void vhost_handle_guest_kick(EventNotifier *n)
> > +{
> > +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueue=
,
> > +                                             host_notifier);
> > +
> > +    if (unlikely(!event_notifier_test_and_clear(n))) {
> > +        return;
> > +    }
> > +
> > +    event_notifier_set(&svq->kick_notifier);
> > +}
> > +
> > +/*
> > + * Restore the vhost guest to host notifier, i.e., disables svq effect=
.
> > + */
> > +static int vhost_shadow_vq_restore_vdev_host_notifier(struct vhost_dev=
 *dev,
> > +                                                     unsigned vhost_in=
dex,
> > +                                                     VhostShadowVirtqu=
eue *svq)
> > +{
> > +    EventNotifier *vq_host_notifier =3D virtio_queue_get_host_notifier=
(svq->vq);
> > +    struct vhost_vring_file file =3D {
> > +        .index =3D vhost_index,
> > +        .fd =3D event_notifier_get_fd(vq_host_notifier),
> > +    };
> > +    int r;
> > +
> > +    /* Restore vhost kick */
> > +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &file);
> > +    return r ? -errno : 0;
> > +}
> > +
> > +/*
> > + * Start shadow virtqueue operation.
> > + * @dev vhost device
> > + * @hidx vhost virtqueue index
> > + * @svq Shadow Virtqueue
> > + */
> > +bool vhost_shadow_vq_start(struct vhost_dev *dev,
> > +                           unsigned idx,
> > +                           VhostShadowVirtqueue *svq)
>
>
> It looks to me this assumes the vhost_dev is started before
> vhost_shadow_vq_start()?
>

Right.

>
> > +{
> > +    EventNotifier *vq_host_notifier =3D virtio_queue_get_host_notifier=
(svq->vq);
> > +    struct vhost_vring_file file =3D {
> > +        .index =3D idx,
> > +        .fd =3D event_notifier_get_fd(&svq->kick_notifier),
> > +    };
> > +    int r;
> > +
> > +    /* Check that notifications are still going directly to vhost dev =
*/
> > +    assert(virtio_queue_is_host_notifier_enabled(svq->vq));
> > +
> > +    /*
> > +     * event_notifier_set_handler already checks for guest's notificat=
ions if
> > +     * they arrive in the switch, so there is no need to explicitely c=
heck for
> > +     * them.
> > +     */
> > +    event_notifier_init_fd(&svq->host_notifier,
> > +                           event_notifier_get_fd(vq_host_notifier));
> > +    event_notifier_set_handler(&svq->host_notifier, vhost_handle_guest=
_kick);
> > +
> > +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &file);
> > +    if (unlikely(r !=3D 0)) {
> > +        error_report("Couldn't set kick fd: %s", strerror(errno));
> > +        goto err_set_vring_kick;
> > +    }
> > +
> > +    return true;
> > +
> > +err_set_vring_kick:
> > +    event_notifier_set_handler(&svq->host_notifier, NULL);
> > +
> > +    return false;
> > +}
> > +
> > +/*
> > + * Stop shadow virtqueue operation.
> > + * @dev vhost device
> > + * @idx vhost queue index
> > + * @svq Shadow Virtqueue
> > + */
> > +void vhost_shadow_vq_stop(struct vhost_dev *dev,
> > +                          unsigned idx,
> > +                          VhostShadowVirtqueue *svq)
> > +{
> > +    int r =3D vhost_shadow_vq_restore_vdev_host_notifier(dev, idx, svq=
);
> > +    if (unlikely(r < 0)) {
> > +        error_report("Couldn't restore vq kick fd: %s", strerror(-r));
> > +    }
> > +
> > +    event_notifier_set_handler(&svq->host_notifier, NULL);
> > +}
> > +
> >   /*
> >    * Creates vhost shadow virtqueue, and instruct vhost device to use t=
he shadow
> >    * methods and file descriptors.
> >    */
> >   VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int =
idx)
> >   {
> > +    int vq_idx =3D dev->vq_index + idx;
> >       g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqu=
eue, 1);
> >       int r;
> >
> > @@ -43,6 +153,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vho=
st_dev *dev, int idx)
> >           goto err_init_call_notifier;
> >       }
> >
> > +    svq->vq =3D virtio_get_queue(dev->vdev, vq_idx);
> >       return g_steal_pointer(&svq);
> >
> >   err_init_call_notifier:
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 97f1bcfa42..4858a35df6 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -25,6 +25,7 @@
> >   #include "exec/address-spaces.h"
> >   #include "hw/virtio/virtio-bus.h"
> >   #include "hw/virtio/virtio-access.h"
> > +#include "hw/virtio/vhost-shadow-virtqueue.h"
> >   #include "migration/blocker.h"
> >   #include "migration/qemu-file-types.h"
> >   #include "sysemu/dma.h"
> > @@ -1219,6 +1220,74 @@ static void vhost_virtqueue_stop(struct vhost_de=
v *dev,
> >                          0, virtio_queue_get_desc_size(vdev, idx));
> >   }
> >
> > +static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
> > +{
> > +    int idx;
> > +
> > +    dev->shadow_vqs_enabled =3D false;
> > +
> > +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > +        vhost_shadow_vq_stop(dev, idx, dev->shadow_vqs[idx]);
> > +        vhost_shadow_vq_free(dev->shadow_vqs[idx]);
> > +    }
> > +
> > +    g_free(dev->shadow_vqs);
> > +    dev->shadow_vqs =3D NULL;
> > +    return 0;
> > +}
> > +
> > +static int vhost_sw_live_migration_start(struct vhost_dev *dev)
> > +{
> > +    int idx, stop_idx;
> > +
> > +    dev->shadow_vqs =3D g_new0(VhostShadowVirtqueue *, dev->nvqs);
> > +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > +        dev->shadow_vqs[idx] =3D vhost_shadow_vq_new(dev, idx);
> > +        if (unlikely(dev->shadow_vqs[idx] =3D=3D NULL)) {
> > +            goto err_new;
> > +        }
> > +    }
> > +
> > +    dev->shadow_vqs_enabled =3D true;
> > +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > +        bool ok =3D vhost_shadow_vq_start(dev, idx, dev->shadow_vqs[id=
x]);
> > +        if (unlikely(!ok)) {
> > +            goto err_start;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +
> > +err_start:
> > +    dev->shadow_vqs_enabled =3D false;
> > +    for (stop_idx =3D 0; stop_idx < idx; stop_idx++) {
> > +        vhost_shadow_vq_stop(dev, idx, dev->shadow_vqs[stop_idx]);
> > +    }
> > +
> > +err_new:
> > +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > +        vhost_shadow_vq_free(dev->shadow_vqs[idx]);
> > +    }
> > +    g_free(dev->shadow_vqs);
> > +
> > +    return -1;
> > +}
> > +
> > +static int vhost_sw_live_migration_enable(struct vhost_dev *dev,
> > +                                          bool enable_lm)
> > +{
>
>
> So the live migration part should be done in an separted patch.
>

Right, I missed the renaming of this one.

> Thanks
>

[1] or, hopefully in the future, in an independent aio context.


>
> > +    int r;
> > +
> > +    if (enable_lm =3D=3D dev->shadow_vqs_enabled) {
> > +        return 0;
> > +    }
> > +
> > +    r =3D enable_lm ? vhost_sw_live_migration_start(dev)
> > +                  : vhost_sw_live_migration_stop(dev);
> > +
> > +    return r;
> > +}
> > +
> >   static void vhost_eventfd_add(MemoryListener *listener,
> >                                 MemoryRegionSection *section,
> >                                 bool match_data, uint64_t data, EventNo=
tifier *e)
> > @@ -1381,6 +1450,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *=
opaque,
> >       hdev->log =3D NULL;
> >       hdev->log_size =3D 0;
> >       hdev->log_enabled =3D false;
> > +    hdev->shadow_vqs_enabled =3D false;
> >       hdev->started =3D false;
> >       memory_listener_register(&hdev->memory_listener, &address_space_m=
emory);
> >       QLIST_INSERT_HEAD(&vhost_devices, hdev, entry);
> > @@ -1484,6 +1554,10 @@ void vhost_dev_disable_notifiers(struct vhost_de=
v *hdev, VirtIODevice *vdev)
> >       BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> >       int i, r;
> >
> > +    if (hdev->shadow_vqs_enabled) {
> > +        vhost_sw_live_migration_enable(hdev, false);
> > +    }
> > +
> >       for (i =3D 0; i < hdev->nvqs; ++i) {
> >           r =3D virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq=
_index + i,
> >                                            false);
> > @@ -1798,6 +1872,7 @@ fail_features:
> >   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
> >   {
> >       int i;
> > +    bool is_shadow_vqs_enabled =3D hdev->shadow_vqs_enabled;
> >
> >       /* should only be called after backend is connected */
> >       assert(hdev->vhost_ops);
> > @@ -1805,7 +1880,16 @@ void vhost_dev_stop(struct vhost_dev *hdev, Virt=
IODevice *vdev)
> >       if (hdev->vhost_ops->vhost_dev_start) {
> >           hdev->vhost_ops->vhost_dev_start(hdev, false);
> >       }
> > +    if (is_shadow_vqs_enabled) {
> > +        /* Shadow virtqueue will be stopped */
> > +        hdev->shadow_vqs_enabled =3D false;
> > +    }
> >       for (i =3D 0; i < hdev->nvqs; ++i) {
> > +        if (is_shadow_vqs_enabled) {
> > +            vhost_shadow_vq_stop(hdev, i, hdev->shadow_vqs[i]);
> > +            vhost_shadow_vq_free(hdev->shadow_vqs[i]);
> > +        }
> > +
> >           vhost_virtqueue_stop(hdev,
> >                                vdev,
> >                                hdev->vqs + i,
> > @@ -1819,6 +1903,8 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtI=
ODevice *vdev)
> >           memory_listener_unregister(&hdev->iommu_listener);
> >       }
> >       vhost_log_put(hdev, true);
> > +    g_free(hdev->shadow_vqs);
> > +    hdev->shadow_vqs_enabled =3D false;
> >       hdev->started =3D false;
> >       hdev->vdev =3D NULL;
> >   }
> > @@ -1835,5 +1921,60 @@ int vhost_net_set_backend(struct vhost_dev *hdev=
,
> >
> >   void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Erro=
r **errp)
> >   {
> > -    error_setg(errp, "Shadow virtqueue still not implemented");
> > +    struct vhost_dev *hdev, *hdev_err;
> > +    VirtIODevice *vdev;
> > +    const char *err_cause =3D NULL;
> > +    int r;
> > +    ErrorClass err_class =3D ERROR_CLASS_GENERIC_ERROR;
> > +
> > +    QLIST_FOREACH(hdev, &vhost_devices, entry) {
> > +        if (hdev->vdev && 0 =3D=3D strcmp(hdev->vdev->name, name)) {
> > +            vdev =3D hdev->vdev;
> > +            break;
> > +        }
> > +    }
> > +
> > +    if (!hdev) {
> > +        err_class =3D ERROR_CLASS_DEVICE_NOT_FOUND;
> > +        err_cause =3D "Device not found";
> > +        goto not_found_err;
> > +    }
> > +
> > +    for ( ; hdev; hdev =3D QLIST_NEXT(hdev, entry)) {
> > +        if (vdev !=3D hdev->vdev) {
> > +            continue;
> > +        }
> > +
> > +        if (!hdev->started) {
> > +            err_cause =3D "Device is not started";
> > +            goto err;
> > +        }
> > +
> > +        r =3D vhost_sw_live_migration_enable(hdev, enable);
> > +        if (unlikely(r)) {
> > +            err_cause =3D "Error enabling (see monitor)";
> > +            goto err;
> > +        }
> > +    }
> > +
> > +    return;
> > +
> > +err:
> > +    QLIST_FOREACH(hdev_err, &vhost_devices, entry) {
> > +        if (hdev_err =3D=3D hdev) {
> > +            break;
> > +        }
> > +
> > +        if (vdev !=3D hdev->vdev) {
> > +            continue;
> > +        }
> > +
> > +        vhost_sw_live_migration_enable(hdev, !enable);
> > +    }
> > +
> > +not_found_err:
> > +    if (err_cause) {
> > +        error_set(errp, err_class,
> > +                  "Can't enable shadow vq on %s: %s", name, err_cause)=
;
> > +    }
> >   }
>


