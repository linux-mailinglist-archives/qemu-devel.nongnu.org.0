Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABE345E583
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 03:49:03 +0100 (CET)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqRIM-0001d0-Qp
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 21:49:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mqRFZ-0000vk-8F
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:46:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mqRFS-0003OH-RA
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637894762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=goxurZIqEIctfhiKDkSR5OnfXztqB/kR5cnvFdGpMjA=;
 b=ENDDMWB+/HPgq5Zqgn45vhul11IMY/fhrkI79r5ICpSNJVpnwHjxv/kmbZhQsJFBSPQtjo
 RwCXebolu0ssMFNDQwIXOZo/5EEGqoT0NFo984Ac1w8qld5Po7FPq3U5DOT4aOCH/WXE1w
 XGxLr4pyb3HppS1SNf5eS2oh0AGQsBQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-w-z-S9IRPOO0LMbsOa-Dow-1; Thu, 25 Nov 2021 21:45:56 -0500
X-MC-Unique: w-z-S9IRPOO0LMbsOa-Dow-1
Received: by mail-lj1-f199.google.com with SMTP id
 t25-20020a2e8e79000000b0021b5c659213so2584535ljk.10
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 18:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=goxurZIqEIctfhiKDkSR5OnfXztqB/kR5cnvFdGpMjA=;
 b=v/IRoB8jVuhW1wqwVP/GMAY1TJqxeCAzB1iJAkMC1La321F+gVcEmeIyeYPL+azToc
 w3ld98m3oyJtMev9KtDUcrUqYhPySbdGvTQnF1iaQIMfzGxKfkHm0Jw3Ju38iJcSNxe5
 IFRWGnSXNBkoRezgMdR+Rn0ycVQ/ZjF/X+77kEB7mqpIGGjF+2rBNUKLdVSTQ1kFBeA0
 mtG/0qWcEEyScHfddEqZajLLC4vIFnmKhC6yy1tF51nd4t+nVICoAMzfdKcYC2Qts6NQ
 cMk6VuWF/K24VdDrtzcaUFnvkF2+1Tz9AtwCRveD0BxwsU26EQPG1xp1hnMslC7fkYCd
 +Pvw==
X-Gm-Message-State: AOAM531tFs1AfJO5QjDi/IqBnTFibO4VOvsf1h33DV8AAviOP5OQlajf
 a+QQokKKMdZ25kOthYlDMjtPFLNnGRSz698aEsFBab+H/aXW/zeLiqpWDXZTyRDJmNmQ2roQSbC
 qMhvHo2nc0JYhgjVWMqVauu7dhoiOKwU=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr28340068ljp.362.1637894754255; 
 Thu, 25 Nov 2021 18:45:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztooet0/O7UxW78zl83+aQffcsK9HeCU5drQS9nJGBen5a8tXdtJpRGcyBpEoxaHnGstsIrq/2ESNUToavpwE=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr28340060ljp.362.1637894754046; 
 Thu, 25 Nov 2021 18:45:54 -0800 (PST)
MIME-Version: 1.0
References: <20211125022046.10433-1-jasowang@redhat.com>
 <20211125022046.10433-2-jasowang@redhat.com>
 <20211125111055-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211125111055-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 26 Nov 2021 10:45:43 +0800
Message-ID: <CACGkMEsXRQm-vssQD0Cp1R-00B1G-XvdMFv1PX07qZqYPxH71A@mail.gmail.com>
Subject: Re: [PATCH 2/2] virtio-balloon: correct used length
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Ellerman <mpe@ellerman.id.au>, qemu-devel <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 26, 2021 at 12:14 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Nov 25, 2021 at 10:20:46AM +0800, Jason Wang wrote:
> > Spec said:
> >
> > "and len the total of bytes written into the buffer."
> >
> > For inflateq, deflateq and statsq, we don't process in_sg so the used
> > length should be zero. For free_page_vq, since the pages could be
> > changed in the destination, we should make all pages used for safety.
>
> Yea, about that, I know I said it, but I was wrong, sorry.
>
> Spec says this:
>
>         \field{len} is particularly useful
>         for drivers using untrusted buffers: if a driver does not know exactly
>         how much has been written by the device, the driver would have to zero
>         the buffer in advance to ensure no data leakage occurs.
>
>         For example, a network driver may hand a received buffer directly to
>         an unprivileged userspace application.  If the network device has not
>         overwritten the bytes which were in that buffer, this could leak the
>         contents of freed memory from other processes to the application.
>
>
> In other words, device must guarantee that used length was
> written into. Since we don't know that, we really should
> write 0 there, and the fact we don't is a spec violation.

The problem is, if we write 0, the driver may assume there's no change
on those pages?

Thanks

>
>
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  hw/virtio/virtio-balloon.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > index 17de2558cb..fb4426ac0c 100644
> > --- a/hw/virtio/virtio-balloon.c
> > +++ b/hw/virtio/virtio-balloon.c
> > @@ -231,7 +231,7 @@ static void balloon_stats_poll_cb(void *opaque)
> >          return;
> >      }
> >
> > -    virtqueue_push(s->svq, s->stats_vq_elem, s->stats_vq_offset);
> > +    virtqueue_push(s->svq, s->stats_vq_elem, 0);
> >      virtio_notify(vdev, s->svq);
> >      g_free(s->stats_vq_elem);
> >      s->stats_vq_elem = NULL;
> > @@ -438,7 +438,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> >              memory_region_unref(section.mr);
> >          }
> >
> > -        virtqueue_push(vq, elem, offset);
> > +        virtqueue_push(vq, elem, 0);
> >          virtio_notify(vdev, vq);
> >          g_free(elem);
> >          virtio_balloon_pbp_free(&pbp);
> > @@ -510,6 +510,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> >      VirtQueue *vq = dev->free_page_vq;
> >      bool ret = true;
> > +    size_t used = 0;
> >      int i;
> >
> >      while (dev->block_iothread) {
> > @@ -548,11 +549,12 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> >          for (i = 0; i < elem->in_num; i++) {
> >              qemu_guest_free_page_hint(elem->in_sg[i].iov_base,
> >                                        elem->in_sg[i].iov_len);
> > +            used += elem->in_sg[i].iov_len;
> >          }
> >      }
> >
> >  out:
> > -    virtqueue_push(vq, elem, 1);
> > +    virtqueue_push(vq, elem, used);
> >      g_free(elem);
> >      return ret;
> >  }
> > --
> > 2.25.1
>


