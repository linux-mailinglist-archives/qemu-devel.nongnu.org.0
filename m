Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490E144FDE6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 05:22:48 +0100 (CET)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmTW2-0003Ga-Rd
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 23:22:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mmTUY-0002O3-UO
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 23:21:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mmTUW-0004IQ-28
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 23:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636950070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U6FfuNVeTH2gvoa5FPxf5T9VSle3YRZ981VB3GU0tao=;
 b=e/mb3xS6zJIpeZ8yRM8MW01q5KOdPtZFttEhLUUlE2uGpXTQalCJfk74nEKlnkZzghmm5A
 U9bXfvVcZKVEWx5/OfsYhrjRYXBfYDZrS3yqgbc9F8TeKG/UmTe4Z4nCFRed9xSoWuVMU+
 OCrSg8L1jY5YiGMeRZlEQsfRNSf/sfQ=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-ZqBhMDQ3OxuM07jKTcvRew-1; Sun, 14 Nov 2021 23:21:08 -0500
X-MC-Unique: ZqBhMDQ3OxuM07jKTcvRew-1
Received: by mail-lf1-f71.google.com with SMTP id
 x7-20020a056512130700b003fd1a7424a8so6166484lfu.5
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 20:21:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U6FfuNVeTH2gvoa5FPxf5T9VSle3YRZ981VB3GU0tao=;
 b=eE9uC4p7HFZcpNgwVsd537TA5Jj86ZS5rZBqGfERFlfHnXCDyiJ/DiLfrWl/KM+xn3
 qsEo0NUAkxkynjovwTesUPmL/Rz6+aBUN/cFTK1+yuT9AoNJ9ae+uG8a7wp9lT2kbgNw
 LCayG7mA93cbWjsAPjNsy1PoPRGZl/D7pmjOBf9qOdtUgiblKSYcBguagKISawE1u+Sl
 wfMl0ca0gbaa/4mF4+hyWs+kkWoPv1fzEjpc+JwHtdrb4zCvu66jjfbE7uAgDJow15H3
 yG2h+X6pBdFDbWmxpBOTDuDWYWGDWhZJYLB0DNRLADmrTpkCI3qI9WHxetPsZ/AcQd/8
 ObbQ==
X-Gm-Message-State: AOAM531MMbNDSUwbw9AloOjDRYtHlpcS+Wz4xsSj3srd3ZKHd+MM1kbG
 l3SaSJ7xPfl2o7uT8ZoibGxOBHTjOflDybCzw60P9gBPKePng7kVzoIPM0u9HjsgNEruJkpABDe
 UlX5dpyrKbQjH4PtQXFrZjPZIDzltYXE=
X-Received: by 2002:a2e:b742:: with SMTP id k2mr35962313ljo.107.1636950067282; 
 Sun, 14 Nov 2021 20:21:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh5JRaN8jFYQ+cSC208B/OqgUgDXfUuMCua6um2KQN9cm2fo5n4W2ePWTRn3B7z3NUaNUtBn6SRO0WZGKy++I=
X-Received: by 2002:a2e:b742:: with SMTP id k2mr35962293ljo.107.1636950067022; 
 Sun, 14 Nov 2021 20:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20211111063854.29060-1-jasowang@redhat.com>
 <20211111032649-mutt-send-email-mst@kernel.org>
 <CACGkMEv1LVXBV2Pq00jWCbxnr18Ar=df7Lirw2j973Q-hM2MRw@mail.gmail.com>
 <20211112045035-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211112045035-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 15 Nov 2021 12:20:55 +0800
Message-ID: <CACGkMEtSjErzVqa=MYN7MyTBae9H3xs4BbPsP3qU4kZpveg+7w@mail.gmail.com>
Subject: Re: [PATCH 1/2] virtio: use virtio accessor to access packed
 descriptor flags
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.695,
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
Cc: eperezma <eperezma@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 6:04 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Nov 12, 2021 at 10:23:12AM +0800, Jason Wang wrote:
> > On Thu, Nov 11, 2021 at 4:27 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Thu, Nov 11, 2021 at 02:38:53PM +0800, Jason Wang wrote:
> > > > We used to access packed descriptor flags via
> > > > address_space_{write|read}_cached(). When we hit the cache, memcpy()
> > > > is used which is not an atomic operation which may lead a wrong value
> > > > is read or wrote.
> > >
> > > Could you clarify where's the memcpy that you see?
> > > Thanks!
> >
> > In the address_space_{write|read}_cached it self:
> >
> > static inline MemTxResult
> > =>dress_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
> >                            const void *buf, hwaddr len)
> > {
> >     assert(addr < cache->len && len <= cache->len - addr);
> >     if (likely(cache->ptr)) {
> >         memcpy(cache->ptr + addr, buf, len);
> >         return MEMTX_OK;
> >     } else {
> >         return address_space_write_cached_slow(cache, addr, buf, len);
> >     }
> > }
> >
> > Thanks
>
> But that's a copy from the cache, not from guest memory.

I may miss something but it looks to me the cache is the cache of
address translation not the cache from guest memory:

See address_space_cache_init():

        cache->ptr = qemu_ram_ptr_length(mr->ram_block, cache->xlat, &l, true);

> I don't see how it can change so I don't see why it needs
> to be atomic. Was there an actual issue you observed or
> is this theoretical?

During code review.

Thanks

>
>
> > >
> > > > So this patch switches to use virito_{stw|lduw}_phys_cached() to make
> > > > sure the aceess is atomic.
> > > >
> > > > Fixes: 86044b24e865f ("virtio: basic packed virtqueue support")
> > > > Cc: qemu-stable@nongnu.org
> > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > ---
> > > >  hw/virtio/virtio.c | 11 ++++-------
> > > >  1 file changed, 4 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > > index cc69a9b881..939bcbfeb9 100644
> > > > --- a/hw/virtio/virtio.c
> > > > +++ b/hw/virtio/virtio.c
> > > > @@ -507,11 +507,9 @@ static void vring_packed_desc_read_flags(VirtIODevice *vdev,
> > > >                                           MemoryRegionCache *cache,
> > > >                                           int i)
> > > >  {
> > > > -    address_space_read_cached(cache,
> > > > -                              i * sizeof(VRingPackedDesc) +
> > > > -                              offsetof(VRingPackedDesc, flags),
> > > > -                              flags, sizeof(*flags));
> > > > -    virtio_tswap16s(vdev, flags);
> > > > +    hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
> > > > +
> > > > +    *flags = virtio_lduw_phys_cached(vdev, cache, off);
> > > >  }
> > > >
> > > >  static void vring_packed_desc_read(VirtIODevice *vdev,
> > > > @@ -564,8 +562,7 @@ static void vring_packed_desc_write_flags(VirtIODevice *vdev,
> > > >  {
> > > >      hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
> > > >
> > > > -    virtio_tswap16s(vdev, &desc->flags);
> > > > -    address_space_write_cached(cache, off, &desc->flags, sizeof(desc->flags));
> > > > +    virtio_stw_phys_cached(vdev, cache, off, desc->flags);
> > > >      address_space_cache_invalidate(cache, off, sizeof(desc->flags));
> > > >  }
> > > >
> > > > --
> > > > 2.25.1
> > >
>


