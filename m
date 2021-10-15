Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA3942ED71
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:19:46 +0200 (CEST)
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJNS-0006hl-1f
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbJDP-0008Ru-9a
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:09:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbJDM-00047F-0Z
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:09:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634288959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTWtEdVjFoNhp8ZRxvnD1sQobBikkQzpF7loUz0N79s=;
 b=aE/lPWDIhjvMIEos99UDnE30uF+zSICCBOaeBpW9pqLJOKupr1E1F6dFOm3etq3xJOKZMD
 Y1cTQqtjaIT2uQQ0BLnzS3cDKF4Goys715TmQu9qVB7JPVsQjLDO72F/PCFCVegHYDSEs2
 XhroXsUwbrYpSVPS/VCFaP/cu4SyLoA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-efypTMOYOeewvWiFET9osw-1; Fri, 15 Oct 2021 05:09:15 -0400
X-MC-Unique: efypTMOYOeewvWiFET9osw-1
Received: by mail-qt1-f200.google.com with SMTP id
 k1-20020ac80c01000000b002a79e319399so5044134qti.8
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 02:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LTWtEdVjFoNhp8ZRxvnD1sQobBikkQzpF7loUz0N79s=;
 b=POsxfKcVVjuOTvuhIkP6/+4Z0K8AREbRc3qdjw5Eda/FmWYBbO7NdTaOa+jsKmvlxq
 nag9kvGmlHJNLZvnvfJtqGhHU5tDjY8RNup/VdBr8avkZd8cY0215gw++jHlNQHh90lB
 pEQYELWxbghZq4gEeJFNlNYsGgNC5nj/BfQtYHw/rrRzNsseH/na0ey6BD3f246JE6bK
 71hfnpb3hVDlI1PZAVUL3hsKVpCojsvyjJcQWBq7wVYNZqz7fVO3ivYTeSMk9F1Th1sK
 tH9s6ZEvj5IgMnQ17K93jbh8upwc+5ZY4ZMQHfnKc2mr9zjLJbmCiIsQb4xiWYjnzd30
 xzag==
X-Gm-Message-State: AOAM532vGfBl3+eim5xQGi55QcCi+FQ9HpPcjnGoAKekdao+pON/xGSO
 sd2en23kOuium5iuYRinMSzYXShq3+6LfsHZ4GCudRY9RJF4UmfQDWj60/ot7j5d9jJTXH0vl7q
 pLGN0ylcOHdlWJIT/Zb10ic18pPqTMDw=
X-Received: by 2002:ac8:6112:: with SMTP id a18mr11895759qtm.401.1634288954357; 
 Fri, 15 Oct 2021 02:09:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaBopQGPwfmZF799DfH+mK7P3dTkCG3PkdQVLUAtOtvKWh9oF1UPnMGjW+KYYxAtHODaJQjUwnVEDeLkRZfo0=
X-Received: by 2002:ac8:6112:: with SMTP id a18mr11895725qtm.401.1634288953899; 
 Fri, 15 Oct 2021 02:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-9-eperezma@redhat.com>
 <23e17562-719e-44da-3362-97e0ca5ae1ff@redhat.com>
 <CAJaqyWd2joWx3kKz=cJBs4UxZofP7ETkbpg9+cSQSE2MSyBtUg@mail.gmail.com>
 <71de4fae-50b2-1c98-5f47-7c48f0ff4e21@redhat.com>
In-Reply-To: <71de4fae-50b2-1c98-5f47-7c48f0ff4e21@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Oct 2021 11:08:37 +0200
Message-ID: <CAJaqyWeUeGVnpqjgsMzTDxsOvn3u=MDGSQV0a6G8eoLm=d4q1Q@mail.gmail.com>
Subject: Re: [RFC PATCH v4 08/20] vhost: Route guest->host notification
 through shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 15, 2021 at 5:46 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/14 =E4=B8=8B=E5=8D=888:00, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > On Wed, Oct 13, 2021 at 5:27 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> >>> Shadow virtqueue notifications forwarding is disabled when vhost_dev
> >>> stops, so code flow follows usual cleanup.
> >>>
> >>> Also, host notifiers must be disabled at SVQ start,
> >>
> >> Any reason for this?
> >>
> > It will be addressed in a later series, sorry.
> >
> >>> and they will not
> >>> start if SVQ has been enabled when device is stopped. This is trivial
> >>> to address, but it is left out for simplicity at this moment.
> >>
> >> It looks to me this patch also contains the following logics
> >>
> >> 1) codes to enable svq
> >>
> >> 2) codes to let svq to be enabled from QMP.
> >>
> >> I think they need to be split out,
> > I agree that we can split this more, with the code that belongs to SVQ
> > and the code that belongs to vhost-vdpa. it will be addressed in
> > future series.
> >
> >> we may endup with the following
> >> series of patches
> >>
> > With "series of patches" do you mean to send every step in a separated
> > series? There are odds of having the need of modifying code already
> > sent & merged with later ones. If you confirm to me that it is fine, I
> > can do it that way for sure.
>
>
> Sorry for being unclear. I meant it's a sub-series actually of the series=
.
>
>
> >
> >> 1) svq skeleton with enable/disable
> >> 2) route host notifier to svq
> >> 3) route guest notifier to svq
> >> 4) codes to enable svq
> >> 5) enable svq via QMP
> >>
> > I'm totally fine with that, but there is code that is never called if
> > the qmp command is not added. The compiler complains about static
> > functions that are not called, making impossible things like bisecting
> > through these commits, unless I use attribute((unused)) or similar. Or
> > have I missed something?
>
>
> You're right, then I think we can then:
>
> 1) svq skeleton with enable/disable via QMP
> 2) route host notifier to svq
> 3) route guest notifier to svq
>

Got it, I will try to adapt the series.

>
> >
> > We could do that way with the code that belongs to SVQ though, since
> > all of it is declared in headers. But to delay the "enable svq via
> > qmp" to the last one makes debugging harder, as we cannot just enable
> > notifications forwarding with no buffers forwarding.
>
>
> Yes.
>
>
> >
> > If I introduce a change in the notifications code, I can simply go to
> > these commits and enable SVQ for notifications. This way I can have an
> > idea of what part is failing. A similar logic can be applied to other
> > devices than vp_vdpa.
>
>
> vhost-vdpa actually?
>

Not this time :).

I was actually talking about other devices with other features or even
subtle differences because they being hardware instead of software.

For example, vp_vdpa does not use host notifiers at the moment. If I
enable SVQ with only notifications forwarding and not buffer ones, I
can bisect pretty fast that there is a problem in the notifications
forwarding mechanism. This saved me a few times while writing the
series.

There are other ways of reaching the same conclusion of course, and
future developments or fixes to this serie will deprecate this method,
but I think it is a good idea to let the SVQ enabling early in the
serie as a way to test what part of the series is failing.

This is just my opinion of course, and I'm biased by the fact that I'm
the one proposing the series. If it makes the reviewing so hard, I'm
totally in to delay QMP command to the end of the series.

>
> > We would lose it if we

Sorry, I think I sent it without a proper review.

> >
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    qapi/net.json                      |   2 +-
> >>>    hw/virtio/vhost-shadow-virtqueue.h |   8 ++
> >>>    include/hw/virtio/vhost-vdpa.h     |   4 +
> >>>    hw/virtio/vhost-shadow-virtqueue.c | 138 +++++++++++++++++++++++++=
+++-
> >>>    hw/virtio/vhost-vdpa.c             | 116 +++++++++++++++++++++++-
> >>>    5 files changed, 264 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/qapi/net.json b/qapi/net.json
> >>> index a2c30fd455..fe546b0e7c 100644
> >>> --- a/qapi/net.json
> >>> +++ b/qapi/net.json
> >>> @@ -88,7 +88,7 @@
> >>>    #
> >>>    # @enable: true to use the alternate shadow VQ notifications
> >>>    #
> >>> -# Returns: Always error, since SVQ is not implemented at the moment.
> >>> +# Returns: Error if failure, or 'no error' for success.
> >>>    #
> >>>    # Since: 6.2
> >>>    #
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-sha=
dow-virtqueue.h
> >>> index 27ac6388fa..237cfceb9c 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.h
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> >>> @@ -14,6 +14,14 @@
> >>>
> >>>    typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> >>>
> >>> +EventNotifier *vhost_svq_get_svq_call_notifier(VhostShadowVirtqueue =
*svq);
> >>
> >> Let's move this function to another patch since it's unrelated to the
> >> guest->host routing.
> >>
> > Right, I missed it while squashing commits and at later reviews.
> >
> >>> +void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, in=
t call_fd);
> >>> +
> >>> +bool vhost_svq_start(struct vhost_dev *dev, unsigned idx,
> >>> +                     VhostShadowVirtqueue *svq);
> >>> +void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
> >>> +                    VhostShadowVirtqueue *svq);
> >>> +
> >>>    VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx=
);
> >>>
> >>>    void vhost_svq_free(VhostShadowVirtqueue *vq);
> >>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost=
-vdpa.h
> >>> index 0d565bb5bd..48aae59d8e 100644
> >>> --- a/include/hw/virtio/vhost-vdpa.h
> >>> +++ b/include/hw/virtio/vhost-vdpa.h
> >>> @@ -12,6 +12,8 @@
> >>>    #ifndef HW_VIRTIO_VHOST_VDPA_H
> >>>    #define HW_VIRTIO_VHOST_VDPA_H
> >>>
> >>> +#include <gmodule.h>
> >>> +
> >>>    #include "qemu/queue.h"
> >>>    #include "hw/virtio/virtio.h"
> >>>
> >>> @@ -24,6 +26,8 @@ typedef struct vhost_vdpa {
> >>>        int device_fd;
> >>>        uint32_t msg_type;
> >>>        MemoryListener listener;
> >>> +    bool shadow_vqs_enabled;
> >>> +    GPtrArray *shadow_vqs;
> >>>        struct vhost_dev *dev;
> >>>        QLIST_ENTRY(vhost_vdpa) entry;
> >>>        VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> >>> index c4826a1b56..21dc99ab5d 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> >>> @@ -9,9 +9,12 @@
> >>>
> >>>    #include "qemu/osdep.h"
> >>>    #include "hw/virtio/vhost-shadow-virtqueue.h"
> >>> +#include "hw/virtio/vhost.h"
> >>> +
> >>> +#include "standard-headers/linux/vhost_types.h"
> >>>
> >>>    #include "qemu/error-report.h"
> >>> -#include "qemu/event_notifier.h"
> >>> +#include "qemu/main-loop.h"
> >>>
> >>>    /* Shadow virtqueue to relay notifications */
> >>>    typedef struct VhostShadowVirtqueue {
> >>> @@ -19,14 +22,146 @@ typedef struct VhostShadowVirtqueue {
> >>>        EventNotifier kick_notifier;
> >>>        /* Shadow call notifier, sent to vhost */
> >>>        EventNotifier call_notifier;
> >>> +
> >>> +    /*
> >>> +     * Borrowed virtqueue's guest to host notifier.
> >>> +     * To borrow it in this event notifier allows to register on the=
 event
> >>> +     * loop and access the associated shadow virtqueue easily. If we=
 use the
> >>> +     * VirtQueue, we don't have an easy way to retrieve it.
> >>> +     *
> >>> +     * So shadow virtqueue must not clean it, or we would lose VirtQ=
ueue one.
> >>> +     */
> >>> +    EventNotifier host_notifier;
> >>> +
> >>> +    /* Guest's call notifier, where SVQ calls guest. */
> >>> +    EventNotifier guest_call_notifier;
> >>
> >> To be consistent, let's simply use "guest_notifier" here.
> >>
> > It could be confused when the series adds a guest -> qemu kick
> > notifier then. Actually, I think it would be better to rename
> > host_notifier to something like host_svq_notifier. Or host_call and
> > guest_call, since "notifier" is already in the type, making the name
> > to be a little bit "Hungarian notation".
>
>
> I think that's fine, just need to make sure we have a consistent name
> for SVQ notifier.
>

Got it.

>
> >
> >>> +
> >>> +    /* Virtio queue shadowing */
> >>> +    VirtQueue *vq;
> >>>    } VhostShadowVirtqueue;
> >>>
> >>> +/* Forward guest notifications */
> >>> +static void vhost_handle_guest_kick(EventNotifier *n)
> >>> +{
> >>> +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtque=
ue,
> >>> +                                             host_notifier);
> >>> +
> >>> +    if (unlikely(!event_notifier_test_and_clear(n))) {
> >>> +        return;
> >>> +    }
> >>
> >> Is there a chance that we may stop the processing of available buffers
> >> during the svq enabling? There could be no kick from the guest in this=
 case.
> >>
> > Actually, yes, I think you are right. The guest kick eventfd could
> > have been consumed by vhost but there may be still pending buffers.
> >
> > I think it would be better to check for available buffers first, then
> > clear the notifier unconditionally, and then re-check and process them
> > if any [1].
>
>
> Looks like I can't find "[1]" anywhere.
>

Sorry, it's at the comment about vhost_svq_start function. It's not
isolated, but in the middle of a paragraph, because both comments are
related: The solution to one of them affects the other.


>
> >
> > However, this problem arises later in the series: At this moment the
> > device is not reset and guest's host notifier is not replaced, so
> > either vhost/device receives the kick, or SVQ does and forwards it.
> >
> > Does it make sense to you?
>
>
> Kind of, so I think we can:
>
> 1) As you said, always check available buffers when switching to SVQ
> 2) alwasy kick the vhost when switching back to vhost
>

Right. I think I prefer solution 1, but let me delay the choice to
compare them properly.

>
> >
> >>> +
> >>> +    event_notifier_set(&svq->kick_notifier);
> >>> +}
> >>> +
> >>> +/*
> >>> + * Obtain the SVQ call notifier, where vhost device notifies SVQ tha=
t there
> >>> + * exists pending used buffers.
> >>> + *
> >>> + * @svq Shadow Virtqueue
> >>> + */
> >>> +EventNotifier *vhost_svq_get_svq_call_notifier(VhostShadowVirtqueue =
*svq)
> >>> +{
> >>> +    return &svq->call_notifier;
> >>> +}
> >>> +
> >>> +/*
> >>> + * Set the call notifier for the SVQ to call the guest
> >>> + *
> >>> + * @svq Shadow virtqueue
> >>> + * @call_fd call notifier
> >>> + *
> >>> + * Called on BQL context.
> >>> + */
> >>> +void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, in=
t call_fd)
> >>> +{
> >>> +    event_notifier_init_fd(&svq->guest_call_notifier, call_fd);
> >>> +}
> >>> +
> >>> +/*
> >>> + * Restore the vhost guest to host notifier, i.e., disables svq effe=
ct.
> >>> + */
> >>> +static int vhost_svq_restore_vdev_host_notifier(struct vhost_dev *de=
v,
> >>> +                                                unsigned vhost_index=
,
> >>> +                                                VhostShadowVirtqueue=
 *svq)
> >>> +{
> >>> +    EventNotifier *vq_host_notifier =3D virtio_queue_get_host_notifi=
er(svq->vq);
> >>> +    struct vhost_vring_file file =3D {
> >>> +        .index =3D vhost_index,
> >>> +        .fd =3D event_notifier_get_fd(vq_host_notifier),
> >>> +    };
> >>> +    int r;
> >>> +
> >>> +    /* Restore vhost kick */
> >>> +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &file);
> >>
> >> And remap the notification area if necessary.
> > Totally right, that step is missed in this series.
> >
> > However, remapping guest host notifier memory region has no advantages
> > over using ioeventfd to perform guest -> SVQ notifications, doesn't
> > it? By both methods flow needs to go through the hypervisor kernel.
>
>
> To be clear, I meant restore the notification area mapping from guest to
> device directly. For SVQ, you are right, there's no much value for
> bothering notification area map. (Or we can do it in the future).
>

Ok, I think I confused the location of your comment so I misunderstood
it. You are right, the notification area must be restored here.

>
> >
> >>
> >>> +    return r ? -errno : 0;
> >>> +}
> >>> +
> >>> +/*
> >>> + * Start shadow virtqueue operation.
> >>> + * @dev vhost device
> >>> + * @hidx vhost virtqueue index
> >>> + * @svq Shadow Virtqueue
> >>> + */
> >>> +bool vhost_svq_start(struct vhost_dev *dev, unsigned idx,
> >>> +                     VhostShadowVirtqueue *svq)
> >>> +{
> >>> +    EventNotifier *vq_host_notifier =3D virtio_queue_get_host_notifi=
er(svq->vq);
> >>> +    struct vhost_vring_file file =3D {
> >>> +        .index =3D dev->vhost_ops->vhost_get_vq_index(dev, dev->vq_i=
ndex + idx),
> >>> +        .fd =3D event_notifier_get_fd(&svq->kick_notifier),
> >>> +    };
> >>> +    int r;
> >>> +
> >>> +    /* Check that notifications are still going directly to vhost de=
v */
> >>> +    assert(virtio_queue_is_host_notifier_enabled(svq->vq));
> >>> +
> >>> +    /*
> >>> +     * event_notifier_set_handler already checks for guest's notific=
ations if
> >>> +     * they arrive in the switch, so there is no need to explicitely=
 check for
> >>> +     * them.
> >>> +     */
> >>
> >> If this is true, shouldn't we call vhost_set_vring_kick() before the
> >> event_notifier_set_handler()?
> >>
> > Not at this point of the series, but it could be another solution when
> > we need to reset the device and we are unsure if all buffers have been
> > read. But I think I prefer the solution exposed in [1] and to
> > explicitly call vhost_handle_guest_kick here. Do you think
> > differently?
>
>
> I actually mean if we can end up with this situation since SVQ take over
> the host notifier before set_vring_kick().
>
> 1) guest kick vq, vhost is running
> 2) qemu take over the host notifier
> 3) guest kick vq
> 4) qemu route host notifier to SVQ
>
> Then the vq will be handled by both SVQ and vhost?
>

It shouldn't because the vhost device must be paused at this moment.
What can happen is that vhost swallows that notification but the
device does not answer to the kick.

>
> >
> >> Btw, I think we should update the fd if set_vring_kick() was called
> >> after this function?
> >>
> > Kind of. This is currently bad in the code, but...
> >
> > Backend callbacks vhost_ops->vhost_set_vring_kick and
> > vhost_ops->vhost_set_vring_addr are only called at
> > vhost_virtqueue_start. And they are always called with known data
> > already stored in VirtQueue.
>
>
> This is true for now, but I'd suggest to not depend on this since it:
>
> 1) it might be changed in the future
> 2) we're working at vhost layer and expose API to virtio device, the
> code should be robust to handle set_vring_kick() at any time
> 3) I think we've already handled similar situation of set_vring_call, so
> let's be consistent
>

Ok. Do you think the same for addr? Or can we stick to that justification t=
here?

>
> >
> > To avoid storing more state in vhost_vdpa, I think that we should
> > avoid duplicating them, but ignore new kick_fd or address in SVQ mode,
> > and retrieve them again at the moment the device is (re)started in SVQ
> > mode. Qemu already avoids things like allowing the guest to set
> > addresses at random time, using the VirtIOPCIProxy to store them.
> >
> > I also see how duplicating that status could protect vdpa SVQ code
> > against future changes to vhost code, but that would make this series
> > bigger and more complex with no need at this moment in my opinion.
> >
> > Do you agree?
>
>
> Somehow, but consider we can handle set_vring_call(), let's at last make
> set_vring_kick() more robust.
>
>
> >
> >>> +    event_notifier_init_fd(&svq->host_notifier,
> >>> +                           event_notifier_get_fd(vq_host_notifier));
> >>> +    event_notifier_set_handler(&svq->host_notifier, vhost_handle_gue=
st_kick);
> >>> +
> >>> +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &file);
> >>
> >> And we need to stop the notification area mmap.
> >>
> > Right.
> >
> >>> +    if (unlikely(r !=3D 0)) {
> >>> +        error_report("Couldn't set kick fd: %s", strerror(errno));
> >>> +        goto err_set_vring_kick;
> >>> +    }
> >>> +
> >>> +    return true;
> >>> +
> >>> +err_set_vring_kick:
> >>> +    event_notifier_set_handler(&svq->host_notifier, NULL);
> >>> +
> >>> +    return false;
> >>> +}
> >>> +
> >>> +/*
> >>> + * Stop shadow virtqueue operation.
> >>> + * @dev vhost device
> >>> + * @idx vhost queue index
> >>> + * @svq Shadow Virtqueue
> >>> + */
> >>> +void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
> >>> +                    VhostShadowVirtqueue *svq)
> >>> +{
> >>> +    int r =3D vhost_svq_restore_vdev_host_notifier(dev, idx, svq);
> >>> +    if (unlikely(r < 0)) {
> >>> +        error_report("Couldn't restore vq kick fd: %s", strerror(-r)=
);
> >>> +    }
> >>> +
> >>> +    event_notifier_set_handler(&svq->host_notifier, NULL);
> >>> +}
> >>> +
> >>>    /*
> >>>     * Creates vhost shadow virtqueue, and instruct vhost device to us=
e the shadow
> >>>     * methods and file descriptors.
> >>>     */
> >>>    VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx=
)
> >>>    {
> >>> +    int vq_idx =3D dev->vq_index + idx;
> >>>        g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVir=
tqueue, 1);
> >>>        int r;
> >>>
> >>> @@ -44,6 +179,7 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_d=
ev *dev, int idx)
> >>>            goto err_init_call_notifier;
> >>>        }
> >>>
> >>> +    svq->vq =3D virtio_get_queue(dev->vdev, vq_idx);
> >>>        return g_steal_pointer(&svq);
> >>>
> >>>    err_init_call_notifier:
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index e0dc7508c3..36c954a779 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -17,6 +17,7 @@
> >>>    #include "hw/virtio/vhost.h"
> >>>    #include "hw/virtio/vhost-backend.h"
> >>>    #include "hw/virtio/virtio-net.h"
> >>> +#include "hw/virtio/vhost-shadow-virtqueue.h"
> >>>    #include "hw/virtio/vhost-vdpa.h"
> >>>    #include "exec/address-spaces.h"
> >>>    #include "qemu/main-loop.h"
> >>> @@ -272,6 +273,16 @@ static void vhost_vdpa_add_status(struct vhost_d=
ev *dev, uint8_t status)
> >>>        vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
> >>>    }
> >>>
> >>> +/**
> >>> + * Adaptor function to free shadow virtqueue through gpointer
> >>> + *
> >>> + * @svq   The Shadow Virtqueue
> >>> + */
> >>> +static void vhost_psvq_free(gpointer svq)
> >>> +{
> >>> +    vhost_svq_free(svq);
> >>> +}
> >>> +
> >>>    static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Er=
ror **errp)
> >>>    {
> >>>        struct vhost_vdpa *v;
> >>> @@ -283,6 +294,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev,=
 void *opaque, Error **errp)
> >>>        dev->opaque =3D  opaque ;
> >>>        v->listener =3D vhost_vdpa_memory_listener;
> >>>        v->msg_type =3D VHOST_IOTLB_MSG_V2;
> >>> +    v->shadow_vqs =3D g_ptr_array_new_full(dev->nvqs, vhost_psvq_fre=
e);
> >>>        QLIST_INSERT_HEAD(&vhost_vdpa_devices, v, entry);
> >>>
> >>>        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >>> @@ -373,6 +385,17 @@ err:
> >>>        return;
> >>>    }
> >>>
> >>> +static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
> >>> +{
> >>> +    struct vhost_vdpa *v =3D dev->opaque;
> >>> +    size_t idx;
> >>> +
> >>> +    for (idx =3D 0; idx < v->shadow_vqs->len; ++idx) {
> >>> +        vhost_svq_stop(dev, idx, g_ptr_array_index(v->shadow_vqs, id=
x));
> >>> +    }
> >>> +    g_ptr_array_free(v->shadow_vqs, true);
> >>> +}
> >>> +
> >>>    static int vhost_vdpa_cleanup(struct vhost_dev *dev)
> >>>    {
> >>>        struct vhost_vdpa *v;
> >>> @@ -381,6 +404,7 @@ static int vhost_vdpa_cleanup(struct vhost_dev *d=
ev)
> >>>        trace_vhost_vdpa_cleanup(dev, v);
> >>>        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> >>>        memory_listener_unregister(&v->listener);
> >>> +    vhost_vdpa_svq_cleanup(dev);
> >>>        QLIST_REMOVE(v, entry);
> >>>
> >>>        dev->opaque =3D NULL;
> >>> @@ -557,7 +581,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev =
*dev, bool started)
> >>>        if (started) {
> >>>            uint8_t status =3D 0;
> >>>            memory_listener_register(&v->listener, &address_space_memo=
ry);
> >>> -        vhost_vdpa_host_notifiers_init(dev);
> >>> +        if (!v->shadow_vqs_enabled) {
> >>> +            vhost_vdpa_host_notifiers_init(dev);
> >>> +        }
> >>
> >> This looks like a trick, why not check and setup shadow_vqs inside:
> >>
> >> 1) vhost_vdpa_host_notifiers_init()
> >>
> >> and
> >>
> >> 2) vhost_vdpa_set_vring_kick()
> >>
> > Ok I will move the checks there.
> >
> >>>            vhost_vdpa_set_vring_ready(dev);
> >>>            vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> >>>            vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
> >>> @@ -663,10 +689,96 @@ static bool  vhost_vdpa_force_iommu(struct vhos=
t_dev *dev)
> >>>        return true;
> >>>    }
> >>>
> >>> +/*
> >>> + * Start shadow virtqueue.
> >>> + */
> >>> +static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned =
idx)
> >>> +{
> >>> +    struct vhost_vdpa *v =3D dev->opaque;
> >>> +    VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs, i=
dx);
> >>> +    return vhost_svq_start(dev, idx, svq);
> >>> +}
> >>> +
> >>> +static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool ena=
ble)
> >>> +{
> >>> +    struct vhost_dev *hdev =3D v->dev;
> >>> +    unsigned n;
> >>> +
> >>> +    if (enable =3D=3D v->shadow_vqs_enabled) {
> >>> +        return hdev->nvqs;
> >>> +    }
> >>> +
> >>> +    if (enable) {
> >>> +        /* Allocate resources */
> >>> +        assert(v->shadow_vqs->len =3D=3D 0);
> >>> +        for (n =3D 0; n < hdev->nvqs; ++n) {
> >>> +            VhostShadowVirtqueue *svq =3D vhost_svq_new(hdev, n);
> >>> +            bool ok;
> >>> +
> >>> +            if (unlikely(!svq)) {
> >>> +                g_ptr_array_set_size(v->shadow_vqs, 0);
> >>> +                return 0;
> >>> +            }
> >>> +            g_ptr_array_add(v->shadow_vqs, svq);
> >>> +
> >>> +            ok =3D vhost_vdpa_svq_start_vq(hdev, n);
> >>> +            if (unlikely(!ok)) {
> >>> +                /* Free still not started svqs */
> >>> +                g_ptr_array_set_size(v->shadow_vqs, n);
> >>> +                enable =3D false;
> > [2]
> >
> >>> +                break;
> >>> +            }
> >>> +        }
> >>
> >> Since there's almost no logic could be shared between enable and
> >> disable. Let's split those logic out into dedicated functions where th=
e
> >> codes looks more easy to be reviewed (e.g have a better error handling=
 etc).
> >>
> > Maybe it could be more clear in the code, but the reused logic is the
> > disabling of SVQ and the fallback in case it cannot be enabled with
> > [2]. But I'm not against splitting in two different functions if it
> > makes review easier.
>
>
> Ok.
>
>
> >
> >>> +    }
> >>> +
> >>> +    v->shadow_vqs_enabled =3D enable;
> >>> +
> >>> +    if (!enable) {
> >>> +        /* Disable all queues or clean up failed start */
> >>> +        for (n =3D 0; n < v->shadow_vqs->len; ++n) {
> >>> +            unsigned vq_idx =3D vhost_vdpa_get_vq_index(hdev, n);
> >>> +            VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shado=
w_vqs, n);
> >>> +            vhost_svq_stop(hdev, n, svq);
> >>> +            vhost_virtqueue_start(hdev, hdev->vdev, &hdev->vqs[n], v=
q_idx);
> >>> +        }
> >>> +
> >>> +        /* Resources cleanup */
> >>> +        g_ptr_array_set_size(v->shadow_vqs, 0);
> >>> +    }
> >>> +
> >>> +    return n;
> >>> +}
> >>>
> >>>    void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, E=
rror **errp)
> >>>    {
> >>> -    error_setg(errp, "Shadow virtqueue still not implemented");
> >>> +    struct vhost_vdpa *v;
> >>> +    const char *err_cause =3D NULL;
> >>> +    bool r;
> >>> +
> >>> +    QLIST_FOREACH(v, &vhost_vdpa_devices, entry) {
> >>> +        if (v->dev->vdev && 0 =3D=3D strcmp(v->dev->vdev->name, name=
)) {
> >>> +            break;
> >>> +        }
> >>> +    }
> >>
> >> I think you can iterate the NetClientStates to ge tthe vhost-vdpa back=
ends.
> >>
> > Right, I missed it.
> >
> >>> +
> >>> +    if (!v) {
> >>> +        err_cause =3D "Device not found";
> >>> +        goto err;
> >>> +    } else if (v->notifier[0].addr) {
> >>> +        err_cause =3D "Device has host notifiers enabled";
> >>
> >> I don't get this.
> >>
> > At this moment of the series you can enable guest -> SVQ -> 'vdpa
> > device' if the device is not using the host notifiers memory region.
> > The right solution is to disable it for the guest, and to handle it in
> > SVQ. Otherwise, guest kick will bypass SVQ and
> >
> > It can be done in the same patch, or at least to disable (as unmap)
> > them at this moment and handle them in a posterior patch. but for
> > prototyping the solution I just ignored it in this series. It will be
> > handled some way or another in the next one. I prefer the last one, to
> > handle in a different patch, but let me know if you think it is better
> > otherwise.
>
>
> Aha, I see. But I think we need to that in this patch otherwise the we
> can route host notifier to SVQ.
>
> Thanks
>

Ok, I will check it.

Thanks!

>
> >
> >> Btw this function should be implemented in an independent patch after
> >> svq is fully functional.
> >>
> > (Reasons for that are already commented at the top of this mail :) ).
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>
> >>> +        goto err;
> >>> +    }
> >>> +
> >>> +    r =3D vhost_vdpa_enable_svq(v, enable);
> >>> +    if (unlikely(!r)) {
> >>> +        err_cause =3D "Error enabling (see monitor)";
> >>> +        goto err;
> >>> +    }
> >>> +
> >>> +err:
> >>> +    if (err_cause) {
> >>> +        error_setg(errp, "Can't enable shadow vq on %s: %s", name, e=
rr_cause);
> >>> +    }
> >>>    }
> >>>
> >>>    const VhostOps vdpa_ops =3D {
>


