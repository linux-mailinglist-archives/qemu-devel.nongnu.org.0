Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C69B39D553
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 08:47:00 +0200 (CEST)
Received: from localhost ([::1]:60296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq92J-00039e-2l
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 02:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lq90Z-0001vx-3O
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:45:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lq90X-0000rn-7n
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623048308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ArjKOjSNqesgSBnIFd1fWsDk2+qWcw09LTt93d+i9vQ=;
 b=Ds4vHYtB2hfkSuPg1R1Cm9U0pctmMbPxqcxATd+nxhPW10PNz/S3szUXpghsWVPKZAHzpg
 SChnfieU1yu7JwoyVCf0Q+Aqzd9aHIS/RyrlgoF1ZGKy1Ufrp+hgEOVZJB+G8ZGxKqSXEZ
 nU7AgfiXOr4ZJvwMJUAoLYghbDzGAEE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-4Aci9OaDOKKGRrWuTjgDnw-1; Mon, 07 Jun 2021 02:45:04 -0400
X-MC-Unique: 4Aci9OaDOKKGRrWuTjgDnw-1
Received: by mail-ed1-f70.google.com with SMTP id
 g13-20020a056402090db02903935a4cb74fso3061141edz.1
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 23:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bR452Uhm7c2kcZUUngHJ+6hyq4RH9d63RpaFFvGDI9I=;
 b=XcrkfyXSafAEMj4aqrQzuSnxKDBefQaeIZB3+YG2ESvUJ+NVQiTVb0v3mmOZ/A8rm5
 zHgeVJT8yfiJ+IFArAEPKGAn0/C4mF/KuWZbLsUhd2cYgRm4WejIotekCVe7MvdaOFcQ
 M0ZbHjfS7MDHwpB2dhAoTOT3m+CkcYjMG+bo2wfMngBQLmaVgl3gNygXUBLtkp9g0xNB
 NvH0dquBk3q8kNFGLtBPjmNCCNqo6kiVvYqgvOo8xGQnh0V2VoOA09FLQTbGHdn+LOW4
 DEvY1ThBMpqQaqFSYJRzm0Xn8V+1pZvlnj28VoQ7GxctzR65+O34lsJkyGkNNEDFh1Vx
 Encg==
X-Gm-Message-State: AOAM531hJxPPufTnKTR8q65QFqjZ8F2FeqTfdgA0+adpovYmd2tr455x
 ncXqC05uPDWnxuW5HgStojMcG7reO8MZkEn2CE3gnZXOzwHUC7/B+Au1z4KkDVyJuBTBOBBKG3/
 fuT0ZLasO6Z6LiF6vJLx15tftPuNExUo=
X-Received: by 2002:a17:906:c316:: with SMTP id
 s22mr16795533ejz.17.1623048303267; 
 Sun, 06 Jun 2021 23:45:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMVkIwR7Wv11JAq/tjon8fmcgSTLeP/Kky2S+MbX+Li/Cgxu3D+nmUnucA2IqDYszk15w6jvdh0JTe/35pn+A=
X-Received: by 2002:a17:906:c316:: with SMTP id
 s22mr16795518ejz.17.1623048303026; 
 Sun, 06 Jun 2021 23:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-10-lulu@redhat.com>
 <cfaaa894-fb52-97f3-4324-5ce875e6a724@redhat.com>
In-Reply-To: <cfaaa894-fb52-97f3-4324-5ce875e6a724@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 7 Jun 2021 14:44:27 +0800
Message-ID: <CACLfguXjkZmm-0pADFtBuKxFnw0nB+fgyS24sWQJxO1H2nd-LQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/10] virtio-pci: add support for configure interrupt
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

On Thu, Jun 3, 2021 at 2:45 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/6/2 =E4=B8=8A=E5=8D=8811:47, Cindy Lu =E5=86=99=E9=81=93:
> > Add support for configure interrupt, use kvm_irqfd_assign and set the
> > gsi to kernel. When the configure notifier was eventfd_signal by host
> > kernel, this will finally inject an msix interrupt to guest
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/virtio-pci.c | 63 ++++++++++++++++++++++++++++++++++++++++-=
-
> >   1 file changed, 60 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index f863c89de6..1e03f11a85 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -717,7 +717,8 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *=
proxy, int queue_no,
> >       VirtQueue *vq;
> >
> >       if (queue_no =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > -        return -1;
> > +        *n =3D virtio_get_config_notifier(vdev);
> > +        *vector =3D vdev->config_vector;
> >       } else {
> >           if (!virtio_queue_get_num(vdev, queue_no)) {
> >               return -1;
> > @@ -764,6 +765,10 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProx=
y *proxy, int nvqs)
> >       return ret;
> >   }
> >
> > +static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
> > +{
> > +    return kvm_virtio_pci_vector_use_one(proxy, VIRTIO_CONFIG_IRQ_IDX)=
;
> > +}
> >
> >   static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
> >                           int queue_no)
> > @@ -792,6 +797,28 @@ static void kvm_virtio_pci_vector_release(VirtIOPC=
IProxy *proxy, int nvqs)
> >       }
> >   }
> >
> > +static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy=
)
> > +{
> > +    kvm_virtio_pci_vector_release_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
> > +}
>
>
> Newline please, can this survive from checkpatch.pl?
>
sure, will fix this , I have tried checkpatch.pl?, but seems it not
working correctly in my environment
>
> > +static int virtio_pci_set_config_notifier(DeviceState *d, bool assign)
> > +{
> > +    VirtIOPCIProxy *proxy =3D to_virtio_pci_proxy(d);
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    EventNotifier *notifier =3D virtio_get_config_notifier(vdev);
> > +    int r =3D 0;
> > +    if (assign) {
> > +        r =3D event_notifier_init(notifier, 0);
> > +        virtio_set_notifier_fd_handler(vdev, VIRTIO_CONFIG_IRQ_IDX, tr=
ue, true);
> > +        kvm_virtio_pci_vector_config_use(proxy);
> > +    } else {
> > +        virtio_set_notifier_fd_handler(vdev, VIRTIO_CONFIG_IRQ_IDX,
> > +                                             false, true);
> > +        kvm_virtio_pci_vector_config_release(proxy);
> > +        event_notifier_cleanup(notifier);
> > +    }
> > +    return r;
> > +}
> >   static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
> >                                          unsigned int queue_no,
> >                                          unsigned int vector,
> > @@ -873,9 +900,17 @@ static int virtio_pci_vector_unmask(PCIDevice *dev=
, unsigned vector,
> >           }
> >           vq =3D virtio_vector_next_queue(vq);
> >       }
> > -
> > +    n =3D virtio_get_config_notifier(vdev);
> > +    ret =3D virtio_pci_vq_vector_unmask(proxy, VIRTIO_CONFIG_IRQ_IDX,
> > +                        vector, msg, n);
> > +    if (ret < 0) {
> > +        goto config_undo;
> > +    }
>
>
> I'd do this before the loop, but need to validate whether the vector is
> the one that is used by the config interrupt.
>
sure ,I  will move this section
>
> >       return 0;
> >
> > +config_undo:
> > +    n =3D virtio_get_config_notifier(vdev);
> > +    virtio_pci_vq_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n)=
;
>
>
> So unmask fail means it is still masked, we don't need to mask it again.
>
>
> >   undo:
> >       vq =3D virtio_vector_first_queue(vdev, vector);
> >       while (vq && unmasked >=3D 0) {
> > @@ -909,6 +944,8 @@ static void virtio_pci_vector_mask(PCIDevice *dev, =
unsigned vector)
> >           }
> >           vq =3D virtio_vector_next_queue(vq);
> >       }
> > +    n =3D virtio_get_config_notifier(vdev);
> > +    virtio_pci_vq_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n)=
;
> >   }
> >
> >   static void virtio_pci_vector_poll(PCIDevice *dev,
> > @@ -942,6 +979,20 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
> >               msix_set_pending(dev, vector);
> >           }
> >       }
> > +   /*check for config interrupt*/
> > +   vector =3D vdev->config_vector;
> > +   notifier =3D virtio_get_config_notifier(vdev);
> > +   if (vector < vector_start || vector >=3D vector_end ||
> > +            !msix_is_masked(dev, vector)) {
> > +        return;
> > +   }
> > +   if (k->guest_notifier_pending) {
> > +        if (k->guest_notifier_pending(vdev, VIRTIO_CONFIG_IRQ_IDX)) {
> > +            msix_set_pending(dev, vector);
> > +        }
> > +   } else if (event_notifier_test_and_clear(notifier)) {
> > +        msix_set_pending(dev, vector);
> > +   }
>
>
> Let's consider to unify the codes with vq vector here.
>
>
Will do this
> >   }
> >
> >   static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool =
assign,
> > @@ -1002,6 +1053,7 @@ static int virtio_pci_set_guest_notifiers(DeviceS=
tate *d, int nvqs, bool assign)
> >           msix_unset_vector_notifiers(&proxy->pci_dev);
> >           if (proxy->vector_irqfd) {
> >               kvm_virtio_pci_vector_release(proxy, nvqs);
> > +            kvm_virtio_pci_vector_config_release(proxy);
> >               g_free(proxy->vector_irqfd);
> >               proxy->vector_irqfd =3D NULL;
> >           }
> > @@ -1029,6 +1081,10 @@ static int virtio_pci_set_guest_notifiers(Device=
State *d, int nvqs, bool assign)
> >                   goto assign_error;
> >               }
> >           }
> > +        r =3D virtio_pci_set_config_notifier(d, assign);
> > +        if (r < 0) {
> > +            goto config_error;
> > +        }
> >           r =3D msix_set_vector_notifiers(&proxy->pci_dev,
> >                                         virtio_pci_vector_unmask,
> >                                         virtio_pci_vector_mask,
> > @@ -1045,7 +1101,8 @@ notifiers_error:
> >           assert(assign);
> >           kvm_virtio_pci_vector_release(proxy, nvqs);
> >       }
> > -
>
>
> Newline should be kept here.
>
> Thanks
>
>
will correct this

> > +config_error:
> > +    kvm_virtio_pci_vector_config_release(proxy);
> >   assign_error:
> >       /* We get here on assignment failure. Recover by undoing for VQs =
0 .. n. */
> >       assert(assign);
>


