Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED5174F7C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 15:31:12 +0200 (CEST)
Received: from localhost ([::1]:60220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqdpu-0004bs-CH
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 09:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49533)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jdillama@redhat.com>) id 1hqdpV-0003v6-CN
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 09:30:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jdillama@redhat.com>) id 1hqdpT-0006An-Nf
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 09:30:45 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46622)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jdillama@redhat.com>) id 1hqdpT-00069G-En
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 09:30:43 -0400
Received: by mail-ed1-f65.google.com with SMTP id d4so50272032edr.13
 for <qemu-devel@nongnu.org>; Thu, 25 Jul 2019 06:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=MQN9ADcOBZPxaqBGU+e9ua1Uwcn6J1v3+7W0LALPDJ8=;
 b=SBjWYryBScqjjlMH+6CZejRWJuFkI0t5mCGH/UAyzqXoNA5CuxSRqDByoamXxOr4Wa
 TUsWmglX7PcUO9Y/TBIEAUWK2aAHLe61CMIq5Bl7aPMxQ4SuWExo2m7SahHxRFIrTuF3
 YdoyUHTRBqRvaRQSBmUWqkg8r6iD1pIjtDkWG1pcANKbmYEUOUQOk0TW5HF7VHJuQnKs
 MFnuvGn/KFDx2gEt7UzaJlC5PcJY9RT0kZW74hS4tg/PvdVQB0he7YUGFKxOOdOSKHBz
 5TXWy0k2dOGBAS584RKzLMvVHeXuS99bRaOr4ZMjS3OAZWp8WuZCuWWyN/ElMOhsARhy
 JIOA==
X-Gm-Message-State: APjAAAW/+wKyw6oOJ68uBPn6vy9ny1kWcWhvZ/CbOKtkpzT0qus9k0zx
 7Mga7AWio71fLq00fSEx8j57VWenpDZ18Lw2CedUJw==
X-Google-Smtp-Source: APXvYqzSh+9VcD45D/rmJRCLEFAmo0DKR9Q2shydWTNcm4Fnxgmov6yoAk1EFnYJ4c2nYTrNvCBypSgJAX38OJO9VoI=
X-Received: by 2002:a50:9832:: with SMTP id g47mr74136950edb.282.1564061441940; 
 Thu, 25 Jul 2019 06:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190723071342.383909-1-sgarzare@redhat.com>
 <CA+aFP1BMUitx40WDT-fcWDjO62j3EsoSdg=3HF2b6c1EdwzUxg@mail.gmail.com>
 <20190725081334.s2btvq3zdorj7lb5@steredhat>
In-Reply-To: <20190725081334.s2btvq3zdorj7lb5@steredhat>
From: Jason Dillaman <jdillama@redhat.com>
Date: Thu, 25 Jul 2019 09:30:30 -0400
Message-ID: <CA+aFP1CjAMdbFOTy125xWLVm6mE35MX+6pOQ-fRq8NYpPkdRjw@mail.gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.65
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
Reply-To: dillaman@redhat.com
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 25, 2019 at 4:13 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Wed, Jul 24, 2019 at 01:48:42PM -0400, Jason Dillaman wrote:
> > On Tue, Jul 23, 2019 at 3:13 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> > >
> > > This patch adds the support of preallocation (off/full) for the RBD
> > > block driver.
> > > If rbd_writesame() is available and supports zeroed buffers, we use
> > > it to quickly fill the image when full preallocation is required.
> > >
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > ---
> > > v3:
> > >  - rebased on master
> > >  - filled with zeroed buffer [Max]
> > >  - used rbd_writesame() only when we can disable the discard of zeroed
> > >    buffers
> > >  - added 'since: 4.2' in qapi/block-core.json [Max]
> > >  - used buffer as large as the "stripe unit"
> > > ---
> > >  block/rbd.c          | 202 ++++++++++++++++++++++++++++++++++++++++---
> > >  qapi/block-core.json |   5 +-
> > >  2 files changed, 192 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/block/rbd.c b/block/rbd.c
> > > index 59757b3120..d923a5a26c 100644
> > > --- a/block/rbd.c
> > > +++ b/block/rbd.c
> > > @@ -64,6 +64,7 @@
> > >  #define OBJ_MAX_SIZE (1UL << OBJ_DEFAULT_OBJ_ORDER)
> > >
> > >  #define RBD_MAX_SNAPS 100
> > > +#define RBD_DEFAULT_CONCURRENT_OPS 10
> > >
> > >  /* The LIBRBD_SUPPORTS_IOVEC is defined in librbd.h */
> > >  #ifdef LIBRBD_SUPPORTS_IOVEC
> > > @@ -104,6 +105,7 @@ typedef struct BDRVRBDState {
> > >      char *image_name;
> > >      char *snap;
> > >      uint64_t image_size;
> > > +    bool ws_zero_supported; /* rbd_writesame() supports zeroed buffers */
> > >  } BDRVRBDState;
> > >
> > >  static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
> > > @@ -333,6 +335,155 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
> > >      }
> > >  }
> > >
> > > +static int qemu_rbd_get_max_concurrent_ops(rados_t cluster)
> > > +{
> > > +    char buf[16];
> > > +    int ret, max_concurrent_ops;
> > > +
> > > +    ret = rados_conf_get(cluster, "rbd_concurrent_management_ops", buf,
> > > +                         sizeof(buf));
> > > +    if (ret < 0) {
> > > +        return RBD_DEFAULT_CONCURRENT_OPS;
> > > +    }
> > > +
> > > +    ret = qemu_strtoi(buf, NULL, 10, &max_concurrent_ops);
> > > +    if (ret < 0) {
> > > +        return RBD_DEFAULT_CONCURRENT_OPS;
> > > +    }
> > > +
> > > +    return max_concurrent_ops;
> > > +}
> > > +
> > > +static int qemu_rbd_do_truncate(rados_t cluster, rbd_image_t image,
> > > +                                int64_t offset, PreallocMode prealloc,
> > > +                                bool ws_zero_supported, Error **errp)
> > > +{
> > > +    uint64_t current_length;
> > > +    char *buf = NULL;
> > > +    int ret;
> > > +
> > > +    ret = rbd_get_size(image, &current_length);
> > > +    if (ret < 0) {
> > > +        error_setg_errno(errp, -ret, "Failed to get file length");
> > > +        goto out;
> > > +    }
> > > +
> > > +    if (current_length > offset && prealloc != PREALLOC_MODE_OFF) {
> > > +        error_setg(errp, "Cannot use preallocation for shrinking files");
> > > +        ret = -ENOTSUP;
> > > +        goto out;
> > > +    }
> > > +
> > > +    switch (prealloc) {
> > > +    case PREALLOC_MODE_FULL: {
> > > +        uint64_t buf_size, current_offset = current_length;
> > > +        ssize_t bytes;
> > > +
> > > +        ret = rbd_get_stripe_unit(image, &buf_size);
> > > +        if (ret < 0) {
> > > +            error_setg_errno(errp, -ret, "Failed to get stripe unit");
> > > +            goto out;
> > > +        }
> > > +
> > > +        ret = rbd_resize(image, offset);
> > > +        if (ret < 0) {
> > > +            error_setg_errno(errp, -ret, "Failed to resize file");
> > > +            goto out;
> > > +        }
> > > +
> > > +        buf = g_malloc0(buf_size);
> > > +
> > > +#ifdef LIBRBD_SUPPORTS_WRITESAME
> > > +        if (ws_zero_supported) {
> > > +            uint64_t writesame_max_size;
> > > +            int max_concurrent_ops;
> > > +
> > > +            max_concurrent_ops = qemu_rbd_get_max_concurrent_ops(cluster);
> > > +            /*
> > > +             * We limit the rbd_writesame() size to avoid to spawn more then
> > > +             * 'rbd_concurrent_management_ops' concurrent operations.
> > > +             */
> > > +            writesame_max_size = MIN(buf_size * max_concurrent_ops, INT_MAX);
> >
> > In the most efficient world, the 'buf_size' would be some small, fixed
> > power of 2 value (like 512 bytes) since there isn't much need to send
> > extra zeroes. You would then want to writesame the full stripe period
> > (if possible), where a stripe period is the data block object size
> > (defaults to 4MiB and is availble via 'rbd_stat') * the stripe count.
> > In this case, the stripe count becomes the number of in-flight IOs.
> > Therefore, you could substitute its value w/ the max_concurrent_ops to
> > ensure you are issuing exactly max_concurrent_ops IOs per
> > rbd_writesame call.
> >
>
> Initially, I had a fixed buffer size to 4 KiB, but I noted that, when
> we didn't use writesame, the rbd_write() was very slow, so I used the
> stripe unit as a buffer size.
>
> Do you think is better to have a small buffer (512 byte) when we use
> writesame or a 'stripe unit' buffer when we can't use it?

I'd use a small buffer for rbd_writesame and then just reallocate the
buffer to a larger size for "rbd_write". It would be most efficient to
allocate a "object size * max concurrent ops" -sized buffer (up to
some reasonable maximum) for the standard rbd_write. Just make sure
your "rbd_writes" offsets / length is aligned to the stripe period for
the most efficient IO (i.e. the initial write might be smaller than
the stripe period if the starting offset is unaligned).

> > > +
> > > +            while (offset - current_offset > buf_size) {
> > > +                bytes = MIN(offset - current_offset, writesame_max_size);
> > > +                /*
> > > +                 * rbd_writesame() supports only request where the size of the
> > > +                 * operation is multiple of buffer size.
> > > +                 */
> > > +                bytes -= bytes % buf_size;
> > > +
> > > +                bytes = rbd_writesame(image, current_offset, bytes, buf,
> > > +                                      buf_size, 0);
> >
> > If the RBD in-memory cache is enabled during this operation, the
> > writesame will effectively just be turned into a write. Therefore,
> > when pre-allocating, you will want to disable the cache.
> >
>
> During the creation, when preallocation is often used, we disable the cache:
>
> static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>                               const char *keypairs, const char *password_secret,
>                               Error **errp)
> {
>     ...
>
>     ret = qemu_rbd_connect(&cluster, &io_ctx, opts->location, false, keypairs,
>                                                               ^^ cache param
>     ...
> }
>
>
> Do you think I should disable it in any case during the preallocation?

Assuming you can grow an image w/ full preallocation, I would
definitely want to ensure that the cache is disabled since otherwise
you would just be performing regular (non-offloaded) writes.

>
>
> > > +                if (bytes < 0) {
> > > +                    ret = bytes;
> > > +                    error_setg_errno(errp, -ret,
> > > +                                     "Failed to write for preallocation");
> > > +                    goto out;
> > > +                }
> > > +
> > > +                current_offset += bytes;
> > > +            }
> > > +        }
> > > +#endif /* LIBRBD_SUPPORTS_WRITESAME */
> > > +
> > > +        while (current_offset < offset) {
> > > +            bytes = rbd_write(image, current_offset,
> > > +                              MIN(offset - current_offset, buf_size), buf);
> > > +            if (bytes < 0) {
> > > +                ret = bytes;
> > > +                error_setg_errno(errp, -ret,
> > > +                                 "Failed to write for preallocation");
> > > +                goto out;
> > > +            }
> > > +
> > > +            current_offset += bytes;
> > > +        }
> > > +
> > > +        ret = rbd_flush(image);
> > > +        if (ret < 0) {
> > > +            error_setg_errno(errp, -ret, "Failed to flush the file");
> > > +            goto out;
> > > +        }
> > > +
> > > +        break;
> > > +    }
> > > +    case PREALLOC_MODE_OFF:
> > > +        ret = rbd_resize(image, offset);
> >
> > I'm not familiar enough w/ the QEMU block code, but why would the
> > PREALLOC_MODE_FULL case not need to resize the image?
>
> PREALLOC_MODE_FULL need too, I did it just before the g_malloc0() in
> this patch :-)

Sorry I missed it. Would it make more sense to just do it before the
switch statement so that you don't duplicate the code and resulting
error handling? I guess just validate that the prealloc mode is
supported before issuing the resize.

> Thanks,
> Stefano



-- 
Jason

