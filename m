Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D0F5A0C3F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 11:08:34 +0200 (CEST)
Received: from localhost ([::1]:41374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR8qn-000326-1l
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 05:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oR8j5-0005of-RH
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 05:00:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oR8ip-0003ow-Mq
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 05:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661418018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8wm3wFAh+l0L1o9C9jv6aT9KYwyfy/KpePbY4D57s5U=;
 b=E6iL0ZRNJe0OQaF/bJ2BJTnX4PD7UR+TH7jhQ7Yg/ZgkUvcUKV5PdQmQ77kep8EinSwi61
 ZjKyl+RKLhUEKMo2r+ulvQp4MX5I7Z8RIyTlJZjtIsNyI1mZX2DCIbw9o1i/q0SdLl+EsT
 umHFiUZfOlQ9ye656Z8XEO9yZ0RkbI8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-Q8LuqE5VM2eCKSCDY_wyqw-1; Thu, 25 Aug 2022 05:00:17 -0400
X-MC-Unique: Q8LuqE5VM2eCKSCDY_wyqw-1
Received: by mail-qt1-f199.google.com with SMTP id
 h19-20020ac85493000000b00343408bd8e5so14606137qtq.4
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 02:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=8wm3wFAh+l0L1o9C9jv6aT9KYwyfy/KpePbY4D57s5U=;
 b=RiBzOpAElmaBswmLIkbeUhwR3pcUeBWHVlB04tkwv8r6jPN+yTsAAF/xVMi8bBVtQJ
 sCeOecUeDs/IinVF4/MdP14elbJ/bAALqgXtSU59PqSX1jY9E4/RNBuuNbp06PFscuv8
 JksltWuXq7qGwJDZB7smOYcfXuI5mnR09lAHcIgdvmns8EgVBxEwjMshwic2U4pMaqe2
 HASjFdX8I2QODnJt8Ginc4A6BoBgkiWzxv+JQ0Ftu9XyWWxHUzgAw3CoM1026JDG2m6z
 MHcmbF8y/d8COBQtHtrq0PPD/ArGDuofwjNKYn6vbDDnJMKRvEcDqX8+JwucyezqBTue
 OHRw==
X-Gm-Message-State: ACgBeo2LfwqWmAFLypDZovjdwj0Ce1TWxS5ftEeHRGa2uxUTdBU5D9vb
 WRNvLnhn/3bZwjlSF3w/0UX+zJAieo4hOan5TIwZH2uBoudzOX0MBy3fZI/mEyYc3Oeg277cfFy
 5HVoipylVNwD8gz9Ll7vMNNwImsjAqxU=
X-Received: by 2002:a05:622a:1045:b0:344:6d94:6353 with SMTP id
 f5-20020a05622a104500b003446d946353mr2694274qte.582.1661418017082; 
 Thu, 25 Aug 2022 02:00:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6NJl89llLs1WtuXIP53uqT94TjcW1ip7HSrUD3n18V91Tpg3GN3+mGAAKaPkLDnEPWGuZwkY9vp11wVzyUYkk=
X-Received: by 2002:a05:622a:1045:b0:344:6d94:6353 with SMTP id
 f5-20020a05622a104500b003446d946353mr2694259qte.582.1661418016883; Thu, 25
 Aug 2022 02:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220818151244.2050-1-qtxuning1999@sjtu.edu.cn>
 <20220818151244.2050-2-qtxuning1999@sjtu.edu.cn>
 <CAJaqyWePsPLtZQh8evqOSyaJAQ2HfAcmV+DhapVdGDn-S4dHdg@mail.gmail.com>
 <107520028.9018426.1661411752630.JavaMail.zimbra@sjtu.edu.cn>
In-Reply-To: <107520028.9018426.1661411752630.JavaMail.zimbra@sjtu.edu.cn>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 25 Aug 2022 10:59:40 +0200
Message-ID: <CAJaqyWezg2yLnySE_K8qfUM5_yiZpHGNcZXL1VenzHiQR243rA@mail.gmail.com>
Subject: Re: [RFC 1/2] virtio: expose used buffers
To: Guo Zhi <qtxuning1999@sjtu.edu.cn>
Cc: jasowang <jasowang@redhat.com>, sgarzare <sgarzare@redhat.com>, 
 Michael Tsirkin <mst@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Aug 25, 2022 at 9:16 AM Guo Zhi <qtxuning1999@sjtu.edu.cn> wrote:
>
>
>
> ----- Original Message -----
> > From: "eperezma" <eperezma@redhat.com>
> > To: "Guo Zhi" <qtxuning1999@sjtu.edu.cn>
> > Cc: "jasowang" <jasowang@redhat.com>, "sgarzare" <sgarzare@redhat.com>, "Michael Tsirkin" <mst@redhat.com>,
> > "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
> > Sent: Monday, August 22, 2022 10:08:32 PM
> > Subject: Re: [RFC 1/2] virtio: expose used buffers
>
> > On Thu, Aug 18, 2022 at 5:13 PM Guo Zhi <qtxuning1999@sjtu.edu.cn> wrote:
> >>
> >> Follow VIRTIO 1.1 spec, we can only writing out a single used ring for a
> >> batch of descriptors, and only notify guest when the batch of
> >> descriptors have all been used.
> >>
> >> We do that batch for tx, because the driver doesn't need to know the
> >> length of tx buffer, while for rx, we don't apply the batch strategy.
> >>
> >> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> >> ---
> >>  hw/net/virtio-net.c | 29 ++++++++++++++++++++++++++---
> >>  1 file changed, 26 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >> index dd0d056f..c8e83921 100644
> >> --- a/hw/net/virtio-net.c
> >> +++ b/hw/net/virtio-net.c
> >> @@ -2542,8 +2542,10 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
> >>      VirtIONet *n = q->n;
> >>      VirtIODevice *vdev = VIRTIO_DEVICE(n);
> >>      VirtQueueElement *elem;
> >> +    VirtQueueElement *elems[VIRTQUEUE_MAX_SIZE];
> >>      int32_t num_packets = 0;
> >>      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> >> +    size_t j;
> >>      if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> >>          return num_packets;
> >>      }
> >> @@ -2621,14 +2623,35 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
> >>          }
> >>
> >>  drop:
> >> -        virtqueue_push(q->tx_vq, elem, 0);
> >> -        virtio_notify(vdev, q->tx_vq);
> >> -        g_free(elem);
> >> +        if (!virtio_vdev_has_feature(vdev, VIRTIO_F_IN_ORDER)) {
> >> +            virtqueue_push(q->tx_vq, elem, 0);
> >> +            virtio_notify(vdev, q->tx_vq);
> >> +            g_free(elem);
> >> +        } else {
> >> +            elems[num_packets] = elem;
> >> +        }
> >>
> >>          if (++num_packets >= n->tx_burst) {
> >>              break;
> >>          }
> >>      }
> >> +
> >> +    if (virtio_vdev_has_feature(vdev, VIRTIO_F_IN_ORDER) && num_packets) {
> >> +        /**
> >> +         * If in order feature negotiated, devices can notify the use of a
> >> batch
> >> +         * of buffers to the driver by only writing out a single used ring
> >> entry
> >> +         * with the id corresponding to the head entry of the descriptor chain
> >> +         * describing the last buffer in the batch.
> >> +         */
> >> +        virtqueue_fill(q->tx_vq, elems[num_packets - 1], 0, 0);
> >> +        for (j = 0; j < num_packets; j++) {
> >
> > There are a few calls on virtqueue_pop that we need to keep cleaning
> > here. For example, the increment on vq->inuse or dma_memory_map/unmap.
> > Maybe it is ok to call virtqueue_detach_element here for all skipped
> > buffers of the batch, but I haven't reviewed it in depth.
>
> Yeah, I think I should call virtqueue_detach_element for skipped buffers.
>
> >
> > Also, if we want to batch, we must increment used idx accordingly.
> > From the standard, "The device then skips forward in the [used] ring
> > according to the size of the batch. Accordingly, it increments the
> > used idx by the size of the batch."
> >
>
> used_idx has been added by the size of the batch, because of this:
>
> virtqueue_flush(q->tx_vq, num_packets);
>

Oh, right, good point!

Thanks!


