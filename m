Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4707E305
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 14:48:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57205 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL5i9-0007n4-VO
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 08:48:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hL5h0-0007Sn-Cd
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 08:47:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hL5gu-0001UV-Pg
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 08:47:34 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hL5gp-0001N6-Lh
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 08:47:26 -0400
Received: by mail-wr1-f65.google.com with SMTP id l2so178922wrb.9
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 05:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HoyUcymL/tT+m1uZIFf3h/Ds8eSMaraOUR51j00DwYE=;
	b=U26QrsfFz1VnS3Zd2CJ/gI+GY0ILdpXp70tYjMVvHfVebkKKoKdgHQrTCdVjjWIhvN
	h0IQBdMzGemNv9FI2Sysnrxw14RVdVJhdNJbZwPDSZ67nITG7y7DCtz8JQa17Gr3r4RX
	TIx/Z9UvsWt+f1S3GQ39vJNRbyZ0AlS5TP2eLGcWNNi7S1S52IeR5uQmgsVcm4LRCGyq
	rj7u4I8Tan/mP4OEQBtVtJE7Aa19FtrGTDCIa5ac6fq+jD0/mp8QQ8vCmHYID8uSORUD
	sR09jaYYW7Tq9wUJoib/SJ67NrLWNGhcV3+g6kN1U+9tESeTrUTK1yHUcAfpvsP2uXaL
	fpbg==
X-Gm-Message-State: APjAAAVSlYjHzu0vcFo0X/v+3+KkV1PdVtzV3KBkQ9HMpVpKGk1BxWXm
	PgfaxlWNelgdHNMD3FYuqkABQA==
X-Google-Smtp-Source: APXvYqz/SPIP3yswS4sJ8AlIwKERmWF16OishOxHnpSkO/YPlqdXEfd5VOGhFiEUUIhXfNeRrZbn0w==
X-Received: by 2002:adf:8b0b:: with SMTP id n11mr2526269wra.149.1556542040539; 
	Mon, 29 Apr 2019 05:47:20 -0700 (PDT)
Received: from steredhat (host35-203-static.12-87-b.business.telecomitalia.it.
	[87.12.203.35])
	by smtp.gmail.com with ESMTPSA id f1sm2405280wrc.93.2019.04.29.05.47.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Apr 2019 05:47:19 -0700 (PDT)
Date: Mon, 29 Apr 2019 14:47:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: dillaman@redhat.com
Message-ID: <20190429124712.mmxnpdkkbzhlbmxm@steredhat>
References: <20190427113625.46594-1-sgarzare@redhat.com>
	<CA+aFP1BtbjrzitLz7PW_b-kuYU7WSOiMs5jVfUBC=M3zEuBcew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+aFP1BtbjrzitLz7PW_b-kuYU7WSOiMs5jVfUBC=M3zEuBcew@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] block/rbd: add preallocation
 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 27, 2019 at 08:43:26AM -0400, Jason Dillaman wrote:
> On Sat, Apr 27, 2019 at 7:37 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > This patch adds the support of preallocation (off/full) for the RBD
> > block driver.
> > If available, we use rbd_writesame() to quickly fill the image when
> > full preallocation is required.
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  block/rbd.c          | 149 ++++++++++++++++++++++++++++++++++++++-----
> >  qapi/block-core.json |   4 +-
> >  2 files changed, 136 insertions(+), 17 deletions(-)
> >
> > diff --git a/block/rbd.c b/block/rbd.c
> > index 0c549c9935..29dd1bb040 100644
> > --- a/block/rbd.c
> > +++ b/block/rbd.c
> > @@ -13,6 +13,7 @@
> >
> >  #include "qemu/osdep.h"
> >
> > +#include "qemu/units.h"
> >  #include <rbd/librbd.h>
> >  #include "qapi/error.h"
> >  #include "qemu/error-report.h"
> > @@ -331,6 +332,110 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
> >      }
> >  }
> >
> > +static int qemu_rbd_do_truncate(rbd_image_t image, int64_t offset,
> > +                                PreallocMode prealloc, Error **errp)
> > +{
> > +    uint64_t current_length;
> > +    char *buf = NULL;
> > +    int ret;
> > +
> > +    ret = rbd_get_size(image, &current_length);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "Failed to get file length");
> > +        goto out;
> > +    }
> > +
> > +    if (current_length > offset && prealloc != PREALLOC_MODE_OFF) {
> > +        error_setg(errp, "Cannot use preallocation for shrinking files");
> > +        ret = -ENOTSUP;
> > +        goto out;
> > +    }
> > +
> > +    switch (prealloc) {
> > +    case PREALLOC_MODE_FULL: {
> > +        uint64_t current_offset = current_length;
> > +        int buf_size = 64 * KiB;
> 
> This should probably be 512B or 4KiB (which is the smallest striped
> unit size). Not only will this avoid sending unnecessary zeroes to the
> backing cluster, writesame silently turns into a standard write if
> your buffer isn't properly aligned with the min(object size, stripe
> unit size).
> 

Okay, I'll change it on v2.
Should we query about the "stripe_unit" size or we simply use the
smallest allowed?

> > +        ssize_t bytes;
> > +
> > +        buf = g_malloc(buf_size);
> > +        /*
> > +         * Some versions of rbd_writesame() discards writes of buffers with
> > +         * all zeroes. In order to avoid this behaviour, we set the first byte
> > +         * to one.
> > +         */
> > +        buf[0] = 1;
> 
> You could also use "rados_conf_set(cluster,
> "rbd_discard_on_zeroed_write_same", "false").
> 

I tried it, but it is not supported on all versions. (eg. I have Ceph
v12.2.11 on my Fedora 29 and it is not supported, but rbd_writesame() is
available)

Maybe we can use both: "rbd_discard_on_zeroed_write_same = false" and
"buf[0] = 1"

> > +        ret = rbd_resize(image, offset);
> > +        if (ret < 0) {
> > +            error_setg_errno(errp, -ret, "Failed to resize file");
> > +            goto out;
> > +        }
> > +
> > +#ifdef LIBRBD_SUPPORTS_WRITESAME
> > +        while (offset - current_offset > buf_size) {
> > +            /*
> > +             * rbd_writesame() supports only request where the size of the
> > +             * operation is multiple of buffer size and it must be less or
> > +             * equal to INT_MAX.
> > +             */
> > +            bytes = MIN(offset - current_offset, INT_MAX);
> > +            bytes -= bytes % buf_size;
> 
> Using the default object size of 4MiB, this write size would result in
> up to 512 concurrent ops to the backing cluster. Perhaps the size
> should be bounded such that only a dozen or so concurrent requests are
> issued per write, always rounded next largest object / stripe period
> size. librbd and the rbd CLI usually try to bound themselves to the
> value in the "rbd_concurrent_management_ops" configuration setting
> (currently defaults to 10).
> 

Do you suggest to use "rbd_concurrent_management_ops" to limit
concurrent requests or use a new QEMU parameters for the RBD driver?

Thanks for your comments,
Stefano

