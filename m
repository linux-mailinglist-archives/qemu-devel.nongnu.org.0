Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D39842DFB4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:52:32 +0200 (CEST)
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3y3-00022c-DC
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb3mQ-0003pH-Gb
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb3mM-0004fG-7q
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634229624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9VhFNGqh7LUqOjLsyctT/XD/3znKuX/fz62jM/I1zc=;
 b=daVBffcfVGjFB1XtutYw6wVyAhW/8PmCNpT7bhrVpJwRoKrIwYSJxgdeo8KYUy80FlCR7D
 IwkBVW2Ml/X0ISfUChiJ0ME+FoVgsVo+rXfFW3cVvCnxr9O/zNKai0qUQ2v4nLrSafCtEG
 GaXIeS3HUB5harC97LJP2HNcDLhIbAQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-KUlLB-v4MKipIRwAY8S3OA-1; Thu, 14 Oct 2021 12:40:22 -0400
X-MC-Unique: KUlLB-v4MKipIRwAY8S3OA-1
Received: by mail-qk1-f197.google.com with SMTP id
 v14-20020a05620a0f0e00b0043355ed67d1so4881823qkl.7
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l9VhFNGqh7LUqOjLsyctT/XD/3znKuX/fz62jM/I1zc=;
 b=HZBKcjDfmLS//YMytjRkI8G2tlbdMbsKP/NNAu4NMcuMwyxBamvyBNegMYeTj8LMnS
 SozonwbjVTbA8XQGaHxWh5R9sp2de57Ght7W43uUeL1p8JeVgu2Xg+upguRxPb+Liwcb
 FakyYoYY4DdDpYXGLv9+6FcD6TjcWHR5u5b2CRidUWpPcLFboqqzBd/WI6e0uVfMCBDc
 Sub4pNbGbbO/RIK4+Q6FO68Zh+uT79DuM8M0ZjD1+j9l+Wtyzs3ZIDalYtpGDAfV0KVa
 Flx7npuP1dJLGkLwZIWlx+RIxhKQyPVbTBZBl5OWgky6lqTIUokVfsAU37RSj6O7fV/b
 c0UQ==
X-Gm-Message-State: AOAM530yRv1E6+P3c5Zhv+iZgbDQpl/UXlyeAib6mjt445rWhVmwuEVt
 FOTIWZc7VjNo/YWGi3KbbA66axT8+b8nZEhkZkp5Dlu+E+A3hgdT/33Yc5Sd2v0nlh/jRdfZFuC
 AE/lZfSHviUkrk0jkG+tr4Tpp6dUnMqM=
X-Received: by 2002:a05:620a:4154:: with SMTP id
 k20mr5825824qko.316.1634229621964; 
 Thu, 14 Oct 2021 09:40:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJ9ryPK72EnKpfBQUANYMb2JSreSYBBOm+uTsCN3NoBuxAdfRwSvpHko8nFdT8a31RkGYOurW9Jy6cNQjs30Q=
X-Received: by 2002:a05:620a:4154:: with SMTP id
 k20mr5825787qko.316.1634229621711; 
 Thu, 14 Oct 2021 09:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-12-eperezma@redhat.com>
 <ab9a7771-5f9b-6413-3e38-bd3dc7373256@redhat.com>
In-Reply-To: <ab9a7771-5f9b-6413-3e38-bd3dc7373256@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 14 Oct 2021 18:39:45 +0200
Message-ID: <CAJaqyWfm734HrwTJK71hUQNYVkyDaR8OiqtGro_AX9i_pXfmBQ@mail.gmail.com>
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
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 5:47 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This will make qemu aware of the device used buffers, allowing it to
> > write the guest memory with its contents if needed.
> >
> > Since the use of vhost_virtqueue_start can unmasks and discard call
> > events, vhost_virtqueue_start should be modified in one of these ways:
> > * Split in two: One of them uses all logic to start a queue with no
> >    side effects for the guest, and another one tha actually assumes tha=
t
> >    the guest has just started the device. Vdpa should use just the
> >    former.
> > * Actually store and check if the guest notifier is masked, and do it
> >    conditionally.
> > * Left as it is, and duplicate all the logic in vhost-vdpa.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.c | 19 +++++++++++++++
> >   hw/virtio/vhost-vdpa.c             | 38 +++++++++++++++++++++++++++++=
-
> >   2 files changed, 56 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 21dc99ab5d..3fe129cf63 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -53,6 +53,22 @@ static void vhost_handle_guest_kick(EventNotifier *n=
)
> >       event_notifier_set(&svq->kick_notifier);
> >   }
> >
> > +/* Forward vhost notifications */
> > +static void vhost_svq_handle_call_no_test(EventNotifier *n)
> > +{
> > +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueue=
,
> > +                                             call_notifier);
> > +
> > +    event_notifier_set(&svq->guest_call_notifier);
> > +}
> > +
> > +static void vhost_svq_handle_call(EventNotifier *n)
> > +{
> > +    if (likely(event_notifier_test_and_clear(n))) {
> > +        vhost_svq_handle_call_no_test(n);
> > +    }
> > +}
> > +
> >   /*
> >    * Obtain the SVQ call notifier, where vhost device notifies SVQ that=
 there
> >    * exists pending used buffers.
> > @@ -180,6 +196,8 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_de=
v *dev, int idx)
> >       }
> >
> >       svq->vq =3D virtio_get_queue(dev->vdev, vq_idx);
> > +    event_notifier_set_handler(&svq->call_notifier,
> > +                               vhost_svq_handle_call);
> >       return g_steal_pointer(&svq);
> >
> >   err_init_call_notifier:
> > @@ -195,6 +213,7 @@ err_init_kick_notifier:
> >   void vhost_svq_free(VhostShadowVirtqueue *vq)
> >   {
> >       event_notifier_cleanup(&vq->kick_notifier);
> > +    event_notifier_set_handler(&vq->call_notifier, NULL);
> >       event_notifier_cleanup(&vq->call_notifier);
> >       g_free(vq);
> >   }
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index bc34de2439..6c5f4c98b8 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -712,13 +712,40 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_=
dev *dev, unsigned idx)
> >   {
> >       struct vhost_vdpa *v =3D dev->opaque;
> >       VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs, id=
x);
> > -    return vhost_svq_start(dev, idx, svq);
> > +    EventNotifier *vhost_call_notifier =3D vhost_svq_get_svq_call_noti=
fier(svq);
> > +    struct vhost_vring_file vhost_call_file =3D {
> > +        .index =3D idx + dev->vq_index,
> > +        .fd =3D event_notifier_get_fd(vhost_call_notifier),
> > +    };
> > +    int r;
> > +    bool b;
> > +
> > +    /* Set shadow vq -> guest notifier */
> > +    assert(v->call_fd[idx]);
>
>
> We need aovid the asser() here. On which case we can hit this?
>

I would say that there is no way we can actually hit it, so let's remove it=
.

>
> > +    vhost_svq_set_guest_call_notifier(svq, v->call_fd[idx]);
> > +
> > +    b =3D vhost_svq_start(dev, idx, svq);
> > +    if (unlikely(!b)) {
> > +        return false;
> > +    }
> > +
> > +    /* Set device -> SVQ notifier */
> > +    r =3D vhost_vdpa_set_vring_dev_call(dev, &vhost_call_file);
> > +    if (unlikely(r)) {
> > +        error_report("vhost_vdpa_set_vring_call for shadow vq failed")=
;
> > +        return false;
> > +    }
>
>
> Similar to kick, do we need to set_vring_call() before vhost_svq_start()?
>

It should not matter at this moment because the device should not be
started at this point and device calls should not run
vhost_svq_handle_call until BQL is released.

The "logic" of doing it after is to make clear that svq must be fully
initialized before processing device calls, even in the case that we
extract SVQ in its own iothread or similar. But this could be done
before vhost_svq_start for sure.

>
> > +
> > +    /* Check for pending calls */
> > +    event_notifier_set(vhost_call_notifier);
>
>
> Interesting, can this result spurious interrupt?
>

This actually "queues" a vhost_svq_handle_call after the BQL release,
where the device should be fully reset. In that regard, if there are
no used descriptors there will not be an irq raised to the guest. Does
that answer the question? Or have I missed something?

>
> > +    return true;
> >   }
> >
> >   static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enab=
le)
> >   {
> >       struct vhost_dev *hdev =3D v->dev;
> >       unsigned n;
> > +    int r;
> >
> >       if (enable =3D=3D v->shadow_vqs_enabled) {
> >           return hdev->nvqs;
> > @@ -752,9 +779,18 @@ static unsigned vhost_vdpa_enable_svq(struct vhost=
_vdpa *v, bool enable)
> >       if (!enable) {
> >           /* Disable all queues or clean up failed start */
> >           for (n =3D 0; n < v->shadow_vqs->len; ++n) {
> > +            struct vhost_vring_file file =3D {
> > +                .index =3D vhost_vdpa_get_vq_index(hdev, n),
> > +                .fd =3D v->call_fd[n],
> > +            };
> > +
> > +            r =3D vhost_vdpa_set_vring_call(hdev, &file);
> > +            assert(r =3D=3D 0);
> > +
> >               unsigned vq_idx =3D vhost_vdpa_get_vq_index(hdev, n);
> >               VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow=
_vqs, n);
> >               vhost_svq_stop(hdev, n, svq);
> > +            /* TODO: This can unmask or override call fd! */
>
>
> I don't get this comment. Does this mean the current code can't work
> with mask_notifiers? If yes, this is something we need to fix.
>

Yes, but it will be addressed in the next series. I should have
explained it bette here, sorry :).

Thanks!

> Thanks
>
>
> >               vhost_virtqueue_start(hdev, hdev->vdev, &hdev->vqs[n], vq=
_idx);
> >           }
> >
>


