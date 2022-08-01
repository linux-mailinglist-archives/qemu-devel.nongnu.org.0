Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91DE5865C7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 09:39:48 +0200 (CEST)
Received: from localhost ([::1]:58070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIQ1k-0001vQ-0L
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 03:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIPxw-0006yW-3d
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIPxs-0001KB-Cv
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659339347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XAcXytZXwIN64vS/rF6HVAxOjtCuQ7dBHjcn0G5PCw=;
 b=S4kWIAJ2cQONvpKqLV31AUA+KEKjtU3Hf5FRP0bGgFUe2pUor4rYICMGFGANS3X1Yvy4VU
 wU/sfDDBuoGVJeDdC+IjLLsLH31bppZojBvIfEjpLtOs+4CaTTnSXnGczH4aTOHSJP0JiJ
 RJYYvbvos0qZf0vVAkMWv8jyFa4wZT4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-HPnV74H7P7u4amJzx1tn_g-1; Mon, 01 Aug 2022 03:35:45 -0400
X-MC-Unique: HPnV74H7P7u4amJzx1tn_g-1
Received: by mail-qk1-f197.google.com with SMTP id
 az14-20020a05620a170e00b006b666c4627bso8761086qkb.23
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 00:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7XAcXytZXwIN64vS/rF6HVAxOjtCuQ7dBHjcn0G5PCw=;
 b=s1SaEKMj7qpgyNWJyMnzifnc+SyvKUcYDiNKUmIBeWXZWQRbbHDg0keJWxb1UYu+Lx
 1x+Ba8pCXcOXHjkLaKwB7hD5uV/EUMtI8T9cP0bUdSo8W8Fqogzb5iW1IaPRRxV108WO
 kxkJsnGumPR5j38WJSHdHTrxvcOn0/kk4VxIbuu+fAdt+s48ptMQF8xNHL7dowlbdoF9
 1fhjEOOYkSst7wRPACk20ZGErWZU6tNP8NtguzMQ6ntg3BFeZGuW5t460ZtFwMYuQ7hQ
 EwM4M1kqN+YRHAoNWtrHzhSf18/HlzOQFVwluJUSqhCFhyBzoljgSunI8XMpmk3wskzA
 N2Eg==
X-Gm-Message-State: AJIora+HRYVgRoBuEVLLC5F8VjIcnYwz5Xw3rbn0F/7bXuFQRHsxt1Ez
 zh0+4k1osgcucWDAElrBu9Fa9TDhPwJUVr322/i8oxh8Yr8T7e/lrPvQhvkXTd8Scn6y/o40g8Z
 h+1EevOy/wSK+IV1+9pHZLpWta4ClvNI=
X-Received: by 2002:a05:620a:29d5:b0:6b5:dc06:5762 with SMTP id
 s21-20020a05620a29d500b006b5dc065762mr10822869qkp.522.1659339345124; 
 Mon, 01 Aug 2022 00:35:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uUFKfziOLLnDdnyGz4OitIctOlrEz71nc6pG1QKgvW9iWWmYKVGXbzuFnPiundVnEg6uoiG7fOJRVIXqzd+Zk=
X-Received: by 2002:a05:620a:29d5:b0:6b5:dc06:5762 with SMTP id
 s21-20020a05620a29d500b006b5dc065762mr10822856qkp.522.1659339344880; Mon, 01
 Aug 2022 00:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220722111245.3403062-1-eperezma@redhat.com>
 <20220722111245.3403062-3-eperezma@redhat.com>
 <2f8cb2fd-9aaf-3cd6-7068-575470c63f23@redhat.com>
In-Reply-To: <2f8cb2fd-9aaf-3cd6-7068-575470c63f23@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Aug 2022 09:35:09 +0200
Message-ID: <CAJaqyWfOdKYzp06G04TXgLhcG=zkkMtkUA2hOtz=2YOCEC46qQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] vdpa: Extract vhost_vdpa_net_cvq_add from
 vhost_vdpa_net_handle_ctrl_avail
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Eric Blake <eblake@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 26, 2022 at 4:50 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/22 19:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > So we can reuse to inject state messages.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 74 ++++++++++++++++++++++++++++++-----------------=
-
> >   1 file changed, 47 insertions(+), 27 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 6abad276a6..1b82ac2e07 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -334,6 +334,46 @@ static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAS=
tate *s,
> >       return true;
> >   }
> >
> > +static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(VhostShadowVirtqueue=
 *svq,
> > +                                               const struct iovec *dev=
_buffers)
>
>
> Let's make this support any layout by accepting in/out sg.
>

I'll change for the next version.

>
> > +{
> > +    /* in buffer used for device model */
> > +    virtio_net_ctrl_ack status;
> > +    size_t dev_written;
> > +    int r;
> > +
> > +    /*
> > +     * Add a fake non-NULL VirtQueueElement since we'll remove before =
SVQ
> > +     * event loop can get it.
> > +     */
> > +    r =3D vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, (=
void *)1);
>
>
> I'd suggest to avoid the trick like (void *)1, which is usually a hint
> of the defect of the API.
>
> We can either:
>
> 1) make vhost_svq_get() check ndescs instead of elem
>
> or
>
> 2) simple pass sg
>

Option one sounds great actually, let me try it and I'll send a new version=
.

Thanks!


> Thanks
>
>
> > +    if (unlikely(r !=3D 0)) {
> > +        if (unlikely(r =3D=3D -ENOSPC)) {
> > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device que=
ue\n",
> > +                          __func__);
> > +        }
> > +        return VIRTIO_NET_ERR;
> > +    }
> > +
> > +    /*
> > +     * We can poll here since we've had BQL from the time we sent the
> > +     * descriptor. Also, we need to take the answer before SVQ pulls b=
y itself,
> > +     * when BQL is released
> > +     */
> > +    dev_written =3D vhost_svq_poll(svq);
> > +    if (unlikely(dev_written < sizeof(status))) {
> > +        error_report("Insufficient written data (%zu)", dev_written);
> > +        return VIRTIO_NET_ERR;
> > +    }
> > +
> > +    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
> > +    if (status !=3D VIRTIO_NET_OK) {
> > +        return VIRTIO_NET_ERR;
> > +    }
> > +
> > +    return VIRTIO_NET_OK;
> > +}
> > +
> >   /**
> >    * Do not forward commands not supported by SVQ. Otherwise, the devic=
e could
> >    * accept it and qemu would not know how to update the device model.
> > @@ -380,19 +420,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vhost=
ShadowVirtqueue *svq,
> >                                               void *opaque)
> >   {
> >       VhostVDPAState *s =3D opaque;
> > -    size_t in_len, dev_written;
> > +    size_t in_len;
> >       virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> >       /* out and in buffers sent to the device */
> >       struct iovec dev_buffers[2] =3D {
> >           { .iov_base =3D s->cvq_cmd_out_buffer },
> >           { .iov_base =3D s->cvq_cmd_in_buffer },
> >       };
> > -    /* in buffer used for device model */
> > +    /* in buffer seen by virtio-net device model */
> >       const struct iovec in =3D {
> >           .iov_base =3D &status,
> >           .iov_len =3D sizeof(status),
> >       };
> > -    int r =3D -EINVAL;
> >       bool ok;
> >
> >       ok =3D vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
> > @@ -405,35 +444,16 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vhost=
ShadowVirtqueue *svq,
> >           goto out;
> >       }
> >
> > -    r =3D vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, e=
lem);
> > -    if (unlikely(r !=3D 0)) {
> > -        if (unlikely(r =3D=3D -ENOSPC)) {
> > -            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device que=
ue\n",
> > -                          __func__);
> > -        }
> > -        goto out;
> > -    }
> > -
> > -    /*
> > -     * We can poll here since we've had BQL from the time we sent the
> > -     * descriptor. Also, we need to take the answer before SVQ pulls b=
y itself,
> > -     * when BQL is released
> > -     */
> > -    dev_written =3D vhost_svq_poll(svq);
> > -    if (unlikely(dev_written < sizeof(status))) {
> > -        error_report("Insufficient written data (%zu)", dev_written);
> > -        goto out;
> > -    }
> > -
> > -    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
> > +    status =3D vhost_vdpa_net_cvq_add(svq, dev_buffers);
> >       if (status !=3D VIRTIO_NET_OK) {
> >           goto out;
> >       }
> >
> >       status =3D VIRTIO_NET_ERR;
> > -    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
> > -    if (status !=3D VIRTIO_NET_OK) {
> > +    in_len =3D virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffe=
rs, 1);
> > +    if (in_len !=3D sizeof(status) || status !=3D VIRTIO_NET_OK) {
> >           error_report("Bad CVQ processing in model");
> > +        return VIRTIO_NET_ERR;
> >       }
> >
> >   out:
> > @@ -450,7 +470,7 @@ out:
> >       if (dev_buffers[1].iov_base) {
> >           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[1].iov_b=
ase);
> >       }
> > -    return r;
> > +    return status =3D=3D VIRTIO_NET_OK ? 0 : 1;
> >   }
> >
> >   static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops =3D {
>


