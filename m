Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C3E4A4F6D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 20:29:29 +0100 (CET)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEcMi-0004nK-Es
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 14:29:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEbvy-0007im-CB
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:01:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEbvZ-0008Pa-FB
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:01:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643655559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zy+hu+aqPZTnN5prArMgbJZAo4lk3UUN+wKDD5iUB2Q=;
 b=gHzFLKH7WXlqko7PZcjIe2LxN6H5nqQvM921k06xMrEUxlR0jYZttv5wlw3pVbV1yNw9RY
 Bqs8hA+Oc3vhSWiQHkcpzU69sa/0wTJuErUeWbBhsLtq//Vfv7txkrDZbvggdVgtlfbuKZ
 mxKX8lAsnmkIqm9gbvZJqo3GhKRV7XA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-2RSwECXLMLW2z0gqjxvFhw-1; Mon, 31 Jan 2022 13:59:17 -0500
X-MC-Unique: 2RSwECXLMLW2z0gqjxvFhw-1
Received: by mail-qk1-f199.google.com with SMTP id
 c128-20020a37b386000000b0047f37e77660so10421346qkf.12
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 10:59:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zy+hu+aqPZTnN5prArMgbJZAo4lk3UUN+wKDD5iUB2Q=;
 b=2d9liKBGI71LYteHvPWo3crmnMWoA4ywoELdIvktG0G0Y0reJvk8UmUnH56d0yKjC5
 KNgAf8rnxaneJp236oshd6qQzgZ4IgAv1MCSL+KA5naeDYiNx3pXB5AjMSmRYLJzNwgt
 fZfMZ9H7A0YBuy75H706K0ejdLvM7EkIjCJh2b+c3yIpKhUCkrlJjvqLzZ7r+2OSw04X
 dfnDP/YAkVBZpE5TXo1wzz1xpA1JAQ9BF4+u+efqcyBvvvJW+woq3fG+qAoUasn2v9bS
 hIRJEL7nGIq+Qnb4oNG0avhi+CxOlsDwhUzC6xlJvXc5ZxBpMf62NN3hvKCt8EVVY9Gn
 JzVQ==
X-Gm-Message-State: AOAM531uF8KxOAnoWyrftbk0wg9PFalO7LO8fPfO7goENaNp+2q5ZUho
 nsTMyUhc57x5jpZgX9ioOgpqOue4GKeKcbmDvE6Bu4sc/1WWSllUxBwAW6KcUFtQ23ReBbJ8IkT
 SsxD98djhjYT46o5jgATNkVlSXcieLvU=
X-Received: by 2002:ac8:5f14:: with SMTP id x20mr7510138qta.459.1643655557230; 
 Mon, 31 Jan 2022 10:59:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRMG5OSzoyXO/zQir1R2lKLHjlBSefbjfhsC9SFUGgcx72DGA3Kp++2/AcWTUdmiwenyJZLFqJaoz1P8D9a+0=
X-Received: by 2002:ac8:5f14:: with SMTP id x20mr7510129qta.459.1643655556908; 
 Mon, 31 Jan 2022 10:59:16 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-18-eperezma@redhat.com>
 <82b8c3bf-1b11-86c7-4fad-294f5ccf1278@redhat.com>
In-Reply-To: <82b8c3bf-1b11-86c7-4fad-294f5ccf1278@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Jan 2022 19:58:40 +0100
Message-ID: <CAJaqyWdRKZp6CwnE+HAr0JALhSRh-trJbZ01kddnLTuRX_tMKQ@mail.gmail.com>
Subject: Re: [PATCH 17/31] vdpa: adapt vhost_ops callbacks to svq
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 30, 2022 at 5:03 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > First half of the buffers forwarding part, preparing vhost-vdpa
> > callbacks to SVQ to offer it. QEMU cannot enable it at this moment, so
> > this is effectively dead code at the moment, but it helps to reduce
> > patch size.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |   2 +-
> >   hw/virtio/vhost-shadow-virtqueue.c |  21 ++++-
> >   hw/virtio/vhost-vdpa.c             | 133 ++++++++++++++++++++++++++--=
-
> >   3 files changed, 143 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 035207a469..39aef5ffdf 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -35,7 +35,7 @@ size_t vhost_svq_device_area_size(const VhostShadowVi=
rtqueue *svq);
> >
> >   void vhost_svq_stop(VhostShadowVirtqueue *svq);
> >
> > -VhostShadowVirtqueue *vhost_svq_new(void);
> > +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize);
> >
> >   void vhost_svq_free(VhostShadowVirtqueue *vq);
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index f129ec8395..7c168075d7 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -277,9 +277,17 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >   /**
> >    * Creates vhost shadow virtqueue, and instruct vhost device to use t=
he shadow
> >    * methods and file descriptors.
> > + *
> > + * @qsize Shadow VirtQueue size
> > + *
> > + * Returns the new virtqueue or NULL.
> > + *
> > + * In case of error, reason is reported through error_report.
> >    */
> > -VhostShadowVirtqueue *vhost_svq_new(void)
> > +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize)
> >   {
> > +    size_t desc_size =3D sizeof(vring_desc_t) * qsize;
> > +    size_t device_size, driver_size;
> >       g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqu=
eue, 1);
> >       int r;
> >
> > @@ -300,6 +308,15 @@ VhostShadowVirtqueue *vhost_svq_new(void)
> >       /* Placeholder descriptor, it should be deleted at set_kick_fd */
> >       event_notifier_init_fd(&svq->svq_kick, INVALID_SVQ_KICK_FD);
> >
> > +    svq->vring.num =3D qsize;
>
>
> I wonder if this is the best. E.g some hardware can support up to 32K
> queue size. So this will probably end up with:
>
> 1) SVQ use 32K queue size
> 2) hardware queue uses 256
>

In that case SVQ vring queue size will be 32K and guest's vring can
negotiate any number with SVQ equal or less than 32K, including 256.
Is that what you mean?

If with hardware queues you mean guest's vring, not sure why it is
"probably 256". I'd say that in that case with the virtio-net kernel
driver the ring size will be the same as the device export, for
example, isn't it?

The implementation should support any combination of sizes, but the
ring size exposed to the guest is never bigger than hardware one.

> ? Or we SVQ can stick to 256 but this will this cause trouble if we want
> to add event index support?
>

I think we should not have any problem with event idx. If you mean
that the guest could mark more buffers available than SVQ vring's
size, that should not happen because there must be less entries in the
guest than SVQ.

But if I understood you correctly, a similar situation could happen if
a guest's contiguous buffer is scattered across many qemu's VA chunks.
Even if that would happen, the situation should be ok too: SVQ knows
the guest's avail idx and, if SVQ is full, it will continue forwarding
avail buffers when the device uses more buffers.

Does that make sense to you?

>
> > +    driver_size =3D vhost_svq_driver_area_size(svq);
> > +    device_size =3D vhost_svq_device_area_size(svq);
> > +    svq->vring.desc =3D qemu_memalign(qemu_real_host_page_size, driver=
_size);
> > +    svq->vring.avail =3D (void *)((char *)svq->vring.desc + desc_size)=
;
> > +    memset(svq->vring.desc, 0, driver_size);
> > +    svq->vring.used =3D qemu_memalign(qemu_real_host_page_size, device=
_size);
> > +    memset(svq->vring.used, 0, device_size);
> > +
> >       event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call=
);
> >       return g_steal_pointer(&svq);
> >
> > @@ -318,5 +335,7 @@ void vhost_svq_free(VhostShadowVirtqueue *vq)
> >       event_notifier_cleanup(&vq->hdev_kick);
> >       event_notifier_set_handler(&vq->hdev_call, NULL);
> >       event_notifier_cleanup(&vq->hdev_call);
> > +    qemu_vfree(vq->vring.desc);
> > +    qemu_vfree(vq->vring.used);
> >       g_free(vq);
> >   }
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 9d801cf907..53e14bafa0 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -641,20 +641,52 @@ static int vhost_vdpa_set_vring_addr(struct vhost=
_dev *dev,
> >       return vhost_vdpa_call(dev, VHOST_SET_VRING_ADDR, addr);
> >   }
> >
> > -static int vhost_vdpa_set_vring_num(struct vhost_dev *dev,
> > -                                      struct vhost_vring_state *ring)
> > +static int vhost_vdpa_set_dev_vring_num(struct vhost_dev *dev,
> > +                                        struct vhost_vring_state *ring=
)
> >   {
> >       trace_vhost_vdpa_set_vring_num(dev, ring->index, ring->num);
> >       return vhost_vdpa_call(dev, VHOST_SET_VRING_NUM, ring);
> >   }
> >
> > -static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
> > -                                       struct vhost_vring_state *ring)
> > +static int vhost_vdpa_set_vring_num(struct vhost_dev *dev,
> > +                                    struct vhost_vring_state *ring)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +
> > +    if (v->shadow_vqs_enabled) {
> > +        /*
> > +         * Vring num was set at device start. SVQ num is handled by Vi=
rtQueue
> > +         * code
> > +         */
> > +        return 0;
> > +    }
> > +
> > +    return vhost_vdpa_set_dev_vring_num(dev, ring);
> > +}
> > +
> > +static int vhost_vdpa_set_dev_vring_base(struct vhost_dev *dev,
> > +                                         struct vhost_vring_state *rin=
g)
> >   {
> >       trace_vhost_vdpa_set_vring_base(dev, ring->index, ring->num);
> >       return vhost_vdpa_call(dev, VHOST_SET_VRING_BASE, ring);
> >   }
> >
> > +static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
> > +                                     struct vhost_vring_state *ring)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +
> > +    if (v->shadow_vqs_enabled) {
> > +        /*
> > +         * Vring base was set at device start. SVQ base is handled by =
VirtQueue
> > +         * code
> > +         */
> > +        return 0;
> > +    }
> > +
> > +    return vhost_vdpa_set_dev_vring_base(dev, ring);
> > +}
> > +
> >   static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
> >                                          struct vhost_vring_state *ring=
)
> >   {
> > @@ -784,8 +816,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *d=
ev, bool started)
> >       }
> >   }
> >
> > -static int vhost_vdpa_get_features(struct vhost_dev *dev,
> > -                                     uint64_t *features)
> > +static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
> > +                                       uint64_t *features)
> >   {
> >       int ret;
> >
> > @@ -794,15 +826,64 @@ static int vhost_vdpa_get_features(struct vhost_d=
ev *dev,
> >       return ret;
> >   }
> >
> > +static int vhost_vdpa_get_features(struct vhost_dev *dev, uint64_t *fe=
atures)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    int ret =3D vhost_vdpa_get_dev_features(dev, features);
> > +
> > +    if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> > +        /* Filter only features that SVQ can offer to guest */
> > +        vhost_svq_valid_guest_features(features);
> > +    }
>
>
> Sorry if I've asked before, I think it's sufficient to filter out the
> device features that we don't support during and fail the vhost
> initialization. Any reason we need do it again here?
>

On the contrary, if something needs to be asked that means that is not
clear enough :).

At initialization we validate that the device offers all the needed
features (ACCESS_PLATFORM, VERSION_1). We don't have the features
acknowledged by the guest at that point.

This is checking the written features by the guest. For example, we
accept _F_INDIRECT here, so the guest can write indirect descriptors
to SVQ, since qemu VirtQueue code is handling it for us. I've stayed
on the safe side and I've not included packed or event_idx, but I
might try to run with them. These would not have been accepted for the
device.

>
> > +
> > +    return ret;
> > +}
> > +
> >   static int vhost_vdpa_set_features(struct vhost_dev *dev,
> >                                      uint64_t features)
> >   {
> > +    struct vhost_vdpa *v =3D dev->opaque;
> >       int ret;
> >
> >       if (vhost_vdpa_one_time_request(dev)) {
> >           return 0;
> >       }
> >
> > +    if (v->shadow_vqs_enabled) {
> > +        uint64_t dev_features, svq_features, acked_features;
> > +        bool ok;
> > +
> > +        ret =3D vhost_vdpa_get_dev_features(dev, &dev_features);
> > +        if (ret !=3D 0) {
> > +            error_report("Can't get vdpa device features, got (%d)", r=
et);
> > +            return ret;
> > +        }
> > +
> > +        svq_features =3D dev_features;
> > +        ok =3D vhost_svq_valid_device_features(&svq_features);
> > +        if (unlikely(!ok)) {
> > +            error_report("SVQ Invalid device feature flags, offer: 0x%=
"
> > +                         PRIx64", ok: 0x%"PRIx64, dev->features, svq_f=
eatures);
> > +            return -1;
> > +        }
> > +
> > +        ok =3D vhost_svq_valid_guest_features(&features);
> > +        if (unlikely(!ok)) {
> > +            error_report(
> > +                "Invalid guest acked feature flag, acked: 0x%"
> > +                PRIx64", ok: 0x%"PRIx64, dev->acked_features, features=
);
> > +            return -1;
> > +        }
> > +
> > +        ok =3D vhost_svq_ack_guest_features(svq_features, features,
> > +                                          &acked_features);
> > +        if (unlikely(!ok)) {
> > +            return -1;
> > +        }
> > +
> > +        features =3D acked_features;
> > +    }
> > +
> >       trace_vhost_vdpa_set_features(dev, features);
> >       ret =3D vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
> >       if (ret) {
> > @@ -822,13 +903,31 @@ static int vhost_vdpa_set_owner(struct vhost_dev =
*dev)
> >       return vhost_vdpa_call(dev, VHOST_SET_OWNER, NULL);
> >   }
> >
> > -static int vhost_vdpa_vq_get_addr(struct vhost_dev *dev,
> > -                    struct vhost_vring_addr *addr, struct vhost_virtqu=
eue *vq)
> > +static void vhost_vdpa_vq_get_guest_addr(struct vhost_vring_addr *addr=
,
> > +                                         struct vhost_virtqueue *vq)
> >   {
> > -    assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VDPA=
);
> >       addr->desc_user_addr =3D (uint64_t)(unsigned long)vq->desc_phys;
> >       addr->avail_user_addr =3D (uint64_t)(unsigned long)vq->avail_phys=
;
> >       addr->used_user_addr =3D (uint64_t)(unsigned long)vq->used_phys;
> > +}
> > +
> > +static int vhost_vdpa_vq_get_addr(struct vhost_dev *dev,
> > +                                  struct vhost_vring_addr *addr,
> > +                                  struct vhost_virtqueue *vq)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +
> > +    assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VDPA=
);
> > +
> > +    if (v->shadow_vqs_enabled) {
> > +        int idx =3D vhost_vdpa_get_vq_index(dev, addr->index);
> > +        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 idx);
> > +
> > +        vhost_svq_get_vring_addr(svq, addr);
> > +    } else {
> > +        vhost_vdpa_vq_get_guest_addr(addr, vq);
> > +    }
> > +
> >       trace_vhost_vdpa_vq_get_addr(dev, vq, addr->desc_user_addr,
> >                                    addr->avail_user_addr, addr->used_us=
er_addr);
> >       return 0;
> > @@ -849,6 +948,12 @@ static void vhost_psvq_free(gpointer svq)
> >       vhost_svq_free(svq);
> >   }
> >
> > +static int vhost_vdpa_get_max_queue_size(struct vhost_dev *dev,
> > +                                         uint16_t *qsize)
> > +{
> > +    return vhost_vdpa_call(dev, VHOST_VDPA_GET_VRING_NUM, qsize);
> > +}
> > +
> >   static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_v=
dpa *v,
> >                                  Error **errp)
> >   {
> > @@ -857,6 +962,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hd=
ev, struct vhost_vdpa *v,
> >                                                              vhost_psvq=
_free);
> >       uint64_t dev_features;
> >       uint64_t svq_features;
> > +    uint16_t qsize;
> >       int r;
> >       bool ok;
> >
> > @@ -864,7 +970,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hd=
ev, struct vhost_vdpa *v,
> >           goto out;
> >       }
> >
> > -    r =3D vhost_vdpa_get_features(hdev, &dev_features);
> > +    r =3D vhost_vdpa_get_dev_features(hdev, &dev_features);
> >       if (r !=3D 0) {
> >           error_setg(errp, "Can't get vdpa device features, got (%d)", =
r);
> >           return r;
> > @@ -879,9 +985,14 @@ static int vhost_vdpa_init_svq(struct vhost_dev *h=
dev, struct vhost_vdpa *v,
> >           return -1;
> >       }
> >
> > +    r =3D vhost_vdpa_get_max_queue_size(hdev, &qsize);
> > +    if (unlikely(r)) {
> > +        qsize =3D 256;
> > +    }
>
>
> Should we fail instead of having a "default" value here?
>

Maybe it is better to fail here, yes. I guess there is no safe default valu=
e.

Thanks!

> Thanks
>
>
> > +
> >       shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_psvq_free);
> >       for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> > -        VhostShadowVirtqueue *svq =3D vhost_svq_new();
> > +        VhostShadowVirtqueue *svq =3D vhost_svq_new(qsize);
> >
> >           if (unlikely(!svq)) {
> >               error_setg(errp, "Cannot create svq %u", n);
>


