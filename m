Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABDF6D4EA0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 19:05:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjNbT-0001H6-Rz; Mon, 03 Apr 2023 13:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjNbR-0001Gf-N1
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjNbP-00089U-Ig
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680541458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1aXiNGRWqndeS0vAUnuKocqzR3r28SW2WgkynxB7LZg=;
 b=IOAdgVOm+hFTOndDBDt+mbVJjc7isxeXGlwP7qZTL92TlzdTGcL9sVi9n+4nteR6Ijku9Z
 BKvdqtapf1HsS7kBN7n6eJz2hHX8VIwTQqXGogDMrEkORYAkgozui1iyaBIwICiUUrWhb6
 z0qVUp9nE2IOJAaX+Z2ufP7+o5BhnJk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-3DxfKdfsPAGRo7gY-jgkOg-1; Mon, 03 Apr 2023 13:04:15 -0400
X-MC-Unique: 3DxfKdfsPAGRo7gY-jgkOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EE381C08785;
 Mon,  3 Apr 2023 17:04:14 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59D4A40C6EC4;
 Mon,  3 Apr 2023 17:04:13 +0000 (UTC)
Date: Mon, 3 Apr 2023 13:04:11 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, hare@suse.de,
 Fam Zheng <fam@euphon.net>, dmitry.fomichev@wdc.com,
 damien.lemoal@opensource.wdc.com, Julia Suvorova <jusual@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v7 1/4] file-posix: add tracking of the zone write pointers
Message-ID: <20230403170411.GB318024@fedora>
References: <20230323051907.5948-1-faithilikerun@gmail.com>
 <20230323051907.5948-2-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FJMnOb6P8fcNgx2C"
Content-Disposition: inline
In-Reply-To: <20230323051907.5948-2-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


--FJMnOb6P8fcNgx2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 01:19:04PM +0800, Sam Li wrote:
> Since Linux doesn't have a user API to issue zone append operations to
> zoned devices from user space, the file-posix driver is modified to add
> zone append emulation using regular writes. To do this, the file-posix
> driver tracks the wp location of all zones of the device. It uses an
> array of uint64_t. The most significant bit of each wp location indicates
> if the zone type is conventional zones.
>=20
> The zones wp can be changed due to the following operations issued:
> - zone reset: change the wp to the start offset of that zone
> - zone finish: change to the end location of that zone
> - write to a zone
> - zone append
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/file-posix.c               | 168 ++++++++++++++++++++++++++++++-
>  include/block/block-common.h     |  14 +++
>  include/block/block_int-common.h |   5 +
>  3 files changed, 183 insertions(+), 4 deletions(-)
>=20
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 65efe5147e..0fb425dcae 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1324,6 +1324,85 @@ static int hdev_get_max_segments(int fd, struct st=
at *st)
>  #endif
>  }
> =20
> +#if defined(CONFIG_BLKZONED)
> +/*
> + * If the ra (reset_all) flag > 0, then the wp of that zone should be re=
set to
> + * the start sector. Else, take the real wp of the device.
> + */
> +static int get_zones_wp(int fd, BlockZoneWps *wps, int64_t offset,
> +                        unsigned int nrz, int ra) {

Please use bool for true/false and use clear variable names:
int ra -> bool reset_all

> +    struct blk_zone *blkz;
> +    size_t rep_size;
> +    uint64_t sector =3D offset >> BDRV_SECTOR_BITS;
> +    int ret, n =3D 0, i =3D 0;
> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct bl=
k_zone);
> +    g_autofree struct blk_zone_report *rep =3D NULL;
> +
> +    rep =3D g_malloc(rep_size);
> +    blkz =3D (struct blk_zone *)(rep + 1);
> +    while (n < nrz) {
> +        memset(rep, 0, rep_size);
> +        rep->sector =3D sector;
> +        rep->nr_zones =3D nrz - n;
> +
> +        do {
> +            ret =3D ioctl(fd, BLKREPORTZONE, rep);
> +        } while (ret !=3D 0 && errno =3D=3D EINTR);
> +        if (ret !=3D 0) {
> +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " failed =
%d",
> +                    fd, offset, errno);
> +            return -errno;
> +        }
> +
> +        if (!rep->nr_zones) {
> +            break;
> +        }
> +
> +        for (i =3D 0; i < rep->nr_zones; i++, n++) {
> +            /*
> +             * The wp tracking cares only about sequential writes requir=
ed and
> +             * sequential write preferred zones so that the wp can advan=
ce to
> +             * the right location.
> +             * Use the most significant bit of the wp location to indica=
te the
> +             * zone type: 0 for SWR/SWP zones and 1 for conventional zon=
es.
> +             */
> +            if (blkz[i].type =3D=3D BLK_ZONE_TYPE_CONVENTIONAL) {
> +                wps->wp[i] &=3D 1ULL << 63;
> +            } else {
> +                switch(blkz[i].cond) {
> +                case BLK_ZONE_COND_FULL:
> +                case BLK_ZONE_COND_READONLY:
> +                    /* Zone not writable */
> +                    wps->wp[i] =3D (blkz[i].start + blkz[i].len) << BDRV=
_SECTOR_BITS;
> +                    break;
> +                case BLK_ZONE_COND_OFFLINE:
> +                    /* Zone not writable nor readable */
> +                    wps->wp[i] =3D (blkz[i].start) << BDRV_SECTOR_BITS;
> +                    break;
> +                default:
> +                    if (ra > 0) {
> +                        wps->wp[i] =3D blkz[i].start << BDRV_SECTOR_BITS;
> +                    } else {
> +                        wps->wp[i] =3D blkz[i].wp << BDRV_SECTOR_BITS;
> +                    }
> +                    break;
> +                }
> +            }
> +        }
> +        sector =3D blkz[i - 1].start + blkz[i - 1].len;
> +    }
> +
> +    return 0;
> +}
> +
> +static void update_zones_wp(int fd, BlockZoneWps *wps, int64_t offset,
> +                            unsigned int nrz) {

QEMU coding style puts the opening curly bracket on a new line:

  static void update_zones_wp(int fd, BlockZoneWps *wps, int64_t offset,
                              unsigned int nrz)
  {

> +    if (get_zones_wp(fd, wps, offset, nrz, 0) < 0) {
> +        error_report("update zone wp failed");
> +    }
> +}
> +#endif
> +
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s =3D bs->opaque;
> @@ -1413,6 +1492,21 @@ static void raw_refresh_limits(BlockDriverState *b=
s, Error **errp)
>          if (ret >=3D 0) {
>              bs->bl.max_active_zones =3D ret;
>          }
> +
> +        ret =3D get_sysfs_long_val(&st, "physical_block_size");
> +        if (ret >=3D 0) {
> +            bs->bl.write_granularity =3D ret;
> +        }
> +
> +        bs->bl.wps =3D g_malloc(sizeof(BlockZoneWps) +
> +                sizeof(int64_t) * bs->bl.nr_zones);

This function can be called multiple times, so the old bs->bl.wps needs
to be freed to avoid a memory leak here.

> +        ret =3D get_zones_wp(s->fd, bs->bl.wps, 0, bs->bl.nr_zones, 0);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "report wps failed");
> +            g_free(bs->bl.wps);

Please set it to NULL to reduce the risk of a double-free.

> +            return;
> +        }
> +        qemu_co_mutex_init(&bs->bl.wps->colock);

I just noticed there is a problem with keeping the mutex and
heap-allocated wps inside bs.bl. bdrv_refresh_limits does this:

  memset(&bs->bl, 0, sizeof(bs->bl));

It would be possible to exclude the wps and mutex from the memset, but
maybe they should be BlockDriverState fields instead. They are not
really limits.

>          return;
>      }
>  out:
> @@ -2338,9 +2432,15 @@ static int coroutine_fn raw_co_prw(BlockDriverStat=
e *bs, uint64_t offset,
>  {
>      BDRVRawState *s =3D bs->opaque;
>      RawPosixAIOData acb;
> +    int ret;
> =20
>      if (fd_open(bs) < 0)
>          return -EIO;
> +#if defined(CONFIG_BLKZONED)
> +    if (type & QEMU_AIO_WRITE && bs->bl.wps) {
> +        qemu_co_mutex_lock(&bs->bl.wps->colock);
> +    }
> +#endif
> =20
>      /*
>       * When using O_DIRECT, the request must be aligned to be able to use
> @@ -2354,14 +2454,16 @@ static int coroutine_fn raw_co_prw(BlockDriverSta=
te *bs, uint64_t offset,
>      } else if (s->use_linux_io_uring) {
>          LuringState *aio =3D aio_get_linux_io_uring(bdrv_get_aio_context=
(bs));
>          assert(qiov->size =3D=3D bytes);
> -        return luring_co_submit(bs, aio, s->fd, offset, qiov, type);
> +        ret =3D luring_co_submit(bs, aio, s->fd, offset, qiov, type);
> +        goto out;
>  #endif
>  #ifdef CONFIG_LINUX_AIO
>      } else if (s->use_linux_aio) {
>          LinuxAioState *aio =3D aio_get_linux_aio(bdrv_get_aio_context(bs=
));
>          assert(qiov->size =3D=3D bytes);
> -        return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
> +        ret =3D laio_co_submit(bs, aio, s->fd, offset, qiov, type,
>                                s->aio_max_batch);
> +        goto out;
>  #endif
>      }
> =20
> @@ -2378,7 +2480,32 @@ static int coroutine_fn raw_co_prw(BlockDriverStat=
e *bs, uint64_t offset,
>      };
> =20
>      assert(qiov->size =3D=3D bytes);
> -    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
> +    ret =3D raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
> +
> +out:
> +#if defined(CONFIG_BLKZONED)
> +    BlockZoneWps *wps =3D bs->bl.wps;
> +    if (ret =3D=3D 0) {
> +        if (type & QEMU_AIO_WRITE && wps && bs->bl.zone_size) {
> +            uint64_t *wp =3D &wps->wp[offset / bs->bl.zone_size];
> +            if (!BDRV_ZT_IS_CONV(*wp)) {
> +                /* Advance the wp if needed */
> +                if (offset + bytes > *wp) {
> +                    *wp =3D offset + bytes;
> +                }
> +            }
> +        }
> +    } else {
> +        if (type & QEMU_AIO_WRITE) {
> +            update_zones_wp(s->fd, bs->bl.wps, 0, 1);
> +        }
> +    }
> +
> +    if (type & QEMU_AIO_WRITE && wps) {
> +        qemu_co_mutex_unlock(&wps->colock);
> +    }
> +#endif
> +    return ret;
>  }
> =20
>  static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offs=
et,
> @@ -2486,6 +2613,11 @@ static void raw_close(BlockDriverState *bs)
>      BDRVRawState *s =3D bs->opaque;
> =20
>      if (s->fd >=3D 0) {
> +#if defined(CONFIG_BLKZONED)
> +        if (bs->bl.wps) {
> +            g_free(bs->bl.wps);
> +        }

The if statement can be replaced with an unconditional
g_free(bs->bl.wps) call. g_free(NULL) is valid and just returns
immediately.

> +#endif
>          qemu_close(s->fd);
>          s->fd =3D -1;
>      }
> @@ -3283,6 +3415,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDrive=
rState *bs, BlockZoneOp op,
>      const char *op_name;
>      unsigned long zo;
>      int ret;
> +    BlockZoneWps *wps =3D bs->bl.wps;
>      int64_t capacity =3D bs->total_sectors << BDRV_SECTOR_BITS;
> =20
>      zone_size =3D bs->bl.zone_size;
> @@ -3300,6 +3433,15 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriv=
erState *bs, BlockZoneOp op,
>          return -EINVAL;
>      }
> =20
> +    qemu_co_mutex_lock(&wps->colock);

I suggest using:

  QEMU_LOCK_GUARD(&wps->colock);
  ...

or:

  WITH_QEMU_LOCK_GUARD(&wps->colock) {
      ...
  }

instead of qemu_co_mutex_lock/unlock().

That way the lock is guaranteed to be unlocked when the function returns
and you don't need to convert the error code paths to use goto.

> +    uint32_t i =3D offset / bs->bl.zone_size;
> +    uint64_t *wp =3D &wps->wp[i];
> +    if (BDRV_ZT_IS_CONV(*wp) && len !=3D capacity) {
> +        error_report("zone mgmt operations are not allowed for conventio=
nal zones");
> +        ret =3D -EIO;
> +        goto out;
> +    }
> +
>      switch (op) {
>      case BLK_ZO_OPEN:
>          op_name =3D "BLKOPENZONE";
> @@ -3319,7 +3461,8 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDrive=
rState *bs, BlockZoneOp op,
>          break;
>      default:
>          error_report("Unsupported zone op: 0x%x", op);
> -        return -ENOTSUP;
> +        ret =3D -ENOTSUP;
> +        goto out;
>      }
> =20
>      acb =3D (RawPosixAIOData) {
> @@ -3337,10 +3480,27 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDri=
verState *bs, BlockZoneOp op,
>                          len >> BDRV_SECTOR_BITS);
>      ret =3D raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
>      if (ret !=3D 0) {
> +        update_zones_wp(s->fd, wps, offset, i);


>          ret =3D -errno;
>          error_report("ioctl %s failed %d", op_name, ret);
> +        goto out;
> +    }
> +
> +    if (zo =3D=3D BLKRESETZONE && len =3D=3D capacity) {
> +        ret =3D get_zones_wp(s->fd, wps, 0, bs->bl.nr_zones, 1);
> +        if (ret < 0) {
> +            error_report("reporting single wp failed");
> +            return ret;
> +        }
> +    } else if (zo =3D=3D BLKRESETZONE) {
> +        *wp =3D offset;
> +    } else if (zo =3D=3D BLKFINISHZONE) {
> +        /* The zoned device allows the last zone smaller that the zone s=
ize. */
> +        *wp =3D offset + len;
>      }

The BLKRESETZONE and BLKFINISHZONE only update one zone's wp, but
[offset, offset+len) can cover multiple zones.

A loop is needed to update wps for multiple zones:

  } else if (zo =3D=3D BLKRESETZONE) {
      for each zone {
          wp[i] =3D offset + i * zone_size;
      }
  } else if (zo =3D=3D BLKFINISHZONE) {
      for each zone {
          /* The last zone may be short */
          wp[i] =3D MIN(offset + (i + 1) * zone_size, offset + len);
      }
  }

> =20
> +out:
> +    qemu_co_mutex_unlock(&wps->colock);
>      return ret;
>  }
>  #endif
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index 1576fcf2ed..93196229ac 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -118,6 +118,14 @@ typedef struct BlockZoneDescriptor {
>      BlockZoneState state;
>  } BlockZoneDescriptor;
> =20
> +/*
> + * Track write pointers of a zone in bytes.
> + */
> +typedef struct BlockZoneWps {
> +    CoMutex colock;
> +    uint64_t wp[];
> +} BlockZoneWps;
> +
>  typedef struct BlockDriverInfo {
>      /* in bytes, 0 if irrelevant */
>      int cluster_size;
> @@ -240,6 +248,12 @@ typedef enum {
>  #define BDRV_SECTOR_BITS   9
>  #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
> =20
> +/*
> + * Get the first most significant bit of wp. If it is zero, then
> + * the zone type is SWR.
> + */
> +#define BDRV_ZT_IS_CONV(wp)    (wp & (1ULL << 63))
> +
>  #define BDRV_REQUEST_MAX_SECTORS MIN_CONST(SIZE_MAX >> BDRV_SECTOR_BITS,=
 \
>                                             INT_MAX >> BDRV_SECTOR_BITS)
>  #define BDRV_REQUEST_MAX_BYTES (BDRV_REQUEST_MAX_SECTORS << BDRV_SECTOR_=
BITS)
> diff --git a/include/block/block_int-common.h b/include/block/block_int-c=
ommon.h
> index 1bd2aef4d5..69d1c3e6dd 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -884,6 +884,11 @@ typedef struct BlockLimits {
> =20
>      /* maximum number of active zones */
>      int64_t max_active_zones;
> +
> +    /* array of write pointers' location of each zone in the zoned devic=
e. */
> +    BlockZoneWps *wps;
> +
> +    int64_t write_granularity;

What is this limit? Is it specific to zones?

>  } BlockLimits;
> =20
>  typedef struct BdrvOpBlocker BdrvOpBlocker;
> --=20
> 2.39.2
>=20

--FJMnOb6P8fcNgx2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQrBwsACgkQnKSrs4Gr
c8gjCAf9Fh3lBg4WHnzt/euI6pstIObu8aQJQq50k3bcc9ih/x2m2YDNj8OJYxCr
Ish468wP4XVtKq21Cm8+FNjNhECFyVmX6cc6F4NH032/ddPCEVUqmpX+dZ3idz8k
Gyip5c/hFVe6XZKhNKzprkpOsRDe0AtxxudapKmxE9kninTKUL+QNGMwyTCg2PTY
SF5OgqTYNq0fDyqzsFXAwCNcLSjdw7iylIt3L30s/fchoi5I5EZoqtTT4Uv45c6R
n5jpa8Ga5SCGvsG+wjFw00ggl74noznMoxK/tyrtNAYMRzmDqTZH3chWefIbXWww
zVXyzbHPW5JoPkC1Wxd0keHUobhCOw==
=NQHK
-----END PGP SIGNATURE-----

--FJMnOb6P8fcNgx2C--


