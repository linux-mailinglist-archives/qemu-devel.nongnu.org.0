Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0032F5A8D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 07:13:52 +0100 (CET)
Received: from localhost ([::1]:45624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzvtH-0004SK-D3
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 01:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kzvsD-00041b-LE
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 01:12:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kzvsA-0003wr-Ey
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 01:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610604761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cGKa4iYskbf0mVSXRVSB6A9qQb5sYLrdZDgKN+uTasw=;
 b=BMbrd530nw2ly/ZMBTUgZJ+bJMiaHwawRTh21CTsgbN1c4fK+mcE7R82/4Pf4VhK2re6IN
 JZXSc3LY7wu5OoJXjGiiO95jPubWxRG9hiQtZx5WLLzWoeXmlLA5KC31+nvyoMeIXZg6lF
 uTrsoJ/ul+UrxlBvVH8RdfolA8UGfn4=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-VyNB1FLUOKSvRv4ljeqZiw-1; Thu, 14 Jan 2021 01:12:37 -0500
X-MC-Unique: VyNB1FLUOKSvRv4ljeqZiw-1
Received: by mail-pg1-f200.google.com with SMTP id n2so3060456pgj.12
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 22:12:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cGKa4iYskbf0mVSXRVSB6A9qQb5sYLrdZDgKN+uTasw=;
 b=Q4LVKdL2/ttdBtEnTAC/MZGTvCmVtCCSLIHMWPKqtC+T+AGHcldvmZn2jdWttmrT92
 L9oTguTcJcpobbCfIf8M0nO8ldvnvXZ7MQWq/G8MUwgkETM0qrofKOwL6U/Khdcvm95N
 SaKfbQSGj7D7YXeVTW2/vYEMY63nxLQlJFqinNPUwfGjZdaNZkuIKm4bdMf+4J9P8xIs
 72RN3e3UIA06dRhVwPKxxhoEsHEDGNXqHDMuuDEenBQq6WFgpm92f7bZ5GhZE/OvnHsG
 JaUyrzDnnQY24BEZZdQgpKSITskYFqRw9LtXM+alIKx9vmrr1SipIz9iv3IYH1zC7Dlu
 PwcA==
X-Gm-Message-State: AOAM5302OJh0HSNjIlgsX+wcUphEvqNoQ0+iwxXkhaHHH/xmSuI8VjO9
 8GqzUZQMmZZISKucHuoqXVfoSRhKX0hix5UMmzGJxdmQ3ZenZVsuI/hirYDL2VGt/C7IZLb2Yk4
 iynzed6i7itWHZCUSHjazvvmz9+X99cM=
X-Received: by 2002:a62:ddcd:0:b029:1a6:99ff:a75e with SMTP id
 w196-20020a62ddcd0000b02901a699ffa75emr6007682pff.42.1610604755923; 
 Wed, 13 Jan 2021 22:12:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfRQ5BcdKjrRbB6TB5IRElSI7q4WzXH+Ou9dURQq0SrBUq9XHe8nAMm6d+tzHvV2/8p9dr69najEAtUp+Tyks=
X-Received: by 2002:a62:ddcd:0:b029:1a6:99ff:a75e with SMTP id
 w196-20020a62ddcd0000b02901a699ffa75emr6007663pff.42.1610604755664; Wed, 13
 Jan 2021 22:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20210113154540.24981-1-lulu@redhat.com>
 <20210113154540.24981-5-lulu@redhat.com>
 <b518466e-c6a8-f479-c635-891e427b822d@redhat.com>
In-Reply-To: <b518466e-c6a8-f479-c635-891e427b822d@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 14 Jan 2021 14:11:58 +0800
Message-ID: <CACLfguV=+WHyhrjJZumBMjX5hgQczA2yDfZKK5F0bszAbihJ4g@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] vhost-vdpa:add callback function for configure
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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

On Thu, Jan 14, 2021 at 12:46 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/13 =E4=B8=8B=E5=8D=8811:45, Cindy Lu wrote:
> > Add call back function for configure interrupt.
> > Set the notifier's fd to the kernel driver when vdpa start.
> > also set -1 when vdpa stop. then the kernel will release
> > the related=E8=81=BDresource=E8=81=BD
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/trace-events            |  2 ++
> >   hw/virtio/vhost-vdpa.c            | 29 ++++++++++++++++++++++++++++-
> >   include/hw/virtio/vhost-backend.h |  4 ++++
> >   3 files changed, 34 insertions(+), 1 deletion(-)
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
> > index 01d2101d09..1647bff8b0 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -467,20 +467,39 @@ static int vhost_vdpa_get_config(struct vhost_dev=
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
> > +     } else {
> > +        fd =3D -1;
> > +     }
> > +    r =3D dev->vhost_ops->vhost_set_config_call(dev, &fd);
> > +    if (r) {
> > +        error_report("vhost_vdpa_config_notify_start error!");
> > +    }
>
>
> So on early version of kernel without config interrupt support. This
> will fail for sure. We need seek a way to make it work.
>
> Thanks
>
Thanks Jason I will test the old version and fix this one
>
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
> > @@ -546,6 +565,13 @@ static int vhost_vdpa_set_vring_call(struct vhost_=
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
> > @@ -611,4 +637,5 @@ const VhostOps vdpa_ops =3D {
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


