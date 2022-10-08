Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EBD5F82CD
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 05:43:57 +0200 (CEST)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oh0km-0005IE-A5
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 23:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oh0j2-0003mi-NX; Fri, 07 Oct 2022 23:42:08 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29]:46757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oh0iy-0005lu-F7; Fri, 07 Oct 2022 23:42:08 -0400
Received: by mail-vk1-xa29.google.com with SMTP id u204so584245vkb.13;
 Fri, 07 Oct 2022 20:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t5Lhe6ZwU6Yv1MTEDVVU+GYmHcrQhKQNJBAeWkj50Q0=;
 b=WaDNhSKJ357/jGL5FvJ+r8tBON9U6I3tYRhtbILiUfCcfc4xw61cOvJehSknmYryzn
 joRBqfNlw78oOWb7mCzgg2vpBgKokaRazz4UpVWshpMKlYQh7fkYZuFbuERZz/F7gHBH
 Z9JZDerHCdG+AVv8rrlsfBen3dH2HPCOi1VdXj+ZsgrauFjliJL9FyraNq9Wy95S8YQB
 EWWCd6cIURmktNWG+YfkAGVBbfGvlnoTYsV+J3QzGE75109G+RBgkr7I+EVD/NVD5em8
 coVpB/E8O4wni184V5KVEnxeGoCeNtKCHny7dzPkHoW7Ahf1fDSoo0hjO521RJg5GpgN
 7t/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t5Lhe6ZwU6Yv1MTEDVVU+GYmHcrQhKQNJBAeWkj50Q0=;
 b=DAmp1/Ca28kTs+Q+XUxXkNBC4Kz7cajJ9qeh3+/1JKC0toreCN9SnLajTEFo6nAd5W
 iMStdRX0/t/3bM/aibwTV0tSPPI3YA9lNIBBY/JQuahNiWlchqcThCc/KhUZKUTeJU1t
 eXSj5UfJQZXKmrnVZAJ6N1sNi8PgFys9aHTI8DdE8SU6l/ROF+N9Jg8phVP9OvGkZaDL
 5RZRXENzqVkil3nUUjD9foDfg4mos/AMLiZjy/F+PBpb8H/9PjSC3cZJdgfIr/JSgIxn
 jQC1SAngc/1hfXgU2/GhXxy7t8OMvNifkGgAXk9bLFPnOSzLS4POE1QPfFjtvTOG3hV1
 1v8w==
X-Gm-Message-State: ACrzQf10HOOQx75XErkzHGPqcdURcIKbWRD6iAC4gJKx9LSv6uWDV8pA
 rx9NZ/s0S4iSufI7P0P9hHo7wRF+k2FE2ogqqrs=
X-Google-Smtp-Source: AMsMyM59viazc6dg3q61Ebgg7n4PKOjF3zjbDWiiOfiDPFX7p1cF0vxbaILDo8vM9ZgAdKXBkQJIiTsaNornkAIVHjA=
X-Received: by 2002:a1f:9b10:0:b0:3ab:4058:32e7 with SMTP id
 d16-20020a1f9b10000000b003ab405832e7mr4835523vke.15.1665200522618; Fri, 07
 Oct 2022 20:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220929083631.61899-1-faithilikerun@gmail.com>
 <20220929083631.61899-4-faithilikerun@gmail.com> <YzsgP1ZLA9pjrIn8@fedora>
 <c44209ec-63d1-2870-9695-28696e8de5a8@opensource.wdc.com>
In-Reply-To: <c44209ec-63d1-2870-9695-28696e8de5a8@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Sat, 8 Oct 2022 11:42:17 +0800
Message-ID: <CAAAx-8+iXxkpLvj5gU9QeeRY-+9N0WXrYOYRrj5JwChUVYkSzQ@mail.gmail.com>
Subject: Re: [PATCH v10 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, hare@suse.de, Hanna Reitz <hreitz@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, 
 qemu-block@nongnu.org, dmitry.fomichev@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=faithilikerun@gmail.com; helo=mail-vk1-xa29.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B410=
=E6=9C=884=E6=97=A5=E5=91=A8=E4=BA=8C 07:23=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2022/10/04 2:47, Stefan Hajnoczi wrote:
> > On Thu, Sep 29, 2022 at 04:36:27PM +0800, Sam Li wrote:
> >> Add a new zoned_host_device BlockDriver. The zoned_host_device option
> >> accepts only zoned host block devices. By adding zone management
> >> operations in this new BlockDriver, users can use the new block
> >> layer APIs including Report Zone and four zone management operations
> >> (open, close, finish, reset).
> >>
> >> Qemu-io uses the new APIs to perform zoned storage commands of the dev=
ice:
> >> zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
> >> zone_finish(zf).
> >>
> >> For example, to test zone_report, use following command:
> >> $ ./build/qemu-io --image-opts -n driver=3Dzoned_host_device, filename=
=3D/dev/nullb0
> >> -c "zrp offset nr_zones"
> >>
> >> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> >> Reviewed-by: Hannes Reinecke <hare@suse.de>
> >> ---
> >>  block/block-backend.c             | 146 +++++++++++++
> >>  block/file-posix.c                | 340 +++++++++++++++++++++++++++++=
-
> >>  block/io.c                        |  41 ++++
> >>  include/block/block-common.h      |   4 +
> >>  include/block/block-io.h          |   7 +
> >>  include/block/block_int-common.h  |  24 +++
> >>  include/block/raw-aio.h           |   6 +-
> >>  include/sysemu/block-backend-io.h |  17 ++
> >>  meson.build                       |   4 +
> >>  qapi/block-core.json              |   8 +-
> >>  qemu-io-cmds.c                    | 148 +++++++++++++
> >>  11 files changed, 741 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/block/block-backend.c b/block/block-backend.c
> >> index d4a5df2ac2..f7f7acd6f4 100644
> >> --- a/block/block-backend.c
> >> +++ b/block/block-backend.c
> >> @@ -1431,6 +1431,15 @@ typedef struct BlkRwCo {
> >>      void *iobuf;
> >>      int ret;
> >>      BdrvRequestFlags flags;
> >> +    union {
> >> +        struct {
> >> +            unsigned int *nr_zones;
> >> +            BlockZoneDescriptor *zones;
> >> +        } zone_report;
> >> +        struct {
> >> +            BlockZoneOp op;
> >> +        } zone_mgmt;
> >> +    };
> >>  } BlkRwCo;
> >>
> >>  int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
> >> @@ -1775,6 +1784,143 @@ int coroutine_fn blk_co_flush(BlockBackend *bl=
k)
> >>      return ret;
> >>  }
> >>
> >> +static void blk_aio_zone_report_entry(void *opaque) {
> >
> >
> > The coroutine_fn annotation is missing:
> >
> >   static void coroutine_fn blk_aio_zone_report_entry(void *opaque) {
> >
> >> +    BlkAioEmAIOCB *acb =3D opaque;
> >> +    BlkRwCo *rwco =3D &acb->rwco;
> >> +
> >> +    rwco->ret =3D blk_co_zone_report(rwco->blk, rwco->offset,
> >> +                                   rwco->zone_report.nr_zones,
> >> +                                   rwco->zone_report.zones);
> >> +    blk_aio_complete(acb);
> >> +}
> >> +
> >> +BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
> >> +                                unsigned int *nr_zones,
> >> +                                BlockZoneDescriptor  *zones,
> >> +                                BlockCompletionFunc *cb, void *opaque=
)
> >> +{
> >> +    BlkAioEmAIOCB *acb;
> >> +    Coroutine *co;
> >> +    IO_CODE();
> >> +
> >> +    blk_inc_in_flight(blk);
> >> +    acb =3D blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
> >> +    acb->rwco =3D (BlkRwCo) {
> >> +        .blk    =3D blk,
> >> +        .offset =3D offset,
> >> +        .ret    =3D NOT_DONE,
> >> +        .zone_report =3D {
> >> +            .zones =3D zones,
> >> +            .nr_zones =3D nr_zones,
> >> +        },
> >> +    };
> >> +    acb->has_returned =3D false;
> >> +
> >> +    co =3D qemu_coroutine_create(blk_aio_zone_report_entry, acb);
> >> +    bdrv_coroutine_enter(blk_bs(blk), co);
> >> +
> >> +    acb->has_returned =3D true;
> >> +    if (acb->rwco.ret !=3D NOT_DONE) {
> >> +        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
> >> +                                         blk_aio_complete_bh, acb);
> >> +    }
> >> +
> >> +    return &acb->common;
> >> +}
> >> +
> >> +static void blk_aio_zone_mgmt_entry(void *opaque) {
> >
> > coroutine_fn is missing here.
> >
> >> +    BlkAioEmAIOCB *acb =3D opaque;
> >> +    BlkRwCo *rwco =3D &acb->rwco;
> >> +
> >> +    rwco->ret =3D blk_co_zone_mgmt(rwco->blk, rwco->zone_mgmt.op,
> >> +                                 rwco->offset, acb->bytes);
> >> +    blk_aio_complete(acb);
> >> +}
> >> +
> >> +BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> >> +                              int64_t offset, int64_t len,
> >> +                              BlockCompletionFunc *cb, void *opaque) =
{
> >> +    BlkAioEmAIOCB *acb;
> >> +    Coroutine *co;
> >> +    IO_CODE();
> >> +
> >> +    blk_inc_in_flight(blk);
> >> +    acb =3D blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
> >> +    acb->rwco =3D (BlkRwCo) {
> >> +        .blk    =3D blk,
> >> +        .offset =3D offset,
> >> +        .ret    =3D NOT_DONE,
> >> +        .zone_mgmt =3D {
> >> +            .op =3D op,
> >> +        },
> >> +    };
> >> +    acb->bytes =3D len;
> >> +    acb->has_returned =3D false;
> >> +
> >> +    co =3D qemu_coroutine_create(blk_aio_zone_mgmt_entry, acb);
> >> +    bdrv_coroutine_enter(blk_bs(blk), co);
> >> +
> >> +    acb->has_returned =3D true;
> >> +    if (acb->rwco.ret !=3D NOT_DONE) {
> >> +        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
> >> +                                         blk_aio_complete_bh, acb);
> >> +    }
> >> +
> >> +    return &acb->common;
> >> +}
> >> +
> >> +/*
> >> + * Send a zone_report command.
> >> + * offset is a byte offset from the start of the device. No alignment
> >> + * required for offset.
> >> + * nr_zones represents IN maximum and OUT actual.
> >> + */
> >> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset=
,
> >> +                                    unsigned int *nr_zones,
> >> +                                    BlockZoneDescriptor *zones)
> >> +{
> >> +    int ret;
> >> +    IO_CODE();
> >> +
> >> +    blk_inc_in_flight(blk); /* increase before waiting */
> >> +    blk_wait_while_drained(blk);
> >> +    if (!blk_is_available(blk)) {
> >> +        blk_dec_in_flight(blk);
> >> +        return -ENOMEDIUM;
> >> +    }
> >> +    ret =3D bdrv_co_zone_report(blk_bs(blk), offset, nr_zones, zones)=
;
> >> +    blk_dec_in_flight(blk);
> >> +    return ret;
> >> +}
> >> +
> >> +/*
> >> + * Send a zone_management command.
> >> + * op is the zone operation;
> >> + * offset is the byte offset from the start of the zoned device;
> >> + * len is the maximum number of bytes the command should operate on. =
It
> >> + * should be aligned with the device zone size.
> >> + */
> >> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> >> +        int64_t offset, int64_t len)
> >> +{
> >> +    int ret;
> >> +    IO_CODE();
> >> +
> >> +
> >> +    blk_inc_in_flight(blk);
> >> +    blk_wait_while_drained(blk);
> >> +
> >> +    ret =3D blk_check_byte_request(blk, offset, len);
> >> +    if (ret < 0) {
> >> +        blk_dec_in_flight(blk);
> >> +        return ret;
> >> +    }
> >> +
> >> +    ret =3D bdrv_co_zone_mgmt(blk_bs(blk), op, offset, len);
> >> +    blk_dec_in_flight(blk);
> >> +    return ret;
> >> +}
> >> +
> >>  void blk_drain(BlockBackend *blk)
> >>  {
> >>      BlockDriverState *bs =3D blk_bs(blk);
> >> diff --git a/block/file-posix.c b/block/file-posix.c
> >> index 0a8b4b426e..0a6c781201 100644
> >> --- a/block/file-posix.c
> >> +++ b/block/file-posix.c
> >> @@ -67,6 +67,9 @@
> >>  #include <sys/param.h>
> >>  #include <sys/syscall.h>
> >>  #include <sys/vfs.h>
> >> +#if defined(CONFIG_BLKZONED)
> >> +#include <linux/blkzoned.h>
> >> +#endif
> >>  #include <linux/cdrom.h>
> >>  #include <linux/fd.h>
> >>  #include <linux/fs.h>
> >> @@ -216,6 +219,15 @@ typedef struct RawPosixAIOData {
> >>              PreallocMode prealloc;
> >>              Error **errp;
> >>          } truncate;
> >> +        struct {
> >> +            unsigned int *nr_zones;
> >> +            BlockZoneDescriptor *zones;
> >> +        } zone_report;
> >> +        struct {
> >> +            unsigned long zone_op;
> >> +            const char *zone_op_name;
> >> +            bool all;
> >
> > Please remove this field if it is unused.
> >
> >> +        } zone_mgmt;
> >>      };
> >>  } RawPosixAIOData;
> >>
> >> @@ -1339,7 +1351,7 @@ static void raw_refresh_limits(BlockDriverState =
*bs, Error **errp)
> >>  #endif
> >>
> >>      if (bs->sg || S_ISBLK(st.st_mode)) {
> >> -        int ret =3D hdev_get_max_hw_transfer(s->fd, &st);
> >> +        ret =3D hdev_get_max_hw_transfer(s->fd, &st);
> >>
> >>          if (ret > 0 && ret <=3D BDRV_REQUEST_MAX_BYTES) {
> >>              bs->bl.max_hw_transfer =3D ret;
> >> @@ -1356,6 +1368,41 @@ static void raw_refresh_limits(BlockDriverState=
 *bs, Error **errp)
> >>          zoned =3D BLK_Z_NONE;
> >>      }
> >>      bs->bl.zoned =3D zoned;
> >> +    if (zoned !=3D BLK_Z_NONE) {
> >> +        ret =3D get_sysfs_long_val(&st, "chunk_sectors");
> >> +        if (ret <=3D 0) {
> >> +            error_report("Invalid zone size %" PRId32 " sectors ", re=
t);
> >> +            bs->bl.zoned =3D BLK_Z_NONE;
> >> +            return;
> >> +        }
> >> +        bs->bl.zone_size =3D ret * 512;
> >> +
> >> +        ret =3D get_sysfs_long_val(&st, "zone_append_max_bytes");
> >> +        if (ret > 0) {
> >> +            bs->bl.max_append_sectors =3D ret / 512;
> >> +        }
> >> +
> >> +        ret =3D get_sysfs_long_val(&st, "max_open_zones");
> >> +        if (ret >=3D 0) {
> >> +            bs->bl.max_open_zones =3D ret;
> >> +        }
> >> +
> >> +        ret =3D get_sysfs_long_val(&st, "max_active_zones");
> >> +        if (ret >=3D 0) {
> >> +            bs->bl.max_active_zones =3D ret;
> >> +        }
> >> +
> >> +        ret =3D get_sysfs_long_val(&st, "nr_zones");
> >> +        if (ret >=3D 0) {
> >> +            bs->bl.nr_zones =3D ret;
> >> +        }
> >> +
> >> +        ret =3D ioctl(s->fd, BLKGETSIZE64, &bs->bl.capacity);
> >> +        if (ret !=3D 0) {
> >> +            error_report("Invalid device capacity %" PRId64 " bytes "=
, bs->bl.capacity);
> >> +            return;
> >> +        }
> >
> > The QEMU block layer already knows the capacity of the device. Can
> > bdrv_getlength() be used instead of introducing a new
> > BlockLimits.capacity field?
> >
> >> +    }
> >>  }
> >>
> >>  static int check_for_dasd(int fd)
> >> @@ -1850,6 +1897,147 @@ static off_t copy_file_range(int in_fd, off_t =
*in_off, int out_fd,
> >>  }
> >>  #endif
> >>
> >> +/*
> >> + * parse_zone - Fill a zone descriptor
> >> + */
> >> +#if defined(CONFIG_BLKZONED)
> >> +static inline void parse_zone(struct BlockZoneDescriptor *zone,
> >> +                              const struct blk_zone *blkz,
> >> +                              const struct blk_zone_report *rep) {
> >> +    zone->start =3D blkz->start << BDRV_SECTOR_BITS;
> >> +    zone->length =3D blkz->len << BDRV_SECTOR_BITS;
> >> +    zone->wp =3D blkz->wp << BDRV_SECTOR_BITS;
> >> +
> >> +    if (rep->flags & BLK_ZONE_REP_CAPACITY) {
> >> +        zone->cap =3D blkz->capacity << BDRV_SECTOR_BITS;
> >
> > #ifdef HAVE_BLK_ZONE_REP_CAPACITY is needed since the rep->flags and
> > blkz->capacity fields are missing and would cause a compilation error
> > when HAVE_BLK_ZONE_REP_CAPACITY is not defined:
> >
> >   zone->cap =3D blkz->len << BDRV_SECTOR_BITS;
> >   #ifdef HAVE_BLK_ZONE_REP_CAPACITY
> >   /* Replace with the dedicated field on newer kernels */
> >   if (rep->flags & BLK_ZONE_REP_CAPACITY) {
> >       zone->cap =3D blkz->capacity << BDRV_SECTOR_BITS;
> >   }
> >   #endif
>
> It would be a lot cleaner to do something like this:
>
> in the block common header file, add:
>
> #ifdef HAVE_BLK_ZONE_REP_CAPACITY
>
> #define BLK_ZONE_REP_CAPACITY   (1 << 0)
>
> struct blk_zone_v2 {
>         __u64   start;          /* Zone start sector */
>         __u64   len;            /* Zone length in number of sectors */
>         __u64   wp;             /* Zone write pointer position */
>         __u8    type;           /* Zone type */
>         __u8    cond;           /* Zone condition */
>         __u8    non_seq;        /* Non-sequential write resources active =
*/
>         __u8    reset;          /* Reset write pointer recommended */
>         __u8    resv[4];
>         __u64   capacity;       /* Zone capacity in number of sectors */
>         __u8    reserved[24];
> };
> #define blk_zone blk_zone_v2
>
> struct blk_zone_report_v2 {
>         __u64   sector;
>         __u32   nr_zones;
>         __u32   flags;
>         struct blk_zone zones[0];
> };
> #define blk_zone_report blk_zone_report_v2
>
> #endif
>
> Then the above code becomes:
>
> if (rep->flags & BLK_ZONE_REP_CAPACITY) {
>     zone->cap =3D blkz->capacity << BDRV_SECTOR_BITS;
> } else {
>     zone->cap =3D blkz->len << BDRV_SECTOR_BITS;
> }
>
> No #ifdef in the C code, only in the header and that compiles and works f=
or all
> host kernel versions.

This approach has a name contradiction. The struct blk_zone_report
name is also the block layer API blk_zone_report() name. Besides, why
not only use HAVE_BLK_ZONE_REP_CAPACITY? As it can indicate if struct
blk_zone has the capacity field, then we can just drop blk-common
header changes and use this in parse_zone:

    zone->cap =3D blkz->len << BDRV_SECTOR_BITS;
#ifdef HAVE_BLK_ZONE_REP_CAPACITY
    zone->cap =3D blkz->capacity << BDRV_SECTOR_BITS;
#endif

Linux capacity field changes:
https://lists.infradead.org/pipermail/linux-nvme/2020-June/017889.html


>
>
> >
> >> +    } else {
> >> +        zone->cap =3D blkz->len << BDRV_SECTOR_BITS;
> >> +    }
> >> +
> >> +    switch (blkz->type) {
> >> +    case BLK_ZONE_TYPE_SEQWRITE_REQ:
> >> +        zone->type =3D BLK_ZT_SWR;
> >> +        break;
> >> +    case BLK_ZONE_TYPE_SEQWRITE_PREF:
> >> +        zone->type =3D BLK_ZT_SWP;
> >> +        break;
> >> +    case BLK_ZONE_TYPE_CONVENTIONAL:
> >> +        zone->type =3D BLK_ZT_CONV;
> >> +        break;
> >> +    default:
> >> +        g_assert_not_reached();
> >> +    }
> >> +
> >> +    switch (blkz->cond) {
> >> +    case BLK_ZONE_COND_NOT_WP:
> >> +        zone->cond =3D BLK_ZS_NOT_WP;
> >> +        break;
> >> +    case BLK_ZONE_COND_EMPTY:
> >> +        zone->cond =3D BLK_ZS_EMPTY;
> >> +        break;
> >> +    case BLK_ZONE_COND_IMP_OPEN:
> >> +        zone->cond =3D BLK_ZS_IOPEN;
> >> +        break;
> >> +    case BLK_ZONE_COND_EXP_OPEN:
> >> +        zone->cond =3D BLK_ZS_EOPEN;
> >> +        break;
> >> +    case BLK_ZONE_COND_CLOSED:
> >> +        zone->cond =3D BLK_ZS_CLOSED;
> >> +        break;
> >> +    case BLK_ZONE_COND_READONLY:
> >> +        zone->cond =3D BLK_ZS_RDONLY;
> >> +        break;
> >> +    case BLK_ZONE_COND_FULL:
> >> +        zone->cond =3D BLK_ZS_FULL;
> >> +        break;
> >> +    case BLK_ZONE_COND_OFFLINE:
> >> +        zone->cond =3D BLK_ZS_OFFLINE;
> >> +        break;
> >> +    default:
> >> +        g_assert_not_reached();
> >> +    }
> >> +}
> >> +#endif
> >> +
> >> +static int handle_aiocb_zone_report(void *opaque) {
> >> +#if defined(CONFIG_BLKZONED)
> >> +    RawPosixAIOData *aiocb =3D opaque;
> >> +    int fd =3D aiocb->aio_fildes;
> >> +    unsigned int *nr_zones =3D aiocb->zone_report.nr_zones;
> >> +    BlockZoneDescriptor *zones =3D aiocb->zone_report.zones;
> >> +    /* zoned block devices use 512-byte sectors */
> >> +    int64_t sector =3D aiocb->aio_offset / 512;
> >> +
> >> +    struct blk_zone *blkz;
> >> +    int64_t rep_size;
> >> +    unsigned int nrz;
> >> +    int ret, n =3D 0, i =3D 0;
> >> +
> >> +    nrz =3D *nr_zones;
> >> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct=
 blk_zone);
> >> +    g_autofree struct blk_zone_report *rep =3D NULL;
> >> +    rep =3D g_malloc(rep_size);
> >> +
> >> +    blkz =3D (struct blk_zone *)(rep + 1);
> >> +    while (n < nrz) {
> >> +        memset(rep, 0, rep_size);
> >> +        rep->sector =3D sector;
> >> +        rep->nr_zones =3D nrz - n;
> >> +
> >> +        do {
> >> +            ret =3D ioctl(fd, BLKREPORTZONE, rep);
> >> +        } while (ret !=3D 0 && errno =3D=3D EINTR);
> >> +        if (ret !=3D 0) {
> >> +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " fail=
ed %d",
> >> +                         fd, sector, errno);
> >> +            return -errno;
> >
> > Using errno after calling error_report() is risky because functions
> > called by error_report() may overwrite errno. It's safer to preserve
> > the value:
> >
> >   if (ret !=3D 0) {
> >       ret =3D -errno;
> >       error_report(...);
> >       return ret;
> >   }
> >
> >> +        }
> >> +
> >> +        if (!rep->nr_zones) {
> >> +            break;
> >> +        }
> >> +
> >> +        for (i =3D 0; i < rep->nr_zones; i++, n++) {
> >> +            parse_zone(&zones[n], &blkz[i], rep);
> >> +            /* The next report should start after the last zone repor=
ted */
> >> +            sector =3D blkz[i].start + blkz[i].len;
> >> +        }
> >> +    }
> >> +
> >> +    *nr_zones =3D n;
> >> +    return 0;
> >> +#else
> >> +    return -ENOTSUP;
> >> +#endif
> >> +}
> >> +
> >> +static int handle_aiocb_zone_mgmt(void *opaque) {
> >> +#if defined(CONFIG_BLKZONED)
> >> +    RawPosixAIOData *aiocb =3D opaque;
> >> +    int fd =3D aiocb->aio_fildes;
> >> +    int64_t sector =3D aiocb->aio_offset / 512;
> >> +    int64_t nr_sectors =3D aiocb->aio_nbytes / 512;
> >> +    struct blk_zone_range range;
> >> +    int ret;
> >> +
> >> +    /* Execute the operation */
> >> +    range.sector =3D sector;
> >> +    range.nr_sectors =3D nr_sectors;
> >> +    do {
> >> +        ret =3D ioctl(fd, aiocb->zone_mgmt.zone_op, &range);
> >> +    } while (ret !=3D 0 && errno =3D=3D EINTR);
> >> +
> >> +    if (ret !=3D 0) {
> >> +        error_report("ioctl %s failed %d", aiocb->zone_mgmt.zone_op_n=
ame,
> >> +                     errno);
> >> +        return -errno;
> >
> > Same errno value preservation thing here.
> >
> >> +    }
> >> +    return ret;
> >> +#else
> >> +    return -ENOTSUP;
> >> +#endif
> >> +}
> >> +
> >>  static int handle_aiocb_copy_range(void *opaque)
> >>  {
> >>      RawPosixAIOData *aiocb =3D opaque;
> >> @@ -3022,6 +3210,105 @@ static void raw_account_discard(BDRVRawState *=
s, uint64_t nbytes, int ret)
> >>      }
> >>  }
> >>
> >> +/*
> >> + * zone report - Get a zone block device's information in the form
> >> + * of an array of zone descriptors.
> >> + * zones is an array of zone descriptors to hold zone information on =
reply;
> >> + * offset can be any byte within the entire size of the device;
> >> + * nr_zones is the maxium number of sectors the command should operat=
e on.
> >> + */
> >> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int6=
4_t offset,
> >> +                                           unsigned int *nr_zones,
> >> +                                           BlockZoneDescriptor *zones=
) {
> >> +#if defined(CONFIG_BLKZONED)
> >> +    BDRVRawState *s =3D bs->opaque;
> >> +    RawPosixAIOData acb;
> >> +
> >> +    acb =3D (RawPosixAIOData) {
> >> +        .bs         =3D bs,
> >> +        .aio_fildes =3D s->fd,
> >> +        .aio_type   =3D QEMU_AIO_ZONE_REPORT,
> >> +        .aio_offset =3D offset,
> >> +        .zone_report    =3D {
> >> +            .nr_zones       =3D nr_zones,
> >> +            .zones          =3D zones,
> >> +        },
> >> +    };
> >> +
> >> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb)=
;
> >> +#else
> >> +    return -ENOTSUP;
> >> +#endif
> >> +}
> >> +
> >> +/*
> >> + * zone management operations - Execute an operation on a zone
> >> + */
> >> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZ=
oneOp op,
> >> +        int64_t offset, int64_t len) {
> >> +#if defined(CONFIG_BLKZONED)
> >> +    BDRVRawState *s =3D bs->opaque;
> >> +    RawPosixAIOData acb;
> >> +    int64_t zone_size, zone_size_mask;
> >> +    const char *zone_op_name;
> >> +    unsigned long zone_op;
> >> +    bool is_all =3D false;
> >> +
> >> +    zone_size =3D bs->bl.zone_size;
> >> +    zone_size_mask =3D zone_size - 1;
> >> +    if (offset & zone_size_mask) {
> >> +        error_report("sector offset %" PRId64 " is not aligned to zon=
e size "
> >> +                     "%" PRId64 "", offset / 512, zone_size / 512);
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    if (((offset + len) < bs->bl.capacity && len & zone_size_mask) ||
> >> +        offset + len > bs->bl.capacity) {
> >> +        error_report("number of sectors %" PRId64 " is not aligned to=
 zone size"
> >> +                      " %" PRId64 "", len / 512, zone_size / 512);
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    switch (op) {
> >> +    case BLK_ZO_OPEN:
> >> +        zone_op_name =3D "BLKOPENZONE";
> >> +        zone_op =3D BLKOPENZONE;
> >> +        break;
> >> +    case BLK_ZO_CLOSE:
> >> +        zone_op_name =3D "BLKCLOSEZONE";
> >> +        zone_op =3D BLKCLOSEZONE;
> >> +        break;
> >> +    case BLK_ZO_FINISH:
> >> +        zone_op_name =3D "BLKFINISHZONE";
> >> +        zone_op =3D BLKFINISHZONE;
> >> +        break;
> >> +    case BLK_ZO_RESET:
> >> +        zone_op_name =3D "BLKRESETZONE";
> >> +        zone_op =3D BLKRESETZONE;
> >> +        break;
> >> +    default:
> >> +        g_assert_not_reached();
> >> +    }
> >> +
> >> +    acb =3D (RawPosixAIOData) {
> >> +        .bs             =3D bs,
> >> +        .aio_fildes     =3D s->fd,
> >> +        .aio_type       =3D QEMU_AIO_ZONE_MGMT,
> >> +        .aio_offset     =3D offset,
> >> +        .aio_nbytes     =3D len,
> >> +        .zone_mgmt  =3D {
> >> +            .zone_op =3D zone_op,
> >> +            .zone_op_name =3D zone_op_name,
> >> +            .all =3D is_all,
> >> +        },
> >> +    };
> >> +
> >> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> >> +#else
> >> +    return -ENOTSUP;
> >> +#endif
> >> +}
> >> +
> >>  static coroutine_fn int
> >>  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
> >>                  bool blkdev)
> >> @@ -3752,6 +4039,54 @@ static BlockDriver bdrv_host_device =3D {
> >>  #endif
> >>  };
> >>
> >> +#if defined(CONFIG_BLKZONED)
> >
> > Have you tried building without CONFIG_BLKZONED? There might be "unused
> > function" compiler warnings because raw_co_zone_mgmt() won't be
> > referenced by anything if BlockDriver bdrv_zoned_host_device isn't
> > compiled in.
> >
> > It may be necessary to completely #ifdef out raw_co_zone_mgmt() and
> > related functions instead of #else return -ENOTSUP.
> >
> >> +static BlockDriver bdrv_zoned_host_device =3D {
> >> +    .format_name =3D "zoned_host_device",
> >> +    .protocol_name =3D "zoned_host_device",
> >> +    .instance_size =3D sizeof(BDRVRawState),
> >> +    .bdrv_needs_filename =3D true,
> >> +    .bdrv_probe_device  =3D hdev_probe_device,
> >> +    .bdrv_file_open     =3D hdev_open,
> >> +    .bdrv_close         =3D raw_close,
> >> +    .bdrv_reopen_prepare =3D raw_reopen_prepare,
> >> +    .bdrv_reopen_commit  =3D raw_reopen_commit,
> >> +    .bdrv_reopen_abort   =3D raw_reopen_abort,
> >> +    .bdrv_co_create_opts =3D bdrv_co_create_opts_simple,
> >> +    .create_opts         =3D &bdrv_create_opts_simple,
> >> +    .mutable_opts        =3D mutable_opts,
> >> +    .bdrv_co_invalidate_cache =3D raw_co_invalidate_cache,
> >> +    .bdrv_co_pwrite_zeroes =3D hdev_co_pwrite_zeroes,
> >> +
> >> +    .bdrv_co_preadv         =3D raw_co_preadv,
> >> +    .bdrv_co_pwritev        =3D raw_co_pwritev,
> >> +    .bdrv_co_flush_to_disk  =3D raw_co_flush_to_disk,
> >> +    .bdrv_co_pdiscard       =3D hdev_co_pdiscard,
> >> +    .bdrv_co_copy_range_from =3D raw_co_copy_range_from,
> >> +    .bdrv_co_copy_range_to  =3D raw_co_copy_range_to,
> >> +    .bdrv_refresh_limits =3D raw_refresh_limits,
> >> +    .bdrv_io_plug =3D raw_aio_plug,
> >> +    .bdrv_io_unplug =3D raw_aio_unplug,
> >> +    .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
> >> +
> >> +    .bdrv_co_truncate       =3D raw_co_truncate,
> >> +    .bdrv_getlength =3D raw_getlength,
> >> +    .bdrv_get_info =3D raw_get_info,
> >> +    .bdrv_get_allocated_file_size
> >> +                        =3D raw_get_allocated_file_size,
> >> +    .bdrv_get_specific_stats =3D hdev_get_specific_stats,
> >> +    .bdrv_check_perm =3D raw_check_perm,
> >> +    .bdrv_set_perm   =3D raw_set_perm,
> >> +    .bdrv_abort_perm_update =3D raw_abort_perm_update,
> >> +    .bdrv_probe_blocksizes =3D hdev_probe_blocksizes,
> >> +    .bdrv_probe_geometry =3D hdev_probe_geometry,
> >> +    .bdrv_co_ioctl =3D hdev_co_ioctl,
> >> +
> >> +    /* zone management operations */
> >> +    .bdrv_co_zone_report =3D raw_co_zone_report,
> >> +    .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> >> +};
> >> +#endif
> >> +
> >>  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_k=
ernel__)
> >>  static void cdrom_parse_filename(const char *filename, QDict *options=
,
> >>                                   Error **errp)
> >> @@ -4012,6 +4347,9 @@ static void bdrv_file_init(void)
> >>      bdrv_register(&bdrv_file);
> >>  #if defined(HAVE_HOST_BLOCK_DEVICE)
> >>      bdrv_register(&bdrv_host_device);
> >> +#if defined(CONFIG_BLKZONED)
> >> +    bdrv_register(&bdrv_zoned_host_device);
> >> +#endif
> >>  #ifdef __linux__
> >>      bdrv_register(&bdrv_host_cdrom);
> >>  #endif
> >> diff --git a/block/io.c b/block/io.c
> >> index 0a8cbefe86..5ab2d169c8 100644
> >> --- a/block/io.c
> >> +++ b/block/io.c
> >> @@ -3198,6 +3198,47 @@ out:
> >>      return co.ret;
> >>  }
> >>
> >> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t of=
fset,
> >> +                        unsigned int *nr_zones,
> >> +                        BlockZoneDescriptor *zones)
> >> +{
> >> +    BlockDriver *drv =3D bs->drv;
> >> +    CoroutineIOCompletion co =3D {
> >> +            .coroutine =3D qemu_coroutine_self(),
> >> +    };
> >> +    IO_CODE();
> >> +
> >> +    bdrv_inc_in_flight(bs);
> >> +    if (!drv || !drv->bdrv_co_zone_report) {
> >> +        co.ret =3D -ENOTSUP;
> >> +        goto out;
> >> +    }
> >> +    co.ret =3D drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
> >> +out:
> >> +    bdrv_dec_in_flight(bs);
> >> +    return co.ret;
> >> +}
> >> +
> >> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp =
op,
> >> +        int64_t offset, int64_t len)
> >> +{
> >> +    BlockDriver *drv =3D bs->drv;
> >> +    CoroutineIOCompletion co =3D {
> >> +            .coroutine =3D qemu_coroutine_self(),
> >> +    };
> >> +    IO_CODE();
> >> +
> >> +    bdrv_inc_in_flight(bs);
> >> +    if (!drv || !drv->bdrv_co_zone_mgmt) {
> >> +        co.ret =3D -ENOTSUP;
> >> +        goto out;
> >> +    }
> >> +    co.ret =3D drv->bdrv_co_zone_mgmt(bs, op, offset, len);
> >> +out:
> >> +    bdrv_dec_in_flight(bs);
> >> +    return co.ret;
> >> +}
> >> +
> >>  void *qemu_blockalign(BlockDriverState *bs, size_t size)
> >>  {
> >>      IO_CODE();
> >> diff --git a/include/block/block-common.h b/include/block/block-common=
.h
> >> index 36bd0e480e..8efb6b0c43 100644
> >> --- a/include/block/block-common.h
> >> +++ b/include/block/block-common.h
> >> @@ -49,6 +49,10 @@ typedef struct BlockDriver BlockDriver;
> >>  typedef struct BdrvChild BdrvChild;
> >>  typedef struct BdrvChildClass BdrvChildClass;
> >>
> >> +#ifndef HAVE_BLK_ZONE_REP_CAPACITY
> >> +#define BLK_ZONE_REP_CAPACITY (1 << 0)
> >> +#endif
> >
> > This constant is defined in <linux/blkzoned.h> and shouldn't be
> > redefined by QEMU. I think this was necessary because of the #ifdefs.
> > Please see my comment above about HAVE_BLK_ZONE_REP_CAPACITY.
> >
> >> +
> >>  typedef enum BlockZoneOp {
> >>      BLK_ZO_OPEN,
> >>      BLK_ZO_CLOSE,
> >> diff --git a/include/block/block-io.h b/include/block/block-io.h
> >> index fd25ffa9be..65463b88d9 100644
> >> --- a/include/block/block-io.h
> >> +++ b/include/block/block-io.h
> >> @@ -88,6 +88,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, vo=
id *buf);
> >>  /* Ensure contents are flushed to disk.  */
> >>  int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
> >>
> >> +/* Report zone information of zone block device. */
> >> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t of=
fset,
> >> +                                     unsigned int *nr_zones,
> >> +                                     BlockZoneDescriptor *zones);
> >> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp =
op,
> >> +                                   int64_t offset, int64_t len);
> >> +
> >>  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes)=
;
> >>  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
> >>  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> >> diff --git a/include/block/block_int-common.h b/include/block/block_in=
t-common.h
> >> index 7f7863cc9e..cdc06e77a6 100644
> >> --- a/include/block/block_int-common.h
> >> +++ b/include/block/block_int-common.h
> >> @@ -691,6 +691,12 @@ struct BlockDriver {
> >>                                            QEMUIOVector *qiov,
> >>                                            int64_t pos);
> >>
> >> +    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
> >> +            int64_t offset, unsigned int *nr_zones,
> >> +            BlockZoneDescriptor *zones);
> >> +    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, Block=
ZoneOp op,
> >> +            int64_t offset, int64_t len);
> >> +
> >>      /* removable device specific */
> >>      bool (*bdrv_is_inserted)(BlockDriverState *bs);
> >>      void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
> >> @@ -828,6 +834,24 @@ typedef struct BlockLimits {
> >>
> >>      /* device zone model */
> >>      BlockZoneModel zoned;
> >> +
> >> +    /* zone size expressed in bytes */
> >> +    uint32_t zone_size;
> >> +
> >> +    /* total number of zones */
> >> +    unsigned int nr_zones;
> >> +
> >> +    /* maximum sectors of a zone append write operation */
> >> +    int64_t max_append_sectors;
> >> +
> >> +    /* maximum number of open zones */
> >> +    int64_t max_open_zones;
> >> +
> >> +    /* maximum number of active zones */
> >> +    int64_t max_active_zones;
> >> +
> >> +    /* device capacity expressed in bytes */
> >> +    int64_t capacity;
> >>  } BlockLimits;
> >>
> >>  typedef struct BdrvOpBlocker BdrvOpBlocker;
> >> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> >> index 21fc10c4c9..3d26929cdd 100644
> >> --- a/include/block/raw-aio.h
> >> +++ b/include/block/raw-aio.h
> >> @@ -29,6 +29,8 @@
> >>  #define QEMU_AIO_WRITE_ZEROES 0x0020
> >>  #define QEMU_AIO_COPY_RANGE   0x0040
> >>  #define QEMU_AIO_TRUNCATE     0x0080
> >> +#define QEMU_AIO_ZONE_REPORT  0x0100
> >> +#define QEMU_AIO_ZONE_MGMT    0x0200
> >>  #define QEMU_AIO_TYPE_MASK \
> >>          (QEMU_AIO_READ | \
> >>           QEMU_AIO_WRITE | \
> >> @@ -37,7 +39,9 @@
> >>           QEMU_AIO_DISCARD | \
> >>           QEMU_AIO_WRITE_ZEROES | \
> >>           QEMU_AIO_COPY_RANGE | \
> >> -         QEMU_AIO_TRUNCATE)
> >> +         QEMU_AIO_TRUNCATE  | \
> >> +         QEMU_AIO_ZONE_REPORT | \
> >> +         QEMU_AIO_ZONE_MGMT)
> >>
> >>  /* AIO flags */
> >>  #define QEMU_AIO_MISALIGNED   0x1000
> >> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-=
backend-io.h
> >> index 50f5aa2e07..6835525582 100644
> >> --- a/include/sysemu/block-backend-io.h
> >> +++ b/include/sysemu/block-backend-io.h
> >> @@ -45,6 +45,12 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int6=
4_t offset,
> >>                              BlockCompletionFunc *cb, void *opaque);
> >>  BlockAIOCB *blk_aio_flush(BlockBackend *blk,
> >>                            BlockCompletionFunc *cb, void *opaque);
> >> +BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
> >> +                                unsigned int *nr_zones, BlockZoneDesc=
riptor *zones,
> >> +                                BlockCompletionFunc *cb, void *opaque=
);
> >> +BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> >> +                              int64_t offset, int64_t len,
> >> +                              BlockCompletionFunc *cb, void *opaque);
> >>  BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64=
_t bytes,
> >>                               BlockCompletionFunc *cb, void *opaque);
> >>  void blk_aio_cancel_async(BlockAIOCB *acb);
> >> @@ -156,6 +162,17 @@ int generated_co_wrapper blk_pwrite_zeroes(BlockB=
ackend *blk, int64_t offset,
> >>  int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offs=
et,
> >>                                        int64_t bytes, BdrvRequestFlags=
 flags);
> >>
> >> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset=
,
> >> +                                    unsigned int *nr_zones,
> >> +                                    BlockZoneDescriptor *zones);
> >> +int generated_co_wrapper blk_zone_report(BlockBackend *blk, int64_t o=
ffset,
> >> +                                         unsigned int *nr_zones,
> >> +                                         BlockZoneDescriptor *zones);
> >> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> >> +                                  int64_t offset, int64_t len);
> >> +int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, BlockZoneOp=
 op,
> >> +                                       int64_t offset, int64_t len);
> >> +
> >>  int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offs=
et,
> >>                                        int64_t bytes);
> >>  int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
> >> diff --git a/meson.build b/meson.build
> >> index 63cfb844cf..9a797388ad 100644
> >> --- a/meson.build
> >> +++ b/meson.build
> >> @@ -1882,6 +1882,7 @@ config_host_data.set('CONFIG_REPLICATION', get_o=
ption('replication').allowed())
> >>  # has_header
> >>  config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
> >>  config_host_data.set('CONFIG_LINUX_MAGIC_H', cc.has_header('linux/mag=
ic.h'))
> >> +config_host_data.set('CONFIG_BLKZONED', cc.has_header('linux/blkzoned=
.h'))
> >>  config_host_data.set('CONFIG_VALGRIND_H', cc.has_header('valgrind/val=
grind.h'))
> >>  config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
> >>  config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
> >> @@ -1975,6 +1976,9 @@ config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_I=
D',
> >>  config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
> >>                       cc.has_member('struct stat', 'st_atim',
> >>                                     prefix: '#include <sys/stat.h>'))
> >> +config_host_data.set('HAVE_BLK_ZONE_REP_CAPACITY',
> >> +                     cc.has_member('struct blk_zone', 'capacity',
> >> +                                   prefix: '#include <linux/blkzoned.=
h>'))
> >>
> >>  # has_type
> >>  config_host_data.set('CONFIG_IOVEC',
> >> diff --git a/qapi/block-core.json b/qapi/block-core.json
> >> index f21fa235f2..ee87c1df8a 100644
> >> --- a/qapi/block-core.json
> >> +++ b/qapi/block-core.json
> >> @@ -2942,6 +2942,7 @@
> >>  # @compress: Since 5.0
> >>  # @copy-before-write: Since 6.2
> >>  # @snapshot-access: Since 7.0
> >> +# @zoned_host_device: Since 7.2
> >>  #
> >>  # Since: 2.9
> >>  ##
> >> @@ -2955,7 +2956,8 @@
> >>              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'par=
allels',
> >>              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', '=
rbd',
> >>              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> >> -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' =
] }
> >> +            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat',
> >> +            { 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' } =
] }
> >>
> >>  ##
> >>  # @BlockdevOptionsFile:
> >> @@ -4329,7 +4331,9 @@
> >>        'vhdx':       'BlockdevOptionsGenericFormat',
> >>        'vmdk':       'BlockdevOptionsGenericCOWFormat',
> >>        'vpc':        'BlockdevOptionsGenericFormat',
> >> -      'vvfat':      'BlockdevOptionsVVFAT'
> >> +      'vvfat':      'BlockdevOptionsVVFAT',
> >> +      'zoned_host_device': { 'type': 'BlockdevOptionsFile',
> >> +                             'if': 'CONFIG_BLKZONED' }
> >>    } }
> >>
> >>  ##
> >> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> >> index 952dc940f1..e56c8d1c30 100644
> >> --- a/qemu-io-cmds.c
> >> +++ b/qemu-io-cmds.c
> >> @@ -1712,6 +1712,149 @@ static const cmdinfo_t flush_cmd =3D {
> >>      .oneline    =3D "flush all in-core file state to disk",
> >>  };
> >>
> >> +static inline int64_t tosector(int64_t bytes) {
> >> +    return bytes >> BDRV_SECTOR_BITS;
> >> +}
> >> +
> >> +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> >> +{
> >> +    int ret;
> >> +    int64_t offset;
> >> +    unsigned int nr_zones;
> >> +
> >> +    ++optind;
> >> +    offset =3D cvtnum(argv[optind]);
> >> +    ++optind;
> >> +    nr_zones =3D cvtnum(argv[optind]);
> >> +
> >> +    g_autofree BlockZoneDescriptor *zones =3D NULL;
> >> +    zones =3D g_new(BlockZoneDescriptor, nr_zones);
> >> +    ret =3D blk_zone_report(blk, offset, &nr_zones, zones);
> >> +    if (ret < 0) {
> >> +        printf("zone report failed: %s\n", strerror(-ret));
> >> +    } else {
> >> +        for (int i =3D 0; i < nr_zones; ++i) {
> >> +            printf("start: 0x%" PRIx64 ", len 0x%" PRIx64 ", "
> >> +                   "cap"" 0x%" PRIx64 ", wptr 0x%" PRIx64 ", "
> >> +                   "zcond:%u, [type: %u]\n",
> >> +                    tosector(zones[i].start), tosector(zones[i].lengt=
h),
> >> +                    tosector(zones[i].cap), tosector(zones[i].wp),
> >> +                    zones[i].cond, zones[i].type);
> >> +        }
> >> +    }
> >> +    return ret;
> >> +}
> >> +
> >> +static const cmdinfo_t zone_report_cmd =3D {
> >> +    .name =3D "zone_report",
> >> +    .altname =3D "zrp",
> >> +    .cfunc =3D zone_report_f,
> >> +    .argmin =3D 2,
> >> +    .argmax =3D 2,
> >> +    .args =3D "offset number",
> >> +    .oneline =3D "report zone information",
> >> +};
> >> +
> >> +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
> >> +{
> >> +    int ret;
> >> +    int64_t offset, len;
> >> +    ++optind;
> >> +    offset =3D cvtnum(argv[optind]);
> >> +    ++optind;
> >> +    len =3D cvtnum(argv[optind]);
> >> +    ret =3D blk_zone_mgmt(blk, BLK_ZO_OPEN, offset, len);
> >> +    if (ret < 0) {
> >> +        printf("zone open failed: %s\n", strerror(-ret));
> >> +    }
> >> +    return ret;
> >> +}
> >> +
> >> +static const cmdinfo_t zone_open_cmd =3D {
> >> +    .name =3D "zone_open",
> >> +    .altname =3D "zo",
> >> +    .cfunc =3D zone_open_f,
> >> +    .argmin =3D 2,
> >> +    .argmax =3D 2,
> >> +    .args =3D "offset len",
> >> +    .oneline =3D "explicit open a range of zones in zone block device=
",
> >> +};
> >> +
> >> +static int zone_close_f(BlockBackend *blk, int argc, char **argv)
> >> +{
> >> +    int ret;
> >> +    int64_t offset, len;
> >> +    ++optind;
> >> +    offset =3D cvtnum(argv[optind]);
> >> +    ++optind;
> >> +    len =3D cvtnum(argv[optind]);
> >> +    ret =3D blk_zone_mgmt(blk, BLK_ZO_CLOSE, offset, len);
> >> +    if (ret < 0) {
> >> +        printf("zone close failed: %s\n", strerror(-ret));
> >> +    }
> >> +    return ret;
> >> +}
> >> +
> >> +static const cmdinfo_t zone_close_cmd =3D {
> >> +    .name =3D "zone_close",
> >> +    .altname =3D "zc",
> >> +    .cfunc =3D zone_close_f,
> >> +    .argmin =3D 2,
> >> +    .argmax =3D 2,
> >> +    .args =3D "offset len",
> >> +    .oneline =3D "close a range of zones in zone block device",
> >> +};
> >> +
> >> +static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
> >> +{
> >> +    int ret;
> >> +    int64_t offset, len;
> >> +    ++optind;
> >> +    offset =3D cvtnum(argv[optind]);
> >> +    ++optind;
> >> +    len =3D cvtnum(argv[optind]);
> >> +    ret =3D blk_zone_mgmt(blk, BLK_ZO_FINISH, offset, len);
> >> +    if (ret < 0) {
> >> +        printf("zone finish failed: %s\n", strerror(-ret));
> >> +    }
> >> +    return ret;
> >> +}
> >> +
> >> +static const cmdinfo_t zone_finish_cmd =3D {
> >> +    .name =3D "zone_finish",
> >> +    .altname =3D "zf",
> >> +    .cfunc =3D zone_finish_f,
> >> +    .argmin =3D 2,
> >> +    .argmax =3D 2,
> >> +    .args =3D "offset len",
> >> +    .oneline =3D "finish a range of zones in zone block device",
> >> +};
> >> +
> >> +static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
> >> +{
> >> +    int ret;
> >> +    int64_t offset, len;
> >> +    ++optind;
> >> +    offset =3D cvtnum(argv[optind]);
> >> +    ++optind;
> >> +    len =3D cvtnum(argv[optind]);
> >> +    ret =3D blk_zone_mgmt(blk, BLK_ZO_RESET, offset, len);
> >> +    if (ret < 0) {
> >> +        printf("zone reset failed: %s\n", strerror(-ret));
> >> +    }
> >> +    return ret;
> >> +}
> >> +
> >> +static const cmdinfo_t zone_reset_cmd =3D {
> >> +    .name =3D "zone_reset",
> >> +    .altname =3D "zrs",
> >> +    .cfunc =3D zone_reset_f,
> >> +    .argmin =3D 2,
> >> +    .argmax =3D 2,
> >> +    .args =3D "offset len",
> >> +    .oneline =3D "reset a zone write pointer in zone block device",
> >> +};
> >> +
> >>  static int truncate_f(BlockBackend *blk, int argc, char **argv);
> >>  static const cmdinfo_t truncate_cmd =3D {
> >>      .name       =3D "truncate",
> >> @@ -2504,6 +2647,11 @@ static void __attribute((constructor)) init_qem=
uio_commands(void)
> >>      qemuio_add_command(&aio_write_cmd);
> >>      qemuio_add_command(&aio_flush_cmd);
> >>      qemuio_add_command(&flush_cmd);
> >> +    qemuio_add_command(&zone_report_cmd);
> >> +    qemuio_add_command(&zone_open_cmd);
> >> +    qemuio_add_command(&zone_close_cmd);
> >> +    qemuio_add_command(&zone_finish_cmd);
> >> +    qemuio_add_command(&zone_reset_cmd);
> >>      qemuio_add_command(&truncate_cmd);
> >>      qemuio_add_command(&length_cmd);
> >>      qemuio_add_command(&info_cmd);
> >> --
> >> 2.37.3
> >>
>
> --
> Damien Le Moal
> Western Digital Research
>
>

