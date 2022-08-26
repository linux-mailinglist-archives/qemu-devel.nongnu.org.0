Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1805A27D1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 14:27:28 +0200 (CEST)
Received: from localhost ([::1]:39162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRYQp-0000af-Kg
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 08:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRYKi-00045K-5r; Fri, 26 Aug 2022 08:21:12 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:33757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRYKd-0000f1-68; Fri, 26 Aug 2022 08:21:07 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-32a09b909f6so32246167b3.0; 
 Fri, 26 Aug 2022 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=Ocb9tnsiQhXZ1zPef4tZAB6lBdvzHZU1WLZkOMexTTM=;
 b=piYlIT/gwQdUBw0GSE9wWdn7FUefP+fyDoIPW+VCGT5ydL3HN3QEM1ZAzrQZnTMVfR
 yWkV0ldvJ/eo6aNUXhImpnB0K1c2GWgZorHKUU0Na9NOw0UYmRccbVKX2KvU/xIJhZfO
 9uAT2sqX+nrhv1ln5zpb6ZRsv5LgRRL6URtXCLR5yUPCa2WnD3Dx14yt+6B2DcTzjB7J
 x3xt3nsIQLX3GXiTug3cvOePZauDCd9MDPtGNTeHmynES8hJtgj5ZfBPRUpFOjjGOYZH
 41RhcbTU12L97aLlXWucW3e0IPBOc5yshNmAeXR4J4a51xx9gjybL+sTXVddqJn0cxmE
 h49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=Ocb9tnsiQhXZ1zPef4tZAB6lBdvzHZU1WLZkOMexTTM=;
 b=nGGk381G/wofF+EsAeOhdi+mW/z2a9ToOeef37SK5nFmxA4a/WtmM64x8D1PtmB49p
 rT0THuefI16xV7QzUQDUmVgvvUR0cgmbeyuQ5QXGeMIPdvlTrXDJTukMslQ03y/a3jma
 B3hcCi37FnIhZqU6QaGwi8G3Hs1OSdzclw2+kxK3Qn/h5+yULF+JKhYltLuP7KMdN7l7
 FTk3gWk5N6C1RzYF8jDqpFLqGVsJOVjNIHdqaPi++88CzwfPP/84wQeDPnSG+zsepPFD
 I7kLko8uPtnwoA4N8u6+JxcFFqAMOIN+5VjDpAvINExkaHHtv5meH+fx/0U8uWx7QoGU
 JBUw==
X-Gm-Message-State: ACgBeo253ZUw1yKysTVCrIzv5JyTVY/hCjO0R3JRU6UWd1TaDaXQmMBX
 lEavd1eUnNPd6fYWnIjOh6QXcx2mCD4lfWrhzOk=
X-Google-Smtp-Source: AA6agR5deQuWnqPkVL6D5Ccd7TQmjbY4/WIdfo0p2i6JI+j2FmQL4KEsEyvIeY61qDAm9u98YJodLCYe5+18W4a+HYs=
X-Received: by 2002:a81:7382:0:b0:328:306f:26d2 with SMTP id
 o124-20020a817382000000b00328306f26d2mr8461269ywc.486.1661516460824; Fri, 26
 Aug 2022 05:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-5-faithilikerun@gmail.com>
 <b9046615-9f85-5394-6f9b-2f892c757555@opensource.wdc.com>
In-Reply-To: <b9046615-9f85-5394-6f9b-2f892c757555@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Fri, 26 Aug 2022 20:20:49 +0800
Message-ID: <CAAAx-8LtEhkpQRUDTCzcuAvGLXD0ZxY+mFGism1Z2rhWZzvyng@mail.gmail.com>
Subject: Re: [PATCH v7 4/8] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Fam Zheng <fam@euphon.net>, 
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x112e.google.com
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

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B48=
=E6=9C=8817=E6=97=A5=E5=91=A8=E4=B8=89 01:50=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2022/08/15 23:25, Sam Li wrote:
> > By adding zone management operations in BlockDriver, storage controller
> > emulation can use the new block layer APIs including Report Zone and
> > four zone management operations (open, close, finish, reset).
> >
> > Add zoned storage commands of the device: zone_report(zrp), zone_open(z=
o),
> > zone_close(zc), zone_reset(zrs), zone_finish(zf).
> >
> > For example, to test zone_report, use following command:
> > $ ./build/qemu-io --image-opts driver=3Dzoned_host_device, filename=3D/=
dev/nullb0
> > -c "zrp offset nr_zones"
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > ---
> >  block/block-backend.c             |  50 +++++
> >  block/file-posix.c                | 341 +++++++++++++++++++++++++++++-
> >  block/io.c                        |  41 ++++
> >  include/block/block-common.h      |   1 -
> >  include/block/block-io.h          |  13 ++
> >  include/block/block_int-common.h  |  22 +-
> >  include/block/raw-aio.h           |   6 +-
> >  include/sysemu/block-backend-io.h |   6 +
> >  meson.build                       |   1 +
> >  qapi/block-core.json              |   8 +-
> >  qemu-io-cmds.c                    | 143 +++++++++++++
> >  11 files changed, 625 insertions(+), 7 deletions(-)
> >
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index d4a5df2ac2..fc639b0cd7 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -1775,6 +1775,56 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
> >      return ret;
> >  }
> >
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
> > + * offset is the starting zone specified as a sector offset.
> > + * len is the maximum number of sectors the command should operate on.
>
> You should mention that len should be zone size aligned. Also, for comple=
tness,
> add a short description of the op argument too ?
>
> > + */
> > +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> > +        int64_t offset, int64_t len)
> > +{
> > +    int ret;
> > +    IO_CODE();
> > +
> > +    ret =3D blk_check_byte_request(blk, offset, len);
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +    blk_inc_in_flight(blk);
> > +    blk_wait_while_drained(blk);
> > +    if (!blk_is_available(blk)) {
> > +        blk_dec_in_flight(blk);
> > +        return -ENOMEDIUM;
> > +    }
> > +    ret =3D bdrv_co_zone_mgmt(blk_bs(blk), op, offset, len);
> > +    blk_dec_in_flight(blk);
> > +    return ret;
> > +}
> > +
> >  void blk_drain(BlockBackend *blk)
> >  {
> >      BlockDriverState *bs =3D blk_bs(blk);
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 727389488c..29f67082d9 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -67,6 +67,9 @@
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
> > +            unsigned long ioctl_op;
>
> May be clarify this field usage by calling it zone_op ?
>
> > +        } zone_mgmt;
> >      };
> >  } RawPosixAIOData;
> >
> > @@ -1328,7 +1338,7 @@ static void raw_refresh_limits(BlockDriverState *=
bs, Error **errp)
> >  #endif
> >
> >      if (bs->sg || S_ISBLK(st.st_mode)) {
> > -        int ret =3D hdev_get_max_hw_transfer(s->fd, &st);
> > +        ret =3D hdev_get_max_hw_transfer(s->fd, &st);
> >
> >          if (ret > 0 && ret <=3D BDRV_REQUEST_MAX_BYTES) {
> >              bs->bl.max_hw_transfer =3D ret;
> > @@ -1340,11 +1350,32 @@ static void raw_refresh_limits(BlockDriverState=
 *bs, Error **errp)
> >          }
> >      }
> >
> > -    ret =3D get_sysfs_zoned_model(s->fd, &st, &zoned);
> > +    ret =3D get_sysfs_zoned_model(&st, &zoned);
> >      if (ret < 0) {
> >          zoned =3D BLK_Z_NONE;
> >      }
> >      bs->bl.zoned =3D zoned;
> > +    if (zoned !=3D BLK_Z_NONE) {
> > +        ret =3D get_sysfs_long_val(&st, "chunk_sectors");
> > +        if (ret > 0) {
> > +            bs->bl.zone_sectors =3D ret;
> > +        }
> > +
> > +        ret =3D get_sysfs_long_val(&st, "zone_append_max_bytes");
> > +        if (ret > 0) {
> > +            bs->bl.zone_append_max_bytes =3D ret;
> > +        }
> > +
> > +        ret =3D get_sysfs_long_val(&st, "max_open_zones");
> > +        if (ret > 0) {
>
> The value can be 0, so this should be "if (ret >=3D 0) {".
>
> > +            bs->bl.max_open_zones =3D ret;
> > +        }
> > +
> > +        ret =3D get_sysfs_long_val(&st, "max_active_zones");
> > +        if (ret > 0) {
>
> The value can be 0, so this should be "if (ret >=3D 0) {".
>
> > +            bs->bl.max_active_zones =3D ret;
> > +        }
> > +    }
> >  }
> >
> >  static int check_for_dasd(int fd)
> > @@ -1839,6 +1870,134 @@ static off_t copy_file_range(int in_fd, off_t *=
in_off, int out_fd,
> >  }
> >  #endif
> >
> > +/*
> > + * parse_zone - Fill a zone descriptor
> > + */
> > +#if defined(CONFIG_BLKZONED)
> > +static inline void parse_zone(struct BlockZoneDescriptor *zone,
> > +                              struct blk_zone *blkz) {
> > +    zone->start =3D blkz->start;
> > +    zone->length =3D blkz->len;
> > +    zone->cap =3D blkz->capacity;
> > +    zone->wp =3D blkz->wp;
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
> > +        error_report("Invalid zone type: 0x%x", blkz->type);
> > +    }
> > +
> > +    switch (blkz->cond) {
> > +    case BLK_ZONE_COND_NOT_WP:
> > +        zone->cond =3D BLK_ZS_NOT_WP;
> > +        break;
> > +    case BLK_ZONE_COND_EMPTY:
> > +        zone->cond =3D BLK_ZS_EMPTY;
> > +        break;
> > +    case BLK_ZONE_COND_IMP_OPEN:
> > +        zone->cond =3DBLK_ZS_IOPEN;
> > +        break;
> > +    case BLK_ZONE_COND_EXP_OPEN:
> > +        zone->cond =3D BLK_ZS_EOPEN;
> > +        break;
> > +    case BLK_ZONE_COND_CLOSED:
> > +        zone->cond =3D BLK_ZS_CLOSED;
> > +        break;
> > +    case BLK_ZONE_COND_READONLY:
> > +        zone->cond =3D BLK_ZS_RDONLY;
> > +        break;
> > +    case BLK_ZONE_COND_FULL:
> > +        zone->cond =3D BLK_ZS_FULL;
> > +        break;
> > +    case BLK_ZONE_COND_OFFLINE:
> > +        zone->cond =3D BLK_ZS_OFFLINE;
> > +        break;
> > +    default:
> > +        error_report("Invalid zone condition 0x%x", blkz->cond);
> > +    }
> > +}
> > +#endif
> > +
> > +static int handle_aiocb_zone_report(void *opaque) {
> > +#if defined(CONFIG_BLKZONED)
> > +    RawPosixAIOData *aiocb =3D opaque;
> > +    int fd =3D aiocb->aio_fildes;
> > +    unsigned int *nr_zones =3D aiocb->zone_report.nr_zones;
> > +    BlockZoneDescriptor *zones =3D aiocb->zone_report.zones;
> > +    int64_t sector =3D aiocb->aio_offset;
> > +
> > +    struct blk_zone *blkz;
> > +    int64_t rep_size;
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
> > +        ret =3D ioctl(fd, BLKREPORTZONE, rep);
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
> > +            parse_zone(&zones[n], &blkz[i]);
> > +            /* The next report should start after the last zone report=
ed */
> > +            sector =3D blkz[i].start + blkz[i].len;
> > +        }
> > +    }
> > +
> > +    *nr_zones =3D n;
> > +    return 0;
> > +#else
> > +    return -ENOTSUP;
> > +#endif
> > +}
> > +
> > +static int handle_aiocb_zone_mgmt(void *opaque) {
> > +#if defined(CONFIG_BLKZONED)
> > +    RawPosixAIOData *aiocb =3D opaque;
> > +    int fd =3D aiocb->aio_fildes;
> > +    int64_t sector =3D aiocb->aio_offset;
> > +    int64_t nr_sectors =3D aiocb->aio_nbytes;
> > +    unsigned long ioctl_op =3D aiocb->zone_mgmt.ioctl_op;
>
> Nit: I do not think these variables are very useful. You could reference
> directly the aiocb fields in the code below.
>
> > +    struct blk_zone_range range;
> > +    int ret;
> > +
> > +    /* Execute the operation */
> > +    range.sector =3D sector;
> > +    range.nr_sectors =3D nr_sectors;
> > +    do {
> > +        ret =3D ioctl(fd, ioctl_op, &range);
> > +    } while (ret !=3D 0 && errno =3D=3D EINTR);
> > +
> > +    return ret;
> > +#else
> > +    return -ENOTSUP;
> > +#endif
> > +}
> > +
> >  static int handle_aiocb_copy_range(void *opaque)
> >  {
> >      RawPosixAIOData *aiocb =3D opaque;
> > @@ -3011,6 +3170,124 @@ static void raw_account_discard(BDRVRawState *s=
, uint64_t nbytes, int ret)
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
> > +                                           unsigned int *nr_zones,
> > +                                           BlockZoneDescriptor *zones)=
 {
> > +#if defined(CONFIG_BLKZONED)
> > +    BDRVRawState *s =3D bs->opaque;
> > +    RawPosixAIOData acb;
> > +
> > +    acb =3D (RawPosixAIOData) {
> > +        .bs         =3D bs,
> > +        .aio_fildes =3D s->fd,
> > +        .aio_type   =3D QEMU_AIO_ZONE_REPORT,
> > +        /* zoned block devices use 512-byte sectors */
> > +        .aio_offset =3D offset / 512,
>
> This conversion from bytes to 512B sectors would be better placed in
> handle_aiocb_zone_report(). Doing so, all the API uses bytes, similarly t=
o other
> operations and the conversion to 512B sectors only done for Linux specifi=
c ioctl
> code.
>
> > +        .zone_report    =3D {
> > +                .nr_zones       =3D nr_zones,
> > +                .zones          =3D zones,
> > +        },
> > +    };
> > +
> > +    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
> > +#else
> > +    return -ENOTSUP;
> > +#endif
> > +}
> > +
> > +/*
> > + * zone management operations - Execute an operation on a zone
> > + */
> > +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZo=
neOp op,
> > +        int64_t offset, int64_t len) {
> > +#if defined(CONFIG_BLKZONED)
> > +    BDRVRawState *s =3D bs->opaque;
> > +    RawPosixAIOData acb;
> > +    int64_t zone_sector, zone_sector_mask;
> > +    const char *ioctl_name;
> > +    unsigned long ioctl_op;
> > +    int ret;
> > +
> > +    struct stat st;
> > +    if (fstat(s->fd, &st) < 0) {
> > +        ret =3D -errno;
> > +        return ret;
> > +    }
> > +    zone_sector =3D get_sysfs_long_val(&st, "chunk_sectors");
> > +    if (zone_sector < 0) {
> > +        error_report("invalid zone sector size %" PRId64 "", zone_sect=
or);
> > +        return -EINVAL;
> > +    }
>
> You already got this value in bs->bl.zone_sectors in raw_refresh_limits()=
. So I
> you should not need to read it again from sysfs.
>
> > +
> > +    zone_sector_mask =3D zone_sector - 1;
> > +    if (offset & zone_sector_mask) {
> > +        error_report("sector offset %" PRId64 " is not aligned to zone=
 size "
> > +                     "%" PRId64 "", offset, zone_sector);
> > +        return -EINVAL;
> > +    }
> > +
> > +    if (len & zone_sector_mask) {
> > +        error_report("number of sectors %" PRId64 " is not aligned to =
zone size"
> > +                      " %" PRId64 "", len, zone_sector);
> > +        return -EINVAL;
> > +    }
> > +
> > +    switch (op) {
> > +    case BLK_ZO_OPEN:
> > +        ioctl_name =3D "BLKOPENZONE";
> > +        ioctl_op =3D BLKOPENZONE;
> > +        break;
> > +    case BLK_ZO_CLOSE:
> > +        ioctl_name =3D "BLKCLOSEZONE";
> > +        ioctl_op =3D BLKCLOSEZONE;
> > +        break;
> > +    case BLK_ZO_FINISH:
> > +        ioctl_name =3D "BLKFINISHZONE";
> > +        ioctl_op =3D BLKFINISHZONE;
> > +        break;
> > +    case BLK_ZO_RESET:
> > +        ioctl_name =3D "BLKRESETZONE";
> > +        ioctl_op =3D BLKRESETZONE;
> > +        break;
> > +    default:
> > +        error_report("Invalid zone operation 0x%x", op);
> > +        return -EINVAL;
> > +    }
> > +
> > +    acb =3D (RawPosixAIOData) {
> > +        .bs             =3D bs,
> > +        .aio_fildes     =3D s->fd,
> > +        .aio_type       =3D QEMU_AIO_ZONE_MGMT,
> > +        .aio_offset     =3D offset,
> > +        .aio_nbytes     =3D len,
>
> Are these 2 values in bytes or in 512B sectors ? Looking at
> handle_aiocb_zone_mgmt(), it looks like 512B sectors. So where is the con=
version
> done from bytes ?

They are both in number of sectors so it doesn't need conversion.

>
> > +        .zone_mgmt  =3D {
> > +                .ioctl_op =3D ioctl_op,
> > +        },
> > +    };
> > +
> > +    ret =3D raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> > +    if (ret !=3D 0) {
> > +        error_report("ioctl %s failed %d", ioctl_name, errno);
> > +        return -errno;
> > +    }
> > +
> > +    return ret;
> > +#else
> > +    return -ENOTSUP;
> > +#endif
> > +}
> > +
> >  static coroutine_fn int
> >  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
> >                  bool blkdev)
> > @@ -3511,6 +3788,14 @@ static void hdev_parse_filename(const char *file=
name, QDict *options,
> >      bdrv_parse_filename_strip_prefix(filename, "host_device:", options=
);
> >  }
> >
> > +#if defined(CONFIG_BLKZONED)
> > +static void zoned_host_device_parse_filename(const char *filename, QDi=
ct *options,
> > +                                Error **errp)
> > +{
> > +    bdrv_parse_filename_strip_prefix(filename, "zoned_host_device:", o=
ptions);
> > +}
> > +#endif
> > +
> >  static bool hdev_is_sg(BlockDriverState *bs)
> >  {
> >
> > @@ -3741,6 +4026,55 @@ static BlockDriver bdrv_host_device =3D {
> >  #endif
> >  };
> >
> > +#if defined(CONFIG_BLKZONED)
> > +static BlockDriver bdrv_zoned_host_device =3D {
> > +        .format_name =3D "zoned_host_device",
> > +        .protocol_name =3D "zoned_host_device",
> > +        .instance_size =3D sizeof(BDRVRawState),
> > +        .bdrv_needs_filename =3D true,
> > +        .bdrv_probe_device  =3D hdev_probe_device,
> > +        .bdrv_parse_filename =3D zoned_host_device_parse_filename,
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
> > +#endif
> > +
> >  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_ke=
rnel__)
> >  static void cdrom_parse_filename(const char *filename, QDict *options,
> >                                   Error **errp)
> > @@ -4001,6 +4335,9 @@ static void bdrv_file_init(void)
> >      bdrv_register(&bdrv_file);
> >  #if defined(HAVE_HOST_BLOCK_DEVICE)
> >      bdrv_register(&bdrv_host_device);
> > +#if defined(CONFIG_BLKZONED)
> > +    bdrv_register(&bdrv_zoned_host_device);
> > +#endif
> >  #ifdef __linux__
> >      bdrv_register(&bdrv_host_cdrom);
> >  #endif
> > diff --git a/block/io.c b/block/io.c
> > index 0a8cbefe86..de9ec1d740 100644
> > --- a/block/io.c
> > +++ b/block/io.c
> > @@ -3198,6 +3198,47 @@ out:
> >      return co.ret;
> >  }
> >
> > +int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
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
> > +        co.ret =3D -ENOTSUP;
> > +        goto out;
> > +    }
> > +    co.ret =3D drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
> > +out:
> > +    bdrv_dec_in_flight(bs);
> > +    return co.ret;
> > +}
> > +
> > +int bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
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
> > diff --git a/include/block/block-common.h b/include/block/block-common.=
h
> > index 36bd0e480e..5102fa6858 100644
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
> > diff --git a/include/block/block-io.h b/include/block/block-io.h
> > index fd25ffa9be..55ad261e16 100644
> > --- a/include/block/block-io.h
> > +++ b/include/block/block-io.h
> > @@ -88,6 +88,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, voi=
d *buf);
> >  /* Ensure contents are flushed to disk.  */
> >  int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
> >
> > +/* Report zone information of zone block device. */
> > +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t off=
set,
> > +                                     unsigned int *nr_zones,
> > +                                     BlockZoneDescriptor *zones);
> > +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp o=
p,
> > +                                   int64_t offset, int64_t len);
> > +
> >  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
> >  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
> >  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> > @@ -297,6 +304,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVec=
tor *qiov, int64_t pos);
> >  int generated_co_wrapper
> >  bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t =
pos);
> >
> > +int generated_co_wrapper
> > +blk_zone_report(BlockBackend *blk, int64_t offset, unsigned int *nr_zo=
nes,
> > +                BlockZoneDescriptor *zones);
> > +int generated_co_wrapper
> > +blk_zone_mgmt(BlockBackend *blk, BlockZoneOp op, int64_t offset, int64=
_t len);
> > +
> >  /**
> >   * bdrv_parent_drained_begin_single:
> >   *
> > diff --git a/include/block/block_int-common.h b/include/block/block_int=
-common.h
> > index 7f7863cc9e..de44c7b6f4 100644
> > --- a/include/block/block_int-common.h
> > +++ b/include/block/block_int-common.h
> > @@ -94,7 +94,6 @@ typedef struct BdrvTrackedRequest {
> >      struct BdrvTrackedRequest *waiting_for;
> >  } BdrvTrackedRequest;
> >
> > -
> >  struct BlockDriver {
> >      /*
> >       * These fields are initialized when this object is created,
> > @@ -691,6 +690,12 @@ struct BlockDriver {
> >                                            QEMUIOVector *qiov,
> >                                            int64_t pos);
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
> > @@ -828,6 +833,21 @@ typedef struct BlockLimits {
> >
> >      /* device zone model */
> >      BlockZoneModel zoned;
> > +
> > +    /* zone size expressed in 512-byte sectors */
> > +    uint32_t zone_sectors;
> > +
> > +    /* total number of zones */
> > +    unsigned int nr_zones;
> > +
> > +    /* maximum size in bytes of a zone append write operation */
> > +    int64_t zone_append_max_bytes;
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
> > index 21fc10c4c9..3d26929cdd 100644
> > --- a/include/block/raw-aio.h
> > +++ b/include/block/raw-aio.h
> > @@ -29,6 +29,8 @@
> >  #define QEMU_AIO_WRITE_ZEROES 0x0020
> >  #define QEMU_AIO_COPY_RANGE   0x0040
> >  #define QEMU_AIO_TRUNCATE     0x0080
> > +#define QEMU_AIO_ZONE_REPORT  0x0100
> > +#define QEMU_AIO_ZONE_MGMT    0x0200
> >  #define QEMU_AIO_TYPE_MASK \
> >          (QEMU_AIO_READ | \
> >           QEMU_AIO_WRITE | \
> > @@ -37,7 +39,9 @@
> >           QEMU_AIO_DISCARD | \
> >           QEMU_AIO_WRITE_ZEROES | \
> >           QEMU_AIO_COPY_RANGE | \
> > -         QEMU_AIO_TRUNCATE)
> > +         QEMU_AIO_TRUNCATE  | \
> > +         QEMU_AIO_ZONE_REPORT | \
> > +         QEMU_AIO_ZONE_MGMT)
> >
> >  /* AIO flags */
> >  #define QEMU_AIO_MISALIGNED   0x1000
> > diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-b=
ackend-io.h
> > index 50f5aa2e07..6e7df1d93b 100644
> > --- a/include/sysemu/block-backend-io.h
> > +++ b/include/sysemu/block-backend-io.h
> > @@ -156,6 +156,12 @@ int generated_co_wrapper blk_pwrite_zeroes(BlockBa=
ckend *blk, int64_t offset,
> >  int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offse=
t,
> >                                        int64_t bytes, BdrvRequestFlags =
flags);
> >
> > +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> > +                                    unsigned int *nr_zones,
> > +                                    BlockZoneDescriptor *zones);
> > +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> > +                                  int64_t offset, int64_t len);
> > +
> >  int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offse=
t,
> >                                        int64_t bytes);
> >  int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
> > diff --git a/meson.build b/meson.build
> > index 294e9a8f32..c3219b0e87 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1883,6 +1883,7 @@ config_host_data.set('CONFIG_REPLICATION', get_op=
tion('live_block_migration').al
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
> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > index 2173e7734a..c6bbb7a037 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -2942,6 +2942,7 @@
> >  # @compress: Since 5.0
> >  # @copy-before-write: Since 6.2
> >  # @snapshot-access: Since 7.0
> > +# @zoned_host_device: Since 7.2
> >  #
> >  # Since: 2.9
> >  ##
> > @@ -2955,7 +2956,8 @@
> >              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'para=
llels',
> >              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'r=
bd',
> >              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> > -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ]=
 }
> > +            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat',
> > +            { 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' } ]=
 }
> >
> >  ##
> >  # @BlockdevOptionsFile:
> > @@ -4329,7 +4331,9 @@
> >        'vhdx':       'BlockdevOptionsGenericFormat',
> >        'vmdk':       'BlockdevOptionsGenericCOWFormat',
> >        'vpc':        'BlockdevOptionsGenericFormat',
> > -      'vvfat':      'BlockdevOptionsVVFAT'
> > +      'vvfat':      'BlockdevOptionsVVFAT',
> > +      'zoned_host_device': { 'type': 'BlockdevOptionsFile',
> > +                             'if': 'CONFIG_BLKZONED' }
> >    } }
> >
> >  ##
> > diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> > index 952dc940f1..687c3a624c 100644
> > --- a/qemu-io-cmds.c
> > +++ b/qemu-io-cmds.c
> > @@ -1712,6 +1712,144 @@ static const cmdinfo_t flush_cmd =3D {
> >      .oneline    =3D "flush all in-core file state to disk",
> >  };
> >
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
> > +                   "cap"" 0x%" PRIx64 ",wptr 0x%" PRIx64 ", "
> > +                   "zcond:%u, [type: %u]\n",
> > +                   zones[i].start, zones[i].length, zones[i].cap, zone=
s[i].wp,
> > +                   zones[i].cond, zones[i].type);
> > +        }
> > +    }
> > +    return ret;
> > +}
> > +
> > +static const cmdinfo_t zone_report_cmd =3D {
> > +        .name =3D "zone_report",
> > +        .altname =3D "zrp",
> > +        .cfunc =3D zone_report_f,
> > +        .argmin =3D 2,
> > +        .argmax =3D 2,
> > +        .args =3D "offset number",
> > +        .oneline =3D "report zone information",
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
> > +        .name =3D "zone_open",
> > +        .altname =3D "zo",
> > +        .cfunc =3D zone_open_f,
> > +        .argmin =3D 2,
> > +        .argmax =3D 2,
> > +        .args =3D "offset len",
> > +        .oneline =3D "explicit open a range of zones in zone block dev=
ice",
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
> > +        .name =3D "zone_close",
> > +        .altname =3D "zc",
> > +        .cfunc =3D zone_close_f,
> > +        .argmin =3D 2,
> > +        .argmax =3D 2,
> > +        .args =3D "offset len",
> > +        .oneline =3D "close a range of zones in zone block device",
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
> > +        .name =3D "zone_finish",
> > +        .altname =3D "zf",
> > +        .cfunc =3D zone_finish_f,
> > +        .argmin =3D 2,
> > +        .argmax =3D 2,
> > +        .args =3D "offset len",
> > +        .oneline =3D "finish a range of zones in zone block device",
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
> > +        .name =3D "zone_reset",
> > +        .altname =3D "zrs",
> > +        .cfunc =3D zone_reset_f,
> > +        .argmin =3D 2,
> > +        .argmax =3D 2,
> > +        .args =3D "offset len",
> > +        .oneline =3D "reset a zone write pointer in zone block device"=
,
> > +};
> > +
> >  static int truncate_f(BlockBackend *blk, int argc, char **argv);
> >  static const cmdinfo_t truncate_cmd =3D {
> >      .name       =3D "truncate",
> > @@ -2504,6 +2642,11 @@ static void __attribute((constructor)) init_qemu=
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
>
>
> --
> Damien Le Moal
> Western Digital Research

