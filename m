Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D4348929
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:35:58 +0100 (CET)
Received: from localhost ([::1]:56046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJb3-0008Lz-CV
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lPJAc-0005LY-3D
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:08:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lPJAY-0002GI-Ib
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616652511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qW1k3YAkI/bhC6GZ1MUbrmwMUeYl7fO8FbdbOMtnwAA=;
 b=E/MZZ2SYpGVpgcuKd2MWO03BE5Ko/MvMTmdhYHrXBMvnGJ7vaGsSzcTH8MbTZncWreg1hr
 LoVnAodQrzTnyKJ8oHLxonLNZdRoktcQ1/l8hb+MkmklnqGId7w5myeqIm/LMIjfEZErEu
 aVi0FK+2UM2rlmX/WauB3xcMzSJPN8c=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-14r1xdGfMdaNzta5w7qFaA-1; Thu, 25 Mar 2021 02:08:29 -0400
X-MC-Unique: 14r1xdGfMdaNzta5w7qFaA-1
Received: by mail-pf1-f199.google.com with SMTP id 7so3096173pfn.4
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 23:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qW1k3YAkI/bhC6GZ1MUbrmwMUeYl7fO8FbdbOMtnwAA=;
 b=nFM3Z800ah/X0PjgfwgTnMe/ORAGxUtJp4snPJn+qO579tQ0PS6JPiVeDiL720F/Bh
 x2gYvVMjWsXLfD1mI7B4b/obTjMs6uuiXFm6HtIwMGhj3coB9WWgloU9RyOBb5/cRVEs
 uQQZLyZpFM6wy0dgi6yW0DwH3jVs8aPjUScObA+d4Of8u/aK4N0FxlXzi4dM169NxsK5
 3k9ixOn7LysE665P5I3wLiQTJS5JrOggRW2Pb3owQ9h5sJa7IUfLp3TyLaya6PDSTk3d
 YBAmg2Ihkm2RAqFn6JmbIkktZpqUj1BljXt+2w5CVOQ/uUEcQf4DH8R6kNfNwpnXQ7kA
 y16w==
X-Gm-Message-State: AOAM533ovjLzzqMVUNU30tZqLd6JIgShgepE0aXfpnzYoDRoi0EyIXX9
 prUmxXXW6QKYjGo4x5r2c8ujjPoclzck9OgtIj2Clqwf699k6zf4/IP59qsWIaTOHuyF85d6IOG
 hz4uU8FBYPk7+dmRTl3Ro+ZegiR6G2tM=
X-Received: by 2002:a17:90a:a10c:: with SMTP id
 s12mr7184404pjp.166.1616652507974; 
 Wed, 24 Mar 2021 23:08:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuUaLaA8KYGQZnH84d5Z4ZeXk8oAaV5uygMSP5LjdZ1SDIlkJkC1fVdlBGDh9WmziVyOAE9JKVjIY9GrxLr88=
X-Received: by 2002:a17:90a:a10c:: with SMTP id
 s12mr7184372pjp.166.1616652507519; 
 Wed, 24 Mar 2021 23:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210323015641.10820-1-lulu@redhat.com>
 <20210323015641.10820-5-lulu@redhat.com>
 <1b6d8291-0ac9-06fe-6f8a-efcaad542bc3@redhat.com>
In-Reply-To: <1b6d8291-0ac9-06fe-6f8a-efcaad542bc3@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 25 Mar 2021 14:07:50 +0800
Message-ID: <CACLfguUbsUsHsWok4K6+H-95fn-qX2iUtvY5_Vft3DkbDdocJA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] virtio-pci: add support for configure interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lulu@redhat.com;
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 24, 2021 at 2:34 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/23 =E4=B8=8A=E5=8D=889:56, Cindy Lu =E5=86=99=E9=81=93:
> > Add support for configure interrupt, use kvm_irqfd_assign and set the
> > gsi to kernel. When the configure notifier was eventfd_signal by host
> > kernel, this will finally inject an msix interrupt to guest
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/virtio-pci.c | 171 +++++++++++++++++++++++++++++++++-------=
-
> >   1 file changed, 137 insertions(+), 34 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index 36524a5728..b0c190caba 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -664,7 +664,6 @@ static uint32_t virtio_read_config(PCIDevice *pci_d=
ev,
> >   }
> >
> >   static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
> > -                                        unsigned int queue_no,
> >                                           unsigned int vector)
>
>
> Let's use a separated patch for decoupling queue_no from those irqfd
> helpers.
>
> Thanks
>
sure will split this
>
> >   {
> >       VirtIOIRQFD *irqfd =3D &proxy->vector_irqfd[vector];
> > @@ -691,23 +690,17 @@ static void kvm_virtio_pci_vq_vector_release(Virt=
IOPCIProxy *proxy,
> >   }
> >
> >   static int kvm_virtio_pci_irqfd_use(VirtIOPCIProxy *proxy,
> > -                                 unsigned int queue_no,
> > +                                 EventNotifier *n,
> >                                    unsigned int vector)
> >   {
> >       VirtIOIRQFD *irqfd =3D &proxy->vector_irqfd[vector];
> > -    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > -    VirtQueue *vq =3D virtio_get_queue(vdev, queue_no);
> > -    EventNotifier *n =3D virtio_queue_get_guest_notifier(vq);
> >       return kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, n, NULL, irq=
fd->virq);
> >   }
> >
> >   static void kvm_virtio_pci_irqfd_release(VirtIOPCIProxy *proxy,
> > -                                      unsigned int queue_no,
> > +                                      EventNotifier *n ,
> >                                         unsigned int vector)
> >   {
> > -    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > -    VirtQueue *vq =3D virtio_get_queue(vdev, queue_no);
> > -    EventNotifier *n =3D virtio_queue_get_guest_notifier(vq);
> >       VirtIOIRQFD *irqfd =3D &proxy->vector_irqfd[vector];
> >       int ret;
> >
> > @@ -722,7 +715,8 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy=
 *proxy, int nvqs)
> >       VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> >       unsigned int vector;
> >       int ret, queue_no;
> > -
> > +    VirtQueue *vq;
> > +    EventNotifier *n;
> >       for (queue_no =3D 0; queue_no < nvqs; queue_no++) {
> >           if (!virtio_queue_get_num(vdev, queue_no)) {
> >               break;
> > @@ -731,7 +725,7 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy=
 *proxy, int nvqs)
> >           if (vector >=3D msix_nr_vectors_allocated(dev)) {
> >               continue;
> >           }
> > -        ret =3D kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
> > +        ret =3D kvm_virtio_pci_vq_vector_use(proxy,  vector);
> >           if (ret < 0) {
> >               goto undo;
> >           }
> > @@ -739,7 +733,9 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy=
 *proxy, int nvqs)
> >            * Otherwise, delay until unmasked in the frontend.
> >            */
> >           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) =
{
> > -            ret =3D kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
> > +            vq =3D virtio_get_queue(vdev, queue_no);
> > +            n =3D virtio_queue_get_guest_notifier(vq);
> > +            ret =3D kvm_virtio_pci_irqfd_use(proxy, n, vector);
> >               if (ret < 0) {
> >                   kvm_virtio_pci_vq_vector_release(proxy, vector);
> >                   goto undo;
> > @@ -755,13 +751,69 @@ undo:
> >               continue;
> >           }
> >           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) =
{
> > -            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> > +            vq =3D virtio_get_queue(vdev, queue_no);
> > +            n =3D virtio_queue_get_guest_notifier(vq);
> > +            kvm_virtio_pci_irqfd_release(proxy, n, vector);
> >           }
> >           kvm_virtio_pci_vq_vector_release(proxy, vector);
> >       }
> >       return ret;
> >   }
> >
> > +static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
> > +{
> > +
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    unsigned int vector;
> > +    int ret;
> > +    EventNotifier *n =3D virtio_get_config_notifier(vdev);
> > +
> > +    vector =3D vdev->config_vector ;
> > +    ret =3D kvm_virtio_pci_vq_vector_use(proxy, vector);
> > +    if (ret < 0) {
> > +        goto undo;
> > +    }
> > +    ret =3D kvm_virtio_pci_irqfd_use(proxy,  n, vector);
> > +    if (ret < 0) {
> > +        goto undo;
> > +    }
> > +    return 0;
> > +undo:
> > +    kvm_virtio_pci_irqfd_release(proxy, n, vector);
> > +    return ret;
> > +}
> > +static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy=
)
> > +{
> > +    PCIDevice *dev =3D &proxy->pci_dev;
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    unsigned int vector;
> > +    EventNotifier *n =3D virtio_get_config_notifier(vdev);
> > +    vector =3D vdev->config_vector ;
> > +    if (vector >=3D msix_nr_vectors_allocated(dev)) {
> > +        return;
> > +    }
> > +    kvm_virtio_pci_irqfd_release(proxy, n, vector);
> > +    kvm_virtio_pci_vq_vector_release(proxy, vector);
> > +}
> > +
> > +static int virtio_pci_set_config_notifier(DeviceState *d,  bool assign=
)
> > +{
> > +    VirtIOPCIProxy *proxy =3D to_virtio_pci_proxy(d);
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    EventNotifier *notifier =3D virtio_get_config_notifier(vdev);
> > +    int r =3D 0;
> > +    if (assign) {
> > +        r =3D event_notifier_init(notifier, 0);
> > +        virtio_set_config_notifier_fd_handler(vdev, true, true);
> > +        kvm_virtio_pci_vector_config_use(proxy);
> > +    } else {
> > +        virtio_set_config_notifier_fd_handler(vdev, false, true);
> > +        kvm_virtio_pci_vector_config_release(proxy);
> > +        event_notifier_cleanup(notifier);
> > +    }
> > +    return r;
> > +}
> > +
> >   static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int =
nvqs)
> >   {
> >       PCIDevice *dev =3D &proxy->pci_dev;
> > @@ -769,7 +821,8 @@ static void kvm_virtio_pci_vector_release(VirtIOPCI=
Proxy *proxy, int nvqs)
> >       unsigned int vector;
> >       int queue_no;
> >       VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> > -
> > +    VirtQueue *vq;
> > +    EventNotifier *n;
> >       for (queue_no =3D 0; queue_no < nvqs; queue_no++) {
> >           if (!virtio_queue_get_num(vdev, queue_no)) {
> >               break;
> > @@ -782,7 +835,9 @@ static void kvm_virtio_pci_vector_release(VirtIOPCI=
Proxy *proxy, int nvqs)
> >            * Otherwise, it was cleaned when masked in the frontend.
> >            */
> >           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) =
{
> > -            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> > +            vq =3D virtio_get_queue(vdev, queue_no);
> > +            n =3D virtio_queue_get_guest_notifier(vq);
> > +            kvm_virtio_pci_irqfd_release(proxy, n, vector);
> >           }
> >           kvm_virtio_pci_vq_vector_release(proxy, vector);
> >       }
> > @@ -791,15 +846,14 @@ static void kvm_virtio_pci_vector_release(VirtIOP=
CIProxy *proxy, int nvqs)
> >   static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
> >                                          unsigned int queue_no,
> >                                          unsigned int vector,
> > -                                       MSIMessage msg)
> > +                                       MSIMessage msg,
> > +                                       int type,
> > +                                        EventNotifier *n)
> >   {
> >       VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> >       VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> > -    VirtQueue *vq =3D virtio_get_queue(vdev, queue_no);
> > -    EventNotifier *n =3D virtio_queue_get_guest_notifier(vq);
> >       VirtIOIRQFD *irqfd;
> >       int ret =3D 0;
> > -
> >       if (proxy->vector_irqfd) {
> >           irqfd =3D &proxy->vector_irqfd[vector];
> >           if (irqfd->msg.data !=3D msg.data || irqfd->msg.address !=3D =
msg.address) {
> > @@ -816,32 +870,33 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIP=
roxy *proxy,
> >        * Otherwise, set it up now.
> >        */
> >       if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> > -        k->guest_notifier_mask(vdev, queue_no, false);
> > +        k->guest_notifier_mask(vdev, queue_no, false, type);
> >           /* Test after unmasking to avoid losing events. */
> >           if (k->guest_notifier_pending &&
> > -            k->guest_notifier_pending(vdev, queue_no)) {
> > +            k->guest_notifier_pending(vdev, queue_no, type)) {
> >               event_notifier_set(n);
> >           }
> >       } else {
> > -        ret =3D kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
> > +        ret =3D kvm_virtio_pci_irqfd_use(proxy, n, vector);
> >       }
> >       return ret;
> >   }
> >
> >   static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
> >                                                unsigned int queue_no,
> > -                                             unsigned int vector)
> > +                                             unsigned int vector,
> > +                                             int type,
> > +                                             EventNotifier *n)
> >   {
> >       VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> >       VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> > -
> >       /* If guest supports masking, keep irqfd but mask it.
> >        * Otherwise, clean it up now.
> >        */
> >       if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> > -        k->guest_notifier_mask(vdev, queue_no, true);
> > +        k->guest_notifier_mask(vdev, queue_no, true, type);
> >       } else {
> > -        kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> > +        kvm_virtio_pci_irqfd_release(proxy, n, vector);
> >       }
> >   }
> >
> > @@ -851,15 +906,26 @@ static int virtio_pci_vector_unmask(PCIDevice *de=
v, unsigned vector,
> >       VirtIOPCIProxy *proxy =3D container_of(dev, VirtIOPCIProxy, pci_d=
ev);
> >       VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> >       VirtQueue *vq =3D virtio_vector_first_queue(vdev, vector);
> > +    EventNotifier *n;
> >       int ret, index, unmasked =3D 0;
> >
> > +   if (vdev->use_config_notifier =3D=3D VIRTIO_CONFIG_WORK) {
> > +        n =3D virtio_get_config_notifier(vdev);
> > +        ret =3D virtio_pci_vq_vector_unmask(proxy, 0, vector, msg,
> > +                    VIRTIO_CONFIG_VECTOR, n);
> > +        if (ret < 0) {
> > +            goto config_undo;
> > +       }
> > +    }
> >       while (vq) {
> >           index =3D virtio_get_queue_index(vq);
> >           if (!virtio_queue_get_num(vdev, index)) {
> >               break;
> >           }
> >           if (index < proxy->nvqs_with_notifiers) {
> > -            ret =3D virtio_pci_vq_vector_unmask(proxy, index, vector, =
msg);
> > +            n =3D virtio_queue_get_guest_notifier(vq);
> > +            ret =3D virtio_pci_vq_vector_unmask(proxy, index, vector, =
msg,
> > +                        VIRTIO_VQ_VECTOR, n);
> >               if (ret < 0) {
> >                   goto undo;
> >               }
> > @@ -875,11 +941,17 @@ undo:
> >       while (vq && unmasked >=3D 0) {
> >           index =3D virtio_get_queue_index(vq);
> >           if (index < proxy->nvqs_with_notifiers) {
> > -            virtio_pci_vq_vector_mask(proxy, index, vector);
> > +            n =3D virtio_queue_get_guest_notifier(vq);
> > +            virtio_pci_vq_vector_mask(proxy, index, vector,
> > +                 VIRTIO_VQ_VECTOR, n);
> >               --unmasked;
> >           }
> >           vq =3D virtio_vector_next_queue(vq);
> >       }
> > + config_undo:
> > +            n =3D virtio_get_config_notifier(vdev);
> > +            virtio_pci_vq_vector_mask(proxy, 0, vector,
> > +                VIRTIO_CONFIG_VECTOR, n);
> >       return ret;
> >   }
> >
> > @@ -888,18 +960,26 @@ static void virtio_pci_vector_mask(PCIDevice *dev=
, unsigned vector)
> >       VirtIOPCIProxy *proxy =3D container_of(dev, VirtIOPCIProxy, pci_d=
ev);
> >       VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> >       VirtQueue *vq =3D virtio_vector_first_queue(vdev, vector);
> > +    EventNotifier *n;
> >       int index;
> >
> > +   if (vdev->use_config_notifier =3D=3D VIRTIO_CONFIG_WORK) {
> > +        n =3D virtio_get_config_notifier(vdev);
> > +        virtio_pci_vq_vector_mask(proxy, 0, vector, VIRTIO_CONFIG_VECT=
OR, n);
> > +   }
> >       while (vq) {
> >           index =3D virtio_get_queue_index(vq);
> > +         n =3D virtio_queue_get_guest_notifier(vq);
> >           if (!virtio_queue_get_num(vdev, index)) {
> >               break;
> >           }
> >           if (index < proxy->nvqs_with_notifiers) {
> > -            virtio_pci_vq_vector_mask(proxy, index, vector);
> > +            virtio_pci_vq_vector_mask(proxy, index, vector,
> > +                VIRTIO_VQ_VECTOR, n);
> >           }
> >           vq =3D virtio_vector_next_queue(vq);
> >       }
> > +
> >   }
> >
> >   static void virtio_pci_vector_poll(PCIDevice *dev,
> > @@ -918,6 +998,7 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
> >           if (!virtio_queue_get_num(vdev, queue_no)) {
> >               break;
> >           }
> > +
> >           vector =3D virtio_queue_vector(vdev, queue_no);
> >           if (vector < vector_start || vector >=3D vector_end ||
> >               !msix_is_masked(dev, vector)) {
> > @@ -926,7 +1007,22 @@ static void virtio_pci_vector_poll(PCIDevice *dev=
,
> >           vq =3D virtio_get_queue(vdev, queue_no);
> >           notifier =3D virtio_queue_get_guest_notifier(vq);
> >           if (k->guest_notifier_pending) {
> > -            if (k->guest_notifier_pending(vdev, queue_no)) {
> > +            if (k->guest_notifier_pending(vdev, queue_no, VIRTIO_VQ_VE=
CTOR)) {
> > +                msix_set_pending(dev, vector);
> > +            }
> > +        } else if (event_notifier_test_and_clear(notifier)) {
> > +            msix_set_pending(dev, vector);
> > +        }
> > +    }
> > +   if (vdev->use_config_notifier =3D=3D VIRTIO_CONFIG_WORK) {
> > +        vector =3D vdev->config_vector;
> > +        notifier =3D virtio_get_config_notifier(vdev);
> > +        if (vector < vector_start || vector >=3D vector_end ||
> > +            !msix_is_masked(dev, vector)) {
> > +            return;
> > +        }
> > +        if (k->guest_notifier_pending) {
> > +            if (k->guest_notifier_pending(vdev, 0,  VIRTIO_CONFIG_VECT=
OR)) {
> >                   msix_set_pending(dev, vector);
> >               }
> >           } else if (event_notifier_test_and_clear(notifier)) {
> > @@ -958,7 +1054,7 @@ static int virtio_pci_set_guest_notifier(DeviceSta=
te *d, int n, bool assign,
> >       if (!msix_enabled(&proxy->pci_dev) &&
> >           vdev->use_guest_notifier_mask &&
> >           vdc->guest_notifier_mask) {
> > -        vdc->guest_notifier_mask(vdev, n, !assign);
> > +        vdc->guest_notifier_mask(vdev, n, !assign, VIRTIO_VQ_VECTOR);
> >       }
> >
> >       return 0;
> > @@ -1008,7 +1104,6 @@ static int virtio_pci_set_guest_notifiers(DeviceS=
tate *d, int nvqs, bool assign)
> >               goto assign_error;
> >           }
> >       }
> > -
> >       /* Must set vector notifier after guest notifier has been assigne=
d */
> >       if ((with_irqfd || k->guest_notifier_mask) && assign) {
> >           if (with_irqfd) {
> > @@ -1020,6 +1115,12 @@ static int virtio_pci_set_guest_notifiers(Device=
State *d, int nvqs, bool assign)
> >                   goto assign_error;
> >               }
> >           }
> > +        if (vdev->use_config_notifier =3D=3D VIRTIO_CONFIG_SUPPORT) {
> > +            r =3D virtio_pci_set_config_notifier(d, assign);
> > +            if (r < 0) {
> > +                goto config_error;
> > +         }
> > +     }
> >           r =3D msix_set_vector_notifiers(&proxy->pci_dev,
> >                                         virtio_pci_vector_unmask,
> >                                         virtio_pci_vector_mask,
> > @@ -1028,7 +1129,6 @@ static int virtio_pci_set_guest_notifiers(DeviceS=
tate *d, int nvqs, bool assign)
> >               goto notifiers_error;
> >           }
> >       }
> > -
> >       return 0;
> >
> >   notifiers_error:
> > @@ -1036,13 +1136,16 @@ notifiers_error:
> >           assert(assign);
> >           kvm_virtio_pci_vector_release(proxy, nvqs);
> >       }
> > -
> > + config_error:
> > +    /* We get here on assignment failure. Recover by undoing for VQs 0=
 .. n. */
> > +        kvm_virtio_pci_vector_config_release(proxy);
> >   assign_error:
> >       /* We get here on assignment failure. Recover by undoing for VQs =
0 .. n. */
> >       assert(assign);
> >       while (--n >=3D 0) {
> >           virtio_pci_set_guest_notifier(d, n, !assign, with_irqfd);
> >       }
> > +
> >       return r;
> >   }
> >
>


