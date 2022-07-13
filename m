Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD0572A78
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 02:54:12 +0200 (CEST)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBQdn-000490-FK
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 20:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oBQbX-0002e6-Ho; Tue, 12 Jul 2022 20:51:51 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:44953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oBQbU-0005c5-Nk; Tue, 12 Jul 2022 20:51:51 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31d7db3e6e5so67553237b3.11; 
 Tue, 12 Jul 2022 17:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oDn8oZLQtWD+zhP9flxjHDDKOTmSVeIN6j+YYetCW7w=;
 b=cWXSGcpa1voHpqis++WlEu8niR4CPZS5U0nvdIshN8zhUIEfnUnaXT08sx2Xhx0tRM
 0wzEhK7OikrRDzs5zzjXS7LBaKsnkHiUn736S4SAhaWutp1uNqzZVlUqM8BOymtf9v1q
 g14Xoq7QgQUGnn/pqSvtIj0HKhByloUS6jY3UTljDET3MKaiMXW578fjdpHhve/wWY1Y
 dk1yge12fiauhzvn9CDO5hB/x2Lto0FwBfP2iddOqfr1nqvj8oB6ZfliqUzSJNQBT7M7
 gUnIDBZvtUTZSGmBEvo2FitoBgQKoHRffp8tjvPRRlRcGiLMmDNqL2Qj2YceF3YM637C
 iJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oDn8oZLQtWD+zhP9flxjHDDKOTmSVeIN6j+YYetCW7w=;
 b=U5HgsmurikXJZ0eks1YjHgmwgkYZAjCbxazBWNB7jA4nB9fIvrruSHzfOHE8+eAiOe
 dXhiAZlxAC2L7MStx3ym/SjqxPfXLIvygi4v0U9Ccwj1d5N7EQ4blmMKGfXEZ4WHm9pA
 9lZySrpWMDVW55X2HIcZw6YOW1nWVm3AH4aHzb4im35xd4u9qkn3t7C80T7nEj1BUyZ0
 p+u2CJo8Af68YpbHhAnLbIO9sCy6iTwHnBrXG6XQZEGyePhPPxjr396qkEPHz5aC6BTq
 ZBwS1ltmK1XKrkomZ8Hw4a88c4jVScwNd9Jc2Bk4RCFvb0W/hlXB5RIMd43jhyopwPc0
 QbVA==
X-Gm-Message-State: AJIora8XzV1BKD3OAMFW2tlV+fUAlkeGoYnTvDak1mXxsAtFzWWdwaCD
 0etVxdMCMZEJuAt44hf/bxiFA0Twul5NWiBY8g0=
X-Google-Smtp-Source: AGRyM1sPystkIRO9s0S07YLMMyXJ1b2TLUGP6nQRpxDe8dCacdtD+NO9d1s6beKWIZgcrOPNP1QE+xS+WHQFYKRpaDw=
X-Received: by 2002:a81:503:0:b0:317:c5d5:16fe with SMTP id
 3-20020a810503000000b00317c5d516femr1224252ywf.231.1657673506480; Tue, 12 Jul
 2022 17:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-2-faithilikerun@gmail.com>
 <Ys2YF9iYeicGf8xr@stefanha-x1.localdomain>
In-Reply-To: <Ys2YF9iYeicGf8xr@stefanha-x1.localdomain>
From: Sam Li <faithilikerun@gmail.com>
Date: Wed, 13 Jul 2022 08:51:45 +0800
Message-ID: <CAAAx-8+Hs6MJZ9Z_SDaqX+RKJ2UeSEtTAY7sy2Oit6PUc=muJg@mail.gmail.com>
Subject: Re: [RFC v4 1/9] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hanna Reitz <hreitz@redhat.com>, 
 qemu block <qemu-block@nongnu.org>, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B47=E6=9C=8812=E6=
=97=A5=E5=91=A8=E4=BA=8C 23:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jul 12, 2022 at 10:13:37AM +0800, Sam Li wrote:
> > By adding zone management operations in BlockDriver, storage
> > controller emulation can use the new block layer APIs including
> > zone_report and zone_mgmt(open, close, finish, reset).
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  block/block-backend.c            |  41 ++++++
> >  block/coroutines.h               |   5 +
> >  block/file-posix.c               | 236 +++++++++++++++++++++++++++++++
> >  include/block/block-common.h     |  43 +++++-
> >  include/block/block_int-common.h |  20 +++
> >  5 files changed, 344 insertions(+), 1 deletion(-)
> >
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index f425b00793..0a05247ae4 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -1806,6 +1806,47 @@ int blk_flush(BlockBackend *blk)
> >      return ret;
> >  }
> >
> > +/*
> > + * Send a zone_report command.
> > + * offset can be any number within the zone size. No alignment for off=
set.
>
> I think offset is a byte offset from the start of the device and its
> range is [0, total_sectors * BDRV_SECTOR_SIZE)?
>
> "any number within the zone size" gives the impression that the value
> must be [0, zone_size_in_bytes), which is not right.
>
> I suggest changing the text to "offset can be any number of bytes from
> the start of the device" or similar.
>
> > + * nr_zones represents IN maximum and OUT actual.
> > + */
> > +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> > +                                    int64_t *nr_zones,
> > +                                    BlockZoneDescriptor *zones)
> > +{
> > +    int ret;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk); /* increase before waiting */
> > +    blk_wait_while_drained(blk);
> > +    ret =3D bdrv_co_zone_report(blk->root->bs, offset, nr_zones, zones=
);
>
> The !blk_is_available(blk) case needs to return -ENOMEDIUM before we can
> safely dereference blk->root->bs (which can also be written as
> blk_bs(blk)).
> > +    blk_dec_in_flight(blk);
> > +    return ret;
> > +}
> > +
> > +/*
> > + * Send a zone_management command.
> > + * Offset is the start of a zone and len is aligned to zones.
> > + */
> > +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
>
> Please define typedef enum { ... } BlockZoneOp instead of enum { ... }
> zone_op and then use a BlockZoneOp op argument instead of enum zone_op.
> QEMU coding style uses typedefs instead of struct foo or enum foo when
> possible.

Yes, it must be a type.

> > +        int64_t offset, int64_t len)
> > +{
> > +    int ret;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk);
> > +    blk_wait_while_drained(blk);
> > +    ret =3D blk_check_byte_request(blk, offset, len);
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +
> > +    ret =3D bdrv_co_zone_mgmt(blk->root->bs, op, offset, len);
> > +    blk_dec_in_flight(blk);
> > +    return ret;
> > +}
> > +
> >  void blk_drain(BlockBackend *blk)
> >  {
> >      BlockDriverState *bs =3D blk_bs(blk);
> > diff --git a/block/coroutines.h b/block/coroutines.h
> > index 830ecaa733..19aa96cc56 100644
> > --- a/block/coroutines.h
> > +++ b/block/coroutines.h
> > @@ -80,6 +80,11 @@ int coroutine_fn
> >  blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
> >
> >  int coroutine_fn blk_co_do_flush(BlockBackend *blk);
> > +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> > +                                    int64_t *nr_zones,
> > +                                    BlockZoneDescriptor *zones);
> > +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
> > +                                  int64_t offset, int64_t len);
> >
> >
> >  /*
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 48cd096624..e7523ae2ed 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -67,6 +67,7 @@
> >  #include <sys/param.h>
> >  #include <sys/syscall.h>
> >  #include <sys/vfs.h>
> > +#include <linux/blkzoned.h>
> >  #include <linux/cdrom.h>
> >  #include <linux/fd.h>
> >  #include <linux/fs.h>
> > @@ -216,6 +217,13 @@ typedef struct RawPosixAIOData {
> >              PreallocMode prealloc;
> >              Error **errp;
> >          } truncate;
> > +        struct {
> > +            int64_t *nr_zones;
> > +            BlockZoneDescriptor *zones;
> > +        } zone_report;
> > +        struct {
> > +            zone_op op;
> > +        } zone_mgmt;
> >      };
> >  } RawPosixAIOData;
> >
> > @@ -1801,6 +1809,130 @@ static off_t copy_file_range(int in_fd, off_t *=
in_off, int out_fd,
> >  }
> >  #endif
> >
>
> Are the functions below within #ifdef __linux__?

Maybe add them later?

> > +/*
> > + * parse_zone - Fill a zone descriptor
> > + */
> > +static inline void parse_zone(struct BlockZoneDescriptor *zone,
> > +                              struct blk_zone *blkz) {
> > +    zone->start =3D blkz->start;
> > +    zone->length =3D blkz->len;
> > +    zone->cap =3D blkz->capacity;
> > +    zone->wp =3D blkz->wp - blkz->start;
> > +    zone->type =3D blkz->type;
> > +    zone->cond =3D blkz->cond;
> > +}
> > +
> > +static int handle_aiocb_zone_report(void *opaque) {
> > +    RawPosixAIOData *aiocb =3D opaque;
> > +    int fd =3D aiocb->aio_fildes;
> > +    int64_t *nr_zones =3D aiocb->zone_report.nr_zones;
> > +    BlockZoneDescriptor *zones =3D aiocb->zone_report.zones;
> > +    int64_t offset =3D aiocb->aio_offset;
>
> The code is easier to read if it's clear this value is in sector units:
>
>   int64_t sector =3D aiocb->aio_offset / 512; /* BLKREPORTZONE uses 512B =
sectors */
>
> Then there's no confusion about whether 'offset' is bytes or sectors.

I see. It is more readable.

> > +
> > +    struct blk_zone *blkz;
> > +    int64_t rep_size, nrz;
> > +    int ret, n =3D 0, i =3D 0;
> > +
> > +    nrz =3D *nr_zones;
> > +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct =
blk_zone);
> > +    g_autofree struct blk_zone_report *rep =3D NULL;
> > +    rep =3D g_malloc(rep_size);
> > +    offset =3D offset / 512; /* get the unit of the start sector: sect=
or size is 512 bytes. */
> > +    printf("start to report zone with offset: 0x%lx\n", offset);
> > +
> > +    blkz =3D (struct blk_zone *)(rep + 1);
> > +    while (n < nrz) {
> > +        memset(rep, 0, rep_size);
> > +        rep->sector =3D offset;
> > +        rep->nr_zones =3D nrz;
>
> After the first time around the while loop zones[] no longer has space
> for nrz elements. This must be taken into account to avoid overflowing
> zones[]:
>
>   rep->nr_zones =3D nrz - n;
>
> > +
> > +        ret =3D ioctl(fd, BLKREPORTZONE, rep);
> > +        if (ret !=3D 0) {
>
> Does this need to retry when ret !=3D 0 && errno =3D=3D EINTR is encounte=
red?
> Damien/Hannes/Dmitry might know the answer. See handle_aiocb_rw_vector()
> for an example of retrying when EINTR is returned from a blocking
> syscall.
>
> > +            ret =3D -errno;
> > +            error_report("%d: ioctl BLKREPORTZONE at %ld failed %d",
> > +                         fd, offset, errno);
>
> Please use "... at %" PRId64 " failed ..." instead of %ld for int64_t
> values. %ld is not portable because sizeof(long) varies on different
> machines.

Right! I've missed other part than qemuio-cmds to use PRI64.

> > +            return ret;
> > +        }
> > +
> > +        if (!rep->nr_zones) {
> > +            break;
> > +        }
> > +
> > +        for (i =3D 0; i < rep->nr_zones; i++, n++) {
> > +            parse_zone(&zones[n], &blkz[i]);
> > +            /* The next report should start after the last zone report=
ed */
> > +            offset =3D blkz[i].start + blkz[i].len;
> > +        }
> > +    }
> > +
> > +    *nr_zones =3D n;
> > +    return 0;
> > +}
> > +
> > +static int handle_aiocb_zone_mgmt(void *opaque) {
> > +    RawPosixAIOData *aiocb =3D opaque;
> > +    int fd =3D aiocb->aio_fildes;
> > +    int64_t offset =3D aiocb->aio_offset;
> > +    int64_t len =3D aiocb->aio_nbytes;
> > +    zone_op op =3D aiocb->zone_mgmt.op;
> > +
> > +    struct blk_zone_range range;
> > +    const char *ioctl_name;
> > +    unsigned long ioctl_op;
> > +    int64_t zone_size;
> > +    int64_t zone_size_mask;
> > +    int ret;
> > +
> > +    g_autofree struct stat *file =3D NULL;
> > +    file =3D g_new(struct stat, 1);
> > +    stat(s->filename, file);
>
> Heap allocation is not needed. It's easier to put the struct stat
> variable on the stack:
>
>   struct stat st;
>   if (fstat(fd, &st) < 0) {
>       return -errno;
>   }
>
> fstat(2) is preferred over stat(2) when a file descriptor is available
> because stat(2) suffers from race conditions when file system paths have
> changed.

Yes, it was mentioned before. I have included this change in patch 3.
I'll move them into this patch for better reviewing later.

> > +    zone_size =3D get_sysfs_long_val(fd, file, "chunk_sectors");
>
> The name "zone_sectors" would be clearer since size doesn't indicate the
> units (bytes vs sectors).
> > +    zone_size_mask =3D zone_size - 1;
> > +    if (offset & zone_size_mask) {
>
> Bytes and sectors units are being mixed here:
>
>   int64_t offset =3D aiocb->aio_offset; <-- bytes
>
> I suggest changing it to:
>
>   int64_t sector =3D aiocb->aio_offset / 512; /* BLK*ZONE ioctls use 512B=
 sectors */

I see. I missed considering the difference between sector and byte.

> > +        error_report("offset is not the start of a zone");
> > +        return -EINVAL;
> > +    }
> > +
> > +    if (len & zone_size_mask) {
>
> Bytes and sectors are mixed here too. I think len is in bytes:
>
>   int64_t len =3D aiocb->aio_nbytes;
>
> Maybe change it to:
>
>   int64_t nr_sectors =3D aiocb->aio_nbytes / 512;
> > +        error_report("len is not aligned to zones");
> > +        return -EINVAL;
> > +    }
> > +
> > +    switch (op) {
> > +    case zone_open:
> > +        ioctl_name =3D "BLKOPENZONE";
> > +        ioctl_op =3D BLKOPENZONE;
> > +        break;
> > +    case zone_close:
> > +        ioctl_name =3D "BLKCLOSEZONE";
> > +        ioctl_op =3D BLKCLOSEZONE;
> > +        break;
> > +    case zone_finish:
> > +        ioctl_name =3D "BLKFINISHZONE";
> > +        ioctl_op =3D BLKFINISHZONE;
> > +        break;
> > +    case zone_reset:
> > +        ioctl_name =3D "BLKRESETZONE";
> > +        ioctl_op =3D BLKRESETZONE;
> > +        break;
> > +    default:
> > +        error_report("Invalid zone operation 0x%x", op);
> > +        return -EINVAL;
> > +    }
> > +
> > +    /* Execute the operation */
> > +    range.sector =3D offset;
> > +    range.nr_sectors =3D len;
> > +    ret =3D ioctl(fd, ioctl_op, &range);
> > +    if (ret !=3D 0) {
> > +        error_report("ioctl %s failed %d",
> > +                     ioctl_name, errno);
> > +        return -errno;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  static int handle_aiocb_copy_range(void *opaque)
> >  {
> >      RawPosixAIOData *aiocb =3D opaque;
> > @@ -2973,6 +3105,59 @@ static void raw_account_discard(BDRVRawState *s,=
 uint64_t nbytes, int ret)
> >      }
> >  }
> >
> > +/*
> > + * zone report - Get a zone block device's information in the form
> > + * of an array of zone descriptors.
> > + *
> > + * @param bs: passing zone block device file descriptor
> > + * @param zones: an array of zone descriptors to hold zone
> > + * information on reply
> > + * @param offset: offset can be any byte within the zone size.
> > + * @param len: (not sure yet.
> > + * @return 0 on success, -1 on failure
> > + */
> > +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64=
_t offset,
> > +                                           int64_t *nr_zones,
> > +                                           BlockZoneDescriptor *zones)=
 {
> > +    BDRVRawState *s =3D bs->opaque;
> > +    RawPosixAIOData acb;
> > +
> > +    acb =3D (RawPosixAIOData) {
> > +        .bs         =3D bs,
> > +        .aio_fildes =3D s->fd,
> > +        .aio_type   =3D QEMU_AIO_IOCTL,
>
> Please define QEMU_AIO_ZONE_REPORT, QEMU_AIO_ZONE_MGMT, etc values for
> these new operations instead of reusing QEMU_AIO_IOCTL, which is meant
> for generic passthrough ioctls.
> > +        .aio_offset =3D offset,
> > +        .zone_report    =3D {
> > +                .nr_zones       =3D nr_zones,
> > +                .zones          =3D zones,
> > +        },
> > +    };
> > +
> > +    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
> > +}
> > +
> > +/*
> > + * zone management operations - Execute an operation on a zone
> > + */
> > +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, zone_op=
 op,
> > +        int64_t offset, int64_t len) {
> > +    BDRVRawState *s =3D bs->opaque;
> > +    RawPosixAIOData acb;
> > +
> > +    acb =3D (RawPosixAIOData) {
> > +        .bs             =3D bs,
> > +        .aio_fildes     =3D s->fd,
> > +        .aio_type       =3D QEMU_AIO_IOCTL,
> > +        .aio_offset     =3D offset,
> > +        .aio_nbytes     =3D len,
> > +        .zone_mgmt  =3D {
> > +                .op =3D op,
> > +        },
> > +    };
> > +
> > +    return raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> > +}
> > +
> >  static coroutine_fn int
> >  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
> >                  bool blkdev)
> > @@ -3324,6 +3509,9 @@ BlockDriver bdrv_file =3D {
> >      .bdrv_abort_perm_update =3D raw_abort_perm_update,
> >      .create_opts =3D &raw_create_opts,
> >      .mutable_opts =3D mutable_opts,
> > +
> > +    .bdrv_co_zone_report =3D raw_co_zone_report,
> > +    .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> >  };
> >
> >  /***********************************************/
> > @@ -3703,6 +3891,53 @@ static BlockDriver bdrv_host_device =3D {
> >  #endif
> >  };
> >
>
> #ifdef __linux__
>
> > +static BlockDriver bdrv_zoned_host_device =3D {
> > +        .format_name =3D "zoned_host_device",
> > +        .protocol_name =3D "zoned_host_device",
> > +        .instance_size =3D sizeof(BDRVRawState),
> > +        .bdrv_needs_filename =3D true,
> > +        .bdrv_probe_device  =3D hdev_probe_device,
> > +        .bdrv_parse_filename =3D hdev_parse_filename,
>
> This function hardcodes "host_device:". zoned_host_device needs a
> separate function that uses "zoned_host_device:".
>
> > +        .bdrv_file_open     =3D hdev_open,
> > +        .bdrv_close         =3D raw_close,
> > +        .bdrv_reopen_prepare =3D raw_reopen_prepare,
> > +        .bdrv_reopen_commit  =3D raw_reopen_commit,
> > +        .bdrv_reopen_abort   =3D raw_reopen_abort,
> > +        .bdrv_co_create_opts =3D bdrv_co_create_opts_simple,
> > +        .create_opts         =3D &bdrv_create_opts_simple,
> > +        .mutable_opts        =3D mutable_opts,
> > +        .bdrv_co_invalidate_cache =3D raw_co_invalidate_cache,
> > +        .bdrv_co_pwrite_zeroes =3D hdev_co_pwrite_zeroes,
> > +
> > +        .bdrv_co_preadv         =3D raw_co_preadv,
> > +        .bdrv_co_pwritev        =3D raw_co_pwritev,
> > +        .bdrv_co_flush_to_disk  =3D raw_co_flush_to_disk,
> > +        .bdrv_co_pdiscard       =3D hdev_co_pdiscard,
> > +        .bdrv_co_copy_range_from =3D raw_co_copy_range_from,
> > +        .bdrv_co_copy_range_to  =3D raw_co_copy_range_to,
> > +        .bdrv_refresh_limits =3D raw_refresh_limits,
> > +        .bdrv_io_plug =3D raw_aio_plug,
> > +        .bdrv_io_unplug =3D raw_aio_unplug,
> > +        .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
> > +
> > +        .bdrv_co_truncate       =3D raw_co_truncate,
> > +        .bdrv_getlength =3D raw_getlength,
> > +        .bdrv_get_info =3D raw_get_info,
> > +        .bdrv_get_allocated_file_size
> > +                            =3D raw_get_allocated_file_size,
> > +        .bdrv_get_specific_stats =3D hdev_get_specific_stats,
> > +        .bdrv_check_perm =3D raw_check_perm,
> > +        .bdrv_set_perm   =3D raw_set_perm,
> > +        .bdrv_abort_perm_update =3D raw_abort_perm_update,
> > +        .bdrv_probe_blocksizes =3D hdev_probe_blocksizes,
> > +        .bdrv_probe_geometry =3D hdev_probe_geometry,
> > +        .bdrv_co_ioctl =3D hdev_co_ioctl,
> > +
> > +        /* zone management operations */
> > +        .bdrv_co_zone_report =3D raw_co_zone_report,
> > +        .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> > +};
>
> #endif /* __linux__ */
>
> > +
> >  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_ke=
rnel__)
> >  static void cdrom_parse_filename(const char *filename, QDict *options,
> >                                   Error **errp)
> > @@ -3964,6 +4199,7 @@ static void bdrv_file_init(void)
> >  #if defined(HAVE_HOST_BLOCK_DEVICE)
> >      bdrv_register(&bdrv_host_device);
> >  #ifdef __linux__
> > +    bdrv_register(&bdrv_zoned_host_device);
> >      bdrv_register(&bdrv_host_cdrom);
> >  #endif
> >  #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
> > diff --git a/include/block/block-common.h b/include/block/block-common.=
h
> > index fdb7306e78..78cddeeda5 100644
> > --- a/include/block/block-common.h
> > +++ b/include/block/block-common.h
> > @@ -23,7 +23,6 @@
> >   */
> >  #ifndef BLOCK_COMMON_H
> >  #define BLOCK_COMMON_H
> > -
> >  #include "block/aio.h"
> >  #include "block/aio-wait.h"
> >  #include "qemu/iov.h"
>
> Please avoid making whitespace changes that are unrelated to the patch.

Sorry, I will be more careful.

> > @@ -49,6 +48,48 @@ typedef struct BlockDriver BlockDriver;
> >  typedef struct BdrvChild BdrvChild;
> >  typedef struct BdrvChildClass BdrvChildClass;
> >
> > +typedef enum zone_op {
> > +    zone_open,
> > +    zone_close,
> > +    zone_finish,
> > +    zone_reset,
> > +} zone_op;
>
> QEMU coding style:
>
>   typedef enum {
>       BLK_ZO_OPEN,
>       BLK_ZO_CLOSE,
>       BLK_ZO_FINISH,
>       BLK_ZO_RESET,
>   } BlockZoneOp;
>
> Please also reformat the enums below.
>
> > +
> > +typedef enum zone_model {
> > +    BLK_Z_HM,
> > +    BLK_Z_HA,
> > +} zone_model;
> > +
> > +typedef enum BlkZoneCondition {
> > +    BLK_ZS_NOT_WP =3D 0x0,
> > +    BLK_ZS_EMPTY =3D 0x1,
> > +    BLK_ZS_IOPEN =3D 0x2,
> > +    BLK_ZS_EOPEN =3D 0x3,
> > +    BLK_ZS_CLOSED =3D 0x4,
> > +    BLK_ZS_RDONLY =3D 0xD,
> > +    BLK_ZS_FULL =3D 0xE,
> > +    BLK_ZS_OFFLINE =3D 0xF,
> > +} BlkZoneCondition;
> > +
> > +typedef enum BlkZoneType {
> > +    BLK_ZT_CONV =3D 0x1,
> > +    BLK_ZT_SWR =3D 0x2,
> > +    BLK_ZT_SWP =3D 0x3,
> > +} BlkZoneType;
> > +
> > +/*
> > + * Zone descriptor data structure.
> > + * Provide information on a zone with all position and size values in =
bytes.
> > + */
> > +typedef struct BlockZoneDescriptor {
> > +    uint64_t start;
> > +    uint64_t length;
> > +    uint64_t cap;
> > +    uint64_t wp;
> > +    BlkZoneType type;
> > +    BlkZoneCondition cond;
> > +} BlockZoneDescriptor;
> > +
> >  typedef struct BlockDriverInfo {
> >      /* in bytes, 0 if irrelevant */
> >      int cluster_size;
> > diff --git a/include/block/block_int-common.h b/include/block/block_int=
-common.h
> > index 8947abab76..6037871089 100644
> > --- a/include/block/block_int-common.h
> > +++ b/include/block/block_int-common.h
> > @@ -94,6 +94,20 @@ typedef struct BdrvTrackedRequest {
> >      struct BdrvTrackedRequest *waiting_for;
> >  } BdrvTrackedRequest;
> >
> > +/**
> > + * Zone device information data structure.
> > + * Provide information on a device.
> > + */
> > +typedef struct zbd_dev {
> > +    uint32_t zone_size;
> > +    zone_model model;
> > +    uint32_t block_size;
> > +    uint32_t write_granularity;
> > +    uint32_t nr_zones;
> > +    struct BlockZoneDescriptor *zones; /* array of zones */
> > +    uint32_t max_nr_open_zones; /* maximum number of explicitly open z=
ones */
> > +    uint32_t max_nr_active_zones;
> > +} zbd_dev;
>
> This struct isn't use by this patch. Please move this change into the
> patch that uses struct zbd_dev.
>
> QEMU coding style naming would be BlockZoneDev instead of zbd_dev.
>
> I think this struct contains the block limits fields that could be added
> to QEMU's BlockLimits? A new struct may not be necessary.

Yes! It will in the next patch series.

> >
> >  struct BlockDriver {
> >      /*
> > @@ -691,6 +705,12 @@ struct BlockDriver {
> >                                            QEMUIOVector *qiov,
> >                                            int64_t pos);
> >
> > +    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
> > +            int64_t offset, int64_t *nr_zones,
> > +            BlockZoneDescriptor *zones);
> > +    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, enum z=
one_op op,
> > +            int64_t offset, int64_t len);
> > +
> >      /* removable device specific */
> >      bool (*bdrv_is_inserted)(BlockDriverState *bs);
> >      void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
> > --
> > 2.36.1
> >

