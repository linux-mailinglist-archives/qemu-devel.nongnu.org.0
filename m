Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98F244E041
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 03:24:40 +0100 (CET)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlMF5-0004Fq-Ln
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 21:24:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mlMDx-0003O9-5X
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:23:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mlMDu-0006rE-QI
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636683806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lPcdZgz3SPc7dJ8Igl7p6pgBz1q0pJtq+wP491SCe5o=;
 b=jPDosQ0L7BJ5VosscVhfcvehinQQlIzjntksUVhRhOc8H2aKdVQGpjNSPhtZxqk+R4fZYv
 KlLrzbOvOh2zzUX3n2lkvxCyMCTMhHdP917y4N0kwbM8ODs6LIktBuXXQSaH1W+8Wo6DUF
 RU3Kpj6/8mGqSeMdVbbbOIGEP5Sq6Xw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-2npQdaI0NV252KHwCLEKSQ-1; Thu, 11 Nov 2021 21:23:25 -0500
X-MC-Unique: 2npQdaI0NV252KHwCLEKSQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 u20-20020a056512129400b0040373ffc60bso3222041lfs.15
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 18:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lPcdZgz3SPc7dJ8Igl7p6pgBz1q0pJtq+wP491SCe5o=;
 b=5P1qT7F3EseGcRor3uXjeNN4Af0OR8kqhaIdCdRqkTh4p2HW2ckQJQrUOQCBwZ9MGU
 P9p0eAF1mdsV/Q0eusABFbFlCHREAkyftpuov6Cjd3/m9iXwHZD4KYSBqxUU3ZJkET1P
 YhuS2Z/FV2PnmnFuBVjZGeAmE4xJzpdD67CZ8gYZmkQh8gD5XQKWs4Q79eqJjrlsnKa8
 XgkgxMYtsWWypoQ1Wnbir10BuDAFy2UZtVfBvVDct+ij9jbV808hLnLvhE7k6PSEDcVS
 Asl/2jH1LeOHVPSPvgY9N5SGNPii4npgzbwuYoGM9inrFCNq45vOtbK7Dqo8IP2Qju1b
 U4sA==
X-Gm-Message-State: AOAM530+ry5+zAJAUJaz0MROyKo1nQQIbr8L3EgXv5wUr5I1lJYCJuxi
 gehcaQ92gK1XsPya8c9I5KFfMf+yiSu6CMz7iyXxEF+tu7CkpNrxArj6oGa9/L8PtShSpJM270j
 FeYS2vgwDz/zSAPHWskfLQdPg7Lp4AfM=
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr11017312lfv.481.1636683803613; 
 Thu, 11 Nov 2021 18:23:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIDP2pVS6dnayKG4E4dV8V+7VXG1V7/YELwxv2Oepfvzkx9G4nIk9TTsksQE9yIU+9QpzeIDz4y3uHlrPgIFA=
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr11017281lfv.481.1636683803265; 
 Thu, 11 Nov 2021 18:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20211111063854.29060-1-jasowang@redhat.com>
 <20211111032649-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211111032649-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 12 Nov 2021 10:23:12 +0800
Message-ID: <CACGkMEv1LVXBV2Pq00jWCbxnr18Ar=df7Lirw2j973Q-hM2MRw@mail.gmail.com>
Subject: Re: [PATCH 1/2] virtio: use virtio accessor to access packed
 descriptor flags
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
Cc: eperezma <eperezma@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 4:27 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Nov 11, 2021 at 02:38:53PM +0800, Jason Wang wrote:
> > We used to access packed descriptor flags via
> > address_space_{write|read}_cached(). When we hit the cache, memcpy()
> > is used which is not an atomic operation which may lead a wrong value
> > is read or wrote.
>
> Could you clarify where's the memcpy that you see?
> Thanks!

In the address_space_{write|read}_cached it self:

static inline MemTxResult
=>dress_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
                           const void *buf, hwaddr len)
{
    assert(addr < cache->len && len <= cache->len - addr);
    if (likely(cache->ptr)) {
        memcpy(cache->ptr + addr, buf, len);
        return MEMTX_OK;
    } else {
        return address_space_write_cached_slow(cache, addr, buf, len);
    }
}

Thanks

>
> > So this patch switches to use virito_{stw|lduw}_phys_cached() to make
> > sure the aceess is atomic.
> >
> > Fixes: 86044b24e865f ("virtio: basic packed virtqueue support")
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  hw/virtio/virtio.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index cc69a9b881..939bcbfeb9 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -507,11 +507,9 @@ static void vring_packed_desc_read_flags(VirtIODevice *vdev,
> >                                           MemoryRegionCache *cache,
> >                                           int i)
> >  {
> > -    address_space_read_cached(cache,
> > -                              i * sizeof(VRingPackedDesc) +
> > -                              offsetof(VRingPackedDesc, flags),
> > -                              flags, sizeof(*flags));
> > -    virtio_tswap16s(vdev, flags);
> > +    hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
> > +
> > +    *flags = virtio_lduw_phys_cached(vdev, cache, off);
> >  }
> >
> >  static void vring_packed_desc_read(VirtIODevice *vdev,
> > @@ -564,8 +562,7 @@ static void vring_packed_desc_write_flags(VirtIODevice *vdev,
> >  {
> >      hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
> >
> > -    virtio_tswap16s(vdev, &desc->flags);
> > -    address_space_write_cached(cache, off, &desc->flags, sizeof(desc->flags));
> > +    virtio_stw_phys_cached(vdev, cache, off, desc->flags);
> >      address_space_cache_invalidate(cache, off, sizeof(desc->flags));
> >  }
> >
> > --
> > 2.25.1
>


