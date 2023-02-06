Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE6468BC8E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:14:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0N6-0004p9-Hh; Mon, 06 Feb 2023 07:13:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pP0N1-0004o4-E1; Mon, 06 Feb 2023 07:13:15 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pP0Mx-0004QN-R5; Mon, 06 Feb 2023 07:13:15 -0500
Received: by mail-ej1-x62a.google.com with SMTP id hx15so33477203ejc.11;
 Mon, 06 Feb 2023 04:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8jLh9C1VQlsmk9vmr+K3dIFrUm/BcM9iKHCZ8N0tgus=;
 b=ARGY3n4IiWrpJhx3aaIfX+YnI/FhZDTsxEc8uRrP0OGEJ5JUAtfM3+uM+4HlBJQUrc
 /wzH6RW+w0WmHh7QQOimBOx5wWyXqyB/Jb0+nm8Uwunm1J0DVNzwknbeYHQCtaUSG3A9
 4ilWkb9O6ATg6oqmy8j0qsVY4L5eFeBDLmKQQlDi9b4l8quLP1W5D0k/S3dA0xKp9/EG
 ExCz3nwDa4qHwm1WCaTug/2rZMeQm1E5TwYrjmrJ9Eo0l3PSwrSs6fxjQLXhu+/VlIrf
 q+H1yRYhucKQjCOOLygaY5IPFTpDFEdazQfi39ZtfLs1rxIZPlzfBAzNpQgEZYvd7nkO
 nOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8jLh9C1VQlsmk9vmr+K3dIFrUm/BcM9iKHCZ8N0tgus=;
 b=opW+mBDw/bEwirYBQdBlDfpfUkTfhOvSaxWltmF/R00yxxa7OtQGOzbnt5RFu4fSz7
 K6ZglDOYn9fZrfKrYTPSUMZBsR55ImRzXH5EZ7PBoiXRI3FNKwk05tn59OzX47e6Ma0F
 2KFzdH2I6yX0+bwp7Jsbejz08CkQq1h9GI66VN4qAF0ajrMkPXKjbg6oYb+tmretmZ5/
 YRkuKaGkpv8tyf6bFQeyOH/fSujSg/TYpwhSMCGDielJk4DZZ/do45BsGFhm2+q5/qVG
 y8aHqGqt5WVSmewUGumYh3AH4CLh7Vw3DKNVFjYdGXI9o39AbhtS3iKu1nIQRgv//JN0
 0TIg==
X-Gm-Message-State: AO0yUKXYesz0tc3VnEznn85V2+59EwDonndkQi2tbFXdGFue/FgB4rBW
 YbftFtvKm9TI4XdDg/MljKKtCqbWik7hgTgmO+8=
X-Google-Smtp-Source: AK7set+NCePzrTxbt7aUBgrL4V1nUcat7L+GuscvDSZANzq/TuYgytjazZ+KCGGhN6FVCiFT7pXsLceYLB0IQKI0ZX0=
X-Received: by 2002:a17:906:cd02:b0:8a5:cae4:51f1 with SMTP id
 oz2-20020a170906cd0200b008a5cae451f1mr597933ejb.195.1675685585639; Mon, 06
 Feb 2023 04:13:05 -0800 (PST)
MIME-Version: 1.0
References: <20230129102850.84731-1-faithilikerun@gmail.com>
 <20230129102850.84731-4-faithilikerun@gmail.com>
 <CAJSP0QU24vGRKhjvRPag5x6iMWj5yQ1g5dUx-Kiy0CFtPYUK=g@mail.gmail.com>
In-Reply-To: <CAJSP0QU24vGRKhjvRPag5x6iMWj5yQ1g5dUx-Kiy0CFtPYUK=g@mail.gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 6 Feb 2023 20:12:38 +0800
Message-ID: <CAAAx-8JQ8Zy_QY-w5FHV59raoASTu=sA08aZhaacz0cv+HKAfA@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, hare@suse.de, damien.lemoal@opensource.wdc.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=faithilikerun@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2023=E5=B9=B42=E6=9C=886=E6=
=97=A5=E5=91=A8=E4=B8=80 20:04=E5=86=99=E9=81=93=EF=BC=9A
>
> )(_On Sun, 29 Jan 2023 at 05:30, Sam Li <faithilikerun@gmail.com> wrote:
> >
> > Add zoned device option to host_device BlockDriver. It will be presente=
d only
> > for zoned host block devices. By adding zone management operations to t=
he
> > host_block_device BlockDriver, users can use the new block layer APIs
> > including Report Zone and four zone management operations
> > (open, close, finish, reset, reset_all).
> >
> > Qemu-io uses the new APIs to perform zoned storage commands of the devi=
ce:
> > zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
> > zone_finish(zf).
> >
> > For example, to test zone_report, use following command:
> > $ ./build/qemu-io --image-opts -n driver=3Dhost_device, filename=3D/dev=
/nullb0
> > -c "zrp offset nr_zones"
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  block/block-backend.c             | 147 ++++++++++++++
> >  block/file-posix.c                | 323 ++++++++++++++++++++++++++++++
> >  block/io.c                        |  41 ++++
> >  include/block/block-io.h          |   7 +
> >  include/block/block_int-common.h  |  21 ++
> >  include/block/raw-aio.h           |   6 +-
> >  include/sysemu/block-backend-io.h |  18 ++
> >  meson.build                       |   4 +
> >  qemu-io-cmds.c                    | 149 ++++++++++++++
> >  9 files changed, 715 insertions(+), 1 deletion(-)
> >
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index ba7bf1d6bc..a4847b9131 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -1451,6 +1451,15 @@ typedef struct BlkRwCo {
> >      void *iobuf;
> >      int ret;
> >      BdrvRequestFlags flags;
> > +    union {
> > +        struct {
> > +            unsigned int *nr_zones;
> > +            BlockZoneDescriptor *zones;
> > +        } zone_report;
> > +        struct {
> > +            unsigned long op;
> > +        } zone_mgmt;
> > +    };
> >  } BlkRwCo;
> >
> >  int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
> > @@ -1795,6 +1804,144 @@ int coroutine_fn blk_co_flush(BlockBackend *blk=
)
> >      return ret;
> >  }
> >
> > +static void coroutine_fn blk_aio_zone_report_entry(void *opaque)
> > +{
> > +    BlkAioEmAIOCB *acb =3D opaque;
> > +    BlkRwCo *rwco =3D &acb->rwco;
> > +
> > +    rwco->ret =3D blk_co_zone_report(rwco->blk, rwco->offset,
> > +                                   rwco->zone_report.nr_zones,
> > +                                   rwco->zone_report.zones);
> > +    blk_aio_complete(acb);
> > +}
> > +
> > +BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
> > +                                unsigned int *nr_zones,
> > +                                BlockZoneDescriptor  *zones,
> > +                                BlockCompletionFunc *cb, void *opaque)
> > +{
> > +    BlkAioEmAIOCB *acb;
> > +    Coroutine *co;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk);
> > +    acb =3D blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
> > +    acb->rwco =3D (BlkRwCo) {
> > +        .blk    =3D blk,
> > +        .offset =3D offset,
> > +        .ret    =3D NOT_DONE,
> > +        .zone_report =3D {
> > +            .zones =3D zones,
> > +            .nr_zones =3D nr_zones,
> > +        },
> > +    };
> > +    acb->has_returned =3D false;
> > +
> > +    co =3D qemu_coroutine_create(blk_aio_zone_report_entry, acb);
> > +    bdrv_coroutine_enter(blk_bs(blk), co);
> > +
> > +    acb->has_returned =3D true;
> > +    if (acb->rwco.ret !=3D NOT_DONE) {
> > +        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
> > +                                         blk_aio_complete_bh, acb);
> > +    }
> > +
> > +    return &acb->common;
> > +}
> > +
> > +static void coroutine_fn blk_aio_zone_mgmt_entry(void *opaque)
> > +{
> > +    BlkAioEmAIOCB *acb =3D opaque;
> > +    BlkRwCo *rwco =3D &acb->rwco;
> > +
> > +    rwco->ret =3D blk_co_zone_mgmt(rwco->blk, rwco->zone_mgmt.op,
> > +                                 rwco->offset, acb->bytes);
> > +    blk_aio_complete(acb);
> > +}
> > +
> > +BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> > +                              int64_t offset, int64_t len,
> > +                              BlockCompletionFunc *cb, void *opaque) {
> > +    BlkAioEmAIOCB *acb;
> > +    Coroutine *co;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk);
> > +    acb =3D blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
> > +    acb->rwco =3D (BlkRwCo) {
> > +        .blk    =3D blk,
> > +        .offset =3D offset,
> > +        .ret    =3D NOT_DONE,
> > +        .zone_mgmt =3D {
> > +            .op =3D op,
> > +        },
> > +    };
> > +    acb->bytes =3D len;
> > +    acb->has_returned =3D false;
> > +
> > +    co =3D qemu_coroutine_create(blk_aio_zone_mgmt_entry, acb);
> > +    bdrv_coroutine_enter(blk_bs(blk), co);
> > +
> > +    acb->has_returned =3D true;
> > +    if (acb->rwco.ret !=3D NOT_DONE) {
> > +        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
> > +                                         blk_aio_complete_bh, acb);
> > +    }
> > +
> > +    return &acb->common;
> > +}
> > +
> > +/*
> > + * Send a zone_report command.
> > + * offset is a byte offset from the start of the device. No alignment
> > + * required for offset.
> > + * nr_zones represents IN maximum and OUT actual.
> > + */
> > +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> > +                                    unsigned int *nr_zones,
> > +                                    BlockZoneDescriptor *zones)
> > +{
> > +    int ret;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk); /* increase before waiting */
> > +    blk_wait_while_drained(blk);
> > +    if (!blk_is_available(blk)) {
> > +        blk_dec_in_flight(blk);
> > +        return -ENOMEDIUM;
> > +    }
> > +    ret =3D bdrv_co_zone_report(blk_bs(blk), offset, nr_zones, zones);
> > +    blk_dec_in_flight(blk);
> > +    return ret;
> > +}
> > +
> > +/*
> > + * Send a zone_management command.
> > + * op is the zone operation;
> > + * offset is the byte offset from the start of the zoned device;
> > + * len is the maximum number of bytes the command should operate on. I=
t
> > + * should be aligned with the device zone size.
> > + */
> > +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> > +        int64_t offset, int64_t len)
> > +{
> > +    int ret;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk);
> > +    blk_wait_while_drained(blk);
> > +
> > +    ret =3D blk_check_byte_request(blk, offset, len);
> > +    if (ret < 0) {
> > +        blk_dec_in_flight(blk);
> > +        return ret;
> > +    }
> > +
> > +    ret =3D bdrv_co_zone_mgmt(blk_bs(blk), op, offset, len);
> > +    blk_dec_in_flight(blk);
> > +    return ret;
> > +}
> > +
> >  void blk_drain(BlockBackend *blk)
> >  {
> >      BlockDriverState *bs =3D blk_bs(blk);
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 43c59c6d56..b6d88db208 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -68,6 +68,9 @@
> >  #include <sys/param.h>
> >  #include <sys/syscall.h>
> >  #include <sys/vfs.h>
> > +#if defined(CONFIG_BLKZONED)
> > +#include <linux/blkzoned.h>
> > +#endif
> >  #include <linux/cdrom.h>
> >  #include <linux/fd.h>
> >  #include <linux/fs.h>
> > @@ -216,6 +219,13 @@ typedef struct RawPosixAIOData {
> >              PreallocMode prealloc;
> >              Error **errp;
> >          } truncate;
> > +        struct {
> > +            unsigned int *nr_zones;
> > +            BlockZoneDescriptor *zones;
> > +        } zone_report;
> > +        struct {
> > +            unsigned long op;
> > +        } zone_mgmt;
> >      };
> >  } RawPosixAIOData;
> >
> > @@ -1351,6 +1361,50 @@ static void raw_refresh_limits(BlockDriverState =
*bs, Error **errp)
> >          zoned =3D BLK_Z_NONE;
> >      }
> >      bs->bl.zoned =3D zoned;
> > +    if (zoned !=3D BLK_Z_NONE) {
> > +        /*
> > +         * The zoned device must at least have zone size and nr_zones =
fields.
> > +         */
> > +        ret =3D get_sysfs_long_val(&st, "chunk_sectors");
> > +        if (ret < 0) {
> > +            error_setg_errno(errp, -ret, "Unable to read chunk_sectors=
 "
> > +                                         "sysfs attribute");
> > +            goto out;
> > +        } else if (!ret) {
> > +            error_setg(errp, "Read 0 from chunk_sectors sysfs attribut=
e");
> > +            goto out;
> > +        }
> > +        bs->bl.zone_size =3D ret << BDRV_SECTOR_BITS;
> > +
> > +        ret =3D get_sysfs_long_val(&st, "nr_zones");
> > +        if (ret < 0) {
> > +            error_setg_errno(errp, -ret, "Unable to read nr_zones "
> > +                                         "sysfs attribute");
> > +            goto out;
> > +        } else if (!ret) {
> > +            error_setg(errp, "Read 0 from nr_zones sysfs attribute");
> > +            goto out;
> > +        }
> > +        bs->bl.nr_zones =3D ret;
> > +
> > +        ret =3D get_sysfs_long_val(&st, "zone_append_max_bytes");
> > +        if (ret > 0) {
> > +            bs->bl.max_append_sectors =3D ret >> BDRV_SECTOR_BITS;
> > +        }
> > +
> > +        ret =3D get_sysfs_long_val(&st, "max_open_zones");
> > +        if (ret >=3D 0) {
> > +            bs->bl.max_open_zones =3D ret;
> > +        }
> > +
> > +        ret =3D get_sysfs_long_val(&st, "max_active_zones");
> > +        if (ret >=3D 0) {
> > +            bs->bl.max_active_zones =3D ret;
> > +        }
> > +        return;
> > +    }
> > +out:
> > +    bs->bl.zoned =3D BLK_Z_NONE;
> >  }
> >
> >  static int check_for_dasd(int fd)
> > @@ -1364,6 +1418,23 @@ static int check_for_dasd(int fd)
> >  #endif
> >  }
> >
> > +#if defined(CONFIG_BLKZONED)
> > +/**
> > + * Zoned storage needs to be virtualized with the correct physical blo=
ck size
> > + * and logical block size.
> > + */
> > +static int hdev_probe_zoned_blocksizes(BlockDriverState *bs, BlockSize=
s *bsz)
>
> The #ifdef approach in this patch won't work because the same
> BlockDriver now handles both zoned and non-zoned devices at runtime.
> This function needs to be unified with hdev_probe_blocksizes():
>
>   if (check_for_dasd(s->fd) < 0 || bs->bl.zoned =3D=3D BLK_Z_NONE) {
>       return -ENOTSUP;
>   }
>
>   ...probe block sizes...
>
> > +{
> > +    BDRVRawState *s =3D bs->opaque;
> > +    int ret;
> > +
> > +    ret =3D probe_logical_blocksize(s->fd, &bsz->log);
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +    return probe_physical_blocksize(s->fd, &bsz->phys);
> > +}
> > +#else
> >  /**
> >   * Try to get @bs's logical and physical block size.
> >   * On success, store them in @bsz and return zero.
> > @@ -1384,6 +1455,7 @@ static int hdev_probe_blocksizes(BlockDriverState=
 *bs, BlockSizes *bsz)
> >      }
> >      return probe_physical_blocksize(s->fd, &bsz->phys);
> >  }
> > +#endif
> >
> >  /**
> >   * Try to get @bs's geometry: cyls, heads, sectors.
> > @@ -1844,6 +1916,146 @@ static off_t copy_file_range(int in_fd, off_t *=
in_off, int out_fd,
> >  }
> >  #endif
> >
> > +/*
> > + * parse_zone - Fill a zone descriptor
> > + */
> > +#if defined(CONFIG_BLKZONED)
> > +static inline int parse_zone(struct BlockZoneDescriptor *zone,
> > +                              const struct blk_zone *blkz) {
> > +    zone->start =3D blkz->start << BDRV_SECTOR_BITS;
> > +    zone->length =3D blkz->len << BDRV_SECTOR_BITS;
> > +    zone->wp =3D blkz->wp << BDRV_SECTOR_BITS;
> > +
> > +#ifdef HAVE_BLK_ZONE_REP_CAPACITY
> > +    zone->cap =3D blkz->capacity << BDRV_SECTOR_BITS;
> > +#else
> > +    zone->cap =3D blkz->len << BDRV_SECTOR_BITS;
> > +#endif
> > +
> > +    switch (blkz->type) {
> > +    case BLK_ZONE_TYPE_SEQWRITE_REQ:
> > +        zone->type =3D BLK_ZT_SWR;
> > +        break;
> > +    case BLK_ZONE_TYPE_SEQWRITE_PREF:
> > +        zone->type =3D BLK_ZT_SWP;
> > +        break;
> > +    case BLK_ZONE_TYPE_CONVENTIONAL:
> > +        zone->type =3D BLK_ZT_CONV;
> > +        break;
> > +    default:
> > +        error_report("Unsupported zone type: 0x%x", blkz->type);
> > +        return -ENOTSUP;
> > +    }
> > +
> > +    switch (blkz->cond) {
> > +    case BLK_ZONE_COND_NOT_WP:
> > +        zone->state =3D BLK_ZS_NOT_WP;
> > +        break;
> > +    case BLK_ZONE_COND_EMPTY:
> > +        zone->state =3D BLK_ZS_EMPTY;
> > +        break;
> > +    case BLK_ZONE_COND_IMP_OPEN:
> > +        zone->state =3D BLK_ZS_IOPEN;
> > +        break;
> > +    case BLK_ZONE_COND_EXP_OPEN:
> > +        zone->state =3D BLK_ZS_EOPEN;
> > +        break;
> > +    case BLK_ZONE_COND_CLOSED:
> > +        zone->state =3D BLK_ZS_CLOSED;
> > +        break;
> > +    case BLK_ZONE_COND_READONLY:
> > +        zone->state =3D BLK_ZS_RDONLY;
> > +        break;
> > +    case BLK_ZONE_COND_FULL:
> > +        zone->state =3D BLK_ZS_FULL;
> > +        break;
> > +    case BLK_ZONE_COND_OFFLINE:
> > +        zone->state =3D BLK_ZS_OFFLINE;
> > +        break;
> > +    default:
> > +        error_report("Unsupported zone state: 0x%x", blkz->cond);
> > +        return -ENOTSUP;
> > +    }
> > +    return 0;
> > +}
> > +#endif
> > +
> > +#if defined(CONFIG_BLKZONED)
> > +static int handle_aiocb_zone_report(void *opaque)
> > +{
> > +    RawPosixAIOData *aiocb =3D opaque;
> > +    int fd =3D aiocb->aio_fildes;
> > +    unsigned int *nr_zones =3D aiocb->zone_report.nr_zones;
> > +    BlockZoneDescriptor *zones =3D aiocb->zone_report.zones;
> > +    /* zoned block devices use 512-byte sectors */
> > +    uint64_t sector =3D aiocb->aio_offset / 512;
> > +
> > +    struct blk_zone *blkz;
> > +    size_t rep_size;
> > +    unsigned int nrz;
> > +    int ret, n =3D 0, i =3D 0;
> > +
> > +    nrz =3D *nr_zones;
> > +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct =
blk_zone);
> > +    g_autofree struct blk_zone_report *rep =3D NULL;
> > +    rep =3D g_malloc(rep_size);
> > +
> > +    blkz =3D (struct blk_zone *)(rep + 1);
> > +    while (n < nrz) {
> > +        memset(rep, 0, rep_size);
> > +        rep->sector =3D sector;
> > +        rep->nr_zones =3D nrz - n;
> > +
> > +        do {
> > +            ret =3D ioctl(fd, BLKREPORTZONE, rep);
> > +        } while (ret !=3D 0 && errno =3D=3D EINTR);
> > +        if (ret !=3D 0) {
> > +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " faile=
d %d",
> > +                         fd, sector, errno);
> > +            return -errno;
> > +        }
> > +
> > +        if (!rep->nr_zones) {
> > +            break;
> > +        }
> > +
> > +        for (i =3D 0; i < rep->nr_zones; i++, n++) {
> > +            ret =3D parse_zone(&zones[n], &blkz[i]);
> > +            if (ret !=3D 0) {
> > +                return ret;
> > +            }
> > +
> > +            /* The next report should start after the last zone report=
ed */
> > +            sector =3D blkz[i].start + blkz[i].len;
> > +        }
> > +    }
> > +
> > +    *nr_zones =3D n;
> > +    return 0;
> > +}
> > +#endif
> > +
> > +#if defined(CONFIG_BLKZONED)
> > +static int handle_aiocb_zone_mgmt(void *opaque)
> > +{
> > +    RawPosixAIOData *aiocb =3D opaque;
> > +    int fd =3D aiocb->aio_fildes;
> > +    uint64_t sector =3D aiocb->aio_offset / 512;
> > +    int64_t nr_sectors =3D aiocb->aio_nbytes / 512;
> > +    struct blk_zone_range range;
> > +    int ret;
> > +
> > +    /* Execute the operation */
> > +    range.sector =3D sector;
> > +    range.nr_sectors =3D nr_sectors;
> > +    do {
> > +        ret =3D ioctl(fd, aiocb->zone_mgmt.op, &range);
> > +    } while (ret !=3D 0 && errno =3D=3D EINTR);
> > +
> > +    return ret;
> > +}
> > +#endif
> > +
> >  static int handle_aiocb_copy_range(void *opaque)
> >  {
> >      RawPosixAIOData *aiocb =3D opaque;
> > @@ -3035,6 +3247,107 @@ static void raw_account_discard(BDRVRawState *s=
, uint64_t nbytes, int ret)
> >      }
> >  }
> >
> > +/*
> > + * zone report - Get a zone block device's information in the form
> > + * of an array of zone descriptors.
> > + * zones is an array of zone descriptors to hold zone information on r=
eply;
> > + * offset can be any byte within the entire size of the device;
> > + * nr_zones is the maxium number of sectors the command should operate=
 on.
> > + */
> > +#if defined(CONFIG_BLKZONED)
> > +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64=
_t offset,
> > +                                           unsigned int *nr_zones,
> > +                                           BlockZoneDescriptor *zones)=
 {
> > +    BDRVRawState *s =3D bs->opaque;
> > +    RawPosixAIOData acb;
> > +
> > +    acb =3D (RawPosixAIOData) {
> > +        .bs         =3D bs,
> > +        .aio_fildes =3D s->fd,
> > +        .aio_type   =3D QEMU_AIO_ZONE_REPORT,
> > +        .aio_offset =3D offset,
> > +        .zone_report    =3D {
> > +            .nr_zones       =3D nr_zones,
> > +            .zones          =3D zones,
> > +        },
> > +    };
> > +
> > +    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
> > +}
> > +#endif
> > +
> > +/*
> > + * zone management operations - Execute an operation on a zone
> > + */
> > +#if defined(CONFIG_BLKZONED)
> > +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZo=
neOp op,
> > +        int64_t offset, int64_t len) {
> > +    BDRVRawState *s =3D bs->opaque;
> > +    RawPosixAIOData acb;
> > +    int64_t zone_size, zone_size_mask;
> > +    const char *op_name;
> > +    unsigned long zo;
> > +    int ret;
> > +    int64_t capacity =3D bs->total_sectors << BDRV_SECTOR_BITS;
> > +
> > +    zone_size =3D bs->bl.zone_size;
> > +    zone_size_mask =3D zone_size - 1;
> > +    if (offset & zone_size_mask) {
> > +        error_report("sector offset %" PRId64 " is not aligned to zone=
 size "
> > +                     "%" PRId64 "", offset / 512, zone_size / 512);
> > +        return -EINVAL;
> > +    }
> > +
> > +    if (((offset + len) < capacity && len & zone_size_mask) ||
> > +        offset + len > capacity) {
> > +        error_report("number of sectors %" PRId64 " is not aligned to =
zone size"
> > +                      " %" PRId64 "", len / 512, zone_size / 512);
> > +        return -EINVAL;
> > +    }
> > +
> > +    switch (op) {
> > +    case BLK_ZO_OPEN:
> > +        op_name =3D "BLKOPENZONE";
> > +        zo =3D BLKOPENZONE;
> > +        break;
> > +    case BLK_ZO_CLOSE:
> > +        op_name =3D "BLKCLOSEZONE";
> > +        zo =3D BLKCLOSEZONE;
> > +        break;
> > +    case BLK_ZO_FINISH:
> > +        op_name =3D "BLKFINISHZONE";
> > +        zo =3D BLKFINISHZONE;
> > +        break;
> > +    case BLK_ZO_RESET:
> > +        op_name =3D "BLKRESETZONE";
> > +        zo =3D BLKRESETZONE;
> > +        break;
> > +    default:
> > +        error_report("Unsupported zone op: 0x%x", op);
> > +        return -ENOTSUP;
> > +    }
> > +
> > +    acb =3D (RawPosixAIOData) {
> > +        .bs             =3D bs,
> > +        .aio_fildes     =3D s->fd,
> > +        .aio_type       =3D QEMU_AIO_ZONE_MGMT,
> > +        .aio_offset     =3D offset,
> > +        .aio_nbytes     =3D len,
> > +        .zone_mgmt  =3D {
> > +            .op =3D zo,
> > +        },
> > +    };
> > +
> > +    ret =3D raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> > +    if (ret !=3D 0) {
> > +        ret =3D -errno;
> > +        error_report("ioctl %s failed %d", op_name, ret);
> > +    }
> > +
> > +    return ret;
> > +}
> > +#endif
> > +
> >  static coroutine_fn int
> >  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
> >                  bool blkdev)
> > @@ -3756,13 +4069,23 @@ static BlockDriver bdrv_host_device =3D {
> >      .bdrv_check_perm =3D raw_check_perm,
> >      .bdrv_set_perm   =3D raw_set_perm,
> >      .bdrv_abort_perm_update =3D raw_abort_perm_update,
> > +#ifndef CONFIG_BLKZONED
> >      .bdrv_probe_blocksizes =3D hdev_probe_blocksizes,
> > +#endif
> >      .bdrv_probe_geometry =3D hdev_probe_geometry,
> >
> >      /* generic scsi device */
> >  #ifdef __linux__
> >      .bdrv_co_ioctl          =3D hdev_co_ioctl,
> >  #endif
> > +
> > +    /* zoned device */
> > +#if defined(CONFIG_BLKZONED)
> > +    /* zone management operations */
> > +    .bdrv_probe_blocksizes =3D hdev_probe_zoned_blocksizes,
> > +    .bdrv_co_zone_report =3D raw_co_zone_report,
> > +    .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> > +#endif
> >  };
> >
> >  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_ke=
rnel__)
> > diff --git a/block/io.c b/block/io.c
> > index a09a19f7a7..1586e42ab9 100644
> > --- a/block/io.c
> > +++ b/block/io.c
> > @@ -3099,6 +3099,47 @@ out:
> >      return co.ret;
> >  }
> >
> > +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t off=
set,
> > +                        unsigned int *nr_zones,
> > +                        BlockZoneDescriptor *zones)
> > +{
> > +    BlockDriver *drv =3D bs->drv;
> > +    CoroutineIOCompletion co =3D {
> > +            .coroutine =3D qemu_coroutine_self(),
> > +    };
> > +    IO_CODE();
> > +
> > +    bdrv_inc_in_flight(bs);
> > +    if (!drv || !drv->bdrv_co_zone_report) {
>
> Now that zoned device support is determined at runtime instead of at
> compile-time, checking for drv->bdrv_co_zone_report isn't enough. The
> BlockDriverState might have bs->bl.zoned =3D=3D BLK_Z_NONE.
>
> Please add || bs->bl.zoned =3D=3D BLK_Z_NONE to this if statement to
> prevent calls when the device is not zoned.
>
> The same applies to bdrv_co_zone_mgmt().

I see. Thanks!

>
> > +        co.ret =3D -ENOTSUP;
> > +        goto out;
> > +    }
> > +    co.ret =3D drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
> > +out:
> > +    bdrv_dec_in_flight(bs);
> > +    return co.ret;
> > +}
> > +
> > +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp o=
p,
> > +        int64_t offset, int64_t len)
> > +{
> > +    BlockDriver *drv =3D bs->drv;
> > +    CoroutineIOCompletion co =3D {
> > +            .coroutine =3D qemu_coroutine_self(),
> > +    };
> > +    IO_CODE();
> > +
> > +    bdrv_inc_in_flight(bs);
> > +    if (!drv || !drv->bdrv_co_zone_mgmt) {
> > +        co.ret =3D -ENOTSUP;
> > +        goto out;
> > +    }
> > +    co.ret =3D drv->bdrv_co_zone_mgmt(bs, op, offset, len);
> > +out:
> > +    bdrv_dec_in_flight(bs);
> > +    return co.ret;
> > +}
> > +
> >  void *qemu_blockalign(BlockDriverState *bs, size_t size)
> >  {
> >      IO_CODE();
> > diff --git a/include/block/block-io.h b/include/block/block-io.h
> > index 3398351596..10ff212036 100644
> > --- a/include/block/block-io.h
> > +++ b/include/block/block-io.h
> > @@ -98,6 +98,13 @@ int coroutine_fn bdrv_co_flush(BlockDriverState *bs)=
;
> >
> >  int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
> >                                    int64_t bytes);
> > +/* Report zone information of zone block device. */
> > +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t off=
set,
> > +                                     unsigned int *nr_zones,
> > +                                     BlockZoneDescriptor *zones);
> > +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp o=
p,
> > +                                   int64_t offset, int64_t len);
> > +
> >  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
> >  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> >                        int64_t bytes, int64_t *pnum, int64_t *map,
> > diff --git a/include/block/block_int-common.h b/include/block/block_int=
-common.h
> > index 57f0612f5e..565228d8dd 100644
> > --- a/include/block/block_int-common.h
> > +++ b/include/block/block_int-common.h
> > @@ -703,6 +703,12 @@ struct BlockDriver {
> >      int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_load_vmstate)(
> >          BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
> >
> > +    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
> > +            int64_t offset, unsigned int *nr_zones,
> > +            BlockZoneDescriptor *zones);
> > +    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, BlockZ=
oneOp op,
> > +            int64_t offset, int64_t len);
> > +
> >      /* removable device specific */
> >      bool (*bdrv_is_inserted)(BlockDriverState *bs);
> >      void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
> > @@ -839,6 +845,21 @@ typedef struct BlockLimits {
> >
> >      /* device zone model */
> >      BlockZoneModel zoned;
> > +
> > +    /* zone size expressed in bytes */
> > +    uint32_t zone_size;
> > +
> > +    /* total number of zones */
> > +    uint32_t nr_zones;
> > +
> > +    /* maximum sectors of a zone append write operation */
> > +    int64_t max_append_sectors;
> > +
> > +    /* maximum number of open zones */
> > +    int64_t max_open_zones;
> > +
> > +    /* maximum number of active zones */
> > +    int64_t max_active_zones;
> >  } BlockLimits;
> >
> >  typedef struct BdrvOpBlocker BdrvOpBlocker;
> > diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> > index f8cda9df91..eda6a7a253 100644
> > --- a/include/block/raw-aio.h
> > +++ b/include/block/raw-aio.h
> > @@ -28,6 +28,8 @@
> >  #define QEMU_AIO_WRITE_ZEROES 0x0020
> >  #define QEMU_AIO_COPY_RANGE   0x0040
> >  #define QEMU_AIO_TRUNCATE     0x0080
> > +#define QEMU_AIO_ZONE_REPORT  0x0100
> > +#define QEMU_AIO_ZONE_MGMT    0x0200
> >  #define QEMU_AIO_TYPE_MASK \
> >          (QEMU_AIO_READ | \
> >           QEMU_AIO_WRITE | \
> > @@ -36,7 +38,9 @@
> >           QEMU_AIO_DISCARD | \
> >           QEMU_AIO_WRITE_ZEROES | \
> >           QEMU_AIO_COPY_RANGE | \
> > -         QEMU_AIO_TRUNCATE)
> > +         QEMU_AIO_TRUNCATE | \
> > +         QEMU_AIO_ZONE_REPORT | \
> > +         QEMU_AIO_ZONE_MGMT)
> >
> >  /* AIO flags */
> >  #define QEMU_AIO_MISALIGNED   0x1000
> > diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-b=
ackend-io.h
> > index 031a27ba10..dc8a4368f0 100644
> > --- a/include/sysemu/block-backend-io.h
> > +++ b/include/sysemu/block-backend-io.h
> > @@ -46,6 +46,13 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64=
_t offset,
> >                              BlockCompletionFunc *cb, void *opaque);
> >  BlockAIOCB *blk_aio_flush(BlockBackend *blk,
> >                            BlockCompletionFunc *cb, void *opaque);
> > +BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
> > +                                unsigned int *nr_zones,
> > +                                BlockZoneDescriptor *zones,
> > +                                BlockCompletionFunc *cb, void *opaque)=
;
> > +BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> > +                              int64_t offset, int64_t len,
> > +                              BlockCompletionFunc *cb, void *opaque);
> >  BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_=
t bytes,
> >                               BlockCompletionFunc *cb, void *opaque);
> >  void blk_aio_cancel_async(BlockAIOCB *acb);
> > @@ -166,6 +173,17 @@ int co_wrapper_mixed blk_pwrite_zeroes(BlockBacken=
d *blk, int64_t offset,
> >  int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offse=
t,
> >                                        int64_t bytes, BdrvRequestFlags =
flags);
> >
> > +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> > +                                    unsigned int *nr_zones,
> > +                                    BlockZoneDescriptor *zones);
> > +int co_wrapper_mixed blk_zone_report(BlockBackend *blk, int64_t offset=
,
> > +                                         unsigned int *nr_zones,
> > +                                         BlockZoneDescriptor *zones);
> > +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> > +                                  int64_t offset, int64_t len);
> > +int co_wrapper_mixed blk_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> > +                                       int64_t offset, int64_t len);
> > +
> >  int co_wrapper_mixed blk_pdiscard(BlockBackend *blk, int64_t offset,
> >                                    int64_t bytes);
> >  int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
> > diff --git a/meson.build b/meson.build
> > index 6d3b665629..a267f74536 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1962,6 +1962,7 @@ config_host_data.set('CONFIG_REPLICATION', get_op=
tion('replication').allowed())
> >  # has_header
> >  config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
> >  config_host_data.set('CONFIG_LINUX_MAGIC_H', cc.has_header('linux/magi=
c.h'))
> > +config_host_data.set('CONFIG_BLKZONED', cc.has_header('linux/blkzoned.=
h'))
> >  config_host_data.set('CONFIG_VALGRIND_H', cc.has_header('valgrind/valg=
rind.h'))
> >  config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
> >  config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
> > @@ -2056,6 +2057,9 @@ config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID=
',
> >  config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
> >                       cc.has_member('struct stat', 'st_atim',
> >                                     prefix: '#include <sys/stat.h>'))
> > +config_host_data.set('HAVE_BLK_ZONE_REP_CAPACITY',
> > +                     cc.has_member('struct blk_zone', 'capacity',
> > +                                   prefix: '#include <linux/blkzoned.h=
>'))
> >
> >  # has_type
> >  config_host_data.set('CONFIG_IOVEC',
> > diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> > index 952dc940f1..3a3bad77c3 100644
> > --- a/qemu-io-cmds.c
> > +++ b/qemu-io-cmds.c
> > @@ -1712,6 +1712,150 @@ static const cmdinfo_t flush_cmd =3D {
> >      .oneline    =3D "flush all in-core file state to disk",
> >  };
> >
> > +static inline int64_t tosector(int64_t bytes)
> > +{
> > +    return bytes >> BDRV_SECTOR_BITS;
> > +}
> > +
> > +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    int ret;
> > +    int64_t offset;
> > +    unsigned int nr_zones;
> > +
> > +    ++optind;
> > +    offset =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    nr_zones =3D cvtnum(argv[optind]);
> > +
> > +    g_autofree BlockZoneDescriptor *zones =3D NULL;
> > +    zones =3D g_new(BlockZoneDescriptor, nr_zones);
> > +    ret =3D blk_zone_report(blk, offset, &nr_zones, zones);
> > +    if (ret < 0) {
> > +        printf("zone report failed: %s\n", strerror(-ret));
> > +    } else {
> > +        for (int i =3D 0; i < nr_zones; ++i) {
> > +            printf("start: 0x%" PRIx64 ", len 0x%" PRIx64 ", "
> > +                   "cap"" 0x%" PRIx64 ", wptr 0x%" PRIx64 ", "
> > +                   "zcond:%u, [type: %u]\n",
> > +                    tosector(zones[i].start), tosector(zones[i].length=
),
> > +                    tosector(zones[i].cap), tosector(zones[i].wp),
> > +                    zones[i].state, zones[i].type);
> > +        }
> > +    }
> > +    return ret;
> > +}
> > +
> > +static const cmdinfo_t zone_report_cmd =3D {
> > +    .name =3D "zone_report",
> > +    .altname =3D "zrp",
> > +    .cfunc =3D zone_report_f,
> > +    .argmin =3D 2,
> > +    .argmax =3D 2,
> > +    .args =3D "offset number",
> > +    .oneline =3D "report zone information",
> > +};
> > +
> > +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    int ret;
> > +    int64_t offset, len;
> > +    ++optind;
> > +    offset =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    len =3D cvtnum(argv[optind]);
> > +    ret =3D blk_zone_mgmt(blk, BLK_ZO_OPEN, offset, len);
> > +    if (ret < 0) {
> > +        printf("zone open failed: %s\n", strerror(-ret));
> > +    }
> > +    return ret;
> > +}
> > +
> > +static const cmdinfo_t zone_open_cmd =3D {
> > +    .name =3D "zone_open",
> > +    .altname =3D "zo",
> > +    .cfunc =3D zone_open_f,
> > +    .argmin =3D 2,
> > +    .argmax =3D 2,
> > +    .args =3D "offset len",
> > +    .oneline =3D "explicit open a range of zones in zone block device"=
,
> > +};
> > +
> > +static int zone_close_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    int ret;
> > +    int64_t offset, len;
> > +    ++optind;
> > +    offset =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    len =3D cvtnum(argv[optind]);
> > +    ret =3D blk_zone_mgmt(blk, BLK_ZO_CLOSE, offset, len);
> > +    if (ret < 0) {
> > +        printf("zone close failed: %s\n", strerror(-ret));
> > +    }
> > +    return ret;
> > +}
> > +
> > +static const cmdinfo_t zone_close_cmd =3D {
> > +    .name =3D "zone_close",
> > +    .altname =3D "zc",
> > +    .cfunc =3D zone_close_f,
> > +    .argmin =3D 2,
> > +    .argmax =3D 2,
> > +    .args =3D "offset len",
> > +    .oneline =3D "close a range of zones in zone block device",
> > +};
> > +
> > +static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    int ret;
> > +    int64_t offset, len;
> > +    ++optind;
> > +    offset =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    len =3D cvtnum(argv[optind]);
> > +    ret =3D blk_zone_mgmt(blk, BLK_ZO_FINISH, offset, len);
> > +    if (ret < 0) {
> > +        printf("zone finish failed: %s\n", strerror(-ret));
> > +    }
> > +    return ret;
> > +}
> > +
> > +static const cmdinfo_t zone_finish_cmd =3D {
> > +    .name =3D "zone_finish",
> > +    .altname =3D "zf",
> > +    .cfunc =3D zone_finish_f,
> > +    .argmin =3D 2,
> > +    .argmax =3D 2,
> > +    .args =3D "offset len",
> > +    .oneline =3D "finish a range of zones in zone block device",
> > +};
> > +
> > +static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    int ret;
> > +    int64_t offset, len;
> > +    ++optind;
> > +    offset =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    len =3D cvtnum(argv[optind]);
> > +    ret =3D blk_zone_mgmt(blk, BLK_ZO_RESET, offset, len);
> > +    if (ret < 0) {
> > +        printf("zone reset failed: %s\n", strerror(-ret));
> > +    }
> > +    return ret;
> > +}
> > +
> > +static const cmdinfo_t zone_reset_cmd =3D {
> > +    .name =3D "zone_reset",
> > +    .altname =3D "zrs",
> > +    .cfunc =3D zone_reset_f,
> > +    .argmin =3D 2,
> > +    .argmax =3D 2,
> > +    .args =3D "offset len",
> > +    .oneline =3D "reset a zone write pointer in zone block device",
> > +};
> > +
> >  static int truncate_f(BlockBackend *blk, int argc, char **argv);
> >  static const cmdinfo_t truncate_cmd =3D {
> >      .name       =3D "truncate",
> > @@ -2504,6 +2648,11 @@ static void __attribute((constructor)) init_qemu=
io_commands(void)
> >      qemuio_add_command(&aio_write_cmd);
> >      qemuio_add_command(&aio_flush_cmd);
> >      qemuio_add_command(&flush_cmd);
> > +    qemuio_add_command(&zone_report_cmd);
> > +    qemuio_add_command(&zone_open_cmd);
> > +    qemuio_add_command(&zone_close_cmd);
> > +    qemuio_add_command(&zone_finish_cmd);
> > +    qemuio_add_command(&zone_reset_cmd);
> >      qemuio_add_command(&truncate_cmd);
> >      qemuio_add_command(&length_cmd);
> >      qemuio_add_command(&info_cmd);
> > --
> > 2.38.1
> >
> >

