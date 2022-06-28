Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04CF55BFAE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:02:12 +0200 (CEST)
Received: from localhost ([::1]:33014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o676p-0004uL-LS
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o66SU-0003nF-5b
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:20:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o66SS-0003Jb-4E
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656404427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XaKRqaQu/KublIfgALl438zzsNBNqCkjr7q4QWTJFlQ=;
 b=TS/Hg7zhsXrILygaLytb6u8wMNvAwyeirsYi1wR6bD7sSbc8/w89gxHTTBU68x0fbjtO6L
 x/+aPp9z5aK8QdP87wOrAU2CynT/s3/O6LjIyR1s8bGp2obAw5X1Ypn29ZDiRAp6vX/dfy
 gGpn6Z5MOhhCnZQ0kMX7aPJZE4w7pnI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-uA5Gf0glOvCsboen9s7L0w-1; Tue, 28 Jun 2022 04:20:21 -0400
X-MC-Unique: uA5Gf0glOvCsboen9s7L0w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5807C8001EA;
 Tue, 28 Jun 2022 08:20:21 +0000 (UTC)
Received: from localhost (unknown [10.39.195.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C774F492CA3;
 Tue, 28 Jun 2022 08:20:19 +0000 (UTC)
Date: Tue, 28 Jun 2022 09:09:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org
Subject: Re: [RFC v3 3/5] file-posix: introduce get_sysfs_long_val for zoned
 device information.
Message-ID: <Yrq3HUPe3QBjS2kq@stefanha-x1.localdomain>
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-4-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pdu7Rq6IUoZEPp6P"
Content-Disposition: inline
In-Reply-To: <20220627001917.9417-4-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--pdu7Rq6IUoZEPp6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 08:19:15AM +0800, Sam Li wrote:
> Use sysfs attribute files to get the zoned device information in case
> that ioctl() commands of zone management interface won't work. It can
> return long type of value like chunk_sectors, zoned_append_max_bytes,
> max_open_zones, max_active_zones.
> ---
>  block/file-posix.c | 37 +++++++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 12 deletions(-)
>=20
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 1b8b0d351f..73c2cdfbca 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1216,15 +1216,19 @@ static int hdev_get_max_hw_transfer(int fd, struc=
t stat *st)
>  #endif
>  }
> =20
> -static int hdev_get_max_segments(int fd, struct stat *st)
> -{
> +/*
> + * Get zoned device information (chunk_sectors, zoned_append_max_bytes,
> + * max_open_zones, max_active_zones) through sysfs attribute files.

This function is also used to get max_segments, which is not related to
zoned devices. How about:

  Get a block queue sysfs attribute value.

> + */
> +static long get_sysfs_long_val(int fd, struct stat *st,
> +                               const char *attribute) {
>  #ifdef CONFIG_LINUX
>      char buf[32];
>      const char *end;
>      char *sysfspath =3D NULL;
>      int ret;
>      int sysfd =3D -1;
> -    long max_segments;
> +    long val;
> =20
>      if (S_ISCHR(st->st_mode)) {
>          if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) =3D=3D 0) {
> @@ -1237,8 +1241,9 @@ static int hdev_get_max_segments(int fd, struct sta=
t *st)
>          return -ENOTSUP;
>      }
> =20
> -    sysfspath =3D g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segmen=
ts",
> -                                major(st->st_rdev), minor(st->st_rdev));
> +    sysfspath =3D g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
> +                                major(st->st_rdev), minor(st->st_rdev),
> +                                attribute);
>      sysfd =3D open(sysfspath, O_RDONLY);
>      if (sysfd =3D=3D -1) {
>          ret =3D -errno;
> @@ -1256,9 +1261,9 @@ static int hdev_get_max_segments(int fd, struct sta=
t *st)
>      }
>      buf[ret] =3D 0;
>      /* The file is ended with '\n', pass 'end' to accept that. */
> -    ret =3D qemu_strtol(buf, &end, 10, &max_segments);
> +    ret =3D qemu_strtol(buf, &end, 10, &val);
>      if (ret =3D=3D 0 && end && *end =3D=3D '\n') {
> -        ret =3D max_segments;
> +        ret =3D val;
>      }
> =20
>  out:
> @@ -1272,6 +1277,15 @@ out:
>  #endif
>  }
> =20
> +static int hdev_get_max_segments(int fd, struct stat *st) {
> +    int ret;
> +    ret =3D get_sysfs_long_val(fd, st, "max_segments");
> +    if (ret < 0) {
> +        return -1;

This hides the actual error number. The if statement can be dropped and
the function can be simplified to:

  static int hdev_get_max_segments(int fd, struct stat *st) {
      return get_sysfs_long_val(fd, st, "max_segments");
  }

Whether you want to keep the tiny helper function or inline
get_sysfs_long_val(fd, st, "max_segments") into the caller is up to you.

> +    }
> +    return ret;
> +}
> +
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s =3D bs->opaque;
> @@ -1872,6 +1886,7 @@ static int handle_aiocb_zone_report(void *opaque) {
> =20
>  static int handle_aiocb_zone_mgmt(void *opaque) {
>      RawPosixAIOData *aiocb =3D opaque;
> +    BlockDriverState *s =3D aiocb->bs;
>      int fd =3D aiocb->aio_fildes;
>      int64_t offset =3D aiocb->aio_offset;
>      int64_t len =3D aiocb->aio_nbytes;
> @@ -1884,11 +1899,9 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
>      int64_t zone_size_mask;
>      int ret;
> =20
> -    ret =3D ioctl(fd, BLKGETZONESZ, &zone_size);
> -    if (ret) {
> -        return -1;
> -    }
> -
> +    g_autofree struct stat *file =3D g_new(struct stat, 1);
> +    stat(s->filename, file);

There is no need to allocate struct stat using g_new(). It's a small
struct that can be on the stack.

Also, fstat(fd, &st) is preferred when the file descriptor is already
open because it avoids race conditions due to file renaming/path
traversal.

Here is how this could be written:

  struct stat st;
  if (fstat(fd, &st) < 0) {
      return -errno;
  }

> +    zone_size =3D get_sysfs_long_val(fd, file, "chunk_sectors");
>      zone_size_mask =3D zone_size - 1;
>      if (offset & zone_size_mask) {
>          error_report("offset is not the start of a zone");
> --=20
> 2.35.3
>=20

--pdu7Rq6IUoZEPp6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmK6tx0ACgkQnKSrs4Gr
c8h2NAgAhk1HL2ic3DZrIncY0d10ofobj7207MtbVNuAYKl0GKX0gjWikeA3wwh4
VnMb1vN6VVe9Lr60g/3DX7XyrJSigUH0NLkpCowoYEkmbpDjWwyOLaTNwh/+6Lbc
CAxoaRXLLlob22nPhKM+4iJq0mYr+3sf94wmugb8APOMbRUYwxrFRVpaIJOjr8YG
Wq4PCSJoQrOYmuJcvj/YhXzpZoER0PtZSG4jWgQAnRrsJ8PeNrUsdei59leJJarA
bQo5F+eKrGu3/swy7tfXkDu5lwGOuidH9Rl3RobTIDUPnr8HD/oFoNgPTXUCP+vs
GFYdJA1o+LMEWlJLGOrYalk5c4n3gQ==
=LRol
-----END PGP SIGNATURE-----

--pdu7Rq6IUoZEPp6P--


