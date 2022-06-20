Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E0A5511F1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 09:56:37 +0200 (CEST)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3CGx-0002lb-IB
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 03:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o3CFi-00025C-B3
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o3CFe-00064k-7W
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655711712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s11mXmOMcmt/fvwpKUvM5impyG9d+AOVsLCOnNl+M9A=;
 b=PkMG8or2yd3Wl8JnmCOvk+TztTdxMcGdxNnpFXWzak4+uJsuJWG67975sxAu0ISCOTRAZd
 f6xFkwhFoX3cfkN7XBPluLx7YzXCxQ8iPNXAPfYPvs+7k+rCbZ46Ir5P+hFhdh4/VF19R4
 cRo4xMpdPQzEVepjbnOy87pojTAetLs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-FQxmfxLgNz2AhNAu7hEvNQ-1; Mon, 20 Jun 2022 03:55:08 -0400
X-MC-Unique: FQxmfxLgNz2AhNAu7hEvNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC61C29AA2F5;
 Mon, 20 Jun 2022 07:55:07 +0000 (UTC)
Received: from localhost (unknown [10.39.193.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B626C50941;
 Mon, 20 Jun 2022 07:55:06 +0000 (UTC)
Date: Mon, 20 Jun 2022 08:55:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, dmitry.fomichev@wdc.com,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 hare@suse.de, damien.lemoal@opensource.wdc.com
Subject: Re: [RFC v2] Adding block layer APIs resembling Linux
 ZoneBlockDevice ioctls.
Message-ID: <YrAn2f4ORFziZ8vk@stefanha-x1.localdomain>
References: <20220620033611.82166-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9bK5mv8ockhkptCv"
Content-Disposition: inline
In-Reply-To: <20220620033611.82166-1-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--9bK5mv8ockhkptCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2022 at 11:36:11AM +0800, Sam Li wrote:

Hi Sam,
Is this version 2 of "[RFC v1] Add support for zoned device"? Please
keep the email subject line the same (except for "v2", "v3", etc) so
that it's clear which patch series this new version replaces.

> Fix some mistakes before. It can report a range of zones now.

This looks like the description of what changed compared to v1. Please
put the changelog below "---" in the future. When patch emails are
merged by git-am(1) it keeps the text above "---" and discards the text
below "---". The changelog is usually no longer useful once the patches
are merged, so it should be located below the "---" line.

The text above the "---" is the commit description (an explanation of
why this commit is necessary). In this case the commit description
should explain that this patch adds .bdrv_co_zone_report() and
=2Ebdrv_co_zone_mgmt() to BlockDriver so that zoned block devices can be
supported.

>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/block-backend.c             |  22 ++++
>  block/coroutines.h                |   5 +
>  block/file-posix.c                | 182 ++++++++++++++++++++++++++++++
>  block/io.c                        |  23 ++++
>  include/block/block-common.h      |  43 ++++++-
>  include/block/block-io.h          |  13 +++
>  include/block/block_int-common.h  |  20 ++++
>  qemu-io-cmds.c                    | 118 +++++++++++++++++++
>  tests/qemu-iotests/tests/zoned.sh |  52 +++++++++
>  9 files changed, 477 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qemu-iotests/tests/zoned.sh
>=20
> diff --git a/block/block-backend.c b/block/block-backend.c
> index e0e1aff4b1..20248e4a35 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -104,6 +104,8 @@ typedef struct BlockBackendAIOCB {
>      int ret;
>  } BlockBackendAIOCB;
> =20
> +
> +

Please avoid whitespace changes in code that is otherwise untouched by
your patch. Code changes can cause merge conflicts and they make it
harder to use git-annotate(1), so only changes that are necessary should
be included in a patch.

>  static const AIOCBInfo block_backend_aiocb_info =3D {
>      .get_aio_context =3D blk_aiocb_get_aio_context,
>      .aiocb_size =3D sizeof(BlockBackendAIOCB),
> @@ -1810,6 +1812,25 @@ int blk_flush(BlockBackend *blk)
>      return ret;
>  }
> =20

Please add a documentation comment for blk_co_zone_report() that
explains how to use the functions and the purpose of the arguments. For
example, does offset have to be the first byte in a zone or can it be
any byte offset? What are the alignment requirements of offset and len?
Why is nr_zones a pointer?

> +int blk_co_zone_report(BlockBackend *blk, int64_t offset, int64_t len,

Functions that run in coroutine context must be labeled with
coroutine_fn:

    int coroutine_fn blk_co_zone_report(...)

This tells humans and tools that the function can only be called from a
coroutine. There is a blog post about coroutines in QEMU here:
https://blog.vmsplice.net/2014/01/coroutines-in-qemu-basics.html

> +                       int64_t *nr_zones,
> +                       struct BlockZoneDescriptor *zones)

QEMU coding style uses typedefs when defining structs, so "struct
BlockZoneDescriptor *zones" should be written as "BlockZoneDescriptor
*zones".

> +{
> +    int ret;

This function is called from the I/O code path, please mark it with:

  IO_CODE();

=46rom include/block/block-io.h:

  * I/O API functions. These functions are thread-safe, and therefore
  * can run in any thread as long as the thread has called
  * aio_context_acquire/release().
  *
  * These functions can only call functions from I/O and Common categories,
  * but can be invoked by GS, "I/O or GS" and I/O APIs.
  *
  * All functions in this category must use the macro
  * IO_CODE();
  * to catch when they are accidentally called by the wrong API.

> +    ret =3D bdrv_co_zone_report(blk->root->bs, offset, len, nr_zones, zo=
nes);

Please add blk_inc_in_flight(blk) and blk_dec_in_flight(blk) around this
function call to ensure that zone report requests finish before I/O is
drained (see bdrv_drained_begin()). This is necessary so that it's
possible to wait for I/O requests, including zone report, to complete.

Similar to blk_co_do_preadv() we need blk_wait_while_drained(blk),
blk_check_byte_request(), and bdrv_inc_in_flight(bs) before calling
bdrv_co_zone_report(). bdrv_dec_in_flight(bs) needs to be called after
bdrv_co_zone_report() returns.

> +    return ret;
> +}
> +
> +int blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
> +        int64_t offset, int64_t len)
> +{
> +    int ret;
> +    ret =3D bdrv_co_zone_mgmt(blk->root->bs, op, offset, len);
> +
> +    return ret;
> +}

The same applies to this function.

> +
> +
>  void blk_drain(BlockBackend *blk)
>  {
>      BlockDriverState *bs =3D blk_bs(blk);
> @@ -2634,3 +2655,4 @@ int blk_make_empty(BlockBackend *blk, Error **errp)
> =20
>      return bdrv_make_empty(blk->root, errp);
>  }
> +

Unrelated whitespace change.

> diff --git a/block/coroutines.h b/block/coroutines.h
> index 830ecaa733..247326255f 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -80,6 +80,11 @@ int coroutine_fn
>  blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
> =20
>  int coroutine_fn blk_co_do_flush(BlockBackend *blk);
> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> +                                    int64_t len, int64_t *nr_zones,
> +                                    struct BlockZoneDescriptor *zones);
> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
> +        int64_t offset, int64_t len);
> =20
> =20
>  /*
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 48cd096624..71fd21f8ba 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -178,6 +178,137 @@ typedef struct BDRVRawReopenState {
>      bool check_cache_dropped;
>  } BDRVRawReopenState;
> =20
> +/*
> + * parse_zone - Fill a zone descriptor
> + */
> +static inline void parse_zone(struct BlockZoneDescriptor *zone,
> +        struct blk_zone *blkz) {
> +    zone->start =3D blkz->start << BDRV_SECTOR_BITS;
> +    zone->length =3D blkz->len << BDRV_SECTOR_BITS;
> +    zone->cap =3D blkz->capacity << BDRV_SECTOR_BITS;
> +    zone->wp =3D blkz->wp << BDRV_SECTOR_BITS;
> +    zone->type =3D blkz->type;
> +    zone->cond =3D blkz->type;

Should this be "zone->cond =3D blkz->cond"?

> +}
> +
> +/**
> + * zone report - Get a zone block device's information in the
> + * form of an array of zone descriptors.
> + *
> + * @param bs: passing zone block device file descriptor
> + * @param zones: Space to hold zone information on reply
> + * @param offset: the location in the zone block device
> + * @return 0 on success, -1 on failure
> + */
> +static int raw_co_zone_report(BlockDriverState *bs, int64_t offset, int6=
4_t len,

coroutine_fn

> +                              int64_t *nr_zones,
> +                              struct BlockZoneDescriptor *zones) {
> +    BDRVRawState *s =3D bs->opaque;
> +    struct blk_zone_report *rep;
> +    struct BlockZoneDescriptor bzd;
> +    struct blk_zone *blkz;
> +    int64_t zone_size_mask, end, rep_size, nrz;
> +    int ret, n =3D 0, i =3D 0;
> +
> +    printf("%s\n", "start to report zone");

This looks like debug output. QEMU has a tracing system that you can
use. See docs/devel/tracing.rst.

> +    nrz =3D *nr_zones;
> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct bl=
k_zone);
> +    rep =3D (struct blk_zone_report *)malloc(rep_size);

Please use g_autofree and g_new(). QEMU avoids direct use of malloc(3)/free=
(3).

> +    if (!rep) {
> +        return -1;
> +    }
> +
> +    zone_size_mask =3D zone_start_sector - 1;
> +    /* align up */
> +    end =3D ((offset + len + zone_size_mask) & (~zone_size_mask))
> +            >> BDRV_SECTOR_BITS;

More readable:

  end =3D DIV_ROUND_UP(offset + len, BDRV_SECTOR_SIZE);

> +
> +    blkz =3D (struct blk_zone *)(rep + 1);
> +    while (offset < end) {
> +        memset(rep, 0, rep_size);
> +        rep->sector =3D offset;
> +        rep->nr_zones =3D nrz;
> +
> +        ret =3D ioctl(s->fd, BLKREPORTZONE, rep);

Can this ioctl() block? It seems likely. If yes, then the call needs to
be made from the thread pool to avoid blocking the current thread. See
raw_thread_pool_submit().

> +        if (ret !=3D 0) {
> +            ret =3D -errno;
> +            error_report("%d: ioctl BLKREPORTZONE at %ld failed %d",
> +                         s->fd, offset, errno);
> +            free(rep);
> +            return ret;
> +        }
> +
> +        if (!rep->nr_zones) {
> +            break;
> +        }
> +
> +        for (i =3D 0; i < rep->nr_zones; i++) {
> +            parse_zone(&bzd, &blkz[i]);
> +            if (zones) {
> +                memcpy(&zones[n], &bzd, sizeof(bzd));

n is never incremented so this always overwrites the first element.

> +            }
> +        }
> +
> +        offset =3D blkz[i].start + blkz[i].len;
> +    }
> +

Does this function need to update *nr_zones =3D n before returning? How does
the caller know how many zones were returned?

> +    return ret;
> +}
> +
> +/**
> + * zone management operations - Execute an operation on a zone
> + */
> +static int raw_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
> +        int64_t offset, int64_t len) {
> +    BDRVRawState *s =3D bs->opaque;
> +    struct blk_zone_range range;
> +    const char *ioctl_name;
> +    uint64_t ioctl_op;

ioctl()'s second argument is unsigned long request. Please use unsigned
long to keep the types consistent.

> +    int64_t zone_size_mask, end;
> +    int ret;
> +
> +    zone_size_mask =3D zone_start_sector - 1;
> +    /* align up */
> +    end =3D ((offset + len + zone_size_mask) & (~zone_size_mask))
> +            >> BDRV_SECTOR_BITS;
> +    offset =3D (offset & (~zone_size_mask)) >> BDRV_SECTOR_BITS; /* alig=
n down */
> +
> +    switch (op) {
> +    case zone_open:
> +        ioctl_name =3D "BLKOPENZONE";
> +        ioctl_op =3D BLKOPENZONE;
> +        break;
> +    case zone_close:
> +        ioctl_name =3D "BLKCLOSEZONE";
> +        ioctl_op =3D BLKCLOSEZONE;
> +        break;
> +    case zone_finish:
> +        ioctl_name =3D "BLKFINISHZONE";
> +        ioctl_op =3D BLKFINISHZONE;
> +        break;
> +    case zone_reset:
> +        ioctl_name =3D "BLKRESETZONE";
> +        ioctl_op =3D BLKRESETZONE;
> +        break;
> +    default:
> +        error_report("Invalid zone operation 0x%x", op);
> +        errno =3D -EINVAL;
> +        return -1;
> +    }
> +
> +    /* Execute the operation */
> +    range.sector =3D offset;
> +    range.nr_sectors =3D end - offset;
> +    ret =3D ioctl(s->fd, ioctl_op, &range);
> +    if (ret !=3D 0) {
> +        error_report("ioctl %s failed %d",
> +                         ioctl_name, errno);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
>  static int fd_open(BlockDriverState *bs)
>  {
>      BDRVRawState *s =3D bs->opaque;
> @@ -3324,6 +3455,9 @@ BlockDriver bdrv_file =3D {
>      .bdrv_abort_perm_update =3D raw_abort_perm_update,
>      .create_opts =3D &raw_create_opts,
>      .mutable_opts =3D mutable_opts,
> +
> +    .bdrv_co_zone_report =3D raw_co_zone_report,
> +    .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
>  };
> =20
>  /***********************************************/
> @@ -3703,6 +3837,53 @@ static BlockDriver bdrv_host_device =3D {
>  #endif
>  };
> =20
> +static BlockDriver bdrv_zoned_host_device =3D {
> +        .format_name =3D "zoned_host_device",
> +        .protocol_name =3D "zoned_host_device",
> +        .instance_size =3D sizeof(BDRVRawState),
> +        .bdrv_needs_filename =3D true,
> +        .bdrv_probe_device  =3D hdev_probe_device,
> +        .bdrv_parse_filename =3D hdev_parse_filename,
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
> +
>  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_kern=
el__)
>  static void cdrom_parse_filename(const char *filename, QDict *options,
>                                   Error **errp)
> @@ -3964,6 +4145,7 @@ static void bdrv_file_init(void)
>  #if defined(HAVE_HOST_BLOCK_DEVICE)
>      bdrv_register(&bdrv_host_device);
>  #ifdef __linux__
> +    bdrv_register(&bdrv_zoned_host_device);
>      bdrv_register(&bdrv_host_cdrom);
>  #endif
>  #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
> diff --git a/block/io.c b/block/io.c
> index 789e6373d5..3e8bb83cc3 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3258,6 +3258,29 @@ out:
>      return co.ret;
>  }
> =20
> +int bdrv_co_zone_report(BlockDriverState *bs,
> +                        int64_t offset, int64_t len, int64_t *nr_zones,
> +                        struct BlockZoneDescriptor *zones)
> +{
> +    int ret =3D 0;
> +    if (!bs->drv->bdrv_co_zone_report(bs, offset, len, nr_zones, zones))=
 {
> +        return -ENOTSUP;
> +    }

This returns -ENOTSUP any time ->bdrv_co_zone_report() returns 0. Should
this be:

  if (!bs->drv->bdrv_co_zone_report) {
      return -ENOTSUP;
  }

  return bs->drv->bdrv_co_zone_report(bs, offset, len, nr_zones, zones);

?

> +
> +    return ret;
> +}
> +
> +int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
> +        int64_t offset, int64_t len)
> +{
> +    int ret =3D 0;
> +    if (!bs->drv->bdrv_co_zone_mgmt(bs, op, offset, len)) {
> +        return -ENOTSUP;
> +    }
> +
> +    return ret;
> +}
> +
>  void *qemu_blockalign(BlockDriverState *bs, size_t size)
>  {
>      IO_CODE();
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index fdb7306e78..24c468d8ad 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -23,7 +23,7 @@
>   */
>  #ifndef BLOCK_COMMON_H
>  #define BLOCK_COMMON_H
> -
> +#include <linux/blkzoned.h>

Linux-specific code must be #ifdef __linux__ to avoid compilation errors
on non-Linux hosts.

>  #include "block/aio.h"
>  #include "block/aio-wait.h"
>  #include "qemu/iov.h"
> @@ -48,6 +48,47 @@
>  typedef struct BlockDriver BlockDriver;
>  typedef struct BdrvChild BdrvChild;
>  typedef struct BdrvChildClass BdrvChildClass;
> +enum zone_type {

Please use "typedef enum { ... } BdrvZoneType" so that enums follow
QEMU's coding style.

> +    BLK_ZT_CONV =3D BLK_ZONE_TYPE_CONVENTIONAL,
> +    BLK_ZT_SWR =3D BLK_ZONE_TYPE_SEQWRITE_REQ,
> +    BLK_ZT_SWP =3D BLK_ZONE_TYPE_SEQWRITE_PREF,
> +};
> +
> +enum zone_cond {
> +    BLK_ZS_NOT_WP =3D BLK_ZONE_COND_NOT_WP,
> +    BLK_ZS_EMPTY =3D BLK_ZONE_COND_EMPTY,
> +    BLK_ZS_IOPEN =3D BLK_ZONE_COND_IMP_OPEN,
> +    BLK_ZS_EOPEN =3D BLK_ZONE_COND_EXP_OPEN,
> +    BLK_ZS_CLOSED =3D BLK_ZONE_COND_CLOSED,
> +    BLK_ZS_RDONLY =3D BLK_ZONE_COND_READONLY,
> +    BLK_ZS_FULL =3D BLK_ZONE_COND_FULL,
> +    BLK_ZS_OFFLINE =3D BLK_ZONE_COND_OFFLINE,
> +};

This 1:1 correspondence with Linux constants could make the code a
little harder to port.

Maybe QEMU's block layer should define its own numeric constants so the
code doesn't rely on operating system-specific headers.
block/file-posix.c #ifdef __linux__ code can be responsible for
converting Linux-specific constants to QEMU constants (and the 1:1
mapping can be used there).

> +
> +enum zone_op {
> +    zone_open,
> +    zone_close,
> +    zone_finish,
> +    zone_reset,
> +};
> +
> +/*
> + * Zone descriptor data structure.
> + * Provide information on a zone with all position and size values in by=
tes.
> + */
> +typedef struct BlockZoneDescriptor {
> +    uint64_t start;
> +    uint64_t length;
> +    uint64_t cap;
> +    uint64_t wp;
> +    enum zone_type type;
> +    enum zone_cond cond;
> +} BlockZoneDescriptor;
> +
> +enum zone_model {
> +    BLK_Z_HM,
> +    BLK_Z_HA,
> +};
> =20
>  typedef struct BlockDriverInfo {
>      /* in bytes, 0 if irrelevant */
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index 62c84f0519..deb8902684 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -80,6 +80,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void =
*buf);
>  /* Ensure contents are flushed to disk.  */
>  int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
> =20
> +/* Report zone information of zone block device. */
> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offse=
t,
> +                                     int64_t len, int64_t *nr_zones,
> +                                     struct BlockZoneDescriptor *zones);
> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
> +        int64_t offset, int64_t len);
> +
>  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
>  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
>  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> @@ -290,6 +297,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVecto=
r *qiov, int64_t pos);
>  int generated_co_wrapper
>  bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t po=
s);
> =20
> +int generated_co_wrapper blk_zone_report(BlockBackend *blk, int64_t offs=
et,
> +                                         int64_t len, int64_t *nr_zones,
> +                                         struct BlockZoneDescriptor *zon=
es);
> +int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, enum zone_op o=
p,
> +        int64_t offset, int64_t len);
> +
>  /**
>   * bdrv_parent_drained_begin_single:
>   *
> diff --git a/include/block/block_int-common.h b/include/block/block_int-c=
ommon.h
> index 8947abab76..4d0180a7da 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -63,6 +63,7 @@
>  #define BLOCK_OPT_EXTL2             "extended_l2"
> =20
>  #define BLOCK_PROBE_BUF_SIZE        512
> +#define zone_start_sector           512
> =20
>  enum BdrvTrackedRequestType {
>      BDRV_TRACKED_READ,
> @@ -94,6 +95,19 @@ typedef struct BdrvTrackedRequest {
>      struct BdrvTrackedRequest *waiting_for;
>  } BdrvTrackedRequest;
> =20
> +/**
> + * Zone device information data structure.
> + * Provide information on a device.
> + */
> +typedef struct zbd_dev {
> +    enum zone_model model;
> +    uint32_t block_size;

How does this relate to QEMU's BlockLimits?

> +    uint32_t write_granularity;

Same. Maybe this belongs in BlockLimits?

> +    uint32_t nr_zones;

Should this really be limited to 32-bit? For example, take 256 MB zones,
then the max nr_zones * 256 MB is much smaller than a uint64_t capacity
value. It seems safer to make this 64-bit, but maybe Dmitry, Hannes, or
Damien can tell us what to do here.

> +    struct BlockZoneDescriptor *zones; /* array of zones */

When is this used?

--9bK5mv8ockhkptCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKwJ9kACgkQnKSrs4Gr
c8jK9Qf/R8LnsG7cXgpGshedfgkCdXW0f1/OPqtj6H1CqYfWb10lLtrVSZDybtAR
1tnEQK9vNUOiXMUvYSwBkKWCd3By2svF1hsAYqgVz2trlsngPJ7c2r1xub9nib5F
Dw5H4vutbapRz8mCCZMwnjbmNfcrpbQ5kMMONtrk5uaBGJqcOKbcrpeTVR9LFKqU
dGgKPLr7/Vidf7X/cZ0s1LtnbYj5FhV9RfYZZ0D96WyumyaC44CxqjN80AdixlFZ
qumZepjQ0bvJ7ZzHRRli7gRYoTTnprAAunMyshKBW0R7SmQPBA9nelIOGEOaXjhb
KGraSNmp+cOLRgcrEKhBK8akNGwuDg==
=WQkt
-----END PGP SIGNATURE-----

--9bK5mv8ockhkptCv--


