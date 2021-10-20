Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329DD43433A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 04:03:35 +0200 (CEST)
Received: from localhost ([::1]:33708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md0x3-0005hR-Uy
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 22:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md0ux-0004GG-JZ
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 22:01:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md0ut-0005o7-0R
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 22:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634695277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1GC11yL6MuwZSP/ZQ7reFvX80h4HWr/oOm7A4CY2Qc=;
 b=hfWh/QsvHEPipidWvRCBfZluk1Vy8Y1+6HUfn/XtKXdqUOcMO0zuffJltX53fqJctHjfbI
 aVS9Avm7ochHBfvukSOga1731lz2B5VXcPf5klecuaRN+80Xhgz/kbesFmP/OJ4EHGmsOu
 tNgmS4SBVHLHvZ32qtvuqly3Wu/oXBE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-G6qhQhkEOnSjKSdAbKhWbw-1; Tue, 19 Oct 2021 22:01:16 -0400
X-MC-Unique: G6qhQhkEOnSjKSdAbKhWbw-1
Received: by mail-lf1-f70.google.com with SMTP id
 z29-20020a195e5d000000b003fd437f0e07so2308210lfi.20
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 19:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X1GC11yL6MuwZSP/ZQ7reFvX80h4HWr/oOm7A4CY2Qc=;
 b=ltsNClooRn28S9MqPzDxYvc/nI/Ls+Ss/vKBp2VvaI/rQmT4Utq/1HBzk1jBEWCDEx
 NkT1Os7BghlBjvZc+3otFz3kOtgkKWg07nrkEIte+wBnNwmhGdchAC2jKLU1nP1zt4sN
 a7JKtBMUiBmqJFo5yDPRudcBmQjnIxPNibllcFBQq0Mu0i0aGcsWmoAQ6kPcDE64VMn1
 fEQMnzMQWvioYJBw4ENywpzMJhFnHXPQrJgRN6sFdJBsh8vQnlHR0e+UOhbklc5aBj8K
 rS4iPtAessmoZ/x6BJesPbEaKnMMZ62dHoDemZnkwFQB/qb2LPAIu2SNCTPxAGXupRzo
 Vl+g==
X-Gm-Message-State: AOAM533BRKyqOw/VCeplcua/R3TT9mtGqOBE0wGKc4568lwpLy9eIgCV
 +v62FnHm/Y6FwA71nnye1xQsEY+OYCYn4moiRWLk3puyYInHCy9ybnA+Sd58CHiBEnNxNSVlFKO
 sa0+pRjXHZrAgRrTAfcpaYPJGIrBr5LM=
X-Received: by 2002:a05:6512:128a:: with SMTP id
 u10mr9644302lfs.84.1634695274653; 
 Tue, 19 Oct 2021 19:01:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGTPWl2zk+ZZgzQ8IheHmFDNopa7S1gX0FfGYj1aBUc1VlnTSM8GHcI+QJGZFwjX6AdRebgh47YC1xyMxtBJQ=
X-Received: by 2002:a05:6512:128a:: with SMTP id
 u10mr9644267lfs.84.1634695274317; 
 Tue, 19 Oct 2021 19:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-12-eperezma@redhat.com>
 <ab9a7771-5f9b-6413-3e38-bd3dc7373256@redhat.com>
 <CAJaqyWfm734HrwTJK71hUQNYVkyDaR8OiqtGro_AX9i_pXfmBQ@mail.gmail.com>
 <78843cbf-0096-816b-da74-5406fdcc3783@redhat.com>
 <CAJaqyWcO9oaGsRe-oMNbmHx7G4Mw0vZfc+7WYQ23+SteoFVn4Q@mail.gmail.com>
In-Reply-To: <CAJaqyWcO9oaGsRe-oMNbmHx7G4Mw0vZfc+7WYQ23+SteoFVn4Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Oct 2021 10:01:03 +0800
Message-ID: <CACGkMEtPAR6qwMN5++Q+e5aJGtzMgzo59_+Jf7=Ra=rtdLYS8g@mail.gmail.com>
Subject: Re: [RFC PATCH v4 11/20] vhost: Route host->guest notification
 through shadow virtqueue
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, Oct 19, 2021 at 4:40 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Oct 15, 2021 at 6:42 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2021/10/15 =E4=B8=8A=E5=8D=8812:39, Eugenio Perez Martin =E5=
=86=99=E9=81=93:
> > > On Wed, Oct 13, 2021 at 5:47 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > >>
> > >> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=
=86=99=E9=81=93:
> > >>> This will make qemu aware of the device used buffers, allowing it t=
o
> > >>> write the guest memory with its contents if needed.
> > >>>
> > >>> Since the use of vhost_virtqueue_start can unmasks and discard call
> > >>> events, vhost_virtqueue_start should be modified in one of these wa=
ys:
> > >>> * Split in two: One of them uses all logic to start a queue with no
> > >>>     side effects for the guest, and another one tha actually assume=
s that
> > >>>     the guest has just started the device. Vdpa should use just the
> > >>>     former.
> > >>> * Actually store and check if the guest notifier is masked, and do =
it
> > >>>     conditionally.
> > >>> * Left as it is, and duplicate all the logic in vhost-vdpa.
> > >>>
> > >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >>> ---
> > >>>    hw/virtio/vhost-shadow-virtqueue.c | 19 +++++++++++++++
> > >>>    hw/virtio/vhost-vdpa.c             | 38 ++++++++++++++++++++++++=
+++++-
> > >>>    2 files changed, 56 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-s=
hadow-virtqueue.c
> > >>> index 21dc99ab5d..3fe129cf63 100644
> > >>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> > >>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > >>> @@ -53,6 +53,22 @@ static void vhost_handle_guest_kick(EventNotifie=
r *n)
> > >>>        event_notifier_set(&svq->kick_notifier);
> > >>>    }
> > >>>
> > >>> +/* Forward vhost notifications */
> > >>> +static void vhost_svq_handle_call_no_test(EventNotifier *n)
> > >>> +{
> > >>> +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtq=
ueue,
> > >>> +                                             call_notifier);
> > >>> +
> > >>> +    event_notifier_set(&svq->guest_call_notifier);
> > >>> +}
> > >>> +
> > >>> +static void vhost_svq_handle_call(EventNotifier *n)
> > >>> +{
> > >>> +    if (likely(event_notifier_test_and_clear(n))) {
> > >>> +        vhost_svq_handle_call_no_test(n);
> > >>> +    }
> > >>> +}
> > >>> +
> > >>>    /*
> > >>>     * Obtain the SVQ call notifier, where vhost device notifies SVQ=
 that there
> > >>>     * exists pending used buffers.
> > >>> @@ -180,6 +196,8 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhos=
t_dev *dev, int idx)
> > >>>        }
> > >>>
> > >>>        svq->vq =3D virtio_get_queue(dev->vdev, vq_idx);
> > >>> +    event_notifier_set_handler(&svq->call_notifier,
> > >>> +                               vhost_svq_handle_call);
> > >>>        return g_steal_pointer(&svq);
> > >>>
> > >>>    err_init_call_notifier:
> > >>> @@ -195,6 +213,7 @@ err_init_kick_notifier:
> > >>>    void vhost_svq_free(VhostShadowVirtqueue *vq)
> > >>>    {
> > >>>        event_notifier_cleanup(&vq->kick_notifier);
> > >>> +    event_notifier_set_handler(&vq->call_notifier, NULL);
> > >>>        event_notifier_cleanup(&vq->call_notifier);
> > >>>        g_free(vq);
> > >>>    }
> > >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > >>> index bc34de2439..6c5f4c98b8 100644
> > >>> --- a/hw/virtio/vhost-vdpa.c
> > >>> +++ b/hw/virtio/vhost-vdpa.c
> > >>> @@ -712,13 +712,40 @@ static bool vhost_vdpa_svq_start_vq(struct vh=
ost_dev *dev, unsigned idx)
> > >>>    {
> > >>>        struct vhost_vdpa *v =3D dev->opaque;
> > >>>        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vq=
s, idx);
> > >>> -    return vhost_svq_start(dev, idx, svq);
> > >>> +    EventNotifier *vhost_call_notifier =3D vhost_svq_get_svq_call_=
notifier(svq);
> > >>> +    struct vhost_vring_file vhost_call_file =3D {
> > >>> +        .index =3D idx + dev->vq_index,
> > >>> +        .fd =3D event_notifier_get_fd(vhost_call_notifier),
> > >>> +    };
> > >>> +    int r;
> > >>> +    bool b;
> > >>> +
> > >>> +    /* Set shadow vq -> guest notifier */
> > >>> +    assert(v->call_fd[idx]);
> > >>
> > >> We need aovid the asser() here. On which case we can hit this?
> > >>
> > > I would say that there is no way we can actually hit it, so let's rem=
ove it.
> > >
> > >>> +    vhost_svq_set_guest_call_notifier(svq, v->call_fd[idx]);
> > >>> +
> > >>> +    b =3D vhost_svq_start(dev, idx, svq);
> > >>> +    if (unlikely(!b)) {
> > >>> +        return false;
> > >>> +    }
> > >>> +
> > >>> +    /* Set device -> SVQ notifier */
> > >>> +    r =3D vhost_vdpa_set_vring_dev_call(dev, &vhost_call_file);
> > >>> +    if (unlikely(r)) {
> > >>> +        error_report("vhost_vdpa_set_vring_call for shadow vq fail=
ed");
> > >>> +        return false;
> > >>> +    }
> > >>
> > >> Similar to kick, do we need to set_vring_call() before vhost_svq_sta=
rt()?
> > >>
> > > It should not matter at this moment because the device should not be
> > > started at this point and device calls should not run
> > > vhost_svq_handle_call until BQL is released.
> >
> >
> > Yes, we stop virtqueue before.
> >
> >
> > >
> > > The "logic" of doing it after is to make clear that svq must be fully
> > > initialized before processing device calls, even in the case that we
> > > extract SVQ in its own iothread or similar. But this could be done
> > > before vhost_svq_start for sure.
> > >
> > >>> +
> > >>> +    /* Check for pending calls */
> > >>> +    event_notifier_set(vhost_call_notifier);
> > >>
> > >> Interesting, can this result spurious interrupt?
> > >>
> > > This actually "queues" a vhost_svq_handle_call after the BQL release,
> > > where the device should be fully reset. In that regard, if there are
> > > no used descriptors there will not be an irq raised to the guest. Doe=
s
> > > that answer the question? Or have I missed something?
> >
> >
> > Yes, please explain this in the comment.
> >
>
> I'm reviewing this again, and actually I think I was wrong in solving the=
 issue.
>
> Since at this point the device is being configured, there is no chance
> that we had a missing call notification here: A previous kick is
> needed for the device to generate any calls, and these cannot be
> processed.
>
> What is not solved in this series is that we could have pending used
> buffers in vdpa device stopping SVQ, but queuing a check for that is
> not going to solve anything, since SVQ vring would be already
> destroyed:
>
> * vdpa device marks N > 0 buffers as used, and calls.
> * Before processing them, SVQ stop is called. SVQ have not processed
> these, and cleans them, making this event_notifier_set useless.
>
> So this would require a few changes. Mainly, instead of queueing a
> check for used, these need to be checked before svq cleaning. After
> that, obtain the VQ state (is not obtained in the stop at the moment,
> trusting in guest's used idx) and run a last
> vhost_svq_handle_call_no_test while the device is paused.

It looks to me what's really important is that SVQ needs to
drain/forwared used buffers after vdpa is stopped. Then we should be
fine.

>
> Thanks!
>
> >
> > >
> > >>> +    return true;
> > >>>    }
> > >>>
> > >>>    static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool=
 enable)
> > >>>    {
> > >>>        struct vhost_dev *hdev =3D v->dev;
> > >>>        unsigned n;
> > >>> +    int r;
> > >>>
> > >>>        if (enable =3D=3D v->shadow_vqs_enabled) {
> > >>>            return hdev->nvqs;
> > >>> @@ -752,9 +779,18 @@ static unsigned vhost_vdpa_enable_svq(struct v=
host_vdpa *v, bool enable)
> > >>>        if (!enable) {
> > >>>            /* Disable all queues or clean up failed start */
> > >>>            for (n =3D 0; n < v->shadow_vqs->len; ++n) {
> > >>> +            struct vhost_vring_file file =3D {
> > >>> +                .index =3D vhost_vdpa_get_vq_index(hdev, n),
> > >>> +                .fd =3D v->call_fd[n],
> > >>> +            };
> > >>> +
> > >>> +            r =3D vhost_vdpa_set_vring_call(hdev, &file);
> > >>> +            assert(r =3D=3D 0);
> > >>> +
> > >>>                unsigned vq_idx =3D vhost_vdpa_get_vq_index(hdev, n)=
;
> > >>>                VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->s=
hadow_vqs, n);
> > >>>                vhost_svq_stop(hdev, n, svq);
> > >>> +            /* TODO: This can unmask or override call fd! */
> > >>
> > >> I don't get this comment. Does this mean the current code can't work
> > >> with mask_notifiers? If yes, this is something we need to fix.
> > >>
> > > Yes, but it will be addressed in the next series. I should have
> > > explained it bette here, sorry :).
> >
> >
> > Ok.
> >
> > Thanks
> >
> >
> > >
> > > Thanks!
> > >
> > >> Thanks
> > >>
> > >>
> > >>>                vhost_virtqueue_start(hdev, hdev->vdev, &hdev->vqs[n=
], vq_idx);
> > >>>            }
> > >>>
> >
>


