Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01AC33D21A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:45:37 +0100 (CET)
Received: from localhost ([::1]:46706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM7Ci-0000aN-Uy
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lM7B7-0008O5-T0
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:43:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lM7B3-0005yp-03
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615891431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8zFg0aa/A+Y/4HOPV3fUaLzyCYunjtFmWlecXyVNl0=;
 b=CcF8NJ/1vEBAEbvKikFL4MTX6ISRrkeoYpE/Zakh1jAhcGsCXdXxyAOiDNpoZmgFfjzHDp
 zAf8qg//U6gGdEVVyJxoePsoHPYlgB99bhvHaoWw1HnUwWOYzEZnukwFOoOHR48io8kk3M
 YsrCopxnvznvQHl5sa/QzjiW+0GbfKM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-H0De0X9qNwOflvauZc_fQQ-1; Tue, 16 Mar 2021 06:43:49 -0400
X-MC-Unique: H0De0X9qNwOflvauZc_fQQ-1
Received: by mail-qt1-f198.google.com with SMTP id m35so13109242qtd.11
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 03:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J8zFg0aa/A+Y/4HOPV3fUaLzyCYunjtFmWlecXyVNl0=;
 b=Tydeedeqbme0CGTbaJeufLgHEWX+/c9nLTe1O0YwlRL5vYIpIVVFVKPjohT/AG+l/B
 M9PPPxc1f9sPE4tJCkxaF53mmfmpaQ4nJ3UxHHoFObNw38urij8xPEnZjiSFLV0/OBLF
 9SfMB2DhkHkjVQ6X7xdKI4mSVQy0IhSYBwl6bWqXxUltA35tOh6CbXHVQawVjOvwZQx1
 II3fb8UjHNXu91JJRZc22HLKMt30m+OJn6e9tvnSqQrxzGKwp/N13mz9SI3l8uQQFzXJ
 GqmWlSy8AWumyFPYjsrblIca6twYoPeelC4dn3iCV/EmgTk5SKeFybReRqt7ws4PJIzb
 hcrg==
X-Gm-Message-State: AOAM530+W2/pkALfhXlcCk4VvXcYOHT4RJq/Md2iL7rrp7hiJeqC1zJb
 hoxtjMkb4FxOWrlezOZg0BDToWsOnOmnv8yp6eMT9jEpu8oIFlJHz2MLR/cA0fMWwy4c/e4KCyK
 hmzUORpNmZltWjL9zovo/uYxlBacZg1U=
X-Received: by 2002:a37:a785:: with SMTP id
 q127mr28666758qke.425.1615891429150; 
 Tue, 16 Mar 2021 03:43:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcUoeG7GnrQN3SadkTqStsgz2OVOyuJ81HvEW9Qbh1+A7hWkxu3y2tgf7g70eJzxLxvF9vcfAbOS9bWJI63Rs=
X-Received: by 2002:a37:a785:: with SMTP id
 q127mr28666741qke.425.1615891428880; 
 Tue, 16 Mar 2021 03:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-11-eperezma@redhat.com>
 <98916095-ac78-7deb-5086-ee0adf39dcf5@redhat.com>
In-Reply-To: <98916095-ac78-7deb-5086-ee0adf39dcf5@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 16 Mar 2021 11:43:13 +0100
Message-ID: <CAJaqyWcFQQQg1YS14NY3JDfHcjEnhvim3TzxV0FEPyKqhf0nrg@mail.gmail.com>
Subject: Re: [RFC v2 10/13] vhost: add vhost_kernel_set_vring_enable
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 8:30 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/16 =E4=B8=8A=E5=8D=883:48, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This method is already present in vhost-user. This commit adapts it to
> > vhost-net, so SVQ can use.
> >
> > vhost_kernel_set_enable stops the device, so qemu can ask for its statu=
s
> > (next available idx the device was going to consume). When SVQ starts i=
t
> > can resume consuming the guest's driver ring, without notice from the
> > latter. Not stopping the device before of the swapping could imply that
> > it process more buffers than reported, what would duplicate the device
> > action.
>
>
> Note that it might not be the case of vDPA (virtio) or at least virtio
> needs some extension to achieve something similar like this. One example
> is virtio-pci which forbids 0 to be wrote to queue_enable.
>
> This is another reason to start from vhost-vDPA.
>
>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-backend.c | 29 +++++++++++++++++++++++++++++
> >   1 file changed, 29 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> > index 31b33bde37..1ac5c574a9 100644
> > --- a/hw/virtio/vhost-backend.c
> > +++ b/hw/virtio/vhost-backend.c
> > @@ -201,6 +201,34 @@ static int vhost_kernel_get_vq_index(struct vhost_=
dev *dev, int idx)
> >       return idx - dev->vq_index;
> >   }
> >
> > +static int vhost_kernel_set_vq_enable(struct vhost_dev *dev, unsigned =
idx,
> > +                                      bool enable)
> > +{
> > +    struct vhost_vring_file file =3D {
> > +        .index =3D idx,
> > +    };
> > +
> > +    if (!enable) {
> > +        file.fd =3D -1; /* Pass -1 to unbind from file. */
> > +    } else {
> > +        struct vhost_net *vn_dev =3D container_of(dev, struct vhost_ne=
t, dev);
> > +        file.fd =3D vn_dev->backend;
>
>
> This can only work with vhost-net devices but not vsock/scsi etc.
>

Right. Shadow virtqueue code should also check the return value of the
vhost_set_vring_enable call.

I'm not sure how to solve it without resorting to some ifelse/switch
chain, checking for specific net/vsock/... features, or relaying on
some other qemu class facilities. However, since the main use case is
vDPA live migration, this commit could be left out and SVQ operation
would only be valid for vhost-vdpa and vhost-user.

> Thanks
>
>
> > +    }
> > +
> > +    return vhost_kernel_net_set_backend(dev, &file);
> > +}
> > +
> > +static int vhost_kernel_set_vring_enable(struct vhost_dev *dev, int en=
able)
> > +{
> > +    int i;
> > +
> > +    for (i =3D 0; i < dev->nvqs; ++i) {
> > +        vhost_kernel_set_vq_enable(dev, i, enable);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   #ifdef CONFIG_VHOST_VSOCK
> >   static int vhost_kernel_vsock_set_guest_cid(struct vhost_dev *dev,
> >                                               uint64_t guest_cid)
> > @@ -317,6 +345,7 @@ static const VhostOps kernel_ops =3D {
> >           .vhost_set_owner =3D vhost_kernel_set_owner,
> >           .vhost_reset_device =3D vhost_kernel_reset_device,
> >           .vhost_get_vq_index =3D vhost_kernel_get_vq_index,
> > +        .vhost_set_vring_enable =3D vhost_kernel_set_vring_enable,
> >   #ifdef CONFIG_VHOST_VSOCK
> >           .vhost_vsock_set_guest_cid =3D vhost_kernel_vsock_set_guest_c=
id,
> >           .vhost_vsock_set_running =3D vhost_kernel_vsock_set_running,
>


