Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6DD788A3
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 11:40:45 +0200 (CEST)
Received: from localhost ([::1]:50778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs296-0003th-Du
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 05:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59439)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sgarzare@redhat.com>) id 1hs28O-0003En-Uo
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:40:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1hs28N-000429-EA
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:40:00 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50729)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hs28N-000418-6w
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:39:59 -0400
Received: by mail-wm1-f68.google.com with SMTP id v15so53211278wml.0
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 02:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=676sR5nu05TGZ8pV/P1BcvgvMyq9MWng/l2497TPzoA=;
 b=kyKMPX5kjD/KehNVYYAH5VX6UkW1xxfC3ijgmcf1jA/I/ZwfpREpPAAvOi41jzV4b0
 AWKEILtV+HjrziBRU1EewisjGOlZudcTKFyZSDXj+EWOs3MkegsXF0fzxb/eifUj5EYj
 ugod6EdvEjTe++ETC4qptLjDlXmxbjrtd/b1mE/P4p7KfIBEGgzaYTqyouH4UtiZipDD
 858NIwHDEhsHDDHrttp70Hv02zMlz7mqgXMiaksA3wJq0tPgX3AW5dQDwmkVjh8v2A9g
 scy4J0cyAVV4JKun2JPAC7j5fztkg2sX6crcRN8W4UOHGGGm5aw/mWatFEeYE9jF5xuk
 BoiQ==
X-Gm-Message-State: APjAAAXx4PGKwjmWHqnEEnd9LaQBDwvfD9ftOfu0L43tJHrK2O4dp7yx
 Dzc5lFjobrwmVJledNmhSR+qSQ==
X-Google-Smtp-Source: APXvYqxZPxmjKDrX6qaIAHUHw+C1N00YG7sQZ3LlJQI82pPSqSle/mwIkSWtTrw45chaqVN4gLgSdg==
X-Received: by 2002:a1c:7a02:: with SMTP id v2mr98355044wmc.159.1564393196581; 
 Mon, 29 Jul 2019 02:39:56 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
 [79.13.201.122])
 by smtp.gmail.com with ESMTPSA id h16sm64816360wrv.88.2019.07.29.02.39.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 02:39:56 -0700 (PDT)
Date: Mon, 29 Jul 2019 11:39:53 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: dillaman@redhat.com
Message-ID: <20190729093953.k5brrpievkmndfyc@steredhat>
References: <20190723071342.383909-1-sgarzare@redhat.com>
 <CA+aFP1BMUitx40WDT-fcWDjO62j3EsoSdg=3HF2b6c1EdwzUxg@mail.gmail.com>
 <20190725081334.s2btvq3zdorj7lb5@steredhat>
 <CA+aFP1CjAMdbFOTy125xWLVm6mE35MX+6pOQ-fRq8NYpPkdRjw@mail.gmail.com>
 <20190726084816.buweyjycku5qgl3o@steredhat>
 <CA+aFP1A5khhJj+7Yhwaghhsu7Y-pjiiAAHDN4cB-ZSc6jLtfig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+aFP1A5khhJj+7Yhwaghhsu7Y-pjiiAAHDN4cB-ZSc6jLtfig@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH v3] block/rbd: add preallocation support
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 26, 2019 at 08:46:56AM -0400, Jason Dillaman wrote:
> On Fri, Jul 26, 2019 at 4:48 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > On Thu, Jul 25, 2019 at 09:30:30AM -0400, Jason Dillaman wrote:
> > > On Thu, Jul 25, 2019 at 4:13 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> > > >
> > > > On Wed, Jul 24, 2019 at 01:48:42PM -0400, Jason Dillaman wrote:
> > > > > On Tue, Jul 23, 2019 at 3:13 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> > > > > >
> > > > > > This patch adds the support of preallocation (off/full) for the RBD
> > > > > > block driver.
> > > > > > If rbd_writesame() is available and supports zeroed buffers, we use
> > > > > > it to quickly fill the image when full preallocation is required.
> > > > > >
> > > > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > > > ---
> > > > > > v3:
> > > > > >  - rebased on master
> > > > > >  - filled with zeroed buffer [Max]
> > > > > >  - used rbd_writesame() only when we can disable the discard of zeroed
> > > > > >    buffers
> > > > > >  - added 'since: 4.2' in qapi/block-core.json [Max]
> > > > > >  - used buffer as large as the "stripe unit"
> > > > > > ---
> > > > > >  block/rbd.c          | 202 ++++++++++++++++++++++++++++++++++++++++---
> > > > > >  qapi/block-core.json |   5 +-
> > > > > >  2 files changed, 192 insertions(+), 15 deletions(-)
> > > > > >
> > > > > > diff --git a/block/rbd.c b/block/rbd.c
> > > > > > index 59757b3120..d923a5a26c 100644
> > > > > > --- a/block/rbd.c
> > > > > > +++ b/block/rbd.c
> > > > > > @@ -64,6 +64,7 @@
> > > > > >  #define OBJ_MAX_SIZE (1UL << OBJ_DEFAULT_OBJ_ORDER)
> > > > > >
> > > > > >  #define RBD_MAX_SNAPS 100
> > > > > > +#define RBD_DEFAULT_CONCURRENT_OPS 10
> > > > > >
> > > > > >  /* The LIBRBD_SUPPORTS_IOVEC is defined in librbd.h */
> > > > > >  #ifdef LIBRBD_SUPPORTS_IOVEC
> > > > > > @@ -104,6 +105,7 @@ typedef struct BDRVRBDState {
> > > > > >      char *image_name;
> > > > > >      char *snap;
> > > > > >      uint64_t image_size;
> > > > > > +    bool ws_zero_supported; /* rbd_writesame() supports zeroed buffers */
> > > > > >  } BDRVRBDState;
> > > > > >
> > > > > >  static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
> > > > > > @@ -333,6 +335,155 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
> > > > > >      }
> > > > > >  }
> > > > > >
> > > > > > +static int qemu_rbd_get_max_concurrent_ops(rados_t cluster)
> > > > > > +{
> > > > > > +    char buf[16];
> > > > > > +    int ret, max_concurrent_ops;
> > > > > > +
> > > > > > +    ret = rados_conf_get(cluster, "rbd_concurrent_management_ops", buf,
> > > > > > +                         sizeof(buf));
> > > > > > +    if (ret < 0) {
> > > > > > +        return RBD_DEFAULT_CONCURRENT_OPS;
> > > > > > +    }
> > > > > > +
> > > > > > +    ret = qemu_strtoi(buf, NULL, 10, &max_concurrent_ops);
> > > > > > +    if (ret < 0) {
> > > > > > +        return RBD_DEFAULT_CONCURRENT_OPS;
> > > > > > +    }
> > > > > > +
> > > > > > +    return max_concurrent_ops;
> > > > > > +}
> > > > > > +
> > > > > > +static int qemu_rbd_do_truncate(rados_t cluster, rbd_image_t image,
> > > > > > +                                int64_t offset, PreallocMode prealloc,
> > > > > > +                                bool ws_zero_supported, Error **errp)
> > > > > > +{
> > > > > > +    uint64_t current_length;
> > > > > > +    char *buf = NULL;
> > > > > > +    int ret;
> > > > > > +
> > > > > > +    ret = rbd_get_size(image, &current_length);
> > > > > > +    if (ret < 0) {
> > > > > > +        error_setg_errno(errp, -ret, "Failed to get file length");
> > > > > > +        goto out;
> > > > > > +    }
> > > > > > +
> > > > > > +    if (current_length > offset && prealloc != PREALLOC_MODE_OFF) {
> > > > > > +        error_setg(errp, "Cannot use preallocation for shrinking files");
> > > > > > +        ret = -ENOTSUP;
> > > > > > +        goto out;
> > > > > > +    }
> > > > > > +
> > > > > > +    switch (prealloc) {
> > > > > > +    case PREALLOC_MODE_FULL: {
> > > > > > +        uint64_t buf_size, current_offset = current_length;
> > > > > > +        ssize_t bytes;
> > > > > > +
> > > > > > +        ret = rbd_get_stripe_unit(image, &buf_size);
> > > > > > +        if (ret < 0) {
> > > > > > +            error_setg_errno(errp, -ret, "Failed to get stripe unit");
> > > > > > +            goto out;
> > > > > > +        }
> > > > > > +
> > > > > > +        ret = rbd_resize(image, offset);
> > > > > > +        if (ret < 0) {
> > > > > > +            error_setg_errno(errp, -ret, "Failed to resize file");
> > > > > > +            goto out;
> > > > > > +        }
> > > > > > +
> > > > > > +        buf = g_malloc0(buf_size);
> > > > > > +
> > > > > > +#ifdef LIBRBD_SUPPORTS_WRITESAME
> > > > > > +        if (ws_zero_supported) {
> > > > > > +            uint64_t writesame_max_size;
> > > > > > +            int max_concurrent_ops;
> > > > > > +
> > > > > > +            max_concurrent_ops = qemu_rbd_get_max_concurrent_ops(cluster);
> > > > > > +            /*
> > > > > > +             * We limit the rbd_writesame() size to avoid to spawn more then
> > > > > > +             * 'rbd_concurrent_management_ops' concurrent operations.
> > > > > > +             */
> > > > > > +            writesame_max_size = MIN(buf_size * max_concurrent_ops, INT_MAX);
> > > > >
> > > > > In the most efficient world, the 'buf_size' would be some small, fixed
> > > > > power of 2 value (like 512 bytes) since there isn't much need to send
> > > > > extra zeroes. You would then want to writesame the full stripe period
> > > > > (if possible), where a stripe period is the data block object size
> > > > > (defaults to 4MiB and is availble via 'rbd_stat') * the stripe count.
> > > > > In this case, the stripe count becomes the number of in-flight IOs.
> > > > > Therefore, you could substitute its value w/ the max_concurrent_ops to
> > > > > ensure you are issuing exactly max_concurrent_ops IOs per
> > > > > rbd_writesame call.
> > > > >
> > > >
> > > > Initially, I had a fixed buffer size to 4 KiB, but I noted that, when
> > > > we didn't use writesame, the rbd_write() was very slow, so I used the
> > > > stripe unit as a buffer size.
> > > >
> > > > Do you think is better to have a small buffer (512 byte) when we use
> > > > writesame or a 'stripe unit' buffer when we can't use it?
> > >
> > > I'd use a small buffer for rbd_writesame and then just reallocate the
> >
> > My idea was to allocate a small buffer for rbd_writesame and use the
> > same to write the remaining bytes that should be a few.
> > If the buffer was not allocated (so we didn't use the rbd_writesame),
> > I'll allocate the big one:
> >
> >         if (ws_zero_supported) {
> >             buf_size = 512;
> >             buf = g_malloc0(buf_size);
> >             ...
> >         }
> >
> >         if (!buf) {
> >             buf_size = object_size * max_concurrent_ops;
> >             buf = g_malloc0(buf_size);
> >         }
> >
> >         while (current_offset < offset) {
> >             bytes = rbd_write(...)
> >             ...
> >         }
> >
> > > buffer to a larger size for "rbd_write". It would be most efficient to
> > > allocate a "object size * max concurrent ops" -sized buffer (up to
> >
> > Why "object size * max concurrent ops" and not
> > "stripe_unit * max concurrent ops"?
> > IIUC stripe_unit can be smaller than object size.
> 
> Correct, stripe unit *must* be smaller than the object size (and both
> are powers of two). However, it's more efficient to send fewer larger
> writes to a backing object than sending more small writes --
> especially in the case of writesame where you don't have the network
> overhead of transferring a large zeroed buffer. Replacing the full
> backing object is even more efficient since it will just need to
> perform a single backing disk allocation that will be continuous
> instead of fragmented.
> 

Okay, so IIUC I should do the following:
- if we can use rbd_writesame
    ~ allocates a buffer of 512 bytes
    ~ writes "object size * max concurrent ops" bytes per call
- if we use rbd_write
    ~ allocates a buffer of "object size * max concurrent ops" bytes
    ~ writes the entire buffer per call (aligning to the stripe unit)

Is that correct?

Thanks,
Stefano

