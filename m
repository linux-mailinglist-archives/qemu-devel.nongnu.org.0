Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83FC305511
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 08:54:49 +0100 (CET)
Received: from localhost ([::1]:36958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4ff6-0002hB-W4
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 02:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4fcq-0001NB-5b
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:52:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4fcn-0001LG-Jy
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611733944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B0clgy/svavR7GAatDbolSeEwvirpjXpAYBnBi0UeM4=;
 b=N86ckC+sOUixEgx0jBDSdYsloJrUBECH3umArgNeB7GEhIHtMhOyAUK6tcNPXu3q0SXv2m
 7bSUdyYVy6YOKtZSOP3mZFxsxGLLm4fc3msQICWBTuFiPRZgAOPi6R2CpahBd3b1TubxCl
 RqutafGCkxEMbkdIjU9vMzES5jX6B+k=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-XNHoWJtTMn2DIA0yTv4tHw-1; Wed, 27 Jan 2021 02:52:19 -0500
X-MC-Unique: XNHoWJtTMn2DIA0yTv4tHw-1
Received: by mail-pl1-f200.google.com with SMTP id 32so745550plf.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 23:52:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B0clgy/svavR7GAatDbolSeEwvirpjXpAYBnBi0UeM4=;
 b=PcWf5HHCudc0uA8VEkklINTETAIw64xsWgvbxWmMhX4B56jAxOfxVO68GjlExz/3VZ
 oW0tGm7AcMZCYl1mEUZpB/Coj0dMEH8pQCmfqkt4OmF5t0MsaDBEwfGd7skCJg7MIzOw
 f2AvKim17uk3UlHmmaSIof+V3X8Jn8l6YxhzcuICCbZeadb9i2C0GSnn6o3uJWscYaVO
 kwenGsDoFVWKO4IiKVMfYMHDx1xoGxRht2Owh4ZYtyllNSp61jXd7DVdiZ2U2SbYfoxE
 /x8HuxwEj65QJfFr/0qSQP3qBewV0niPE6xZe5CRHBUSZH1JqnHHUz8NeCzk53TWB/Uf
 LkPw==
X-Gm-Message-State: AOAM53150nXCo0rG2UX3pxJLprz6flcegMZsdyv3P/KNWXjvCsLTpW/4
 E29X8My7Wfl0LRp0GmkYi+fXAuxpQV+OBL0UXf+6i7HCNjYyxGlt8mGT7zD0y5+46TftrV2nmOe
 yr0Di+889LPeSTEga6oMRP9IKwaRX7AM=
X-Received: by 2002:a17:90a:e656:: with SMTP id
 ep22mr4356540pjb.127.1611733938042; 
 Tue, 26 Jan 2021 23:52:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0vIzi693W7N9GTZp2e2Ofy+Lbby/45565FKyHSvb+8Kghxhn7yEMgje66nfZ9MgfEksz3gPgccBtP92RJw2Q=
X-Received: by 2002:a17:90a:e656:: with SMTP id
 ep22mr4356517pjb.127.1611733937775; 
 Tue, 26 Jan 2021 23:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20210126074254.3225-1-lulu@redhat.com>
 <20210126074254.3225-6-lulu@redhat.com>
 <639e39d7-e210-e2d6-5d42-0afb01dcddf7@redhat.com>
In-Reply-To: <639e39d7-e210-e2d6-5d42-0afb01dcddf7@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Wed, 27 Jan 2021 15:51:41 +0800
Message-ID: <CACLfguWXOBXbbW7cro4vU6XfDezaaQfXbNbzx618y9+XV8sURw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] vhost-vdpa: add callback function for configure
 interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 1:47 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/26 =E4=B8=8B=E5=8D=883:42, Cindy Lu wrote:
> > Add call back function for configure interrupt.
> > Set the notifier's fd to the kernel driver when vdpa start.
> > also set -1 while vdpa stop. then the kernel will release
> > the related resource
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/trace-events            |  2 ++
> >   hw/virtio/vhost-vdpa.c            | 37 ++++++++++++++++++++++++++++++=
-
> >   include/hw/virtio/vhost-backend.h |  4 ++++
> >   3 files changed, 42 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index 2060a144a2..6710835b46 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -52,6 +52,8 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int ind=
ex, int fd) "dev: %p index:
> >   vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p featur=
es: 0x%"PRIx64
> >   vhost_vdpa_set_owner(void *dev) "dev: %p"
> >   vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, =
uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_use=
r_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> > +vhost_vdpa_set_config_call(void *dev, int *fd)"dev: %p fd: %p"
> > +
> >
> >   # virtio.c
> >   virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsig=
ned out_num) "elem %p size %zd in_num %u out_num %u"
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 01d2101d09..cc1d39d663 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -467,20 +467,47 @@ static int vhost_vdpa_get_config(struct vhost_dev=
 *dev, uint8_t *config,
> >       }
> >       return ret;
> >    }
> > +static void vhost_vdpa_config_notify_start(struct vhost_dev *dev,
> > +                                struct VirtIODevice *vdev, bool start)
> > +{
> > +    int fd, r;
> > +    if (start) {
> > +        fd =3D event_notifier_get_fd(&vdev->config_notifier);
> > +        vdev->use_config_notifier =3D true;
> > +     } else {
> > +        fd =3D -1;
> > +        vdev->use_config_notifier =3D false;
> > +     }
> > +     /*set the fd call back to vdpa driver*/
>
>
> I guess checkpatch.pl might warn here. Please try to silent checkpath.pl
> before submitting patches.
>
Actually I do have run this script, but seems not warned here. I will
pay attention next time
>
> > +    r =3D dev->vhost_ops->vhost_set_config_call(dev, &fd);
> > +    if (r) {
> > +        vdev->use_config_notifier =3D false;
> > +        info_report("vhost_vdpa_config_notify not started!");
>
>
> This looks kind of fragile. Do we need some workaround here like:
>
> 1) filter out the features that depends on config interrupt
>
> or
>
> 2) A timer to watch the change of config space
>
> Thanks
>
sure I will add this check
>
> > +    }
> > +    /*active the config_notifier when vdev->use_config_notifier is tru=
e*/
> > +    if ((vdev->use_config_notifier) && (start)) {
> > +        event_notifier_set(&vdev->config_notifier);
> > +    }
> > +    return;
> >
> > +}
> >   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> >   {
> >       struct vhost_vdpa *v =3D dev->opaque;
> >       trace_vhost_vdpa_dev_start(dev, started);
> > +    VirtIODevice *vdev =3D dev->vdev;
> > +
> >       if (started) {
> >           uint8_t status =3D 0;
> >           memory_listener_register(&v->listener, &address_space_memory)=
;
> >           vhost_vdpa_set_vring_ready(dev);
> >           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> >           vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
> > -
> > +        /*set the configure interrupt call back*/
> > +        vhost_vdpa_config_notify_start(dev, vdev, true);
> >           return !(status & VIRTIO_CONFIG_S_DRIVER_OK);
> >       } else {
> > +        vhost_vdpa_config_notify_start(dev, vdev, false);
> >           vhost_vdpa_reset_device(dev);
> >           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >                                      VIRTIO_CONFIG_S_DRIVER);
> > @@ -546,6 +573,13 @@ static int vhost_vdpa_set_vring_call(struct vhost_=
dev *dev,
> >       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> >   }
> >
> > +static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
> > +                                       int *fd)
> > +{
> > +    trace_vhost_vdpa_set_config_call(dev, fd);
> > +    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, fd);
> > +}
> > +
> >   static int vhost_vdpa_get_features(struct vhost_dev *dev,
> >                                        uint64_t *features)
> >   {
> > @@ -611,4 +645,5 @@ const VhostOps vdpa_ops =3D {
> >           .vhost_get_device_id =3D vhost_vdpa_get_device_id,
> >           .vhost_vq_get_addr =3D vhost_vdpa_vq_get_addr,
> >           .vhost_force_iommu =3D vhost_vdpa_force_iommu,
> > +        .vhost_set_config_call =3D vhost_vdpa_set_config_call,
> >   };
> > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhos=
t-backend.h
> > index 8a6f8e2a7a..1a2fee8994 100644
> > --- a/include/hw/virtio/vhost-backend.h
> > +++ b/include/hw/virtio/vhost-backend.h
> > @@ -125,6 +125,9 @@ typedef int (*vhost_get_device_id_op)(struct vhost_=
dev *dev, uint32_t *dev_id);
> >
> >   typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
> >
> > +typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
> > +                                       int *fd);
> > +
> >   typedef struct VhostOps {
> >       VhostBackendType backend_type;
> >       vhost_backend_init vhost_backend_init;
> > @@ -170,6 +173,7 @@ typedef struct VhostOps {
> >       vhost_vq_get_addr_op  vhost_vq_get_addr;
> >       vhost_get_device_id_op vhost_get_device_id;
> >       vhost_force_iommu_op vhost_force_iommu;
> > +    vhost_set_config_call_op vhost_set_config_call;
> >   } VhostOps;
> >
> >   extern const VhostOps user_ops;
>


