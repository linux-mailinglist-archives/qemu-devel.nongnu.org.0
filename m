Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6794A39D517
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 08:38:39 +0200 (CEST)
Received: from localhost ([::1]:54142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq8uE-00078y-FV
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 02:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lq8t4-0005Aj-La
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:37:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lq8sz-0004b4-3V
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623047839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JiR0Ksqd++EVdiRo6YCTQ2RcXvKC2T78MVXMtqOrvQQ=;
 b=PeM8pB+54ptsNeZnaR6I2QQLuuUGxvxqhEVCEN2rUlp139le6TQx3a1NxXkHTCNZa9NWJK
 n862eoZXb2WByNKvh5NKiBv8ZqqeUoY+QUwwGtlykSYJWAgvGz+sy9WLACnUcC2BYo962g
 SPC7qw86wIU37a8AkBfcQh6/U+L8JbY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-iwTK_TlqM-GtgPqT5Tz_EQ-1; Mon, 07 Jun 2021 02:37:10 -0400
X-MC-Unique: iwTK_TlqM-GtgPqT5Tz_EQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 w13-20020a170906384db02903d9ad6b26d8so4919266ejc.0
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 23:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JiR0Ksqd++EVdiRo6YCTQ2RcXvKC2T78MVXMtqOrvQQ=;
 b=P1Fo/3EW9NjhdQDCCXuMI0c0HE39om49SDFjSYkrDpjzRH7bRafzmOsMO/C/J5sozn
 sCD9Gig+HmDDgIXUtlKPOAika2s+7WqKDgr1rXVfochBdXXThWl3WlBB7vzF/rPd2U86
 YA/9GzUlSb6BURn8dWJZrI8KSToiDMD9CfZdcPxMWpfMD/cXtWdHk5TmvxiTv83Cy+8T
 DAX5yCfygEn3jonKdOEV+FqkP/streRWQPEmpm78u9eubZLhzXJESKuGp1r3G75OZ6va
 0gz1RxLlm0nYWpCS7zdozewvT9UGySgifWhhG9y5xmUkeKKfK8B3fw4Zv4HiydWffpU3
 S/mA==
X-Gm-Message-State: AOAM531sFncHIbokUNUfYIPSQZK4FkIDmRnItfubeqvuOwQYcxhLQ3a2
 UUS7hT+tqXHIe4bVL+H1BC5JAcDRLSYFP0hu27DdPriYvazqGjLzL+06nO/v6nemwOxVfT0T6hb
 Sc17baQRkzLsdykQJ+PvRF6Xcd1Axb18=
X-Received: by 2002:a17:906:488f:: with SMTP id
 v15mr16138104ejq.428.1623047829691; 
 Sun, 06 Jun 2021 23:37:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwySB8EF/hS7VnU9z66/4tuRbi4YOug1EYg0MYr05jZkvj36eE7y7m4I4WKInJrz/WzAyc4rjIxw1uTniUytM0=
X-Received: by 2002:a17:906:488f:: with SMTP id
 v15mr16138094ejq.428.1623047829479; 
 Sun, 06 Jun 2021 23:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-9-lulu@redhat.com>
 <a4dae2fa-a023-5a81-7e9e-5c6164962324@redhat.com>
In-Reply-To: <a4dae2fa-a023-5a81-7e9e-5c6164962324@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 7 Jun 2021 14:36:33 +0800
Message-ID: <CACLfguWK6-ppHH3Vs4GAAkhTn5AJGmSCypUep+f--TCrWtqxGg@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] virtio-pci: decouple virtqueue from
 kvm_virtio_pci_vector_use
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Thu, Jun 3, 2021 at 2:39 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/6/2 =E4=B8=8A=E5=8D=8811:47, Cindy Lu =E5=86=99=E9=81=93:
> > inorder
>
>
> s/inorder/In order/
>
>
> > to support configure interrupt, we need to decouple
> > virtqueue from vector use and vector release function
> > this patch introduce vector_release_one and vector_use_one
> > to support one vector.
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
>
>
> I think we need to reorder the patches to let such decoupling comes
> first in this series.
>
>
> > ---
> >   hw/virtio/virtio-pci.c | 122 ++++++++++++++++++++--------------------=
-
> >   1 file changed, 61 insertions(+), 61 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index 6a4ef413a4..f863c89de6 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -666,7 +666,6 @@ static uint32_t virtio_read_config(PCIDevice *pci_d=
ev,
> >   }
> >
> >   static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
> > -                                        unsigned int queue_no,
> >                                           unsigned int vector)
> >   {
> >       VirtIOIRQFD *irqfd =3D &proxy->vector_irqfd[vector];
> > @@ -710,85 +709,86 @@ static void kvm_virtio_pci_irqfd_release(VirtIOPC=
IProxy *proxy,
> >       ret =3D kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, irqfd=
->virq);
> >       assert(ret =3D=3D 0);
> >   }
> > -
> > -static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
> > +static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no=
,
> > +                                      EventNotifier **n, unsigned int =
*vector)
> >   {
> >       PCIDevice *dev =3D &proxy->pci_dev;
> >       VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > -    VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> > -    unsigned int vector;
> > -    int ret, queue_no;
> >       VirtQueue *vq;
> > -    EventNotifier *n;
> > -    for (queue_no =3D 0; queue_no < nvqs; queue_no++) {
> > +
> > +    if (queue_no =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        return -1;
> > +    } else {
> >           if (!virtio_queue_get_num(vdev, queue_no)) {
> > -            break;
> > -        }
> > -        vector =3D virtio_queue_vector(vdev, queue_no);
> > -        if (vector >=3D msix_nr_vectors_allocated(dev)) {
> > -            continue;
> > -        }
> > -        ret =3D kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
> > -        if (ret < 0) {
> > -            goto undo;
> > -        }
> > -        /* If guest supports masking, set up irqfd now.
> > -         * Otherwise, delay until unmasked in the frontend.
> > -         */
> > -        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> > -            vq =3D virtio_get_queue(vdev, queue_no);
> > -            n =3D virtio_queue_get_guest_notifier(vq);
> > -            ret =3D kvm_virtio_pci_irqfd_use(proxy, n, vector);
> > -            if (ret < 0) {
> > -                kvm_virtio_pci_vq_vector_release(proxy, vector);
> > -                goto undo;
> > -            }
> > +            return -1;
> >           }
> > +        *vector =3D virtio_queue_vector(vdev, queue_no);
> > +        vq =3D virtio_get_queue(vdev, queue_no);
> > +        *n =3D virtio_queue_get_guest_notifier(vq);
> > +    }
> > +    if (*vector >=3D msix_nr_vectors_allocated(dev)) {
> > +        return -1;
> >       }
> >       return 0;
> > +}
> >
> > +static int kvm_virtio_pci_vector_use_one(VirtIOPCIProxy *proxy, int qu=
eue_no)
> > +{
>
>
> To ease the reviewer, let's separate this patch into two.
>
> 1) factoring out the core logic
> 2) decouple the vq
>
> Thanks
>
Thanks Jason, I will change this part
>
> > +    unsigned int vector;
> > +    int ret;
> > +    EventNotifier *n;
> > +    ret =3D virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +    ret =3D kvm_virtio_pci_vq_vector_use(proxy, vector);
> > +    if (ret < 0) {
> > +        goto undo;
> > +    }
> > +    ret =3D kvm_virtio_pci_irqfd_use(proxy, n, vector);
> > +    if (ret < 0) {
> > +        goto undo;
> > +    }
> > +    return 0;
> >   undo:
> > -    while (--queue_no >=3D 0) {
> > -        vector =3D virtio_queue_vector(vdev, queue_no);
> > -        if (vector >=3D msix_nr_vectors_allocated(dev)) {
> > -            continue;
> > -        }
> > -        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> > -            vq =3D virtio_get_queue(vdev, queue_no);
> > -            n =3D virtio_queue_get_guest_notifier(vq);
> > -            kvm_virtio_pci_irqfd_release(proxy, n, vector);
> > -        }
> > -        kvm_virtio_pci_vq_vector_release(proxy, vector);
> > +    kvm_virtio_pci_irqfd_release(proxy, n, vector);
> > +    return ret;
> > +}
> > +static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
> > +{
> > +    int queue_no;
> > +    int ret =3D 0;
> > +    for (queue_no =3D 0; queue_no < nvqs; queue_no++) {
> > +        ret =3D kvm_virtio_pci_vector_use_one(proxy, queue_no);
> >       }
> >       return ret;
> >   }
> >
> > -static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int n=
vqs)
> > +
> > +static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
> > +                        int queue_no)
> >   {
> > -    PCIDevice *dev =3D &proxy->pci_dev;
> >       VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> >       unsigned int vector;
> > -    int queue_no;
> > -    VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> > -    VirtQueue *vq;
> >       EventNotifier *n;
> > +    int ret;
> > +    VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> > +    ret =3D virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
> > +    if (ret < 0) {
> > +        return;
> > +    }
> > +
> > +    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> > +        kvm_virtio_pci_irqfd_release(proxy, n, vector);
> > +    }
> > +    kvm_virtio_pci_vq_vector_release(proxy, vector);
> > +}
> > +static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int n=
vqs)
> > +{
> > +    int queue_no;
> > +
> >       for (queue_no =3D 0; queue_no < nvqs; queue_no++) {
> > -        if (!virtio_queue_get_num(vdev, queue_no)) {
> > -            break;
> > -        }
> > -        vector =3D virtio_queue_vector(vdev, queue_no);
> > -        if (vector >=3D msix_nr_vectors_allocated(dev)) {
> > -            continue;
> > -        }
> > -        /* If guest supports masking, clean up irqfd now.
> > -         * Otherwise, it was cleaned when masked in the frontend.
> > -         */
> > -        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> > -            vq =3D virtio_get_queue(vdev, queue_no);
> > -            n =3D virtio_queue_get_guest_notifier(vq);
> > -            kvm_virtio_pci_irqfd_release(proxy, n, vector);
> > -        }
> > -        kvm_virtio_pci_vq_vector_release(proxy, vector);
> > +        kvm_virtio_pci_vector_release_one(proxy, queue_no);
> >       }
> >   }
> >
>


