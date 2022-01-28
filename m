Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C7049F4D6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 09:03:48 +0100 (CET)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDMEV-00076i-Lr
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 03:03:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nDM9V-0005E5-E9
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 02:58:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nDM9T-00025i-8Q
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 02:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643356714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LqzgB+hqj4JKwXV48f/fIvNQ8lq0hxSl/iEmIWQyNU0=;
 b=T81FMT21M7PU1VDir3K+9UjWwd9/HEBO67UT+I2NDsf/KOG4uD0cqpJsln5HXpTkjpwzU1
 ZwxJN3+ntCcNIuCnZK94qGVGfX4qPTpmr4PBuWBTYs5DO1hLcMoBWlgkrIwKKvsONYQWZ6
 QDLyYMd6yh059j+PjyThtcWEaj/cbmQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-M7bMpDBFOYKLaqyOpOF-mQ-1; Fri, 28 Jan 2022 02:58:28 -0500
X-MC-Unique: M7bMpDBFOYKLaqyOpOF-mQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 gg10-20020a056214252a00b0041eeb1c2684so5410532qvb.21
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 23:58:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LqzgB+hqj4JKwXV48f/fIvNQ8lq0hxSl/iEmIWQyNU0=;
 b=PAs/HQyN0FkTMs9vLsg1nPGh62nUHdhZw+i/E0/HzDfd7pbG51sjgmOBaX6va6M039
 hQGYcJmppbWg3gNv92QqXRtQOY0E/NDUQFssQFhuwis/WvAU2tDN3hYtVpywtUgaWvks
 gpOG0LCXCW4hmeJAqac4mAp/Y6xJFraSoOUbvKGLck0Kpiw5ZajoOQiFAk/3fE4XuEmW
 gKFgjQ8EIJHCf3rmmuJz44zMIPGxeMm5zan1MBtEHUxCd9oYeq/0NWHTFw1MzHe8Esch
 DB3fPTHkUq+ubo5l36Xhf3K3h8h0GZpvvLTgK3h4OBy+KN0yFPiHxi5dw0UuTVHbQw76
 aeOw==
X-Gm-Message-State: AOAM532Etin50ZJqTEwr4regLQeipuazvOBAgzc4SZhv6EBIKVNPhzvE
 9gRX8ap7n7p1K3PqVIUIgrVEEmsT06SzGwH5AOTdK67mAexjIC9EhiMdyj/lxgK8pxklxdkIz+H
 wJ0qtMzuOWUnweSlosUzrC9Ej+LGiDng=
X-Received: by 2002:a05:622a:215:: with SMTP id
 b21mr5207466qtx.199.1643356707481; 
 Thu, 27 Jan 2022 23:58:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1Phd/1fG7anv2l/RdmujzEqOpTWHCctma8YPeNZMXryVQM4JTpmn/pzl2yadUMjsDnJHH9UikiShP6iOZ1So=
X-Received: by 2002:a05:622a:215:: with SMTP id
 b21mr5207453qtx.199.1643356707168; 
 Thu, 27 Jan 2022 23:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-2-eperezma@redhat.com>
 <bb5490a4-8fae-0cc8-56dd-0953a2b40922@redhat.com>
In-Reply-To: <bb5490a4-8fae-0cc8-56dd-0953a2b40922@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 28 Jan 2022 08:57:51 +0100
Message-ID: <CAJaqyWffGzYv2+HufFZzzBPtu5z3_vaKh4evGXqj7hqTB0WU3A@mail.gmail.com>
Subject: Re: [PATCH 01/31] vdpa: Reorder virtio/vhost-vdpa.c functions
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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

On Fri, Jan 28, 2022 at 6:59 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > vhost_vdpa_set_features and vhost_vdpa_init need to use
> > vhost_vdpa_get_features in svq mode.
> >
> > vhost_vdpa_dev_start needs to use almost all _set_ functions:
> > vhost_vdpa_set_vring_dev_kick, vhost_vdpa_set_vring_dev_call,
> > vhost_vdpa_set_dev_vring_base and vhost_vdpa_set_dev_vring_num.
> >
> > No functional change intended.
>
>
> Is it related (a must) to the SVQ code?
>

Yes, SVQ needs to access the device variants to configure it, while
exposing the SVQ ones.

For example for set_features, SVQ needs to set device features in the
start code, but expose SVQ ones to the guest.

Another possibility is to forward-declare them but I feel it pollutes
the code more, doesn't it? Is there any reason to avoid the reordering
beyond reducing the number of changes/patches?

Thanks!


> Thanks
>
>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 164 ++++++++++++++++++++--------------------=
-
> >   1 file changed, 82 insertions(+), 82 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 04ea43704f..6c10a7f05f 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -342,41 +342,6 @@ static bool vhost_vdpa_one_time_request(struct vho=
st_dev *dev)
> >       return v->index !=3D 0;
> >   }
> >
> > -static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error =
**errp)
> > -{
> > -    struct vhost_vdpa *v;
> > -    assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VDPA=
);
> > -    trace_vhost_vdpa_init(dev, opaque);
> > -    int ret;
> > -
> > -    /*
> > -     * Similar to VFIO, we end up pinning all guest memory and have to
> > -     * disable discarding of RAM.
> > -     */
> > -    ret =3D ram_block_discard_disable(true);
> > -    if (ret) {
> > -        error_report("Cannot set discarding of RAM broken");
> > -        return ret;
> > -    }
> > -
> > -    v =3D opaque;
> > -    v->dev =3D dev;
> > -    dev->opaque =3D  opaque ;
> > -    v->listener =3D vhost_vdpa_memory_listener;
> > -    v->msg_type =3D VHOST_IOTLB_MSG_V2;
> > -
> > -    vhost_vdpa_get_iova_range(v);
> > -
> > -    if (vhost_vdpa_one_time_request(dev)) {
> > -        return 0;
> > -    }
> > -
> > -    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > -                               VIRTIO_CONFIG_S_DRIVER);
> > -
> > -    return 0;
> > -}
> > -
> >   static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
> >                                               int queue_index)
> >   {
> > @@ -506,24 +471,6 @@ static int vhost_vdpa_set_mem_table(struct vhost_d=
ev *dev,
> >       return 0;
> >   }
> >
> > -static int vhost_vdpa_set_features(struct vhost_dev *dev,
> > -                                   uint64_t features)
> > -{
> > -    int ret;
> > -
> > -    if (vhost_vdpa_one_time_request(dev)) {
> > -        return 0;
> > -    }
> > -
> > -    trace_vhost_vdpa_set_features(dev, features);
> > -    ret =3D vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
> > -    if (ret) {
> > -        return ret;
> > -    }
> > -
> > -    return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
> > -}
> > -
> >   static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
> >   {
> >       uint64_t features;
> > @@ -646,35 +593,6 @@ static int vhost_vdpa_get_config(struct vhost_dev =
*dev, uint8_t *config,
> >       return ret;
> >    }
> >
> > -static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> > -{
> > -    struct vhost_vdpa *v =3D dev->opaque;
> > -    trace_vhost_vdpa_dev_start(dev, started);
> > -
> > -    if (started) {
> > -        vhost_vdpa_host_notifiers_init(dev);
> > -        vhost_vdpa_set_vring_ready(dev);
> > -    } else {
> > -        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> > -    }
> > -
> > -    if (dev->vq_index + dev->nvqs !=3D dev->vq_index_end) {
> > -        return 0;
> > -    }
> > -
> > -    if (started) {
> > -        memory_listener_register(&v->listener, &address_space_memory);
> > -        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> > -    } else {
> > -        vhost_vdpa_reset_device(dev);
> > -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > -                                   VIRTIO_CONFIG_S_DRIVER);
> > -        memory_listener_unregister(&v->listener);
> > -
> > -        return 0;
> > -    }
> > -}
> > -
> >   static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t ba=
se,
> >                                        struct vhost_log *log)
> >   {
> > @@ -735,6 +653,35 @@ static int vhost_vdpa_set_vring_call(struct vhost_=
dev *dev,
> >       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> >   }
> >
> > +static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    trace_vhost_vdpa_dev_start(dev, started);
> > +
> > +    if (started) {
> > +        vhost_vdpa_host_notifiers_init(dev);
> > +        vhost_vdpa_set_vring_ready(dev);
> > +    } else {
> > +        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> > +    }
> > +
> > +    if (dev->vq_index + dev->nvqs !=3D dev->vq_index_end) {
> > +        return 0;
> > +    }
> > +
> > +    if (started) {
> > +        memory_listener_register(&v->listener, &address_space_memory);
> > +        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> > +    } else {
> > +        vhost_vdpa_reset_device(dev);
> > +        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > +                                   VIRTIO_CONFIG_S_DRIVER);
> > +        memory_listener_unregister(&v->listener);
> > +
> > +        return 0;
> > +    }
> > +}
> > +
> >   static int vhost_vdpa_get_features(struct vhost_dev *dev,
> >                                        uint64_t *features)
> >   {
> > @@ -745,6 +692,24 @@ static int vhost_vdpa_get_features(struct vhost_de=
v *dev,
> >       return ret;
> >   }
> >
> > +static int vhost_vdpa_set_features(struct vhost_dev *dev,
> > +                                   uint64_t features)
> > +{
> > +    int ret;
> > +
> > +    if (vhost_vdpa_one_time_request(dev)) {
> > +        return 0;
> > +    }
> > +
> > +    trace_vhost_vdpa_set_features(dev, features);
> > +    ret =3D vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
> > +}
> > +
> >   static int vhost_vdpa_set_owner(struct vhost_dev *dev)
> >   {
> >       if (vhost_vdpa_one_time_request(dev)) {
> > @@ -772,6 +737,41 @@ static bool  vhost_vdpa_force_iommu(struct vhost_d=
ev *dev)
> >       return true;
> >   }
> >
> > +static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error =
**errp)
> > +{
> > +    struct vhost_vdpa *v;
> > +    assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VDPA=
);
> > +    trace_vhost_vdpa_init(dev, opaque);
> > +    int ret;
> > +
> > +    /*
> > +     * Similar to VFIO, we end up pinning all guest memory and have to
> > +     * disable discarding of RAM.
> > +     */
> > +    ret =3D ram_block_discard_disable(true);
> > +    if (ret) {
> > +        error_report("Cannot set discarding of RAM broken");
> > +        return ret;
> > +    }
> > +
> > +    v =3D opaque;
> > +    v->dev =3D dev;
> > +    dev->opaque =3D  opaque ;
> > +    v->listener =3D vhost_vdpa_memory_listener;
> > +    v->msg_type =3D VHOST_IOTLB_MSG_V2;
> > +
> > +    vhost_vdpa_get_iova_range(v);
> > +
> > +    if (vhost_vdpa_one_time_request(dev)) {
> > +        return 0;
> > +    }
> > +
> > +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > +                               VIRTIO_CONFIG_S_DRIVER);
> > +
> > +    return 0;
> > +}
> > +
> >   const VhostOps vdpa_ops =3D {
> >           .backend_type =3D VHOST_BACKEND_TYPE_VDPA,
> >           .vhost_backend_init =3D vhost_vdpa_init,
>


