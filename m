Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FFC36E385
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 05:09:11 +0200 (CEST)
Received: from localhost ([::1]:49568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbx39-0007QT-19
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 23:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbx1x-0006zB-QW
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 23:07:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbx1t-0000zP-G6
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 23:07:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619665672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LsHf/7DvSG/IW8BagDqveSKHhn1QNEXPOEKlhKuDg2Y=;
 b=SUU2olGZaw5C9RVDTbS/X3LEMfKhldt5lGbgVVdT2UZvlcS0p8XaaNuVJ41F3D01xlmMkA
 /yL9tHMTjO1dI5cIITMOOGFVa/kMLllokI/msIQbGz0MflPwif21KwmPT7hfqJZVlZ3i45
 ozQBoyO1KK9Zj3f/kHTArQfTJWOAHgo=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-If4iwxYeNAGbFOHcUMwKKQ-1; Wed, 28 Apr 2021 23:07:50 -0400
X-MC-Unique: If4iwxYeNAGbFOHcUMwKKQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 h22-20020aa786d60000b029027d0956e914so2244544pfo.23
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 20:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LsHf/7DvSG/IW8BagDqveSKHhn1QNEXPOEKlhKuDg2Y=;
 b=UeIA7F43WVj0Tyfp1/94JwwhXffoKwPfPj/bT8eqOm5/x+aP7zeJf2mlr4KlDj6zS4
 W0YqBHMt2lUsae1Dl8hYeNAAbBDu7YjvU/LjUUbd200OiqNx2lF37zhFAgnc5KGBcCuh
 EZany8NxPRrmljFkjysaUwH9cn+fj8Q4ejfuxpRWnwph9riU4XojuP7k/64K06EcLHuK
 aXHFwFy3jUeJ9o0OgoIyfqbeSZj+y33nWSgei9p94n+S04zFGWra+lz/AayE6L6WcCQt
 hIIixFCaq90++aZm3bEIYrLDxdoptAr8xWKf6zU2fJhSGyNOJ6gKNTuK5bJMl/Dv0y4x
 4EGQ==
X-Gm-Message-State: AOAM533ZFM8FF3w1/uwAb6XP+2eCMu/r+lpEbjUnOrUC8NXf61B3X8vE
 GnPLQwwBLqHu+RIsvlkrouFbnEoQzwd3nYrAmFnYivWcCb4wJaZ+XqcVpKuhy1Diu3YVl/ojTMr
 geb5phJHe8Ah6mhYr88HCdH9ojqicSMQ=
X-Received: by 2002:a17:90a:bb93:: with SMTP id
 v19mr7286092pjr.127.1619665669050; 
 Wed, 28 Apr 2021 20:07:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuDFjLJc3yTBwhoXqpk7sPdcg7SlV2sYmKz1mIHg44zaCryUCGQjfAm+MvXp2kIuObrduXIHTYdj7nYIBTM00=
X-Received: by 2002:a17:90a:bb93:: with SMTP id
 v19mr7286075pjr.127.1619665668723; 
 Wed, 28 Apr 2021 20:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210427033951.29805-1-lulu@redhat.com>
 <20210427033951.29805-8-lulu@redhat.com>
 <35563de7-7cc2-2972-d08c-0a58473dbb27@redhat.com>
In-Reply-To: <35563de7-7cc2-2972-d08c-0a58473dbb27@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 29 Apr 2021 11:07:11 +0800
Message-ID: <CACLfguUXwHGJupgQfPXA-HeWOMUycxniFoca_P7G8Be50Oxt3Q@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] virtio-pci: add support for configure interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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

On Tue, Apr 27, 2021 at 3:12 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/4/27 =E4=B8=8A=E5=8D=8811:39, Cindy Lu =E5=86=99=E9=81=93:
> > Add support for configure interrupt, use kvm_irqfd_assign and set the
> > gsi to kernel. When the configure notifier was eventfd_signal by host
> > kernel, this will finally inject an msix interrupt to guest
> > ---
> >   hw/virtio/virtio-pci.c | 186 ++++++++++++++++++++++++++--------------=
-
> >   1 file changed, 120 insertions(+), 66 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index 2b7e6cc0d9..07d28dd367 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -664,12 +664,10 @@ static uint32_t virtio_read_config(PCIDevice *pci=
_dev,
> >   }
> >
> >   static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
> > -                                        unsigned int queue_no,
> >                                           unsigned int vector)
> >   {
> >       VirtIOIRQFD *irqfd =3D &proxy->vector_irqfd[vector];
> >       int ret;
> > -
>
>
> Unnecessary changes.
>
will fix this
>
> >       if (irqfd->users =3D=3D 0) {
> >           ret =3D kvm_irqchip_add_msi_route(kvm_state, vector, &proxy->=
pci_dev);
> >           if (ret < 0) {
> > @@ -708,93 +706,120 @@ static void kvm_virtio_pci_irqfd_release(VirtIOP=
CIProxy *proxy,
> >       ret =3D kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, irqfd=
->virq);
> >       assert(ret =3D=3D 0);
> >   }
> > -
>
>
> So did here.
>
will fix this
>
> > -static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
> > + static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_n=
o,
> > +                                      EventNotifier **n, unsigned int =
*vector)
>
>
> The indentation looks not correct.
>
>
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
> > +    if (queue_no =3D=3D -1) {
> > +        *n =3D virtio_get_config_notifier(vdev);
> > +        *vector =3D vdev->config_vector;
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
> Let's use separate patch for the introducing of
> kvm_virtio_pci_vector_user/release_one().
>
> And then do the config interrupt support on top.
>
Sure, will fix this
> Thanks
>


