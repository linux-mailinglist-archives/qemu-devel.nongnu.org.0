Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FFE5F6B14
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:56:52 +0200 (CEST)
Received: from localhost ([::1]:40446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTEx-0008AT-EL
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogSci-00021u-Dy
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:17:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogSce-0005i1-Ba
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665069434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JhtwP9Rha2T8CiBHne1H2AinOelnCz69YUEY3AkMISc=;
 b=Wi4oI7MzIaVdDslxOHdWsjNY8jGeKQX+qhjxwjAMW2QgOG3Psk/TMEpGL25xJojmY/Rbdj
 J/aEQ1TgFJxebIWCMLAfgmU/g6aVk+D8e4yb2EUfg5WBiIc4bnhOKTiBzqounjsVvbhRD9
 Ox3pfiLlZbYHIaQESH/2yUw2wPngmoE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-FFAUB-V1PfSWaKWZ6X8w-Q-1; Thu, 06 Oct 2022 11:17:11 -0400
X-MC-Unique: FFAUB-V1PfSWaKWZ6X8w-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D09893815D3D;
 Thu,  6 Oct 2022 15:17:10 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0165145454E;
 Thu,  6 Oct 2022 15:17:09 +0000 (UTC)
Date: Thu, 6 Oct 2022 11:17:07 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 dmitry.fomichev@wdc.com
Subject: Re: [PATCH v10 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Message-ID: <Yz7xc+pQp7gsav57@fedora>
References: <20220929083631.61899-1-faithilikerun@gmail.com>
 <20220929083631.61899-4-faithilikerun@gmail.com>
 <YzsgP1ZLA9pjrIn8@fedora>
 <c44209ec-63d1-2870-9695-28696e8de5a8@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0E29EWUOTOiCl1OX"
Content-Disposition: inline
In-Reply-To: <c44209ec-63d1-2870-9695-28696e8de5a8@opensource.wdc.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0E29EWUOTOiCl1OX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2022 at 08:23:15AM +0900, Damien Le Moal wrote:
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
> >>  block/file-posix.c                | 340 +++++++++++++++++++++++++++++-
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
> >> =20
> >>  int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
> >> @@ -1775,6 +1784,143 @@ int coroutine_fn blk_co_flush(BlockBackend *bl=
k)
> >>      return ret;
> >>  }
> >> =20
> >> +static void blk_aio_zone_report_entry(void *opaque) {
> >=20
> >=20
> > The coroutine_fn annotation is missing:
> >=20
> >   static void coroutine_fn blk_aio_zone_report_entry(void *opaque) {
> >=20
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
> >> +                                BlockCompletionFunc *cb, void *opaque)
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
> >=20
> > coroutine_fn is missing here.
> >=20
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
> >> +                              BlockCompletionFunc *cb, void *opaque) {
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
> >> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
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
> >> +    ret =3D bdrv_co_zone_report(blk_bs(blk), offset, nr_zones, zones);
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
> >=20
> > Please remove this field if it is unused.
> >=20
> >> +        } zone_mgmt;
> >>      };
> >>  } RawPosixAIOData;
> >> =20
> >> @@ -1339,7 +1351,7 @@ static void raw_refresh_limits(BlockDriverState =
*bs, Error **errp)
> >>  #endif
> >> =20
> >>      if (bs->sg || S_ISBLK(st.st_mode)) {
> >> -        int ret =3D hdev_get_max_hw_transfer(s->fd, &st);
> >> +        ret =3D hdev_get_max_hw_transfer(s->fd, &st);
> >> =20
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
> >> +       =20
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
> >=20
> > The QEMU block layer already knows the capacity of the device. Can
> > bdrv_getlength() be used instead of introducing a new
> > BlockLimits.capacity field?
> >=20
> >> +    }
> >>  }
> >> =20
> >>  static int check_for_dasd(int fd)
> >> @@ -1850,6 +1897,147 @@ static off_t copy_file_range(int in_fd, off_t =
*in_off, int out_fd,
> >>  }
> >>  #endif
> >> =20
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
> >> +   =20
> >> +    if (rep->flags & BLK_ZONE_REP_CAPACITY) {
> >> +        zone->cap =3D blkz->capacity << BDRV_SECTOR_BITS;
> >=20
> > #ifdef HAVE_BLK_ZONE_REP_CAPACITY is needed since the rep->flags and
> > blkz->capacity fields are missing and would cause a compilation error
> > when HAVE_BLK_ZONE_REP_CAPACITY is not defined:
> >=20
> >   zone->cap =3D blkz->len << BDRV_SECTOR_BITS;
> >   #ifdef HAVE_BLK_ZONE_REP_CAPACITY
> >   /* Replace with the dedicated field on newer kernels */
> >   if (rep->flags & BLK_ZONE_REP_CAPACITY) {
> >       zone->cap =3D blkz->capacity << BDRV_SECTOR_BITS;
> >   }
> >   #endif
>=20
> It would be a lot cleaner to do something like this:
>=20
> in the block common header file, add:
>=20
> #ifdef HAVE_BLK_ZONE_REP_CAPACITY
>=20
> #define BLK_ZONE_REP_CAPACITY   (1 << 0)
>=20
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
>=20
> struct blk_zone_report_v2 {
>         __u64   sector;
>         __u32   nr_zones;
>         __u32   flags;
> 	struct blk_zone zones[0];
> };
> #define blk_zone_report blk_zone_report_v2
>=20
> #endif
>=20
> Then the above code becomes:
>=20
> if (rep->flags & BLK_ZONE_REP_CAPACITY) {
>     zone->cap =3D blkz->capacity << BDRV_SECTOR_BITS;
> } else {
>     zone->cap =3D blkz->len << BDRV_SECTOR_BITS;
> }
>=20
> No #ifdef in the C code, only in the header and that compiles and works f=
or all
> host kernel versions.

The ->flags field doesn't exist in old versions of the header. How will
"if (rep->flags ..." compile on old systems?

Stefan

--0E29EWUOTOiCl1OX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM+8XMACgkQnKSrs4Gr
c8iFrgf/UB37P5Dh7rPqykZPWw1EhYjowyv7KwSz5DblMFo3hymAvzwKSW9tRuNA
dN7nT4F+YE/wKH6pc7xZT/M/V/VbKv7dqHRoTAMV0qE1W84l8NH6sCouXgA+YNWi
/eHOWlrbJ38XyxbWLZOQYkZRXgRt8l94J4YZBLLTmj7kDJvZzvlBTxXtP84uQew1
MzxwITiSfiInsK9Emuo6cXca35C9y29UJWSfjqLa+9JFlddrxDiVntTJdvIcf73u
J/s0BNuBQ+B6LTpvV3pAehK1/xUsmL+84GhFUnhkJYQqupC+Xm7OvmTW+JzlSLaC
LTpShX/CuriC/wrZaJ7pzGELf1yv2w==
=d6tr
-----END PGP SIGNATURE-----

--0E29EWUOTOiCl1OX--


