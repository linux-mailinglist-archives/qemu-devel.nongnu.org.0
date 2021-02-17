Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E1731DDCB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 18:01:39 +0100 (CET)
Received: from localhost ([::1]:57530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCQCo-0007mB-D8
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 12:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCQ8P-00063W-Gi
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:57:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCQ8L-0005Xk-C5
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613581019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UmI/vuDLIIHV6tumVN5Dm72SbZPYzsZJyTAA4XkAKhk=;
 b=jQg0byNNJMGmld9K1NbnNCyqZebcsQzBY9EE0tLhPr6VByAOPcg53m2DRZyT3oSnAXF3OI
 Bcl/pTVtP2D0vknETxQaY/lUlU5by8cCrMG/zKXoAIeMyiuOYErrCzQBzLq5HD/PY9AWPn
 sTE6dQIqDoyXFGdMJgYXatLE+4ARdMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-mKOe-9AsOrynC7Y1jU2R3g-1; Wed, 17 Feb 2021 11:56:55 -0500
X-MC-Unique: mKOe-9AsOrynC7Y1jU2R3g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54BB5874982;
 Wed, 17 Feb 2021 16:56:53 +0000 (UTC)
Received: from localhost (ovpn-115-102.ams2.redhat.com [10.36.115.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44FDC19C46;
 Wed, 17 Feb 2021 16:56:49 +0000 (UTC)
Date: Wed, 17 Feb 2021 16:56:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v2 6/7] vhost: Route guest->host notification through
 shadow virtqueue
Message-ID: <20210217165648.GH269203@stefanha-x1.localdomain>
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-7-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209153757.1653598-7-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hAW+M2+FUO+onfmf"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Rob Miller <rob.miller@broadcom.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--hAW+M2+FUO+onfmf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 04:37:56PM +0100, Eugenio P=E9rez wrote:
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index ac963bf23d..884818b109 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -55,6 +55,8 @@ struct vhost_iommu {
>      QLIST_ENTRY(vhost_iommu) iommu_next;
>  };
> =20
> +typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;

There is already another declaration in
hw/virtio/vhost-shadow-virtqueue.h. Should vhost.h include
vhost-shadow-virtqueue.h?

This is becoming confusing:
1. typedef in vhost-shadow-virtqueue.h
2. typedef in vhost.h
3. typedef in vhost-shadow-virtqueue.c

3 typedefs is a bit much :). I suggest:
1. typedef in vhost-shadow-virtqueue.h
2. #include "vhost-shadow-virtqueue.h" in vhost.h
3. struct VhostShadowVirtqueue (no typedef redefinition) in vhost-shadow-vi=
rtqueue.c

That should make the code easier to understand, navigate with tools, and
if a change is made (e.g. renaming the struct) then it won't be
necessary to change things in 3 places.

> +
>  typedef struct VhostDevConfigOps {
>      /* Vhost device config space changed callback
>       */
> @@ -83,7 +85,9 @@ struct vhost_dev {
>      uint64_t backend_cap;
>      bool started;
>      bool log_enabled;
> +    bool sw_lm_enabled;

Rename to shadow_vqs_enabled?

>      uint64_t log_size;
> +    VhostShadowVirtqueue **shadow_vqs;
>      Error *migration_blocker;
>      const VhostOps *vhost_ops;
>      void *opaque;
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index b5d2645ae0..01f282d434 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -8,9 +8,12 @@
>   */
> =20
>  #include "hw/virtio/vhost-shadow-virtqueue.h"
> +#include "hw/virtio/vhost.h"
> +
> +#include "standard-headers/linux/vhost_types.h"
> =20
>  #include "qemu/error-report.h"
> -#include "qemu/event_notifier.h"
> +#include "qemu/main-loop.h"
> =20
>  /* Shadow virtqueue to relay notifications */
>  typedef struct VhostShadowVirtqueue {
> @@ -18,8 +21,95 @@ typedef struct VhostShadowVirtqueue {
>      EventNotifier kick_notifier;
>      /* Shadow call notifier, sent to vhost */
>      EventNotifier call_notifier;
> +
> +    /* Borrowed virtqueue's guest to host notifier. */
> +    EventNotifier host_notifier;

The purpose of these EventNotifier fields is not completely clear to me.
Here is how I interpret the comments:

1. The vhost device is set up to use kick_notifier/call_notifier when
   the shadow vq is enabled.

2. host_notifier is the guest-visible vq's host notifier. This is set up
   when the shadow vq is enabled.

But I'm not confident this is correct. Maybe you could expand the
comment to make it clear what is happening?

> +
> +    /* Virtio queue shadowing */
> +    VirtQueue *vq;
>  } VhostShadowVirtqueue;
> =20
> +/* Forward guest notifications */
> +static void vhost_handle_guest_kick(EventNotifier *n)
> +{
> +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueue,
> +                                             host_notifier);
> +
> +    if (event_notifier_test_and_clear(n)) {
> +        event_notifier_set(&svq->kick_notifier);
> +    }
> +}

This function looks incomplete. You can make review easier by indicating
the state of the code:

  /* TODO pop requests from vq and put them onto vhost vq */

I'm not sure why it's useful to include this incomplete function in the
patch. Maybe the host notifier is already intercepted by the
guest-visible vq is still mapped directly to the vhost vq so this works?
An explanation in comments or the commit description would be helpful.

> +
> +/*
> + * Start shadow virtqueue operation.
> + * @dev vhost device
> + * @hidx vhost virtqueue index
> + * @svq Shadow Virtqueue
> + *
> + * Run in RCU context
> + */
> +bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
> +                               unsigned idx,
> +                               VhostShadowVirtqueue *svq)
> +{
> +    EventNotifier *vq_host_notifier =3D virtio_queue_get_host_notifier(s=
vq->vq);
> +    struct vhost_vring_file kick_file =3D {
> +        .index =3D idx,
> +        .fd =3D event_notifier_get_fd(&svq->kick_notifier),
> +    };
> +    int r;
> +
> +    /* Check that notifications are still going directly to vhost dev */
> +    assert(virtio_queue_host_notifier_status(svq->vq));
> +
> +    event_notifier_init_fd(&svq->host_notifier,
> +                           event_notifier_get_fd(vq_host_notifier));
> +    event_notifier_set_handler(&svq->host_notifier, vhost_handle_guest_k=
ick);

If I understand correctly svq->host_notifier only exists as an easy way
to use container_of() in vhost_handle_guest_kick?

svq->host_notifier does not actually own the fd and therefore
event_notifier_cleanup() must never be called on it?

Please document this.

> +
> +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
> +    if (unlikely(r !=3D 0)) {
> +        error_report("Couldn't set kick fd: %s", strerror(errno));
> +        goto err_set_vring_kick;
> +    }
> +
> +    /* Check for pending notifications from the guest */
> +    vhost_handle_guest_kick(&svq->host_notifier);
> +
> +    return true;

host_notifier is still registered with the vhost device so now the
kernel vhost thread and QEMU are both monitoring the ioeventfd at the
same time? Did I miss a vhost_set_vring_call() somewhere?

> +
> +err_set_vring_kick:
> +    event_notifier_set_handler(&svq->host_notifier, NULL);
> +
> +    return false;
> +}
> +
> +/*
> + * Stop shadow virtqueue operation.
> + * @dev vhost device
> + * @idx vhost queue index
> + * @svq Shadow Virtqueue
> + *
> + * Run in RCU context
> + */
> +void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
> +                              unsigned idx,
> +                              VhostShadowVirtqueue *svq)
> +{
> +    EventNotifier *vq_host_notifier =3D virtio_queue_get_host_notifier(s=
vq->vq);
> +    struct vhost_vring_file kick_file =3D {
> +        .index =3D idx,
> +        .fd =3D event_notifier_get_fd(vq_host_notifier),
> +    };
> +    int r;
> +
> +    /* Restore vhost kick */
> +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
> +    /* Cannot do a lot of things */
> +    assert(r =3D=3D 0);
> +
> +    event_notifier_set_handler(&svq->host_notifier, NULL);

It may be necessary to call event_notifier_set(vq_host_notifier) before
vhost_set_vring_kick() so that the vhost kernel thread looks at the
vring immediately. That covers the case where svq->kick_notifier was
just set but not yet handled by the vhost kernel thread.

I'm not 100% sure this race condition can occur, but couldn't find
anything that prevents it.

> +err:
> +    for (; idx >=3D 0; --idx) {
> +        vhost_shadow_vq_free(dev->shadow_vqs[idx]);
> +    }
> +    g_free(dev->shadow_vqs[idx]);

Should this be g_free(dev->shadow_vqs)?

--hAW+M2+FUO+onfmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAtStAACgkQnKSrs4Gr
c8jvBwf/U1/0WLtOf5uxvrh5ccOTzVBf1csrWT+FZU77xu8307DgJuqBlCM/m0yT
B+lXxvlVCrr2gJaBPdaSmXe5YH+bJzFax4aGBTbT7S1zt5w9RPLVt9GSDc9w9HjB
2DeYNy37oE/XIgO9OlWWHzCCFEAiBC0RiiydeN4LwrmTjGmn9NnpDVL1+Q+TFRqp
C0BcN2VO9LT5uyHFWKY4dh857xFIzFsZG9evuDpHkngTjx6GfFiAdZenSHIq+FBD
3ch/PIeDgNbMqk9q3NzczkaChVj73WoZaBNApYuFz4m/XrJj3nu2FGWAUXYXJizD
JSsTUoQ7Ul4IuKIH/DiorZUq4zZwPA==
=kDMB
-----END PGP SIGNATURE-----

--hAW+M2+FUO+onfmf--


