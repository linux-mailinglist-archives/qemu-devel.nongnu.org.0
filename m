Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F48C1A3ECF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Apr 2020 05:37:35 +0200 (CEST)
Received: from localhost ([::1]:58140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMkU2-0007Pt-5y
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 23:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47135)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jMkT0-0006rd-EY
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 23:36:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alexander.duyck@gmail.com>) id 1jMkSz-0005kf-9i
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 23:36:30 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:32980)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alexander.duyck@gmail.com>)
 id 1jMkSz-0005jc-5N
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 23:36:29 -0400
Received: by mail-il1-x142.google.com with SMTP id d2so386074ilc.0
 for <qemu-devel@nongnu.org>; Thu, 09 Apr 2020 20:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQGSaCPV1MJx4rHiNBOcFSi2O6UncMlYlTrIxHdoGM4=;
 b=j6bZiKkdTSgcmVFaOPZ8gV0wk5ddyDoIlWAeVvE93652Qszuu0SQ+kyDhq7PgGGa+S
 pFIlZTRavYeLPcm7lYDR2P3Y9zBPA6H69wevgjh/ntH65nzRc3U2WCprMlhGS+FYhwmx
 ktvAnU5cwfLQX/FUlCFn2M8PkfY95MDwRl5NDMiQy62HRln+FDud0cn6b0s4uqfk8AGS
 QtmGgzleB93YgTK9YSWf0gjPFtGB6mLa9iiuRhiiI1GY60GJNdgp+tvzGcEypfcuSAmr
 Si6fJwX38mRTHk99a8KRoe1jbAcOPZQPnsyzqsh3eFmSCn9EhYIF2kZgtKJSrqBf1YEz
 tA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQGSaCPV1MJx4rHiNBOcFSi2O6UncMlYlTrIxHdoGM4=;
 b=VgpPCG9vEuYTfNILuIejjwoxmNAtQPC84/a957Ht7fFjrt0TX5i6DKbdnOQyCBQgiD
 QNtauw2vTeskSFuK7kuesEX0n92yQLVIRqzy6Zd3dk5YSdluP7a/uknFX2WlKoF79EEy
 RHukS7cFf04D0eUOtJ89SLdvHcrnXM3WBOYacYmAbN7F96dvlttRtbUhMGNTHIDf5lW2
 +iuBPq/sA9vSFQEQ/ImQSKVGG5x9lplon6tRO8XPNIVkK6jBp9uo27VIIJxamvxg8TjO
 P8qu2dTRaR99ZzHVXRJhaMUA8k+Ha/ulaiq0Lr/DPTViC6NLj+BiD6/FL6vLT/u+UzQg
 svCg==
X-Gm-Message-State: AGi0PuajZBN3XxCQnCUeN/rKTc+/cpFHMjVjYuntP41Go02cNnT9W+rV
 7v+7zQHJzHUmis2QDla5V8eHWjVMs7Wl6nCY3II=
X-Google-Smtp-Source: APiQypIZCxKHCBpn5920BT2msQ4iSjKDw/Np/ZiApvcfGAhu7IHsW+y1ImtwpPrwPPUErXMBl3mqwNYFZWfYcnKSj7Q=
X-Received: by 2002:a92:af53:: with SMTP id n80mr3318683ili.42.1586489785671; 
 Thu, 09 Apr 2020 20:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200408225302.18764.209.stgit@localhost.localdomain>
 <20200408225529.18764.44086.stgit@localhost.localdomain>
 <06ac44b9-77ae-7686-8a65-7edff2cbf1b7@redhat.com>
 <CAKgT0UdLRKyc47izJO-rukHmj4cWP1xOzrxBv1ZX4yF92nH8Kg@mail.gmail.com>
 <987022c8-3aed-dccb-df02-d834500c04d3@redhat.com>
In-Reply-To: <987022c8-3aed-dccb-df02-d834500c04d3@redhat.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Thu, 9 Apr 2020 20:36:14 -0700
Message-ID: <CAKgT0UdYu7GnY_w_50p_7RZ+gSSP5hMUgNqsscqU8fdvFc1yQA@mail.gmail.com>
Subject: Re: [PATCH v18 QEMU 3/3] virtio-balloon: Provide a interface for free
 page reporting
To: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::142
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
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 9, 2020 at 10:35 AM David Hildenbrand <david@redhat.com> wrote:
> On 09.04.20 19:34, Alexander Duyck wrote:
> >>>  hw/virtio/virtio-balloon.c         |   48 +++++++++++++++++++++++++++++++++++-
> >>>  include/hw/virtio/virtio-balloon.h |    2 +-
> >>>  2 files changed, 47 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> >>> index 1c6d36a29a04..297b267198ac 100644
> >>> --- a/hw/virtio/virtio-balloon.c
> >>> +++ b/hw/virtio/virtio-balloon.c
> >>> @@ -321,6 +321,42 @@ static void balloon_stats_set_poll_interval(Object *obj, Visitor *v,
> >>>      balloon_stats_change_timer(s, 0);
> >>>  }
> >>>
> >>> +static void virtio_balloon_handle_report(VirtIODevice *vdev, VirtQueue *vq)
> >>> +{
> >>> +    VirtIOBalloon *dev = VIRTIO_BALLOON(vdev);
> >>> +    VirtQueueElement *elem;
> >>> +
> >>> +    while ((elem = virtqueue_pop(vq, sizeof(VirtQueueElement)))) {
> >>> +        unsigned int i;
> >>> +
> >>> +        for (i = 0; i < elem->in_num; i++) {
> >>> +            void *addr = elem->in_sg[i].iov_base;
> >>> +            size_t size = elem->in_sg[i].iov_len;
> >>> +            ram_addr_t ram_offset;
> >>> +            size_t rb_page_size;
> >>> +            RAMBlock *rb;
> >>> +
> >>> +            if (qemu_balloon_is_inhibited() || dev->poison_val) {
> >>> +                continue;
> >>> +            }
> >>
> >> These checks are not sufficient. See virtio_balloon_handle_output(),
> >> where we e.g., check that somebody doesn't try to discard the bios.
> >>
> >> Maybe we can factor our/unify the handling in both code paths.
> >
> > I am going to have to look at this further. If I understand correctly
> > you are asking me to add all of the memory section checks that are in
> > virtio_balloon_handle_output correct?
> >
> > I'm not sure it makes sense with the scatterlist approach I have taken
> > here. All of the mappings were created as a scatterlist of writable
> > DMA mappings unlike the regular balloon which is just stuffing PFN
> > numbers into an array and then sending the array across. As such I
> > would think there are already such protections in place. For instance,
> > you wouldn't want to let virtio-net map the BIOS and request data be
> > written into that either, correct? So I am assuming there is something
> > there to prevent that already isn't there?
>
> Good point, let's find out :)

Okay, so I believe I figured it out. From what I can tell there is a
call in address_space_map that will determine if we can directly write
to the page or not. However it looks like there might be one minor
issue as it is assuming it can write directly to ROM devices and that
isn't correct. I will add a patch to my set to address that.

Other than that the behavior seems to be that a bounce buffer will be
allocated on the first instance of a page backed by ROM or anything
other than RAM, and after that it will return NULL until the bounce
buffer is freed. If we start getting NULLs the mapping will be aborted
and we wouldn't even get into this code path. After we unmap the
region it will attempt to use address_space_write which should fail
for any region that isn't meant to be written to, or it will copy
zeros out of the bounce buffer into the region if it is writable via
address_space_write.

So the DMA mapping API in virtqueue_pop/virtqueue_push will take care
of doing the right stuff for the mappings in the case that the guest
is trying to do something really stupid, at least after I address the
direct write access to rom_device regions.

- Alex

