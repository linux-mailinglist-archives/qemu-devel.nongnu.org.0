Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B04F4A3F55
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:38:09 +0100 (CET)
Received: from localhost ([::1]:47266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nET8R-0004Ta-UY
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:38:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nET4N-0003a5-UL
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:33:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nET4D-0007u1-W7
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643621623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9KWXzU3yCXh1Bn1R9l4f2XuodTNsk4IqZ3y5sDhgNU=;
 b=GEaSUWEz7XKBi18yg2Uqu8U30FVJTg1qvyywBk+2Q/o5q3OZbJ3ZihVcmH6DHhhAAuGwac
 vV5vk0V15E7CfaeTrUtMGATg5rASmXTbTFMvI3C/O3b1qWI6jXYpik6jGPaP8E4mgQa+oP
 QX4wD+oOY1FPNjYH2N689Cw3Ig3ZBNA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-zOSR5gLsPQ2khJtrsPo-jQ-1; Mon, 31 Jan 2022 04:33:42 -0500
X-MC-Unique: zOSR5gLsPQ2khJtrsPo-jQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 kl20-20020a056214519400b0042382bf37f2so12174320qvb.5
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 01:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U9KWXzU3yCXh1Bn1R9l4f2XuodTNsk4IqZ3y5sDhgNU=;
 b=OWNVL6VAKqHwyfzFoNvNGndh5Vbg121TIfLrCZZvNgBUVZvNUcKiVsxH9G+daIhtU8
 23AgtVUly7AmnXOACUJGA3sep2rhx7UpkkVoRL8XLEGFDGac9Kx9/MF29rUV4O90v1OB
 TnPE5APWfQHj6AizPsQOeY1w49UOANc6jUFv4fo16pM1S7fb6VMn/JLRhOeDwQmzCaE9
 0agW7fiPjlpP11hFT+l6KTujGdaMFDKap6nE+x9oIcXH2ewuyD6m4p6AVVrl8HxGCjVU
 5naZ+6kgcHJSGfYWDZnlEP63bnxGHLis8MJsu7Zn86RvV41DG+NwQi12WGsO/kau6Lgw
 77YQ==
X-Gm-Message-State: AOAM53268EGRAYzWVvUBTosD9J0Y9v9ZwJPDSQsSW4d0Cdz17osxMtRf
 Ew4Wr766eca0SYeHZbKm1VgA8IzCoVvUZho38kGV3+VBGvlG/y6ZDvqhju7sZsi2My2Szp9J930
 tV1sXCQ5Hp5uw7B+uF1ILoGh8d4kIvm4=
X-Received: by 2002:a05:620a:4727:: with SMTP id
 bs39mr218007qkb.486.1643621621530; 
 Mon, 31 Jan 2022 01:33:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0DPjq3+Tre+9XC2IH4LQnZMr7y0DIdRgWvsSXq9qyO9x5HSrYYKZEwFks8nMZUTwr4hk1mnsrjheFqKxjQNM=
X-Received: by 2002:a05:620a:4727:: with SMTP id
 bs39mr217991qkb.486.1643621621286; 
 Mon, 31 Jan 2022 01:33:41 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-4-eperezma@redhat.com>
 <d97a4fce-b94b-9503-e1bb-1599b73475dd@redhat.com>
In-Reply-To: <d97a4fce-b94b-9503-e1bb-1599b73475dd@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Jan 2022 10:33:05 +0100
Message-ID: <CAJaqyWfoHnq6ax1Az1Uom04VOX3zBm5Q-3O2LvtEZ7FP1UM8RQ@mail.gmail.com>
Subject: Re: [PATCH 03/31] vdpa: Add vhost_svq_get_dev_kick_notifier
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Fri, Jan 28, 2022 at 7:03 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Is needed so vhost-vdpa knows the device's kick event fd.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  4 ++++
> >   hw/virtio/vhost-shadow-virtqueue.c | 10 +++++++++-
> >   2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 61ea112002..400effd9f2 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -11,9 +11,13 @@
> >   #define VHOST_SHADOW_VIRTQUEUE_H
> >
> >   #include "hw/virtio/vhost.h"
> > +#include "qemu/event_notifier.h"
>
>
> Let's move this part to patch 2.
>

Sure, I'll change for the next revision.

> Thanks
>
>
> >
> >   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> >
> > +const EventNotifier *vhost_svq_get_dev_kick_notifier(
> > +                                              const VhostShadowVirtque=
ue *svq);
> > +
> >   VhostShadowVirtqueue *vhost_svq_new(void);
> >
> >   void vhost_svq_free(VhostShadowVirtqueue *vq);
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 5ee7b401cb..bd87110073 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -11,7 +11,6 @@
> >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> >
> >   #include "qemu/error-report.h"
> > -#include "qemu/event_notifier.h"
> >
> >   /* Shadow virtqueue to relay notifications */
> >   typedef struct VhostShadowVirtqueue {
> > @@ -21,6 +20,15 @@ typedef struct VhostShadowVirtqueue {
> >       EventNotifier hdev_call;
> >   } VhostShadowVirtqueue;
> >
> > +/**
> > + * The notifier that SVQ will use to notify the device.
> > + */
> > +const EventNotifier *vhost_svq_get_dev_kick_notifier(
> > +                                               const VhostShadowVirtqu=
eue *svq)
> > +{
> > +    return &svq->hdev_kick;
> > +}
> > +
> >   /**
> >    * Creates vhost shadow virtqueue, and instruct vhost device to use t=
he shadow
> >    * methods and file descriptors.
>


