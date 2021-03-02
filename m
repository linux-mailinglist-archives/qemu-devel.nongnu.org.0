Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BF832A611
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 17:32:10 +0100 (CET)
Received: from localhost ([::1]:46160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH7wO-0005nr-TY
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 11:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lH7v9-0005JE-Ni
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:30:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lH7v6-0001nO-H8
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614702647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KW92w+CvXgyn4rn0B7cVZK/3hl3UP57YomfCHhAVIJg=;
 b=PeueYANXQNcBRyeNow1F05ld8ans0l3rrk4gSGZqzMf5T+WNZYwdDPC6ZiWtoX7wgHYPwg
 m+AI6Pco50FuZ8nwV+pVwxmVgKAMKpb9aBj/x/kFoftRn9P4c9jKtt1T/M/LCkF+aZs7aT
 SGxMM3TAgjuc8eRQ4Xrodd7NBGGEqvs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-CBgUUq0wNgKPwVQxhA8aSQ-1; Tue, 02 Mar 2021 11:30:45 -0500
X-MC-Unique: CBgUUq0wNgKPwVQxhA8aSQ-1
Received: by mail-qk1-f197.google.com with SMTP id o8so17320902qkl.3
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 08:30:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KW92w+CvXgyn4rn0B7cVZK/3hl3UP57YomfCHhAVIJg=;
 b=CnRq6foZrtjxraLiCfDVwkg37G3FW/0ln8U8Z5WpjjtcwNZVGf81FVYYd332Qra0gR
 eaoe2HzBpS86/9bc1IeeuKMPJHBKWnAK3IXeJqfRRbyjhsKgOrzsqJJ7tsBTZjqwR4GC
 5zE5RjCOIQTE+VojlIzbaDlBgcqZyBVh5T+GOnwwyxckVdh7aHcnIBYencYhJxpsimmo
 l7zp17eXrbaOVKXZ6wneSFhp/4CV4n6C0JkHsOj63PQ+Sw2vWtaq7SrZaQ1kNJ/rTEfr
 Yfsvh3aAL9jTFrc7mQx4eLAfkelW/J4XlS6rLfLZDScepjtonWit5VL5vMHPVgodmQpU
 DLOQ==
X-Gm-Message-State: AOAM531bwzrrQUSoiCRHYFoPO2QTiUIKibpoO356qDP0ohqV1f/bBO7B
 0Ad/iVUovbGRy/xoGqqVhg2STbu0czsmqKLW3iobYYiHKt6jymOG6IXGzgOjA6oeTSj8iNoH7IA
 x+e309S7oCjNggde8s/QoMJvF+BczQKU=
X-Received: by 2002:ac8:5503:: with SMTP id j3mr7385745qtq.19.1614702645093;
 Tue, 02 Mar 2021 08:30:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYjrMldFgefGYQL0bYgyX3ixvUG9hcsRsBXQigkZ64/1xHPKNwEwBkhDDM33PCePYeb25O3rTgBN5r6WgV++Q=
X-Received: by 2002:ac8:5503:: with SMTP id j3mr7385708qtq.19.1614702644805;
 Tue, 02 Mar 2021 08:30:44 -0800 (PST)
MIME-Version: 1.0
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-8-eperezma@redhat.com>
 <3df92e05-95c5-536e-150a-b5be8d6e149e@redhat.com>
In-Reply-To: <3df92e05-95c5-536e-150a-b5be8d6e149e@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Mar 2021 17:30:08 +0100
Message-ID: <CAJaqyWdFhp4kdFNTKT-+KnS-7q7Ktyb2haFc87v9FfMppU0BqQ@mail.gmail.com>
Subject: Re: [RFC v2 7/7] vhost: Route host->guest notification through shadow
 virtqueue
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 1, 2021 at 7:24 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/2/9 11:37 =E4=B8=8B=E5=8D=88, Eugenio P=C3=A9rez wrote:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
> >   hw/virtio/vhost-shadow-virtqueue.c | 49 +++++++++++++++++++++++++++++=
+
> >   hw/virtio/vhost.c                  |  5 ++-
> >   3 files changed, 55 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index c45035c4b7..210133434c 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -17,6 +17,8 @@
> >
> >   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> >
> > +EventNotifier *vhost_shadow_vq_get_call_notifier(VhostShadowVirtqueue =
*vq);
> > +
> >   bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
> >                                  unsigned idx,
> >                                  VhostShadowVirtqueue *svq);
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 01f282d434..61d98ae652 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -24,6 +24,8 @@ typedef struct VhostShadowVirtqueue {
> >
> >       /* Borrowed virtqueue's guest to host notifier. */
> >       EventNotifier host_notifier;
> > +    /* Host to guest notifier */
> > +    EventNotifier *guest_notifier;
> >
> >       /* Virtio queue shadowing */
> >       VirtQueue *vq;
> > @@ -40,6 +42,26 @@ static void vhost_handle_guest_kick(EventNotifier *n=
)
> >       }
> >   }
> >
> > +/* Forward vhost notifications */
> > +static void vhost_handle_call(EventNotifier *n)
> > +{
> > +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueue=
,
> > +                                             call_notifier);
> > +
> > +    if (event_notifier_test_and_clear(n)) {
> > +        event_notifier_set(svq->guest_notifier);
> > +    }
> > +}
>
>
> So I wonder how this is synchonized with virtqueue mask/unmask. Or the
> masking is totally transparent to shadow virtqueue?
>

Hi Jason.

Thanks for pointing it out. Actually, the design proposed in this
series is wrong.

In this series, when the guest masks a virtqueue, qemu still sends the
masked notifier as call fd to the vhost device. While that ioctl acts
as a synchronization point, it disables shadow vq polling and used
buffers forwarding entirely. The guest could be actively polling the
virtqueue used ring and waiting for used buffers before unmasking:
This is valid as far as I can tell.

At unmasking, either guest's notifier or shadow virtqueue call
notifier is set, and masked is checked as usual. Again this is
transparent for the dataplane (vhost_handle_call in this series).

We could have a race in vhost_shadow_vq_stop_rcu, since mask/unmask
status is set by vcpu thread and these are called by QMP here [1]. As
Stefan pointed out, vhost_shadow_vq_start_rcu is bad because it
unmasks unconditionally.

In the next revision the masked status will be also tracked by the
shadow virtqueue, but will only affect qemu->guest used notifications.

> Thanks
>
>
> > +
> > +/*
> > + * Get the vhost call notifier of the shadow vq
> > + * @vq Shadow virtqueue
> > + */
> > +EventNotifier *vhost_shadow_vq_get_call_notifier(VhostShadowVirtqueue =
*vq)
> > +{
> > +    return &vq->call_notifier;
> > +}
> > +
> >   /*
> >    * Start shadow virtqueue operation.
> >    * @dev vhost device
> > @@ -57,6 +79,10 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev=
,
> >           .index =3D idx,
> >           .fd =3D event_notifier_get_fd(&svq->kick_notifier),
> >       };
> > +    struct vhost_vring_file call_file =3D {
> > +        .index =3D idx,
> > +        .fd =3D event_notifier_get_fd(&svq->call_notifier),
> > +    };
> >       int r;
> >
> >       /* Check that notifications are still going directly to vhost dev=
 */
> > @@ -66,6 +92,7 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
> >                              event_notifier_get_fd(vq_host_notifier));
> >       event_notifier_set_handler(&svq->host_notifier, vhost_handle_gues=
t_kick);
> >
> > +    svq->guest_notifier =3D virtio_queue_get_guest_notifier(svq->vq);
> >       r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
> >       if (unlikely(r !=3D 0)) {
> >           error_report("Couldn't set kick fd: %s", strerror(errno));
> > @@ -75,8 +102,19 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *de=
v,
> >       /* Check for pending notifications from the guest */
> >       vhost_handle_guest_kick(&svq->host_notifier);
> >
> > +    r =3D dev->vhost_ops->vhost_set_vring_call(dev, &call_file);
> > +    if (r !=3D 0) {
> > +        error_report("Couldn't set call fd: %s", strerror(errno));
> > +        goto err_set_vring_call;
> > +    }
> > +
> >       return true;
> >
> > +err_set_vring_call:
> > +    kick_file.fd =3D event_notifier_get_fd(vq_host_notifier);
> > +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
> > +    assert(r =3D=3D 0);
> > +
> >   err_set_vring_kick:
> >       event_notifier_set_handler(&svq->host_notifier, NULL);
> >
> > @@ -108,6 +146,16 @@ void vhost_shadow_vq_stop_rcu(struct vhost_dev *de=
v,
> >       assert(r =3D=3D 0);
> >
> >       event_notifier_set_handler(&svq->host_notifier, NULL);
> > +
> > +    if (!dev->vqs[idx].notifier_is_masked) {
> > +        EventNotifier *e =3D vhost_shadow_vq_get_call_notifier(svq);
 > > +
> > +        /* Restore vhost call */
> > +        vhost_virtqueue_mask(dev, dev->vdev, dev->vq_index + idx, fals=
e);
> > +
> > +        /* Check for pending calls */
> > +        vhost_handle_call(e);
> > +    }

[1] We could have a race condition if vcpu mask/unmask just between
reading it and calling vhost_virtqueue_mask: vhost_shadow_vq_stop_rcu
would override whatever guest set. It will be fixed in the next
revision.

> >   }
> >
> >   /*
> > @@ -136,6 +184,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vh=
ost_dev *dev, int idx)
> >           goto err_init_call_notifier;
> >       }
> >
> > +    event_notifier_set_handler(&svq->call_notifier, vhost_handle_call)=
;
> >       return g_steal_pointer(&svq);
> >
> >   err_init_call_notifier:
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 9d4728e545..0dc95679e9 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -975,7 +975,6 @@ static int vhost_sw_live_migration_start(struct vho=
st_dev *dev)
> >           for (idx =3D 0; idx < dev->nvqs; ++idx) {
> >               bool ok =3D vhost_shadow_vq_start_rcu(dev, idx,
> >                                                   dev->shadow_vqs[idx])=
;
> > -
> >               if (!ok) {
> >                   int stop_idx =3D idx;
> >
> > @@ -1608,6 +1607,10 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev=
, VirtIODevice *vdev, int n,
> >       if (mask) {
> >           assert(vdev->use_guest_notifier_mask);
> >           file.fd =3D event_notifier_get_fd(&hdev->vqs[index].masked_no=
tifier);
> > +    } else if (hdev->sw_lm_enabled) {
> > +        VhostShadowVirtqueue *svq =3D hdev->shadow_vqs[n];
> > +        EventNotifier *e =3D vhost_shadow_vq_get_call_notifier(svq);
> > +        file.fd =3D event_notifier_get_fd(e);
> >       } else {
> >           file.fd =3D event_notifier_get_fd(virtio_queue_get_guest_noti=
fier(vvq));
> >       }
>


