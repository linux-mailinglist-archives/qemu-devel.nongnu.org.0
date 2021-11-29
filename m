Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A95460CD1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 03:51:17 +0100 (CET)
Received: from localhost ([::1]:38286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrWl9-0003VK-PT
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 21:51:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mrWj3-0002Kc-Uf
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 21:49:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mrWih-0005Qg-Ng
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 21:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638154122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wempz6DRlw0cpoIyu7qQuKWIPg1EIiV75aywNzB5YGg=;
 b=ImoDJYHy5ca80zigcvYfW3kRfseR43Aa93Wr5XSRdVfeC3RfNEcSrPoeoBQdHBFfeZPb2+
 8RXAfxBf0Vgih4dCoBUf/w4TFSojjt2DAY0NQ5GDv3bv9KvIGVN43j4gq+P1lXZQS1u2s6
 RdG0yKUZoQXHozsj22X+7Dr6+eTCbqo=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-otnBmC4JMW2prCCLFvX8Xw-1; Sun, 28 Nov 2021 21:48:38 -0500
X-MC-Unique: otnBmC4JMW2prCCLFvX8Xw-1
Received: by mail-lf1-f70.google.com with SMTP id
 24-20020ac25f58000000b0041799ebf529so5035754lfz.1
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 18:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wempz6DRlw0cpoIyu7qQuKWIPg1EIiV75aywNzB5YGg=;
 b=iTSd3chG7+Susp8jsKNfjmeB+mA86zJhLFs5gsNqi5YvRZYhuxT3dyOeScLw9x4H86
 5VfnZEnXncaBNDg0mNzwSQb6JgqR+oeXu5CNu3sWqvYOoPNGOxfSzZ70lDHsVgdr3Z3r
 i5Q4s4qFLteqNAGL/ubKJBSJB7A+7BK+l3mnKItqLOYiEgfWxLBRBKjNaOTschpp4p+/
 B/hGA5i/F3yCmUQzV99+Sxtp73w1eMMEQ2KLGE3xY/asu3njRvSF+j8jNMgjHpb0y4Db
 9td8nDcAcFmD8rJrDeZkxybSoCodGS27NQXS+O5pTSGBRtGTHpUPNecnVMPsYkrnCPpM
 Qhng==
X-Gm-Message-State: AOAM5303Lv6VvR7l0l9EoQFaikDLaskpJY5vd3w1zcry1oAE4A9+8C5O
 8aePt7y2UFYgYKfetWfbSN0Ss0ksJr800RGaaWFxuhoUFqr2zd1Xc3uZN1Qk7Xnub8JOA80jKNd
 LS/DYck7W4b9MmmqgiWU3m9qho/K+dXc=
X-Received: by 2002:a05:6512:685:: with SMTP id
 t5mr45139859lfe.84.1638154116489; 
 Sun, 28 Nov 2021 18:48:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnFw4mXt6T1o5q2qt7k8fINeTf/++OwbZgtsqAhy5pnJlZmyT1dBl0KL0vVxDTAlx1XwJaNi05O8aXvqPnbHo=
X-Received: by 2002:a05:6512:685:: with SMTP id
 t5mr45139833lfe.84.1638154116234; 
 Sun, 28 Nov 2021 18:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20211125022046.10433-1-jasowang@redhat.com>
 <20211125022046.10433-2-jasowang@redhat.com>
 <20211125111055-mutt-send-email-mst@kernel.org>
 <CACGkMEsXRQm-vssQD0Cp1R-00B1G-XvdMFv1PX07qZqYPxH71A@mail.gmail.com>
 <20211126023424-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211126023424-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 29 Nov 2021 10:48:25 +0800
Message-ID: <CACGkMEuPtm5DTUQGHUf6RN2g88vmNEU63eWf7YnShU+s1QcsQg@mail.gmail.com>
Subject: Re: [PATCH 2/2] virtio-balloon: correct used length
To: "Michael S. Tsirkin" <mst@redhat.com>
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
Cc: Michael Ellerman <mpe@ellerman.id.au>, qemu-devel <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 26, 2021 at 3:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Nov 26, 2021 at 10:45:43AM +0800, Jason Wang wrote:
> > On Fri, Nov 26, 2021 at 12:14 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Thu, Nov 25, 2021 at 10:20:46AM +0800, Jason Wang wrote:
> > > > Spec said:
> > > >
> > > > "and len the total of bytes written into the buffer."
> > > >
> > > > For inflateq, deflateq and statsq, we don't process in_sg so the used
> > > > length should be zero. For free_page_vq, since the pages could be
> > > > changed in the destination, we should make all pages used for safety.
> > >
> > > Yea, about that, I know I said it, but I was wrong, sorry.
> > >
> > > Spec says this:
> > >
> > >         \field{len} is particularly useful
> > >         for drivers using untrusted buffers: if a driver does not know exactly
> > >         how much has been written by the device, the driver would have to zero
> > >         the buffer in advance to ensure no data leakage occurs.
> > >
> > >         For example, a network driver may hand a received buffer directly to
> > >         an unprivileged userspace application.  If the network device has not
> > >         overwritten the bytes which were in that buffer, this could leak the
> > >         contents of freed memory from other processes to the application.
> > >
> > >
> > > In other words, device must guarantee that used length was
> > > written into. Since we don't know that, we really should
> > > write 0 there, and the fact we don't is a spec violation.
> >
> > The problem is, if we write 0, the driver may assume there's no change
> > on those pages?
> >
> > Thanks
>
> No:
>
>
> The driver MUST NOT make assumptions about data in device-writable buffers
> beyond the first \field{len} bytes, and SHOULD ignore this data.

Good to know this. Will fix it in V2.

Thanks

>
>
>
> > >
> > >
> > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > ---
> > > >  hw/virtio/virtio-balloon.c | 8 +++++---
> > > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > > > index 17de2558cb..fb4426ac0c 100644
> > > > --- a/hw/virtio/virtio-balloon.c
> > > > +++ b/hw/virtio/virtio-balloon.c
> > > > @@ -231,7 +231,7 @@ static void balloon_stats_poll_cb(void *opaque)
> > > >          return;
> > > >      }
> > > >
> > > > -    virtqueue_push(s->svq, s->stats_vq_elem, s->stats_vq_offset);
> > > > +    virtqueue_push(s->svq, s->stats_vq_elem, 0);
> > > >      virtio_notify(vdev, s->svq);
> > > >      g_free(s->stats_vq_elem);
> > > >      s->stats_vq_elem = NULL;
> > > > @@ -438,7 +438,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> > > >              memory_region_unref(section.mr);
> > > >          }
> > > >
> > > > -        virtqueue_push(vq, elem, offset);
> > > > +        virtqueue_push(vq, elem, 0);
> > > >          virtio_notify(vdev, vq);
> > > >          g_free(elem);
> > > >          virtio_balloon_pbp_free(&pbp);
> > > > @@ -510,6 +510,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> > > >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > > >      VirtQueue *vq = dev->free_page_vq;
> > > >      bool ret = true;
> > > > +    size_t used = 0;
> > > >      int i;
> > > >
> > > >      while (dev->block_iothread) {
> > > > @@ -548,11 +549,12 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> > > >          for (i = 0; i < elem->in_num; i++) {
> > > >              qemu_guest_free_page_hint(elem->in_sg[i].iov_base,
> > > >                                        elem->in_sg[i].iov_len);
> > > > +            used += elem->in_sg[i].iov_len;
> > > >          }
> > > >      }
> > > >
> > > >  out:
> > > > -    virtqueue_push(vq, elem, 1);
> > > > +    virtqueue_push(vq, elem, used);
> > > >      g_free(elem);
> > > >      return ret;
> > > >  }
> > > > --
> > > > 2.25.1
> > >
>


