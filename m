Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F407596B3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 11:03:02 +0200 (CEST)
Received: from localhost ([::1]:57822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgmmb-0006tm-54
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 05:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39436)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sgarzare@redhat.com>) id 1hgmj4-00061C-90
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 04:59:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1hgmj2-0004Wa-Dg
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 04:59:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34683)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hgmj2-0004Ki-4Q
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 04:59:20 -0400
Received: by mail-wr1-f65.google.com with SMTP id k11so5435231wrl.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jun 2019 01:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gDjQk5005woeiKOFM14oln8NMwGtBGoa08lr17p53MI=;
 b=HqGfJY7BLRjRI2JwXv/gRjxIbyo+9Q7dtMfr1iuvXy9LUzi9NdhP9F7houLoeTFbUV
 5QTOuyWtCf7Kt/KO9ZXJ+t4GS2+6yiATDR4H4pmM/4La1gHpnZDbYe54OrJXeIn0xAPR
 vpSSaha/j9u2mqUYsNLGQ+IcC8S97fanwjVqtq7NgW6nVc1PQ2s9o7F9Pzr8/T/6Zxs+
 iH6R/+G4Gcs9P9y2DC89qzfy0NjDve16G7Ag8QmCv8sE5Ts/BtADfrWF0cCZlmv7y5Md
 ltXpwMJLvpcvMypMOG5oVGsvBJWUowyXVikB7JsTZcnxNQPUcP5TCi5IHmuZIW8ZOMx1
 7fDw==
X-Gm-Message-State: APjAAAUCIt9cjnlHwyuHkfl6Qn5Kex+pHY+zJet7D/errnggqNKcaqav
 RfTtDHh7LhXOVkP2Qz4HXZtk/w==
X-Google-Smtp-Source: APXvYqzMu+8xpAmwqBSek4TWHpUEAGumy/cwKLhNIeUrDoL2pQk0tGPpv+sR3UpY560UNYWnbd7Cag==
X-Received: by 2002:adf:dc81:: with SMTP id r1mr6924154wrj.298.1561712344732; 
 Fri, 28 Jun 2019 01:59:04 -0700 (PDT)
Received: from steredhat (host21-207-dynamic.52-79-r.retail.telecomitalia.it.
 [79.52.207.21])
 by smtp.gmail.com with ESMTPSA id f204sm2009632wme.18.2019.06.28.01.59.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 01:59:04 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:59:01 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: dillaman@redhat.com
Message-ID: <20190628085901.rnzcfu6rgkvrg46n@steredhat>
References: <20190510153346.238366-1-sgarzare@redhat.com>
 <96429d33-6514-33b5-3fe8-7bdf2eccc8d9@redhat.com>
 <20190627084816.u6fj556uen3iqa3r@steredhat.homenet.telecomitalia.it>
 <b7aaa681-12ae-e256-e295-06e953dc51ff@redhat.com>
 <CA+aFP1Btm6O5R0fiNZmBjHOO8t9ZDvvVgH0i1vFHsrQq85d+bA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+aFP1Btm6O5R0fiNZmBjHOO8t9ZDvvVgH0i1vFHsrQq85d+bA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH v2] block/rbd: implement
 .bdrv_get_allocated_file_size callback
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
Cc: Kevin Wolf <kwolf@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 27, 2019 at 03:43:04PM -0400, Jason Dillaman wrote:
> On Thu, Jun 27, 2019 at 1:24 PM John Snow <jsnow@redhat.com> wrote:
> > On 6/27/19 4:48 AM, Stefano Garzarella wrote:
> > > On Wed, Jun 26, 2019 at 05:04:25PM -0400, John Snow wrote:
> > >> It looks like this has hit a 30 day expiration without any reviews or
> > >> being merged; do we still want this? If so, can you please resend?
> > >
> > > Yes, I think we still want :)
> > >
> > > Is it okay if I send a v3 following your comments?
> > >
> >
> > Yes, but I don't know who is responsible for final approval; I guess
> > that's Josh Durgin?
> 
> I'm the new (for the past several years) upstream PTL for RBD, so feel
> free to tag me.
> 
> > >>
> > >> On 5/10/19 11:33 AM, Stefano Garzarella wrote:
> > >>> This patch allows 'qemu-img info' to show the 'disk size' for
> > >>> the RBD images that have the fast-diff feature enabled.
> > >>>
> > >>> If this feature is enabled, we use the rbd_diff_iterate2() API
> > >>> to calculate the allocated size for the image.
> > >>>
> > >>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > >>> ---
> > >>> v2:
> > >>>   - calculate the actual usage only if the fast-diff feature is
> > >>>     enabled [Jason]
> > >>> ---
> > >>>  block/rbd.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >>>  1 file changed, 54 insertions(+)
> > >>>
> > >>> diff --git a/block/rbd.c b/block/rbd.c
> > >>> index 0c549c9935..f1bc76ab80 100644
> > >>> --- a/block/rbd.c
> > >>> +++ b/block/rbd.c
> > >>> @@ -1046,6 +1046,59 @@ static int64_t qemu_rbd_getlength(BlockDriverState *bs)
> > >>>      return info.size;
> > >>>  }
> > >>>
> > >>> +static int rbd_allocated_size_cb(uint64_t offset, size_t len, int exists,
> > >>> +                                 void *arg)
> > >>> +{
> > >>> +    int64_t *alloc_size = (int64_t *) arg;
> > >>> +
> > >>> +    if (exists) {
> > >>> +        (*alloc_size) += len;
> > >>> +    }
> > >>> +
> > >>> +    return 0;
> > >>> +}
> > >>> +
> > >>> +static int64_t qemu_rbd_get_allocated_file_size(BlockDriverState *bs)
> > >>> +{
> > >>> +    BDRVRBDState *s = bs->opaque;
> > >>> +    uint64_t flags, features;
> > >>> +    int64_t alloc_size = 0;
> > >>> +    int r;
> > >>> +
> > >>> +    r = rbd_get_flags(s->image, &flags);
> > >>> +    if (r < 0) {
> > >>> +        return r;
> > >>> +    }
> > >>> +
> > >>
> > >> Do you know where rbd_get_flags is documented? I can't seem to quickly
> > >> find a reference that tells me what to expect from calling it. It
> > >> returns an int, I guess an error code, but how can I confirm this?
> > >>
> > >> *clones the ceph repository*
> > >>
> > >> src/librbd/internal.cc get_flags convinces me it probably works like I
> > >> think, but is there not a reference here?
> > >>
> > >
> > > Good question!
> > > I didn't find any docs, but looking in the ceph tests test/librbd/fsx.cc,
> > > they print an error message if the return value is less than 0.
> > >
> > > A 'get_flags' implemented in cls/rbd/cls_rbd.cc for example returns 0 at the
> > > end and -EINVAL in a try/catch. It also uses 'read_key()' that in some cases
> > > returns -EIO, so I hope that the error returned by rbd_get_flags() is one of
> > > the errors defined in errno.h
> > >
> > >>> +    r = rbd_get_features(s->image, &features);
> > >>> +    if (r < 0) {
> > >>> +        return r;
> > >>> +    }
> > >>> +
> > >>> +    /*
> > >>> +     * We use rbd_diff_iterate2() only if the RBD image have fast-diff
> > >>> +     * feature enabled. If it is disabled, rbd_diff_iterate2() could be
> > >>> +     * very slow on a big image.
> > >>> +     */
> > >>> +    if (!(features & RBD_FEATURE_FAST_DIFF) ||
> > >>> +        (flags & RBD_FLAG_FAST_DIFF_INVALID)) {
> > >>> +        return -1;
> > >>> +    }
> > >>> +
> > >>
> > >> (Is there a reference for the list of flags to make sure there aren't
> > >> other cases we might want to skip this?)
> > >
> > > Unfortunately no :(
> > > As Jason suggested, I followed what libvirt did in the
> > > volStorageBackendRBDUseFastDiff() [src/storage/storage_backend_rbd.c]
> 
> These are the only ones.

Thanks for the clarification!

> 
> > >>
> > >> It looks reasonable at a glance, but maybe let's return -ENOTSUP instead
> > >> of -1, based on the idea that bdrv_get_allocated_file_size returns
> > >> -ENOMEDIUM in a prominent error case -- let's match that error convention.
> > >
> > > Sure, -ENOTSUP is absolutely better!
> > >
> > >>
> > >> (Well, I wonder what the librbd calls are returning and if THOSE mean
> > >> anything.)
> > >
> > > I hope they return an errno.h errors, but I'm not sure if the meaning
> > > make sense for us.
> > >
> > > Do you think is better to return -ENOTSUP or -EIO when librbd calls
> > > fail?
> > >
> >
> > I'll be honest, I have no idea because I don't know what failure of
> > these calls means _at all_, so I don't know if it should be something
> > severe like EIO or something more mundane.
> >
> > I guess just leave them alone in absence of better information, honestly.
> 
> It looks like QEMU treats any negative error code like the actual size
> isn't available. However, for clarity I would vote for -ENOTSUPP since
> that's what would be returned if the driver doesn't support it.
> 

Do you mean to return -ENOTSUP even when there's a runtime error in
rbd_get_features() or rbd_get_flags() or rbd_diff_iterate2?

Thanks,
Stefano

