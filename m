Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A0331E00F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:16:44 +0100 (CET)
Received: from localhost ([::1]:37856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTFa-0002vd-GX
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:16:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lCTBs-0008Re-5p
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:12:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lCTBo-0004Yl-T3
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613592767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nIbdFrDwDYfvd/DLx0lDqmvqV3Ssly0Ks9v6Lc4nQ8Q=;
 b=XIGYJMw/HZPjfc1JXT7I69kX+XV9bUrgv7BWiwR+24RBPb9G3JydQsLxgP1fZIcMxcPbd8
 3HL4AfJpvfeEKedt12Is3Ah4sRDYIo0om0kcFbxUyESuI7p+ZWhT2xnDEsqNdjJmRRMR+s
 OpxLsG4zMSLjP+1tMyYN0ANCd5LCS9M=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-rz6MyZ8cOsO_7FxFLgUsJg-1; Wed, 17 Feb 2021 15:12:45 -0500
X-MC-Unique: rz6MyZ8cOsO_7FxFLgUsJg-1
Received: by mail-qv1-f71.google.com with SMTP id k4so8085049qvf.8
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:12:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nIbdFrDwDYfvd/DLx0lDqmvqV3Ssly0Ks9v6Lc4nQ8Q=;
 b=aSzIsNqx5nhuaTHqb6Lg4S0xSk/nIiCjAoRFwJoBn1++o0pFotn2GSEW15igYlrvgv
 yzqv6LWd9lRx1ggQOdGoKkPFHgfD0kFYUj5z0uq97zeA6Z8Xz+rUkHANHvykxBooq6Oc
 f+gKmd/T+ItQcN649oSNxrL3otD76Cwd6tmPfOl7ehffLlsmvXZ9AmFKiqOp6GXFKoz9
 Q1EGUxwTNB/HK/WdFFyYKVAQ86CO8xnMUW0GvML3O6EsOn5HPAFriw/vIqRM1aoeZ4Y6
 8ILTG7aTIRKfHMpvGwOopSy7ZXJfSjHyxsVqwVuwUdFxe2xQrUKrz58baUbAMc9mozsR
 x01w==
X-Gm-Message-State: AOAM532gHxfPIY0l0ZjEIEEsE5Hz2mtgyrOfDLPwzx7WEhJdY/mfGqEJ
 APIKeQGkCSxcTDUKdVK9w0uP/kZXw/tk1JW0yR28xW1/70sMGJIqsFp4EkLTRAsxSkPBqZZXkDc
 +ydOxDOgDWg2hTej7Rw4w6GoPS8igL7o=
X-Received: by 2002:a05:6214:2022:: with SMTP id 2mr868914qvf.39.1613592758357; 
 Wed, 17 Feb 2021 12:12:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1V4SdvD5KkYpjoTrehj5erRo1r2pNnPU5kbjSBQ869q3qU6KZ51xsQXvCgfNlrFN7EaVHRCPhhyzR69otuHM=
X-Received: by 2002:a05:6214:2022:: with SMTP id 2mr867891qvf.39.1613592743282; 
 Wed, 17 Feb 2021 12:12:23 -0800 (PST)
MIME-Version: 1.0
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-7-eperezma@redhat.com>
 <20210217165648.GH269203@stefanha-x1.localdomain>
In-Reply-To: <20210217165648.GH269203@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 17 Feb 2021 21:11:47 +0100
Message-ID: <CAJaqyWfT+iEXXbXoZscmpbnpBpFY-ZmBUhNR3t8YV=KmKMXHaw@mail.gmail.com>
Subject: Re: [RFC v2 6/7] vhost: Route guest->host notification through shadow
 virtqueue
To: Stefan Hajnoczi <stefanha@redhat.com>
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
 Juan Quintela <quintela@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 17, 2021 at 5:56 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>
> On Tue, Feb 09, 2021 at 04:37:56PM +0100, Eugenio P=C3=A9rez wrote:
> > diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> > index ac963bf23d..884818b109 100644
> > --- a/include/hw/virtio/vhost.h
> > +++ b/include/hw/virtio/vhost.h
> > @@ -55,6 +55,8 @@ struct vhost_iommu {
> >      QLIST_ENTRY(vhost_iommu) iommu_next;
> >  };
> >
> > +typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>
> There is already another declaration in
> hw/virtio/vhost-shadow-virtqueue.h. Should vhost.h include
> vhost-shadow-virtqueue.h?
>
> This is becoming confusing:
> 1. typedef in vhost-shadow-virtqueue.h
> 2. typedef in vhost.h
> 3. typedef in vhost-shadow-virtqueue.c
>
> 3 typedefs is a bit much :). I suggest:
> 1. typedef in vhost-shadow-virtqueue.h
> 2. #include "vhost-shadow-virtqueue.h" in vhost.h
> 3. struct VhostShadowVirtqueue (no typedef redefinition) in vhost-shadow-=
virtqueue.c
>
> That should make the code easier to understand, navigate with tools, and
> if a change is made (e.g. renaming the struct) then it won't be
> necessary to change things in 3 places.
>

Totally agree.

> > +
> >  typedef struct VhostDevConfigOps {
> >      /* Vhost device config space changed callback
> >       */
> > @@ -83,7 +85,9 @@ struct vhost_dev {
> >      uint64_t backend_cap;
> >      bool started;
> >      bool log_enabled;
> > +    bool sw_lm_enabled;
>
> Rename to shadow_vqs_enabled?
>

Ok, will change.

> >      uint64_t log_size;
> > +    VhostShadowVirtqueue **shadow_vqs;
> >      Error *migration_blocker;
> >      const VhostOps *vhost_ops;
> >      void *opaque;
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index b5d2645ae0..01f282d434 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -8,9 +8,12 @@
> >   */
> >
> >  #include "hw/virtio/vhost-shadow-virtqueue.h"
> > +#include "hw/virtio/vhost.h"
> > +
> > +#include "standard-headers/linux/vhost_types.h"
> >
> >  #include "qemu/error-report.h"
> > -#include "qemu/event_notifier.h"
> > +#include "qemu/main-loop.h"
> >
> >  /* Shadow virtqueue to relay notifications */
> >  typedef struct VhostShadowVirtqueue {
> > @@ -18,8 +21,95 @@ typedef struct VhostShadowVirtqueue {
> >      EventNotifier kick_notifier;
> >      /* Shadow call notifier, sent to vhost */
> >      EventNotifier call_notifier;
> > +
> > +    /* Borrowed virtqueue's guest to host notifier. */
> > +    EventNotifier host_notifier;
>
> The purpose of these EventNotifier fields is not completely clear to me.
> Here is how I interpret the comments:
>
> 1. The vhost device is set up to use kick_notifier/call_notifier when
>    the shadow vq is enabled.
>

Right. These are the ones the vhost backend sees, so I will add this to the=
 doc.

> 2. host_notifier is the guest-visible vq's host notifier. This is set up
>    when the shadow vq is enabled.
>

If by guest-visible you mean that the guest can notify the device
though it, yes. Names are used as in qemu virtqueue device code.

As you point later in the code, is borrowed (and not just referenced
through a pointer) to reduce qemu VirtIODevice dependency.

> But I'm not confident this is correct. Maybe you could expand the
> comment to make it clear what is happening?
>
> > +
> > +    /* Virtio queue shadowing */
> > +    VirtQueue *vq;
> >  } VhostShadowVirtqueue;
> >
> > +/* Forward guest notifications */
> > +static void vhost_handle_guest_kick(EventNotifier *n)
> > +{
> > +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueue=
,
> > +                                             host_notifier);
> > +
> > +    if (event_notifier_test_and_clear(n)) {
> > +        event_notifier_set(&svq->kick_notifier);
> > +    }
> > +}
>
> This function looks incomplete. You can make review easier by indicating
> the state of the code:
>
>   /* TODO pop requests from vq and put them onto vhost vq */
>

Only guest -> device notifications are forwarded at this point,
buffers aren't. The vhost backend/device still needs to access the
latter the regular way, but guest -> device notifications now make an
extra jump.

> I'm not sure why it's useful to include this incomplete function in the
> patch.

It has little use at this moment except logging that notifications are
being forwarded through qemu. Once notifications are being forwarded
properly, we can develop buffer treatment on top of this.

In my debugging it helps me to bisect the problem if the network loses
connectivity when I enable shadow virtqueue: If it works in this
commit, but not in 7/7 ("vhost: Route host->guest notification through
shadow virtqueue"), I know that is the latter commit fault. If it
works on 7/7, but it doesn't work on commits that exchange/translates
buffers through qemu [1], I know host->guest notifications are being
forwarded OK and the problem is elsewhere.

> Maybe the host notifier is already intercepted by the
> guest-visible vq is still mapped directly to the vhost vq so this works?
> An explanation in comments or the commit description would be helpful.
>

I'm not sure what you mean in the first part, but descriptors and
buffers are still mapped in vhost device, yes.

> > +
> > +/*
> > + * Start shadow virtqueue operation.
> > + * @dev vhost device
> > + * @hidx vhost virtqueue index
> > + * @svq Shadow Virtqueue
> > + *
> > + * Run in RCU context
> > + */
> > +bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
> > +                               unsigned idx,
> > +                               VhostShadowVirtqueue *svq)
> > +{
> > +    EventNotifier *vq_host_notifier =3D virtio_queue_get_host_notifier=
(svq->vq);
> > +    struct vhost_vring_file kick_file =3D {
> > +        .index =3D idx,
> > +        .fd =3D event_notifier_get_fd(&svq->kick_notifier),
> > +    };
> > +    int r;
> > +
> > +    /* Check that notifications are still going directly to vhost dev =
*/
> > +    assert(virtio_queue_host_notifier_status(svq->vq));
> > +
> > +    event_notifier_init_fd(&svq->host_notifier,
> > +                           event_notifier_get_fd(vq_host_notifier));
> > +    event_notifier_set_handler(&svq->host_notifier, vhost_handle_guest=
_kick);
>
> If I understand correctly svq->host_notifier only exists as an easy way
> to use container_of() in vhost_handle_guest_kick?
>
> svq->host_notifier does not actually own the fd and therefore
> event_notifier_cleanup() must never be called on it?
>
> Please document this.
>

Right, will document better.

> > +
> > +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
> > +    if (unlikely(r !=3D 0)) {
> > +        error_report("Couldn't set kick fd: %s", strerror(errno));
> > +        goto err_set_vring_kick;
> > +    }
> > +
> > +    /* Check for pending notifications from the guest */
> > +    vhost_handle_guest_kick(&svq->host_notifier);
> > +
> > +    return true;
>
(> host_notifier is still registered with the vhost device so now the
> kernel vhost thread and QEMU are both monitoring the ioeventfd at the
> same time?

The vhost device is not monitoring host_notifier, since we replaced it
with previous vhost_set_vring_kick(dev, &kick_file).

> Did I miss a vhost_set_vring_call() somewhere?
>

It is in the next commit. This one just intercepts guest->device notificati=
ons.

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
> > + *
> > + * Run in RCU context
> > + */
> > +void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
> > +                              unsigned idx,
> > +                              VhostShadowVirtqueue *svq)
> > +{
> > +    EventNotifier *vq_host_notifier =3D virtio_queue_get_host_notifier=
(svq->vq);
> > +    struct vhost_vring_file kick_file =3D {
> > +        .index =3D idx,
> > +        .fd =3D event_notifier_get_fd(vq_host_notifier),
> > +    };
> > +    int r;
> > +
> > +    /* Restore vhost kick */
> > +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
> > +    /* Cannot do a lot of things */
> > +    assert(r =3D=3D 0);
> > +
> > +    event_notifier_set_handler(&svq->host_notifier, NULL);
>
> It may be necessary to call event_notifier_set(vq_host_notifier) before
> vhost_set_vring_kick() so that the vhost kernel thread looks at the
> vring immediately. That covers the case where svq->kick_notifier was
> just set but not yet handled by the vhost kernel thread.
>
> I'm not 100% sure this race condition can occur, but couldn't find
> anything that prevents it.

As I can see, we should not lose any notifications as long as vhost
kernel thread checks the fd at set vring kick. They are always sent by
the guest, and qemu never kicks it. We would have the same problem in
vhost_virtqueue_start and qemu doesn't kick in it.

However, I'm not sure if we can say that all devices will check it...
Should it be mandated by vDPA?

>
> > +err:
> > +    for (; idx >=3D 0; --idx) {
> > +        vhost_shadow_vq_free(dev->shadow_vqs[idx]);
> > +    }
> > +    g_free(dev->shadow_vqs[idx]);
>
> Should this be g_free(dev->shadow_vqs)?

Right, a big miss again.

Thank you very much for the useful and in- depth review!

[1] Not in this series, but already posted in previous RFC and
obviously the final solution will contain them :).


