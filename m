Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE6A4A4D95
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:54:04 +0100 (CET)
Received: from localhost ([::1]:35532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEasN-0001n5-Ae
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:54:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEalI-0002xr-HQ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:46:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEak2-0005M8-FD
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643651111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zfoHn0PYJ3zkERqwZ8z2Y5uXRGKXZzMQHCTb3mRNuIo=;
 b=hjEb27rJkD0nFV0B/W8DrP2yu8opqF2y/yfKkXCVc0hjWMzMNhVMslYDKf/+8o8pDAUfTn
 B4Mq+js+1cEmQ24mc7iuzS2yENzftvQsZDVo48yY7Uk9gnMVFLPy8uNw3At7OgB+joMZgr
 F7zzHchHU6BjMS5Xem5I3YXZ2UiGGs8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-QA4i9ioWO42v32W3oX__BA-1; Mon, 31 Jan 2022 12:45:06 -0500
X-MC-Unique: QA4i9ioWO42v32W3oX__BA-1
Received: by mail-qv1-f70.google.com with SMTP id
 ej14-20020ad45a4e000000b00425d03eabe4so11263618qvb.9
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 09:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zfoHn0PYJ3zkERqwZ8z2Y5uXRGKXZzMQHCTb3mRNuIo=;
 b=LC2aK0GSoJCPjUS7PssnbXGoF/jnbhMEMcJWtQW2UI1tuAJBPvVVjpMjWqYGW3p8CF
 aryG9rRQBQQNJerGZOfsVJ3bJe8jYv/RmGII/V4JYKhoSaOGuKEp9yZkgiEWDlXOk8B5
 +72NeFX5st/IdDzP+UfZiWtf0iAEyIDwvnuJBnq/ibJoYZNX9vUJGaFGP+9C4vhHkolJ
 zoZVv5TXsGb72UF12DBejOKC11m2UpQrH10ZVDYV8/XSWMUx/VqJkih2pVtkeF7ZMoQC
 n3nzjcPH6m6yYSfZMw1JQAop54wAUmyPvLuIIWiTGSDCS9OwfR1DWpgoyA4yL5Uo8zZV
 FkYw==
X-Gm-Message-State: AOAM533MIpNZH6+MC54a4RElqImTzH0dTEhV/Hvdr5auFnXnnOALoWe/
 jsqA+Ju+16Xyf+u4Y5QreqwLZIri6H/Jv+xT04EoUlxVn3JEk248BWo8pCEt3EzO+ecuiq562tA
 86jmKxevjYMwQ615JjEiy+IR5AKnyIAM=
X-Received: by 2002:a05:6214:d04:: with SMTP id
 4mr18518491qvh.91.1643651106318; 
 Mon, 31 Jan 2022 09:45:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwB82bFj8mungysrTQEvLdQY6w2hOPBtjAKOx0a8VIbjaY4t374m4680DFqcLgU2rCxwMB5xhyweEJq3v+sGdc=
X-Received: by 2002:a05:6214:d04:: with SMTP id
 4mr18518458qvh.91.1643651106097; 
 Mon, 31 Jan 2022 09:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-17-eperezma@redhat.com>
 <f0e549eb-3485-01f5-88cb-f5681fc74abc@redhat.com>
In-Reply-To: <f0e549eb-3485-01f5-88cb-f5681fc74abc@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Jan 2022 18:44:30 +0100
Message-ID: <CAJaqyWexu=VroHQxmtJDQm=iu1va-s1VGR8hqGOreG0SOisjYg@mail.gmail.com>
Subject: Re: [PATCH 16/31] vhost: pass queue index to vhost_vq_get_addr
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Sat, Jan 29, 2022 at 9:20 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Doing that way allows vhost backend to know what address to return.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 7b03efccec..64b955ba0c 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -798,9 +798,10 @@ static int vhost_virtqueue_set_addr(struct vhost_d=
ev *dev,
> >                                       struct vhost_virtqueue *vq,
> >                                       unsigned idx, bool enable_log)
> >   {
> > -    struct vhost_vring_addr addr;
> > +    struct vhost_vring_addr addr =3D {
> > +        .index =3D idx,
> > +    };
> >       int r;
> > -    memset(&addr, 0, sizeof(struct vhost_vring_addr));
> >
> >       if (dev->vhost_ops->vhost_vq_get_addr) {
> >           r =3D dev->vhost_ops->vhost_vq_get_addr(dev, &addr, vq);
> > @@ -813,7 +814,6 @@ static int vhost_virtqueue_set_addr(struct vhost_de=
v *dev,
> >           addr.avail_user_addr =3D (uint64_t)(unsigned long)vq->avail;
> >           addr.used_user_addr =3D (uint64_t)(unsigned long)vq->used;
> >       }
>
>
> I'm a bit lost in the logic above, any reason we need call
> vhost_vq_get_addr() :) ?
>

It's the way vhost_virtqueue_set_addr works if the backend has a
vhost_vq_get_addr operation (currently, only vhost-vdpa). vhost first
ask the address to the back end and then set it.

Previously, index was not needed because all the information was in
vhost_virtqueue. However to extract queue index from vhost_virtqueue
is tricky, so I think it's easier to simply have that information at
request, something similar to get_base or get_num when asking vdpa
device. We can extract the index from vq - dev->vqs or something
similar if it's prefered.

Thanks!

> Thanks
>
>
> > -    addr.index =3D idx;
> >       addr.log_guest_addr =3D vq->used_phys;
> >       addr.flags =3D enable_log ? (1 << VHOST_VRING_F_LOG) : 0;
> >       r =3D dev->vhost_ops->vhost_set_vring_addr(dev, &addr);
>


