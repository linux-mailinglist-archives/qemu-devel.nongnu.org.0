Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28BE2D47ED
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:28:38 +0100 (CET)
Received: from localhost ([::1]:48792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3GX-00079d-TN
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn2xZ-0005QC-F9
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:09:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn2xU-0004Pn-O8
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607533734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BAvF4aO/uVkLC5sMDyd70RK51ZlPJ4N8Kvsowu313nM=;
 b=Jhwwy7wPhrC2NOr87/FasxJFVHQWnOhv40i4CTFkY3BKy83UsxDzboC/A9Ay6zB1wAAr91
 W96SH0CJH+3aOyMM0Inp+x98RKU9tTE6ULjz2XptlVY/oJ0RZVMyoEr/nQKjSKUK9Wm/yY
 GW+GiNwujnGZKllDfiAZIU7z+x9kLlU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-F-5X05euMwOcsljF1EYCwA-1; Wed, 09 Dec 2020 12:08:52 -0500
X-MC-Unique: F-5X05euMwOcsljF1EYCwA-1
Received: by mail-qk1-f200.google.com with SMTP id z129so1516402qkb.13
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BAvF4aO/uVkLC5sMDyd70RK51ZlPJ4N8Kvsowu313nM=;
 b=Y1znCV5A+sEHjUkQWYDbhGdzxAv1l4DC+K2TfD8rrbzuWZlzvUYddDGZ9F/DecUQXy
 va+H4wpsC/a0zqjVF/uuu3+Q9G1h59pQ2h37lvSlJ4AUY8gk4iz8ze9Tt3rl+uLOg0Of
 qfVpUoTdYiHjUF2Q4B88RsZ5L5ANOsS3//6cre3tzF+M/EvFUmFMkiz8Jrlmm7m+gomp
 FgMHD8rmSudV6GtF9zW/nLYRVHCT4tW5hozls68JROziGjaIE6oaQ3GyJG0NtOloNVPs
 xq6JvC1aXwR2vQMLuGLDkkkhZ1CqdnoxFbGpdlNSIzzBzQeDergpyFEXQMcAo4QzeA+6
 hD+Q==
X-Gm-Message-State: AOAM531r1fxnOfc2Ls47y4UA1gyIOZxDWqJrlBUg/G9JlRNXThQoNH6z
 BfqA6fKXjh1sXAvLU8Eun6Ea0rB1bX5ZjMDRPIIm1hQxLBwG3+w3ZjkSUG+xl46/fuu2JEXCBsw
 vC2ZxoaEVaAliEFcnpUfE8l/DQtixj6Q=
X-Received: by 2002:a05:620a:b0e:: with SMTP id
 t14mr4053357qkg.484.1607533731397; 
 Wed, 09 Dec 2020 09:08:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJys3U2Bs1iNsuxs3nVeT5GKyB90P1DnfUjosr+fZTdxItuetNZEeeXC4p3taqaoJppCTAT2nXawYyeAisnpeDw=
X-Received: by 2002:a05:620a:b0e:: with SMTP id
 t14mr4053307qkg.484.1607533730962; 
 Wed, 09 Dec 2020 09:08:50 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-8-eperezma@redhat.com>
 <20201207174233.GN203660@stefanha-x1.localdomain>
In-Reply-To: <20201207174233.GN203660@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 9 Dec 2020 18:08:14 +0100
Message-ID: <CAJaqyWfiMsRP9FgSv7cOj=3jHx=DJS7hRJTMbRcTTHHWng0eKg@mail.gmail.com>
Subject: Re: [RFC PATCH 07/27] vhost: Route guest->host notification through
 qemu
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 7, 2020 at 6:42 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, Nov 20, 2020 at 07:50:45PM +0100, Eugenio P=C3=A9rez wrote:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-sw-lm-ring.h |  26 +++++++++
> >  include/hw/virtio/vhost.h    |   3 ++
> >  hw/virtio/vhost-sw-lm-ring.c |  60 +++++++++++++++++++++
> >  hw/virtio/vhost.c            | 100 +++++++++++++++++++++++++++++++++--
> >  hw/virtio/meson.build        |   2 +-
> >  5 files changed, 187 insertions(+), 4 deletions(-)
> >  create mode 100644 hw/virtio/vhost-sw-lm-ring.h
> >  create mode 100644 hw/virtio/vhost-sw-lm-ring.c
> >
> > diff --git a/hw/virtio/vhost-sw-lm-ring.h b/hw/virtio/vhost-sw-lm-ring.=
h
> > new file mode 100644
> > index 0000000000..86dc081b93
> > --- /dev/null
> > +++ b/hw/virtio/vhost-sw-lm-ring.h
> > @@ -0,0 +1,26 @@
> > +/*
> > + * vhost software live migration ring
> > + *
> > + * SPDX-FileCopyrightText: Red Hat, Inc. 2020
> > + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@redhat.c=
om>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#ifndef VHOST_SW_LM_RING_H
> > +#define VHOST_SW_LM_RING_H
> > +
> > +#include "qemu/osdep.h"
> > +
> > +#include "hw/virtio/virtio.h"
> > +#include "hw/virtio/vhost.h"
> > +
> > +typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>
> Here it's called a shadow virtqueue while the file calls it a
> sw-lm-ring. Please use a single name.
>

I will switch to shadow virtqueue.

> > +
> > +bool vhost_vring_kick(VhostShadowVirtqueue *vq);
>
> vhost_shadow_vq_kick()?
>
> > +
> > +VhostShadowVirtqueue *vhost_sw_lm_shadow_vq(struct vhost_dev *dev, int=
 idx);
>
> vhost_dev_get_shadow_vq()? This could be in include/hw/virtio/vhost.h
> with the other vhost_dev_*() functions.
>

I agree, that is a better place.

> > +
> > +void vhost_sw_lm_shadow_vq_free(VhostShadowVirtqueue *vq);
>
> Hmm...now I wonder what the lifecycle is. Does vhost_sw_lm_shadow_vq()
> allocate it?
>
> Please add doc comments explaining these functions either in this header
> file or in vhost-sw-lm-ring.c.
>

Will document.

> > +
> > +#endif
> > diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> > index b5b7496537..93cc3f1ae3 100644
> > --- a/include/hw/virtio/vhost.h
> > +++ b/include/hw/virtio/vhost.h
> > @@ -54,6 +54,8 @@ struct vhost_iommu {
> >      QLIST_ENTRY(vhost_iommu) iommu_next;
> >  };
> >
> > +typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> > +
> >  typedef struct VhostDevConfigOps {
> >      /* Vhost device config space changed callback
> >       */
> > @@ -83,6 +85,7 @@ struct vhost_dev {
> >      bool started;
> >      bool log_enabled;
> >      uint64_t log_size;
> > +    VhostShadowVirtqueue *sw_lm_shadow_vq[2];
>
> The hardcoded 2 is probably for single-queue virtio-net? I guess this
> will eventually become VhostShadowVirtqueue *shadow_vqs or
> VhostShadowVirtqueue **shadow_vqs, depending on whether each one should
> be allocated individually.
>

Yes, I will switch to one way or another for the next series.

> >      VirtIOHandleOutput sw_lm_vq_handler;
> >      Error *migration_blocker;
> >      const VhostOps *vhost_ops;
> > diff --git a/hw/virtio/vhost-sw-lm-ring.c b/hw/virtio/vhost-sw-lm-ring.=
c
> > new file mode 100644
> > index 0000000000..0192e77831
> > --- /dev/null
> > +++ b/hw/virtio/vhost-sw-lm-ring.c
> > @@ -0,0 +1,60 @@
> > +/*
> > + * vhost software live migration ring
> > + *
> > + * SPDX-FileCopyrightText: Red Hat, Inc. 2020
> > + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@redhat.c=
om>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "hw/virtio/vhost-sw-lm-ring.h"
> > +#include "hw/virtio/vhost.h"
> > +
> > +#include "standard-headers/linux/vhost_types.h"
> > +#include "standard-headers/linux/virtio_ring.h"
> > +
> > +#include "qemu/event_notifier.h"
> > +
> > +typedef struct VhostShadowVirtqueue {
> > +    EventNotifier hdev_notifier;
> > +    VirtQueue *vq;
> > +} VhostShadowVirtqueue;
> > +
> > +static inline bool vhost_vring_should_kick(VhostShadowVirtqueue *vq)
> > +{
> > +    return virtio_queue_get_used_notify_split(vq->vq);
> > +}
> > +
> > +bool vhost_vring_kick(VhostShadowVirtqueue *vq)
> > +{
> > +    return vhost_vring_should_kick(vq) ? event_notifier_set(&vq->hdev_=
notifier)
> > +                                       : true;
> > +}
>
> How is the return value used? event_notifier_set() returns -errno so
> this function returns false on success, and true when notifications are
> disabled or event_notifier_set() failed. I'm not sure this return value
> can be used for anything.
>

I think you are right, this is bad. It could be used for retry, but
the failure is unlikely and the fail path is easy to add in the future
if needed.

It will be void.

> > +
> > +VhostShadowVirtqueue *vhost_sw_lm_shadow_vq(struct vhost_dev *dev, int=
 idx)
>
> I see now that this function allocates the VhostShadowVirtqueue. Maybe
> adding _new() to the name would make that clear?
>

Yes, I will rename.

> > +{
> > +    struct vhost_vring_file file =3D {
> > +        .index =3D idx
> > +    };
> > +    VirtQueue *vq =3D virtio_get_queue(dev->vdev, idx);
> > +    VhostShadowVirtqueue *svq;
> > +    int r;
> > +
> > +    svq =3D g_new0(VhostShadowVirtqueue, 1);
> > +    svq->vq =3D vq;
> > +
> > +    r =3D event_notifier_init(&svq->hdev_notifier, 0);
> > +    assert(r =3D=3D 0);
> > +
> > +    file.fd =3D event_notifier_get_fd(&svq->hdev_notifier);
> > +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &file);
> > +    assert(r =3D=3D 0);
> > +
> > +    return svq;
> > +}
>
> I guess there are assumptions about the status of the device? Does the
> virtqueue need to be disabled when this function is called?
>

Yes. Maybe an assertion checking the notification state?

> > +
> > +void vhost_sw_lm_shadow_vq_free(VhostShadowVirtqueue *vq)
> > +{
> > +    event_notifier_cleanup(&vq->hdev_notifier);
> > +    g_free(vq);
> > +}
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 9cbd52a7f1..a55b684b5f 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -13,6 +13,8 @@
> >   * GNU GPL, version 2 or (at your option) any later version.
> >   */
> >
> > +#include "hw/virtio/vhost-sw-lm-ring.h"
> > +
> >  #include "qemu/osdep.h"
> >  #include "qapi/error.h"
> >  #include "hw/virtio/vhost.h"
> > @@ -61,6 +63,20 @@ bool vhost_has_free_slot(void)
> >      return slots_limit > used_memslots;
> >  }
> >
> > +static struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vde=
v)
> > +{
> > +    struct vhost_dev *hdev;
> > +
> > +    QLIST_FOREACH(hdev, &vhost_devices, entry) {
> > +        if (hdev->vdev =3D=3D vdev) {
> > +            return hdev;
> > +        }
> > +    }
> > +
> > +    assert(hdev);
> > +    return NULL;
> > +}
> > +
> >  static bool vhost_dev_can_log(const struct vhost_dev *hdev)
> >  {
> >      return hdev->features & (0x1ULL << VHOST_F_LOG_ALL);
> > @@ -148,6 +164,12 @@ static int vhost_sync_dirty_bitmap(struct vhost_de=
v *dev,
> >      return 0;
> >  }
> >
> > +static void vhost_log_sync_nop(MemoryListener *listener,
> > +                               MemoryRegionSection *section)
> > +{
> > +    return;
> > +}
> > +
> >  static void vhost_log_sync(MemoryListener *listener,
> >                            MemoryRegionSection *section)
> >  {
> > @@ -928,6 +950,71 @@ static void vhost_log_global_stop(MemoryListener *=
listener)
> >      }
> >  }
> >
> > +static void handle_sw_lm_vq(VirtIODevice *vdev, VirtQueue *vq)
> > +{
> > +    struct vhost_dev *hdev =3D vhost_dev_from_virtio(vdev);
>
> If this lookup becomes a performance bottleneck there are other options
> for determining the vhost_dev. For example VirtIODevice could have a
> field for stashing the vhost_dev pointer.
>

I would like to have something like that for the definitive patch
series, yes. I would not like to increase the virtio knowledge of
vhost, but it seems the most straightforward change for it.

> > +    uint16_t idx =3D virtio_get_queue_index(vq);
> > +
> > +    VhostShadowVirtqueue *svq =3D hdev->sw_lm_shadow_vq[idx];
> > +
> > +    vhost_vring_kick(svq);
> > +}
>
> I'm a confused. Do we need to pop elements from vq and push equivalent
> elements onto svq before kicking? Either a todo comment is missing or I
> misunderstand how this works.
>

At this commit only notifications are forwarded, buffers are still
fetched directly from the guest. A TODO comment would have been
helpful, yes :).

> > +
> > +static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
> > +{
> > +    int idx;
> > +
> > +    vhost_dev_enable_notifiers(dev, dev->vdev);
> > +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > +        vhost_sw_lm_shadow_vq_free(dev->sw_lm_shadow_vq[idx]);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int vhost_sw_live_migration_start(struct vhost_dev *dev)
> > +{
> > +    int idx;
> > +
> > +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > +        dev->sw_lm_shadow_vq[idx] =3D vhost_sw_lm_shadow_vq(dev, idx);
> > +    }
> > +
> > +    vhost_dev_disable_notifiers(dev, dev->vdev);
>
> There is a race condition if the guest kicks the vq while this is
> happening. The shadow vq hdev_notifier needs to be set so the vhost
> device checks the virtqueue for requests that slipped in during the
> race window.
>

I'm not sure if I follow you. If I understand correctly,
vhost_dev_disable_notifiers calls virtio_bus_cleanup_host_notifier,
and the latter calls virtio_queue_host_notifier_read. That's why the
documentation says "This might actually run the qemu handlers right
away, so virtio in qemu must be completely setup when this is
called.". Am I missing something?

> > +
> > +    return 0;
> > +}
> > +
> > +static int vhost_sw_live_migration_enable(struct vhost_dev *dev,
> > +                                          bool enable_lm)
> > +{
> > +    if (enable_lm) {
> > +        return vhost_sw_live_migration_start(dev);
> > +    } else {
> > +        return vhost_sw_live_migration_stop(dev);
> > +    }
> > +}
> > +
> > +static void vhost_sw_lm_global_start(MemoryListener *listener)
> > +{
> > +    int r;
> > +
> > +    r =3D vhost_migration_log(listener, true, vhost_sw_live_migration_=
enable);
> > +    if (r < 0) {
> > +        abort();
> > +    }
> > +}
> > +
> > +static void vhost_sw_lm_global_stop(MemoryListener *listener)
> > +{
> > +    int r;
> > +
> > +    r =3D vhost_migration_log(listener, false, vhost_sw_live_migration=
_enable);
> > +    if (r < 0) {
> > +        abort();
> > +    }
> > +}
> > +
> >  static void vhost_log_start(MemoryListener *listener,
> >                              MemoryRegionSection *section,
> >                              int old, int new)
> > @@ -1334,9 +1421,14 @@ int vhost_dev_init(struct vhost_dev *hdev, void =
*opaque,
> >          .region_nop =3D vhost_region_addnop,
> >          .log_start =3D vhost_log_start,
> >          .log_stop =3D vhost_log_stop,
> > -        .log_sync =3D vhost_log_sync,
> > -        .log_global_start =3D vhost_log_global_start,
> > -        .log_global_stop =3D vhost_log_global_stop,
> > +        .log_sync =3D !vhost_dev_can_log(hdev) ?
> > +                    vhost_log_sync_nop :
> > +                    vhost_log_sync,
>
> Why is this change necessary now? It's not clear to me why it was
> previously okay to call vhost_log_sync().
>

This is only needed because I'm hijacking the vhost log system to know
when migration has started. Since vhost log is not allocated, the call
to vhost_log_sync() will fail to write in the bitmap.

Likely, this change will be discarded in the final patch series, since
another way of detecting live migration will be used.

> > +        .log_global_start =3D !vhost_dev_can_log(hdev) ?
> > +                            vhost_sw_lm_global_start :
> > +                            vhost_log_global_start,
> > +        .log_global_stop =3D !vhost_dev_can_log(hdev) ? vhost_sw_lm_gl=
obal_stop :
> > +                                                      vhost_log_global=
_stop,
> >          .eventfd_add =3D vhost_eventfd_add,
> >          .eventfd_del =3D vhost_eventfd_del,
> >          .priority =3D 10
> > @@ -1364,6 +1456,8 @@ int vhost_dev_init(struct vhost_dev *hdev, void *=
opaque,
> >              error_free(hdev->migration_blocker);
> >              goto fail_busyloop;
> >          }
> > +    } else {
> > +        hdev->sw_lm_vq_handler =3D handle_sw_lm_vq;
> >      }
> >
> >      hdev->mem =3D g_malloc0(offsetof(struct vhost_memory, regions));
> > diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> > index fbff9bc9d4..17419cb13e 100644
> > --- a/hw/virtio/meson.build
> > +++ b/hw/virtio/meson.build
> > @@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vh=
ost-stub.c'))
> >
> >  virtio_ss =3D ss.source_set()
> >  virtio_ss.add(files('virtio.c'))
> > -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-b=
ackend.c'))
> > +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-b=
ackend.c', 'vhost-sw-lm-ring.c'))
> >  virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'=
))
> >  virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'=
))
> >  virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-ba=
lloon.c'))
> > --
> > 2.18.4
> >


