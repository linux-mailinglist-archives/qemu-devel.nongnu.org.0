Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD676D8878
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 22:28:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk9iW-00083U-Nb; Wed, 05 Apr 2023 16:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pk9iV-00081s-AU
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 16:26:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pk9iT-0003j3-Cu
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 16:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680726408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JyZeZAl4d7MgDbsYXn4SOnz6G9TuMbOhwm+XFafltuA=;
 b=X9qhdiYzYoS4UkKZhMOtS4x4C6hHgUo6Ezq+Bj1DGsLgav1sO8zrEwue1wQCgPlNoy3jPv
 R7L4VQ2GKXJfiegYsdZD+8w6GJ6M6UjZRZgajZUkxRrAhrmvQBZqki5cGZ3frWv6rWhrbh
 9OXfePgyy/7xk1SN1cci9SkDmAAvgvM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-zGi6-x7-Nv2A8sGEcx9itA-1; Wed, 05 Apr 2023 16:26:44 -0400
X-MC-Unique: zGi6-x7-Nv2A8sGEcx9itA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE57F3802AC4;
 Wed,  5 Apr 2023 20:26:43 +0000 (UTC)
Received: from localhost (unknown [10.39.194.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0AF640C83A9;
 Wed,  5 Apr 2023 20:26:42 +0000 (UTC)
Date: Wed, 5 Apr 2023 16:26:41 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, damien.lemoal@opensource.wdc.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v8 1/4] file-posix: add tracking of the zone write pointers
Message-ID: <20230405202641.GD676473@fedora>
References: <20230404153239.32234-1-faithilikerun@gmail.com>
 <20230404153239.32234-2-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RDlr/n9gOlnwT0of"
Content-Disposition: inline
In-Reply-To: <20230404153239.32234-2-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--RDlr/n9gOlnwT0of
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 11:32:36PM +0800, Sam Li wrote:
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
>  3 files changed, 184 insertions(+), 3 deletions(-)
>=20
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 65efe5147e..bc58f7193b 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1324,6 +1324,88 @@ static int hdev_get_max_segments(int fd, struct st=
at *st)
>  #endif
>  }
> =20
> +#if defined(CONFIG_BLKZONED)
> +/*
> + * If the reset_all flag is true, then the wps of zone whose state is
> + * not readonly or offline should be all reset to the start sector.
> + * Else, take the real wp of the device.
> + */
> +static int get_zones_wp(int fd, BlockZoneWps *wps, int64_t offset,
> +                        unsigned int nrz, bool reset_all)
> +{
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

Should this be |=3D instead of &=3D? I think the intention is to set the
bit.

> +            } else {
> +                switch(blkz[i].cond) {
> +                case BLK_ZONE_COND_FULL:
> +                case BLK_ZONE_COND_READONLY:
> +                    /* Zone not writable */
> +                    wps->wp[i] =3D (blkz[i].start + blkz[i].len) << BDRV=
_SECTOR_BITS;

wps->wp[i] looks wrong in two cases:
1. After the first iteration of the while (n < nrz) loop.
2. When offset > 0.

I think there should be a j variable that tracks the index into wp[]. It
should be initialized outside the while loop based on offset and
incremented inside the for loop.

> +                    break;
> +                case BLK_ZONE_COND_OFFLINE:
> +                    /* Zone not writable nor readable */
> +                    wps->wp[i] =3D (blkz[i].start) << BDRV_SECTOR_BITS;
> +                    break;
> +                default:
> +                    if (reset_all) {
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
> +                            unsigned int nrz)
> +{
> +    if (get_zones_wp(fd, wps, offset, nrz, 0) < 0) {
> +        error_report("update zone wp failed");
> +    }
> +}
> +#endif
> +
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s =3D bs->opaque;
> @@ -1413,6 +1495,23 @@ static void raw_refresh_limits(BlockDriverState *b=
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
> +        /* The refresh_limits() function can be called multiple times. */
> +        bs->wps =3D NULL;

This needs to be g_free(bs->wps) to avoid leaking the odl bs->wps
memory.

(There are more complex solutions that reuse bs->wps when nr_zones has
not gotten larger, but freeing and allocating a new one is the simple
solution for now. This code isn't performance-critical.)

> +        bs->wps =3D g_malloc(sizeof(BlockZoneWps) +
> +                sizeof(int64_t) * bs->bl.nr_zones);
> +        ret =3D get_zones_wp(s->fd, bs->wps, 0, bs->bl.nr_zones, 0);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "report wps failed");
> +            bs->wps =3D NULL;
> +            return;
> +        }
> +        qemu_co_mutex_init(&bs->wps->colock);
>          return;
>      }
>  out:
> @@ -2338,9 +2437,15 @@ static int coroutine_fn raw_co_prw(BlockDriverStat=
e *bs, uint64_t offset,
>  {
>      BDRVRawState *s =3D bs->opaque;
>      RawPosixAIOData acb;
> +    int ret;
> =20
>      if (fd_open(bs) < 0)
>          return -EIO;
> +#if defined(CONFIG_BLKZONED)
> +    if (type & QEMU_AIO_WRITE && bs->wps) {
> +        QEMU_LOCK_GUARD(&bs->wps->colock);
> +    }

QEMU_LOCK_GUARD() has lexical scope so its lifetime ends at the end of
the {} block. Therefore it doesn't lock for the remainder of the
function.

This is a case where it's necessary to use qemu_co_mutex_lock() directly
and remember to qemu_co_mutex_unlock() at the exit point of this
function.

Stefan

--RDlr/n9gOlnwT0of
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQt2YEACgkQnKSrs4Gr
c8jE4wgAqvc2V1j92bQbfqlXbLIdoHkZW/BZikHaSSlOpQTIyWXJ7BWGmrrP5Kt0
B903+rnylZK5vV8U+m6Fz2zDHPkaKkY5jcm6LVfQaUCT4c+jxls/4GNfe8qjg/Ef
ex4vIo129QkTrI+V2+2Kreqi4dPEw0RJz23uN/akr5Cws5mZIts+BLtdcA3IHxoM
tMdYf1izIvZE+ByWfBYr5zBs0YZmo2JJI3aNf0DlLQ6G2+2qqSlDds8PymbZQjzu
szOu4J/5KK7n4o15lL+Mgpmvs0rkEFOVnhKO7fxwOQE0CqvtxNXZZ/uIFv3sVKBE
x9h1OvBWBhNxr6U2dG0GrNS5wKbNVw==
=HgTR
-----END PGP SIGNATURE-----

--RDlr/n9gOlnwT0of--


