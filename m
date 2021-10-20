Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC10543454B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 08:41:35 +0200 (CEST)
Received: from localhost ([::1]:42678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md5I5-00032U-CM
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 02:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1md5EP-0001aK-8y
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 02:37:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1md5EJ-0002lj-Sv
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 02:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634711857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TQ0/akxv/7reicSfRakfUwVBaGidMK4mbw5UmIhmYJ0=;
 b=huRsF9u/zkigrVq+umaVZQ8Bsr+o1KwPD6liMlyRuvvgk4DQwk8awQa6wW0TULtX+eJGEQ
 3LENzq2GSHYSJ9v+SYvIw1wE0SAJuqAbdnRyn8+irKkQlQhmhc9N6FFzwEGsR1nq9Phqo4
 N7fcRh1qRTQCqKYMunTB8r+JajhVl6o=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-2JvZovwzOMabWYBkLnFRbA-1; Wed, 20 Oct 2021 02:37:36 -0400
X-MC-Unique: 2JvZovwzOMabWYBkLnFRbA-1
Received: by mail-qk1-f197.google.com with SMTP id
 e22-20020a05620a209600b0045f81b8f89cso1601706qka.5
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 23:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TQ0/akxv/7reicSfRakfUwVBaGidMK4mbw5UmIhmYJ0=;
 b=Wc2l5bBPQgo028Ll6rbWIkgpWaDXWlKsO64c1sIW6SqZaUIG8gSOurqC0agk7tm8k3
 lF/OnE2xzpnmoHKr4ydoJ1wcVn0Gzo05hPvWkKAAtYtI7r68L9OODGWvLmlW7UBLxvHC
 6glFngy/P1v++7hOBA7vum34FjAFTBAs+Dm01pgPGW1ir+VxRzf6iWcc2Ml9otsQK3Kf
 W06kww7D1vadQtlRu72ZCvzxhUtUa4bHogaU365cETbXp2w2iFMiJ1h0iHgG5XRmGlh8
 ToNd9Mg+baFE5s/GLU53Rl2ImTBMp+geWH0JI7SJcaaJ6NSURRPSmfj0ZWsc8cCkcJAp
 ow8w==
X-Gm-Message-State: AOAM533zesmKLD97KaOpG3f4bAnpBaG+8XKusph415+nO4Nxhg1kCElB
 yot12FXoyFisUv1elVdLrLi8EqUsixNwmmCSrdi/xLfTcaHivtyN4QJOfpM/Pl/HaHWR3sA/dmI
 RsKeSPud6ptDfaImDAPN23Z3/DEf2ghc=
X-Received: by 2002:aed:3022:: with SMTP id 31mr4926729qte.322.1634711855470; 
 Tue, 19 Oct 2021 23:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS3h6iAWnMsUq1d8dzxQObdcKD2bURt4jsberOyCRtu3JDk7DCOfhyrGM02VZ4t0x/uwU+PuTNynRo6T2EeWM=
X-Received: by 2002:aed:3022:: with SMTP id 31mr4926703qte.322.1634711855176; 
 Tue, 19 Oct 2021 23:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-12-eperezma@redhat.com>
 <ab9a7771-5f9b-6413-3e38-bd3dc7373256@redhat.com>
 <CAJaqyWfm734HrwTJK71hUQNYVkyDaR8OiqtGro_AX9i_pXfmBQ@mail.gmail.com>
 <78843cbf-0096-816b-da74-5406fdcc3783@redhat.com>
 <CAJaqyWcO9oaGsRe-oMNbmHx7G4Mw0vZfc+7WYQ23+SteoFVn4Q@mail.gmail.com>
 <CACGkMEtPAR6qwMN5++Q+e5aJGtzMgzo59_+Jf7=Ra=rtdLYS8g@mail.gmail.com>
In-Reply-To: <CACGkMEtPAR6qwMN5++Q+e5aJGtzMgzo59_+Jf7=Ra=rtdLYS8g@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 20 Oct 2021 08:36:58 +0200
Message-ID: <CAJaqyWcwBmZupND3KCPOW3Hxbau1eUX6SPXE4mU9heKGCOT2rw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 11/20] vhost: Route host->guest notification
 through shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Wed, Oct 20, 2021 at 4:01 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Oct 19, 2021 at 4:40 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Fri, Oct 15, 2021 at 6:42 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > >
> > > =E5=9C=A8 2021/10/15 =E4=B8=8A=E5=8D=8812:39, Eugenio Perez Martin =
=E5=86=99=E9=81=93:
> > > > On Wed, Oct 13, 2021 at 5:47 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > > >>
> > > >> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=
=86=99=E9=81=93:
> > > >>> This will make qemu aware of the device used buffers, allowing it=
 to
> > > >>> write the guest memory with its contents if needed.
> > > >>>
> > > >>> Since the use of vhost_virtqueue_start can unmasks and discard ca=
ll
> > > >>> events, vhost_virtqueue_start should be modified in one of these =
ways:
> > > >>> * Split in two: One of them uses all logic to start a queue with =
no
> > > >>>     side effects for the guest, and another one tha actually assu=
mes that
> > > >>>     the guest has just started the device. Vdpa should use just t=
he
> > > >>>     former.
> > > >>> * Actually store and check if the guest notifier is masked, and d=
o it
> > > >>>     conditionally.
> > > >>> * Left as it is, and duplicate all the logic in vhost-vdpa.
> > > >>>
> > > >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > >>> ---
> > > >>>    hw/virtio/vhost-shadow-virtqueue.c | 19 +++++++++++++++
> > > >>>    hw/virtio/vhost-vdpa.c             | 38 ++++++++++++++++++++++=
+++++++-
> > > >>>    2 files changed, 56 insertions(+), 1 deletion(-)
> > > >>>
> > > >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost=
-shadow-virtqueue.c
> > > >>> index 21dc99ab5d..3fe129cf63 100644
> > > >>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > >>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > >>> @@ -53,6 +53,22 @@ static void vhost_handle_guest_kick(EventNotif=
ier *n)
> > > >>>        event_notifier_set(&svq->kick_notifier);
> > > >>>    }
> > > >>>
> > > >>> +/* Forward vhost notifications */
> > > >>> +static void vhost_svq_handle_call_no_test(EventNotifier *n)
> > > >>> +{
> > > >>> +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVir=
tqueue,
> > > >>> +                                             call_notifier);
> > > >>> +
> > > >>> +    event_notifier_set(&svq->guest_call_notifier);
> > > >>> +}
> > > >>> +
> > > >>> +static void vhost_svq_handle_call(EventNotifier *n)
> > > >>> +{
> > > >>> +    if (likely(event_notifier_test_and_clear(n))) {
> > > >>> +        vhost_svq_handle_call_no_test(n);
> > > >>> +    }
> > > >>> +}
> > > >>> +
> > > >>>    /*
> > > >>>     * Obtain the SVQ call notifier, where vhost device notifies S=
VQ that there
> > > >>>     * exists pending used buffers.
> > > >>> @@ -180,6 +196,8 @@ VhostShadowVirtqueue *vhost_svq_new(struct vh=
ost_dev *dev, int idx)
> > > >>>        }
> > > >>>
> > > >>>        svq->vq =3D virtio_get_queue(dev->vdev, vq_idx);
> > > >>> +    event_notifier_set_handler(&svq->call_notifier,
> > > >>> +                               vhost_svq_handle_call);
> > > >>>        return g_steal_pointer(&svq);
> > > >>>
> > > >>>    err_init_call_notifier:
> > > >>> @@ -195,6 +213,7 @@ err_init_kick_notifier:
> > > >>>    void vhost_svq_free(VhostShadowVirtqueue *vq)
> > > >>>    {
> > > >>>        event_notifier_cleanup(&vq->kick_notifier);
> > > >>> +    event_notifier_set_handler(&vq->call_notifier, NULL);
> > > >>>        event_notifier_cleanup(&vq->call_notifier);
> > > >>>        g_free(vq);
> > > >>>    }
> > > >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > >>> index bc34de2439..6c5f4c98b8 100644
> > > >>> --- a/hw/virtio/vhost-vdpa.c
> > > >>> +++ b/hw/virtio/vhost-vdpa.c
> > > >>> @@ -712,13 +712,40 @@ static bool vhost_vdpa_svq_start_vq(struct =
vhost_dev *dev, unsigned idx)
> > > >>>    {
> > > >>>        struct vhost_vdpa *v =3D dev->opaque;
> > > >>>        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_=
vqs, idx);
> > > >>> -    return vhost_svq_start(dev, idx, svq);
> > > >>> +    EventNotifier *vhost_call_notifier =3D vhost_svq_get_svq_cal=
l_notifier(svq);
> > > >>> +    struct vhost_vring_file vhost_call_file =3D {
> > > >>> +        .index =3D idx + dev->vq_index,
> > > >>> +        .fd =3D event_notifier_get_fd(vhost_call_notifier),
> > > >>> +    };
> > > >>> +    int r;
> > > >>> +    bool b;
> > > >>> +
> > > >>> +    /* Set shadow vq -> guest notifier */
> > > >>> +    assert(v->call_fd[idx]);
> > > >>
> > > >> We need aovid the asser() here. On which case we can hit this?
> > > >>
> > > > I would say that there is no way we can actually hit it, so let's r=
emove it.
> > > >
> > > >>> +    vhost_svq_set_guest_call_notifier(svq, v->call_fd[idx]);
> > > >>> +
> > > >>> +    b =3D vhost_svq_start(dev, idx, svq);
> > > >>> +    if (unlikely(!b)) {
> > > >>> +        return false;
> > > >>> +    }
> > > >>> +
> > > >>> +    /* Set device -> SVQ notifier */
> > > >>> +    r =3D vhost_vdpa_set_vring_dev_call(dev, &vhost_call_file);
> > > >>> +    if (unlikely(r)) {
> > > >>> +        error_report("vhost_vdpa_set_vring_call for shadow vq fa=
iled");
> > > >>> +        return false;
> > > >>> +    }
> > > >>
> > > >> Similar to kick, do we need to set_vring_call() before vhost_svq_s=
tart()?
> > > >>
> > > > It should not matter at this moment because the device should not b=
e
> > > > started at this point and device calls should not run
> > > > vhost_svq_handle_call until BQL is released.
> > >
> > >
> > > Yes, we stop virtqueue before.
> > >
> > >
> > > >
> > > > The "logic" of doing it after is to make clear that svq must be ful=
ly
> > > > initialized before processing device calls, even in the case that w=
e
> > > > extract SVQ in its own iothread or similar. But this could be done
> > > > before vhost_svq_start for sure.
> > > >
> > > >>> +
> > > >>> +    /* Check for pending calls */
> > > >>> +    event_notifier_set(vhost_call_notifier);
> > > >>
> > > >> Interesting, can this result spurious interrupt?
> > > >>
> > > > This actually "queues" a vhost_svq_handle_call after the BQL releas=
e,
> > > > where the device should be fully reset. In that regard, if there ar=
e
> > > > no used descriptors there will not be an irq raised to the guest. D=
oes
> > > > that answer the question? Or have I missed something?
> > >
> > >
> > > Yes, please explain this in the comment.
> > >
> >
> > I'm reviewing this again, and actually I think I was wrong in solving t=
he issue.
> >
> > Since at this point the device is being configured, there is no chance
> > that we had a missing call notification here: A previous kick is
> > needed for the device to generate any calls, and these cannot be
> > processed.
> >
> > What is not solved in this series is that we could have pending used
> > buffers in vdpa device stopping SVQ, but queuing a check for that is
> > not going to solve anything, since SVQ vring would be already
> > destroyed:
> >
> > * vdpa device marks N > 0 buffers as used, and calls.
> > * Before processing them, SVQ stop is called. SVQ have not processed
> > these, and cleans them, making this event_notifier_set useless.
> >
> > So this would require a few changes. Mainly, instead of queueing a
> > check for used, these need to be checked before svq cleaning. After
> > that, obtain the VQ state (is not obtained in the stop at the moment,
> > trusting in guest's used idx) and run a last
> > vhost_svq_handle_call_no_test while the device is paused.
>
> It looks to me what's really important is that SVQ needs to
> drain/forwared used buffers after vdpa is stopped. Then we should be
> fine.
>

Right. I think I picked the wrong place to raise the concern, but the
next revision will include the drain of the pending buffers.

Thanks!

> >
> > Thanks!
> >
> > >
> > > >
> > > >>> +    return true;
> > > >>>    }
> > > >>>
> > > >>>    static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bo=
ol enable)
> > > >>>    {
> > > >>>        struct vhost_dev *hdev =3D v->dev;
> > > >>>        unsigned n;
> > > >>> +    int r;
> > > >>>
> > > >>>        if (enable =3D=3D v->shadow_vqs_enabled) {
> > > >>>            return hdev->nvqs;
> > > >>> @@ -752,9 +779,18 @@ static unsigned vhost_vdpa_enable_svq(struct=
 vhost_vdpa *v, bool enable)
> > > >>>        if (!enable) {
> > > >>>            /* Disable all queues or clean up failed start */
> > > >>>            for (n =3D 0; n < v->shadow_vqs->len; ++n) {
> > > >>> +            struct vhost_vring_file file =3D {
> > > >>> +                .index =3D vhost_vdpa_get_vq_index(hdev, n),
> > > >>> +                .fd =3D v->call_fd[n],
> > > >>> +            };
> > > >>> +
> > > >>> +            r =3D vhost_vdpa_set_vring_call(hdev, &file);
> > > >>> +            assert(r =3D=3D 0);
> > > >>> +
> > > >>>                unsigned vq_idx =3D vhost_vdpa_get_vq_index(hdev, =
n);
> > > >>>                VhostShadowVirtqueue *svq =3D g_ptr_array_index(v-=
>shadow_vqs, n);
> > > >>>                vhost_svq_stop(hdev, n, svq);
> > > >>> +            /* TODO: This can unmask or override call fd! */
> > > >>
> > > >> I don't get this comment. Does this mean the current code can't wo=
rk
> > > >> with mask_notifiers? If yes, this is something we need to fix.
> > > >>
> > > > Yes, but it will be addressed in the next series. I should have
> > > > explained it bette here, sorry :).
> > >
> > >
> > > Ok.
> > >
> > > Thanks
> > >
> > >
> > > >
> > > > Thanks!
> > > >
> > > >> Thanks
> > > >>
> > > >>
> > > >>>                vhost_virtqueue_start(hdev, hdev->vdev, &hdev->vqs=
[n], vq_idx);
> > > >>>            }
> > > >>>
> > >
> >
>


