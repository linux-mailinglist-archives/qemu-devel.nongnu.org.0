Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E9D58BE62
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 02:08:00 +0200 (CEST)
Received: from localhost ([::1]:48582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKqJL-0004dr-9E
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 20:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oKq4J-0007oQ-Fr; Sun, 07 Aug 2022 19:52:27 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:43610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oKq4G-0002M9-7r; Sun, 07 Aug 2022 19:52:27 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-328303afa6eso64963407b3.10; 
 Sun, 07 Aug 2022 16:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=uVMDTWsN4/r4G6qusw/GFqMVVGwZmi0aim+GJtYhXQs=;
 b=MH0hRPRt2uIyLnqa7/LDljLbbb57Ah8mKb4cgTrkb8+zG2Xb+ps+kyJPXu4LLZbJao
 2d86rRONH+xFzAyzOxlZ+4HiPEqdEz6MlDjf8CinJGQTN9ut+1aJvAEJojoCGqmUTAZX
 64ITy2U2ey07CQYvtt00HqMK7xqxs5dvMKKe3fstRDdX7JJquzOz6jAEB/W7rvWk7AOz
 wDbydK52Q5KaEBtva+jSLJO7i5cb3bLUKIuXcRiO8rf+V0dO0I6Auu3IdtfjTzDEOFJw
 pNMBmVedWxfruk8MppoCYnH1SoiJT+ja/lwoG2gQ9W6fH6uJbxcSALcQYfUJrAYToTir
 Cuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=uVMDTWsN4/r4G6qusw/GFqMVVGwZmi0aim+GJtYhXQs=;
 b=0Efl7hrRx6Rn9BNnXALX9DXomSzOmxog3N5Pg1R41rj40JD2wqLxfAk2P4yCuhyq+h
 1iek+FxSuryfc7fsDZoOtqxkRszXnkgoqRDqQ2Z97IQrZjPOrzOnFRYG79SJaKoCzKK3
 puGo/qpDYErDR96ph/SOWzGmYfATeCgruyPCvvGJXyZY8lAbgu2KLIIfhC73PpewPBYz
 /YSrUpriGSa0pLAkE1cJFWdu47RrGT9TjoqYyxKIFh9O7BR8Vs2ZOj1+YpxzK0VSoXkY
 xHooAEDeGuBbZoJrdZDkKyhnjUP49lJHSorx5i6VMnfvGHQcwSu5Jn5+13XPxmBg3+cz
 /LTQ==
X-Gm-Message-State: ACgBeo1CHBC23eaWtdqkuMMYbyhU4kg60KmAbaqOaNw5rccxOEVW1q1g
 hNqse64TKwalv+8hL8gTadwtsNxzI/sv4SR8wU7Jsg1v3gQ=
X-Google-Smtp-Source: AA6agR5yAgaqC1TTe8tf2YmTtLlbDq4yTLLODTdSap2k3zevxpAoeV8eyoqRkc+QaZcFLnl9yF4sxjsyMVgwPp7kQgA=
X-Received: by 2002:a0d:ca56:0:b0:328:303a:dd61 with SMTP id
 m83-20020a0dca56000000b00328303add61mr15965321ywd.267.1659916340936; Sun, 07
 Aug 2022 16:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220805075751.77499-1-faithilikerun@gmail.com>
 <20220805075751.77499-5-faithilikerun@gmail.com>
In-Reply-To: <20220805075751.77499-5-faithilikerun@gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 8 Aug 2022 07:52:09 +0800
Message-ID: <CAAAx-8JXSsC2qBpgNZHEKSEB+yjBrSn3yUZd1-4a=WRzNZVYOg@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
To: qemu-devel <qemu-devel@nongnu.org>
Cc: qemu block <qemu-block@nongnu.org>, Hannes Reinecke <hare@suse.de>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>
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

Sam Li <faithilikerun@gmail.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=885=E6=97=A5=
=E5=91=A8=E4=BA=94 15:58=E5=86=99=E9=81=93=EF=BC=9A
>
> By adding zone management operations in BlockDriver, storage controller
> emulation can use the new block layer APIs including Report Zone and
> four zone management operations (open, close, finish, reset).
>
> Add zoned storage commands of the device: zone_report(zrp), zone_open(zo)=
,
> zone_close(zc), zone_reset(zrs), zone_finish(zf).
>
> For example, to test zone_report, use following command:
> $ ./build/qemu-io --image-opts driver=3Dzoned_host_device, filename=3D/de=
v/nullb0
> -c "zrp offset nr_zones"
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
>  block/block-backend.c            |  50 +++++
>  block/coroutines.h               |   6 +
>  block/file-posix.c               | 315 ++++++++++++++++++++++++++++++-
>  block/io.c                       |  41 ++++
>  include/block/block-common.h     |   1 -
>  include/block/block-io.h         |  13 ++
>  include/block/block_int-common.h |  22 ++-
>  include/block/raw-aio.h          |   6 +-
>  meson.build                      |   1 +
>  qapi/block-core.json             |   8 +-
>  qemu-io-cmds.c                   | 144 ++++++++++++++
>  11 files changed, 601 insertions(+), 6 deletions(-)
>
> diff --git a/block/block-backend.c b/block/block-backend.c
> index d4a5df2ac2..fc639b0cd7 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1775,6 +1775,56 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
>      return ret;
>  }
>
> +/*
> + * Send a zone_report command.
> + * offset is a byte offset from the start of the device. No alignment
> + * required for offset.
> + * nr_zones represents IN maximum and OUT actual.
> + */
> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> +                                    unsigned int *nr_zones,
> +                                    BlockZoneDescriptor *zones)
> +{
> +    int ret;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk); /* increase before waiting */
> +    blk_wait_while_drained(blk);
> +    if (!blk_is_available(blk)) {
> +        blk_dec_in_flight(blk);
> +        return -ENOMEDIUM;
> +    }
> +    ret =3D bdrv_co_zone_report(blk_bs(blk), offset, nr_zones, zones);
> +    blk_dec_in_flight(blk);
> +    return ret;
> +}
> +
> +/*
> + * Send a zone_management command.
> + * offset is the starting zone specified as a sector offset.
> + * len is the maximum number of sectors the command should operate on.
> + */
> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +        int64_t offset, int64_t len)
> +{
> +    int ret;
> +    IO_CODE();
> +
> +    ret =3D blk_check_byte_request(blk, offset, len);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +    blk_inc_in_flight(blk);
> +    blk_wait_while_drained(blk);
> +    if (!blk_is_available(blk)) {
> +        blk_dec_in_flight(blk);
> +        return -ENOMEDIUM;
> +    }
> +    ret =3D bdrv_co_zone_mgmt(blk_bs(blk), op, offset, len);
> +    blk_dec_in_flight(blk);
> +    return ret;
> +}
> +
>  void blk_drain(BlockBackend *blk)
>  {
>      BlockDriverState *bs =3D blk_bs(blk);
> diff --git a/block/coroutines.h b/block/coroutines.h
> index 3a2bad564f..e3f62d94e5 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -63,6 +63,12 @@ nbd_co_do_establish_connection(BlockDriverState *bs, b=
ool blocking,
>                                 Error **errp);
>
>
> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> +                                    unsigned int *nr_zones,
> +                                    BlockZoneDescriptor *zones);
> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +                                  int64_t offset, int64_t len);
> +
>  /*
>   * "I/O or GS" API functions. These functions can run without
>   * the BQL, but only in one specific iothread/main loop.
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 4785203eea..2627431581 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -67,6 +67,9 @@
>  #include <sys/param.h>
>  #include <sys/syscall.h>
>  #include <sys/vfs.h>
> +#if defined(CONFIG_BLKZONED)
> +#include <linux/blkzoned.h>
> +#endif
>  #include <linux/cdrom.h>
>  #include <linux/fd.h>
>  #include <linux/fs.h>
> @@ -216,6 +219,13 @@ typedef struct RawPosixAIOData {
>              PreallocMode prealloc;
>              Error **errp;
>          } truncate;
> +        struct {
> +            unsigned int *nr_zones;
> +            BlockZoneDescriptor *zones;
> +        } zone_report;
> +        struct {
> +            BlockZoneOp op;
> +        } zone_mgmt;
>      };
>  } RawPosixAIOData;
>
> @@ -1369,7 +1379,7 @@ static void raw_refresh_limits(BlockDriverState *bs=
, Error **errp)
>  #endif
>
>      if (bs->sg || S_ISBLK(st.st_mode)) {
> -        int ret =3D hdev_get_max_hw_transfer(s->fd, &st);
> +        ret =3D hdev_get_max_hw_transfer(s->fd, &st);
>
>          if (ret > 0 && ret <=3D BDRV_REQUEST_MAX_BYTES) {
>              bs->bl.max_hw_transfer =3D ret;
> @@ -1386,6 +1396,27 @@ static void raw_refresh_limits(BlockDriverState *b=
s, Error **errp)
>          zoned =3D BLK_Z_NONE;
>      }
>      bs->bl.zoned =3D zoned;
> +    if (zoned !=3D BLK_Z_NONE) {
> +        ret =3D get_sysfs_long_val(s->fd, &st, "chunk_sectors");
> +        if (ret > 0) {
> +            bs->bl.zone_sectors =3D ret;
> +        }
> +
> +        ret =3D get_sysfs_long_val(s->fd, &st, "zone_append_max_bytes");
> +        if (ret > 0) {
> +            bs->bl.zone_append_max_bytes =3D ret;
> +        }
> +
> +        ret =3D get_sysfs_long_val(s->fd, &st, "max_open_zones");
> +        if (ret > 0) {
> +            bs->bl.max_open_zones =3D ret;
> +        }
> +
> +        ret =3D get_sysfs_long_val(s->fd, &st, "max_active_zones");
> +        if (ret > 0) {
> +            bs->bl.max_active_zones =3D ret;
> +        }
> +    }
>  }
>
>  static int check_for_dasd(int fd)
> @@ -1880,6 +1911,167 @@ static off_t copy_file_range(int in_fd, off_t *in=
_off, int out_fd,
>  }
>  #endif
>
> +/*
> + * parse_zone - Fill a zone descriptor
> + */
> +#if defined(CONFIG_BLKZONED)
> +static inline void parse_zone(struct BlockZoneDescriptor *zone,
> +                              struct blk_zone *blkz) {
> +    zone->start =3D blkz->start;
> +    zone->length =3D blkz->len;
> +    zone->cap =3D blkz->capacity;
> +    zone->wp =3D blkz->wp;
> +    zone->type =3D blkz->type;
> +
> +    switch (blkz->cond) {
> +    case BLK_ZONE_COND_NOT_WP:
> +        blkz->cond =3D BLK_ZS_NOT_WP;

Typo: it should be zone->cond. Same for the other zone states as below.


> +        break;
> +    case BLK_ZONE_COND_EMPTY:
> +        blkz->cond =3D BLK_ZS_EMPTY;
> +        break;
> +    case BLK_ZONE_COND_IMP_OPEN:
> +        blkz->cond =3DBLK_ZS_IOPEN;
> +        break;
> +    case BLK_ZONE_COND_EXP_OPEN:
> +        blkz->cond =3D BLK_ZS_EOPEN;
> +        break;
> +    case BLK_ZONE_COND_CLOSED:
> +        blkz->cond =3D BLK_ZS_CLOSED;
> +        break;
> +    case BLK_ZONE_COND_READONLY:
> +        blkz->cond =3D BLK_ZS_RDONLY;
> +        break;
> +    case BLK_ZONE_COND_FULL:
> +        blkz->cond =3D BLK_ZS_FULL;
> +        break;
> +    case BLK_ZONE_COND_OFFLINE:
> +        blkz->cond =3D BLK_ZS_OFFLINE;
> +        break;
> +    default:
> +        error_report("Invalid zone condition 0x%x", blkz->cond);
> +    }
> +}
> +#endif
> +
> +static int handle_aiocb_zone_report(void *opaque) {
> +#if defined(CONFIG_BLKZONED)
> +    RawPosixAIOData *aiocb =3D opaque;
> +    int fd =3D aiocb->aio_fildes;
> +    unsigned int *nr_zones =3D aiocb->zone_report.nr_zones;
> +    BlockZoneDescriptor *zones =3D aiocb->zone_report.zones;
> +    int64_t sector =3D aiocb->aio_offset / 512; /* ZBDs use 512B sectors=
 */
> +
> +    struct blk_zone *blkz;
> +    int64_t rep_size;
> +    unsigned int nrz;
> +    int ret, n =3D 0, i =3D 0;
> +
> +    nrz =3D *nr_zones;
> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct bl=
k_zone);
> +    g_autofree struct blk_zone_report *rep =3D NULL;
> +    rep =3D g_malloc(rep_size);
> +
> +    blkz =3D (struct blk_zone *)(rep + 1);
> +    while (n < nrz) {
> +        memset(rep, 0, rep_size);
> +        rep->sector =3D sector;
> +        rep->nr_zones =3D nrz - n;
> +
> +        ret =3D ioctl(fd, BLKREPORTZONE, rep);
> +        if (ret !=3D 0) {
> +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " failed =
%d",
> +                         fd, sector, errno);
> +            return -errno;
> +        }
> +
> +        if (!rep->nr_zones) {
> +            break;
> +        }
> +
> +        for (i =3D 0; i < rep->nr_zones; i++, n++) {
> +            parse_zone(&zones[n], &blkz[i]);
> +            /* The next report should start after the last zone reported=
 */
> +            sector =3D blkz[i].start + blkz[i].len;
> +        }
> +    }
> +
> +    *nr_zones =3D n;
> +    return 0;
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
> +static int handle_aiocb_zone_mgmt(void *opaque) {
> +#if defined(CONFIG_BLKZONED)
> +    RawPosixAIOData *aiocb =3D opaque;
> +    BlockDriverState *bs =3D aiocb->bs;
> +    int fd =3D aiocb->aio_fildes;
> +    int64_t sector =3D aiocb->aio_offset;
> +    int64_t nr_sectors =3D aiocb->aio_nbytes;
> +    BlockZoneOp op =3D aiocb->zone_mgmt.op;
> +    struct blk_zone_range range;
> +    const char *ioctl_name;
> +    unsigned long ioctl_op;
> +    int64_t zone_sector, zone_sector_mask;
> +    int ret;
> +
> +    zone_sector =3D bs->bl.zone_sectors;
> +    zone_sector_mask =3D zone_sector - 1;
> +    if (sector & zone_sector_mask) {
> +        error_report("offset %" PRId64 " is not aligned to zone size "
> +                     "%" PRId64 "", sector, zone_sector);
> +        return -EINVAL;
> +    }
> +
> +    if (nr_sectors & zone_sector_mask) {
> +        error_report("number of sectors %" PRId64 " is not aligned to zo=
ne size"
> +                      " %" PRId64 "", nr_sectors, zone_sector);
> +        return -EINVAL;
> +    }
> +
> +    switch (op) {
> +    case BLK_ZO_OPEN:
> +        ioctl_name =3D "BLKOPENZONE";
> +        ioctl_op =3D BLKOPENZONE;
> +        break;
> +    case BLK_ZO_CLOSE:
> +        ioctl_name =3D "BLKCLOSEZONE";
> +        ioctl_op =3D BLKCLOSEZONE;
> +        break;
> +    case BLK_ZO_FINISH:
> +        ioctl_name =3D "BLKFINISHZONE";
> +        ioctl_op =3D BLKFINISHZONE;
> +        break;
> +    case BLK_ZO_RESET:
> +        ioctl_name =3D "BLKRESETZONE";
> +        ioctl_op =3D BLKRESETZONE;
> +        break;
> +    default:
> +        error_report("Invalid zone operation 0x%x", op);
> +        return -EINVAL;
> +    }
> +
> +    /* Execute the operation */
> +    range.sector =3D sector;
> +    range.nr_sectors =3D nr_sectors;
> +    do {
> +        ret =3D ioctl(fd, ioctl_op, &range);
> +    } while (ret !=3D 0 && errno =3D=3D EINTR);
> +
> +    if (ret !=3D 0) {
> +        error_report("ioctl %s failed %d",
> +                     ioctl_name, errno);
> +        return -errno;
> +    }
> +
> +    return 0;
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
>  static int handle_aiocb_copy_range(void *opaque)
>  {
>      RawPosixAIOData *aiocb =3D opaque;
> @@ -3052,6 +3244,67 @@ static void raw_account_discard(BDRVRawState *s, u=
int64_t nbytes, int ret)
>      }
>  }
>
> +/*
> + * zone report - Get a zone block device's information in the form
> + * of an array of zone descriptors.
> + *
> + * @param bs: passing zone block device file descriptor
> + * @param zones: an array of zone descriptors to hold zone
> + * information on reply
> + * @param offset: offset can be any byte within the zone size.
> + * @param len: (not sure yet.
> + * @return 0 on success, -1 on failure
> + */
> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t=
 offset,
> +                                           unsigned int *nr_zones,
> +                                           BlockZoneDescriptor *zones) {
> +#if defined(CONFIG_BLKZONED)
> +    BDRVRawState *s =3D bs->opaque;
> +    RawPosixAIOData acb;
> +
> +    acb =3D (RawPosixAIOData) {
> +        .bs         =3D bs,
> +        .aio_fildes =3D s->fd,
> +        .aio_type   =3D QEMU_AIO_ZONE_REPORT,
> +        .aio_offset =3D offset,
> +        .zone_report    =3D {
> +                .nr_zones       =3D nr_zones,
> +                .zones          =3D zones,
> +        },
> +    };
> +
> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
> +/*
> + * zone management operations - Execute an operation on a zone
> + */
> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZone=
Op op,
> +        int64_t offset, int64_t len) {
> +#if defined(CONFIG_BLKZONED)
> +    BDRVRawState *s =3D bs->opaque;
> +    RawPosixAIOData acb;
> +
> +    acb =3D (RawPosixAIOData) {
> +        .bs             =3D bs,
> +        .aio_fildes     =3D s->fd,
> +        .aio_type       =3D QEMU_AIO_ZONE_MGMT,
> +        .aio_offset     =3D offset,
> +        .aio_nbytes     =3D len,
> +        .zone_mgmt  =3D {
> +                .op =3D op,
> +        },
> +    };
> +
> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
>  static coroutine_fn int
>  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
>                  bool blkdev)
> @@ -3552,6 +3805,14 @@ static void hdev_parse_filename(const char *filena=
me, QDict *options,
>      bdrv_parse_filename_strip_prefix(filename, "host_device:", options);
>  }
>
> +#if defined(CONFIG_BLKZONED)
> +static void zoned_host_device_parse_filename(const char *filename, QDict=
 *options,
> +                                Error **errp)
> +{
> +    bdrv_parse_filename_strip_prefix(filename, "zoned_host_device:", opt=
ions);
> +}
> +#endif
> +
>  static bool hdev_is_sg(BlockDriverState *bs)
>  {
>
> @@ -3782,6 +4043,55 @@ static BlockDriver bdrv_host_device =3D {
>  #endif
>  };
>
> +#if defined(CONFIG_BLKZONED)
> +static BlockDriver bdrv_zoned_host_device =3D {
> +        .format_name =3D "zoned_host_device",
> +        .protocol_name =3D "zoned_host_device",
> +        .instance_size =3D sizeof(BDRVRawState),
> +        .bdrv_needs_filename =3D true,
> +        .bdrv_probe_device  =3D hdev_probe_device,
> +        .bdrv_parse_filename =3D zoned_host_device_parse_filename,
> +        .bdrv_file_open     =3D hdev_open,
> +        .bdrv_close         =3D raw_close,
> +        .bdrv_reopen_prepare =3D raw_reopen_prepare,
> +        .bdrv_reopen_commit  =3D raw_reopen_commit,
> +        .bdrv_reopen_abort   =3D raw_reopen_abort,
> +        .bdrv_co_create_opts =3D bdrv_co_create_opts_simple,
> +        .create_opts         =3D &bdrv_create_opts_simple,
> +        .mutable_opts        =3D mutable_opts,
> +        .bdrv_co_invalidate_cache =3D raw_co_invalidate_cache,
> +        .bdrv_co_pwrite_zeroes =3D hdev_co_pwrite_zeroes,
> +
> +        .bdrv_co_preadv         =3D raw_co_preadv,
> +        .bdrv_co_pwritev        =3D raw_co_pwritev,
> +        .bdrv_co_flush_to_disk  =3D raw_co_flush_to_disk,
> +        .bdrv_co_pdiscard       =3D hdev_co_pdiscard,
> +        .bdrv_co_copy_range_from =3D raw_co_copy_range_from,
> +        .bdrv_co_copy_range_to  =3D raw_co_copy_range_to,
> +        .bdrv_refresh_limits =3D raw_refresh_limits,
> +        .bdrv_io_plug =3D raw_aio_plug,
> +        .bdrv_io_unplug =3D raw_aio_unplug,
> +        .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
> +
> +        .bdrv_co_truncate       =3D raw_co_truncate,
> +        .bdrv_getlength =3D raw_getlength,
> +        .bdrv_get_info =3D raw_get_info,
> +        .bdrv_get_allocated_file_size
> +                            =3D raw_get_allocated_file_size,
> +        .bdrv_get_specific_stats =3D hdev_get_specific_stats,
> +        .bdrv_check_perm =3D raw_check_perm,
> +        .bdrv_set_perm   =3D raw_set_perm,
> +        .bdrv_abort_perm_update =3D raw_abort_perm_update,
> +        .bdrv_probe_blocksizes =3D hdev_probe_blocksizes,
> +        .bdrv_probe_geometry =3D hdev_probe_geometry,
> +        .bdrv_co_ioctl =3D hdev_co_ioctl,
> +
> +        /* zone management operations */
> +        .bdrv_co_zone_report =3D raw_co_zone_report,
> +        .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> +};
> +#endif
> +
>  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_kern=
el__)
>  static void cdrom_parse_filename(const char *filename, QDict *options,
>                                   Error **errp)
> @@ -4042,6 +4352,9 @@ static void bdrv_file_init(void)
>      bdrv_register(&bdrv_file);
>  #if defined(HAVE_HOST_BLOCK_DEVICE)
>      bdrv_register(&bdrv_host_device);
> +#if defined(CONFIG_BLKZONED)
> +    bdrv_register(&bdrv_zoned_host_device);
> +#endif
>  #ifdef __linux__
>      bdrv_register(&bdrv_host_cdrom);
>  #endif
> diff --git a/block/io.c b/block/io.c
> index 0a8cbefe86..de9ec1d740 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3198,6 +3198,47 @@ out:
>      return co.ret;
>  }
>
> +int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                        unsigned int *nr_zones,
> +                        BlockZoneDescriptor *zones)
> +{
> +    BlockDriver *drv =3D bs->drv;
> +    CoroutineIOCompletion co =3D {
> +            .coroutine =3D qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || !drv->bdrv_co_zone_report) {
> +        co.ret =3D -ENOTSUP;
> +        goto out;
> +    }
> +    co.ret =3D drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
> +int bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
> +        int64_t offset, int64_t len)
> +{
> +    BlockDriver *drv =3D bs->drv;
> +    CoroutineIOCompletion co =3D {
> +            .coroutine =3D qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || !drv->bdrv_co_zone_mgmt) {
> +        co.ret =3D -ENOTSUP;
> +        goto out;
> +    }
> +    co.ret =3D drv->bdrv_co_zone_mgmt(bs, op, offset, len);
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
>  void *qemu_blockalign(BlockDriverState *bs, size_t size)
>  {
>      IO_CODE();
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index 36bd0e480e..5102fa6858 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -23,7 +23,6 @@
>   */
>  #ifndef BLOCK_COMMON_H
>  #define BLOCK_COMMON_H
> -
>  #include "block/aio.h"
>  #include "block/aio-wait.h"
>  #include "qemu/iov.h"
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index fd25ffa9be..55ad261e16 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -88,6 +88,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void =
*buf);
>  /* Ensure contents are flushed to disk.  */
>  int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
>
> +/* Report zone information of zone block device. */
> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offse=
t,
> +                                     unsigned int *nr_zones,
> +                                     BlockZoneDescriptor *zones);
> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
> +                                   int64_t offset, int64_t len);
> +
>  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
>  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
>  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> @@ -297,6 +304,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVecto=
r *qiov, int64_t pos);
>  int generated_co_wrapper
>  bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t po=
s);
>
> +int generated_co_wrapper
> +blk_zone_report(BlockBackend *blk, int64_t offset, unsigned int *nr_zone=
s,
> +                BlockZoneDescriptor *zones);
> +int generated_co_wrapper
> +blk_zone_mgmt(BlockBackend *blk, BlockZoneOp op, int64_t offset, int64_t=
 len);
> +
>  /**
>   * bdrv_parent_drained_begin_single:
>   *
> diff --git a/include/block/block_int-common.h b/include/block/block_int-c=
ommon.h
> index 7f7863cc9e..de44c7b6f4 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -94,7 +94,6 @@ typedef struct BdrvTrackedRequest {
>      struct BdrvTrackedRequest *waiting_for;
>  } BdrvTrackedRequest;
>
> -
>  struct BlockDriver {
>      /*
>       * These fields are initialized when this object is created,
> @@ -691,6 +690,12 @@ struct BlockDriver {
>                                            QEMUIOVector *qiov,
>                                            int64_t pos);
>
> +    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
> +            int64_t offset, unsigned int *nr_zones,
> +            BlockZoneDescriptor *zones);
> +    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, BlockZon=
eOp op,
> +            int64_t offset, int64_t len);
> +
>      /* removable device specific */
>      bool (*bdrv_is_inserted)(BlockDriverState *bs);
>      void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
> @@ -828,6 +833,21 @@ typedef struct BlockLimits {
>
>      /* device zone model */
>      BlockZoneModel zoned;
> +
> +    /* zone size expressed in 512-byte sectors */
> +    uint32_t zone_sectors;
> +
> +    /* total number of zones */
> +    unsigned int nr_zones;
> +
> +    /* maximum size in bytes of a zone append write operation */
> +    int64_t zone_append_max_bytes;
> +
> +    /* maximum number of open zones */
> +    int64_t max_open_zones;
> +
> +    /* maximum number of active zones */
> +    int64_t max_active_zones;
>  } BlockLimits;
>
>  typedef struct BdrvOpBlocker BdrvOpBlocker;
> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> index 21fc10c4c9..3d26929cdd 100644
> --- a/include/block/raw-aio.h
> +++ b/include/block/raw-aio.h
> @@ -29,6 +29,8 @@
>  #define QEMU_AIO_WRITE_ZEROES 0x0020
>  #define QEMU_AIO_COPY_RANGE   0x0040
>  #define QEMU_AIO_TRUNCATE     0x0080
> +#define QEMU_AIO_ZONE_REPORT  0x0100
> +#define QEMU_AIO_ZONE_MGMT    0x0200
>  #define QEMU_AIO_TYPE_MASK \
>          (QEMU_AIO_READ | \
>           QEMU_AIO_WRITE | \
> @@ -37,7 +39,9 @@
>           QEMU_AIO_DISCARD | \
>           QEMU_AIO_WRITE_ZEROES | \
>           QEMU_AIO_COPY_RANGE | \
> -         QEMU_AIO_TRUNCATE)
> +         QEMU_AIO_TRUNCATE  | \
> +         QEMU_AIO_ZONE_REPORT | \
> +         QEMU_AIO_ZONE_MGMT)
>
>  /* AIO flags */
>  #define QEMU_AIO_MISALIGNED   0x1000
> diff --git a/meson.build b/meson.build
> index 75aaca8462..8c34516443 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1883,6 +1883,7 @@ config_host_data.set('CONFIG_REPLICATION', get_opti=
on('live_block_migration').al
>  # has_header
>  config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
>  config_host_data.set('CONFIG_LINUX_MAGIC_H', cc.has_header('linux/magic.=
h'))
> +config_host_data.set('CONFIG_BLKZONED', cc.has_header('linux/blkzoned.h'=
))
>  config_host_data.set('CONFIG_VALGRIND_H', cc.has_header('valgrind/valgri=
nd.h'))
>  config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
>  config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 2173e7734a..c6bbb7a037 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2942,6 +2942,7 @@
>  # @compress: Since 5.0
>  # @copy-before-write: Since 6.2
>  # @snapshot-access: Since 7.0
> +# @zoned_host_device: Since 7.2
>  #
>  # Since: 2.9
>  ##
> @@ -2955,7 +2956,8 @@
>              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parall=
els',
>              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd=
',
>              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
> +            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat',
> +            { 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' } ] }
>
>  ##
>  # @BlockdevOptionsFile:
> @@ -4329,7 +4331,9 @@
>        'vhdx':       'BlockdevOptionsGenericFormat',
>        'vmdk':       'BlockdevOptionsGenericCOWFormat',
>        'vpc':        'BlockdevOptionsGenericFormat',
> -      'vvfat':      'BlockdevOptionsVVFAT'
> +      'vvfat':      'BlockdevOptionsVVFAT',
> +      'zoned_host_device': { 'type': 'BlockdevOptionsFile',
> +                             'if': 'CONFIG_BLKZONED' }
>    } }
>
>  ##
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 952dc940f1..5a215277c7 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -1712,6 +1712,145 @@ static const cmdinfo_t flush_cmd =3D {
>      .oneline    =3D "flush all in-core file state to disk",
>  };
>
> +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset;
> +    unsigned int nr_zones;
> +
> +    ++optind;
> +    offset =3D cvtnum(argv[optind]);
> +    ++optind;
> +    nr_zones =3D cvtnum(argv[optind]);
> +
> +    g_autofree BlockZoneDescriptor *zones =3D NULL;
> +    zones =3D g_new(BlockZoneDescriptor, nr_zones);
> +    ret =3D blk_zone_report(blk, offset, &nr_zones, zones);
> +    if (ret < 0) {
> +        printf("zone report failed: %s\n", strerror(-ret));
> +    } else {
> +        for (int i =3D 0; i < nr_zones; ++i) {
> +            printf("start: 0x%" PRIx64 ", len 0x%" PRIx64 ", "
> +                   "cap"" 0x%" PRIx64 ",wptr 0x%" PRIx64 ", "
> +                   "zcond:%u, [type: %u]\n",
> +                   zones[i].start, zones[i].length, zones[i].cap, zones[=
i].wp,
> +                   zones[i].cond, zones[i].type);
> +        }
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_report_cmd =3D {
> +        .name =3D "zone_report",
> +        .altname =3D "zrp",
> +        .cfunc =3D zone_report_f,
> +        .argmin =3D 2,
> +        .argmax =3D 2,
> +        .args =3D "offset number",
> +        .oneline =3D "report zone information",
> +};
> +
> +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset =3D cvtnum(argv[optind]);
> +    ++optind;
> +    len =3D cvtnum(argv[optind]);
> +    ret =3D blk_zone_mgmt(blk, BLK_ZO_OPEN, offset, len);
> +    if (ret < 0) {
> +        printf("zone open failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_open_cmd =3D {
> +        .name =3D "zone_open",
> +        .altname =3D "zo",
> +        .cfunc =3D zone_open_f,
> +        .argmin =3D 2,
> +        .argmax =3D 2,
> +        .args =3D "offset len",
> +        .oneline =3D "explicit open a range of zones in zone block devic=
e",
> +};
> +
> +static int zone_close_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset =3D cvtnum(argv[optind]);
> +    ++optind;
> +    len =3D cvtnum(argv[optind]);
> +    ret =3D blk_zone_mgmt(blk, BLK_ZO_CLOSE, offset, len);
> +    if (ret < 0) {
> +        printf("zone close failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_close_cmd =3D {
> +        .name =3D "zone_close",
> +        .altname =3D "zc",
> +        .cfunc =3D zone_close_f,
> +        .argmin =3D 2,
> +        .argmax =3D 2,
> +        .args =3D "offset len",
> +        .oneline =3D "close a range of zones in zone block device",
> +};
> +
> +static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset =3D cvtnum(argv[optind]);
> +    ++optind;
> +    len =3D cvtnum(argv[optind]);
> +    ret =3D blk_zone_mgmt(blk, BLK_ZO_FINISH, offset, len);
> +    if (ret < 0) {
> +        printf("zone finish failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_finish_cmd =3D {
> +        .name =3D "zone_finish",
> +        .altname =3D "zf",
> +        .cfunc =3D zone_finish_f,
> +        .argmin =3D 2,
> +        .argmax =3D 2,
> +        .args =3D "offset len",
> +        .oneline =3D "finish a range of zones in zone block device",
> +};
> +
> +static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset =3D cvtnum(argv[optind]);
> +    ++optind;
> +    len =3D cvtnum(argv[optind]);
> +    ret =3D blk_zone_mgmt(blk, BLK_ZO_RESET, offset, len);
> +    if (ret < 0) {
> +        printf("zone reset failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_reset_cmd =3D {
> +        .name =3D "zone_reset",
> +        .altname =3D "zrs",
> +        .cfunc =3D zone_reset_f,
> +        .argmin =3D 2,
> +        .argmax =3D 2,
> +        .args =3D "offset len",
> +        .oneline =3D "reset a zone write pointer in zone block device",
> +};
> +
> +

An extra blank line should be removed.


>  static int truncate_f(BlockBackend *blk, int argc, char **argv);
>  static const cmdinfo_t truncate_cmd =3D {
>      .name       =3D "truncate",
> @@ -2504,6 +2643,11 @@ static void __attribute((constructor)) init_qemuio=
_commands(void)
>      qemuio_add_command(&aio_write_cmd);
>      qemuio_add_command(&aio_flush_cmd);
>      qemuio_add_command(&flush_cmd);
> +    qemuio_add_command(&zone_report_cmd);
> +    qemuio_add_command(&zone_open_cmd);
> +    qemuio_add_command(&zone_close_cmd);
> +    qemuio_add_command(&zone_finish_cmd);
> +    qemuio_add_command(&zone_reset_cmd);
>      qemuio_add_command(&truncate_cmd);
>      qemuio_add_command(&length_cmd);
>      qemuio_add_command(&info_cmd);
> --
> 2.37.1
>

