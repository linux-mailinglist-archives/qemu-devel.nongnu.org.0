Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C53465C8D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 04:12:31 +0100 (CET)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mscWM-00061b-7Q
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 22:12:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mscVO-0005Km-9e
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 22:11:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mscVL-0007CP-U2
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 22:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638414686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YGbmCB7qPu/1kudhHEas85xA5rhP4tZUrLCH39gY5cc=;
 b=bKjRkEMOnF4TQThTgZ3obL/14Xioz5VaHTWQXSsSM+Utz1obGyC5aHTQ34iotiuVqg+6uK
 gL67a0Em9SLQVNTLT/QS14u9a4tK4RD+P7MRdoiYCUXSgai3CxGqqJcq+cTLTg6W+pWwN0
 AV0YZtGGyeZ4mj9hwmt6pWDpWvHxfpA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-N_a5Mi37Oz2Gf5pDS_y2Mg-1; Wed, 01 Dec 2021 22:11:25 -0500
X-MC-Unique: N_a5Mi37Oz2Gf5pDS_y2Mg-1
Received: by mail-lf1-f72.google.com with SMTP id
 k5-20020a05651210c500b0040934a07fbdso10553920lfg.22
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 19:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YGbmCB7qPu/1kudhHEas85xA5rhP4tZUrLCH39gY5cc=;
 b=nm8+lZpJkL2WmcDpJLk7oa3Hp1Atkuy9CNPEUhB4uxfWYO6DRNUs9Ez9pkcW9TbJTp
 yA4Q0YPxr6bJ+Hp0QUFSjzNXfZRgX3R5I97GftWQH77U0areMxSaOyPivnZnVHpq1Ioa
 o5Lbf/yx7EAxpWe06qq/7qcF/QMUejJTwT9BELWodlgEDgqEPVimkoM+9PZf6Ue4t9Ag
 hGBUBWimbjFt53LEdYdJvMPO3CXHWxty7j3KRqRTSOlTMsTaQD2IFJZFxG18k/zMhwMU
 RrF+/TzMyG8PM7YzXxUTS0SGmaQcIFCuYJeVt5yCs0gUHAtliwBvp0hdhWsYVqpLnOpA
 OusQ==
X-Gm-Message-State: AOAM530GIi16DvXhW79Shn1vkLe2jO9YZpcc+/6idyFXxR0tW/q3uOnT
 oHFnCtpn8hSD9wWvPh4GmKNKbSDoOq2c2E2LhwV1uSCjwuOSzpGVsY040KkU8pQYWrYwgPYxeui
 vJaRA954/yfKc9iDLPeeOaZrxvNs5fiY=
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr10000371lfv.481.1638414683700; 
 Wed, 01 Dec 2021 19:11:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFt95w9ohnhQlBc4nhZfc/eUexFKmW5WpVeMxjoGaCXMGcP9afTjnqTkcmaU6RIPOTGpfceVoXZO/HraNLCdE=
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr10000347lfv.481.1638414683454; 
 Wed, 01 Dec 2021 19:11:23 -0800 (PST)
MIME-Version: 1.0
References: <20211130134510.267382-1-stefanha@redhat.com>
In-Reply-To: <20211130134510.267382-1-stefanha@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 2 Dec 2021 11:11:12 +0800
Message-ID: <CACGkMEu2HNX9yL7NGtRGk_iF2pFDmk1o6c-Uzw797rbhj3mhLg@mail.gmail.com>
Subject: Re: [PATCH] virtio: signal after wrapping packed used_idx
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Tiwei Bie <tiwei.bie@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 30, 2021 at 9:46 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Packed Virtqueues wrap used_idx instead of letting it run freely like
> Split Virtqueues do. If the used ring wraps more than once there is no
> way to compare vq->signalled_used and vq->used_idx in
> virtio_packed_should_notify() since they are modulo vq->vring.num.
>
> This causes the device to stop sending used buffer notifications when
> when virtio_packed_should_notify() is called less than once each time
> around the used ring.
>
> It is possible to trigger this with virtio-blk's dataplane
> notify_guest_bh() irq coalescing optimization. The call to
> virtio_notify_irqfd() (and virtio_packed_should_notify()) is deferred to
> a BH. If the guest driver is polling it can complete and submit more
> requests before the BH executes, causing the used ring to wrap more than
> once. The result is that the virtio-blk device ceases to raise
> interrupts and I/O hangs.
>
> Cc: Tiwei Bie <tiwei.bie@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
> Smarter solutions welcome, but I think notifying once per vq->vring.num
> is acceptable.
> ---
>  hw/virtio/virtio.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index ea7c079fb0..f7851c2750 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -885,6 +885,7 @@ static void virtqueue_packed_flush(VirtQueue *vq, unsigned int count)
>      if (vq->used_idx >= vq->vring.num) {
>          vq->used_idx -= vq->vring.num;
>          vq->used_wrap_counter ^= 1;
> +        vq->signalled_used_valid = false;
>      }
>  }
>
> --
> 2.33.1
>


