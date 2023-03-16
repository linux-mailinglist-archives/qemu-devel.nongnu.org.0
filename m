Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714DD6BD97F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 20:47:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pctYr-0006vC-Mg; Thu, 16 Mar 2023 15:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pctYp-0006ug-N2
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 15:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pctYo-00089B-0B
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 15:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678996009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eQLIxXJWi3Lofj60d+8YYc83QkRspNpCC5Ao2sA5ouQ=;
 b=Y6zN7jGP2b5erJLcQRdWGFXHKPVOut3u5fGdAM3pmZJy4OV2EZLeu6Fyy35MGMb8oHDK1p
 dj51EszGsoCTiSylQuoBswcSyJ0E351do6ldoY/SJ9Ww6cjOrWDmn7NlRdD2CsnvVqVtwN
 X60A3dRBUwuy39LS7adD+OHFg3XmURg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-aaor-BeFMZ2ykyrgtDIoRw-1; Thu, 16 Mar 2023 15:46:45 -0400
X-MC-Unique: aaor-BeFMZ2ykyrgtDIoRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58D55811E7D;
 Thu, 16 Mar 2023 19:46:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9C83202701E;
 Thu, 16 Mar 2023 19:46:43 +0000 (UTC)
Date: Thu, 16 Mar 2023 14:59:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, hare@suse.de, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Subject: Re: [PATCH v6 3/4] qemu-iotests: test zone append operation
Message-ID: <20230316185926.GD63600@fedora>
References: <20230310103106.62124-1-faithilikerun@gmail.com>
 <20230310103106.62124-4-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="belQWximohIJe/x9"
Content-Disposition: inline
In-Reply-To: <20230310103106.62124-4-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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


--belQWximohIJe/x9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 06:31:05PM +0800, Sam Li wrote:
> This tests is mainly a helper to indicate append writes in block layer
> behaves as expected.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  qemu-io-cmds.c                     | 65 ++++++++++++++++++++++++++++++
>  tests/qemu-iotests/tests/zoned.out |  7 ++++
>  tests/qemu-iotests/tests/zoned.sh  |  9 +++++
>  3 files changed, 81 insertions(+)
>=20
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index f35ea627d7..4159f41ab9 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -1874,6 +1874,70 @@ static const cmdinfo_t zone_reset_cmd =3D {
>      .oneline =3D "reset a zone write pointer in zone block device",
>  };
> =20
> +static int do_aio_zone_append(BlockBackend *blk, QEMUIOVector *qiov,
> +                              int64_t *offset, int flags, int *total)
> +{
> +    int async_ret =3D NOT_DONE;
> +
> +    blk_aio_zone_append(blk, offset, qiov, flags, aio_rw_done, &async_re=
t);
> +    while (async_ret =3D=3D NOT_DONE) {
> +        main_loop_wait(false);
> +    }
> +
> +    *total =3D qiov->size;
> +    return async_ret < 0 ? async_ret : 1;
> +}
> +
> +static int zone_append_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int flags =3D 0;
> +    int total =3D 0;
> +    int64_t offset;
> +    char *buf;
> +    int nr_iov;
> +    int pattern =3D 0xcd;
> +    QEMUIOVector qiov;
> +
> +    if (optind > argc - 2) {
> +        return -EINVAL;
> +    }
> +    optind++;
> +    offset =3D cvtnum(argv[optind]);
> +    if (offset < 0) {
> +        print_cvtnum_err(offset, argv[optind]);
> +        return offset;
> +    }
> +    optind++;
> +    nr_iov =3D argc - optind;
> +    buf =3D create_iovec(blk, &qiov, &argv[optind], nr_iov, pattern,
> +                       flags & BDRV_REQ_REGISTERED_BUF);
> +    if (buf =3D=3D NULL) {
> +        return -EINVAL;
> +    }
> +    ret =3D do_aio_zone_append(blk, &qiov, &offset, flags, &total);
> +    if (ret < 0) {
> +        printf("zone append failed: %s\n", strerror(-ret));
> +        goto out;
> +    }

How about a -p option that prints the value of offset after the
operation completes? That way the test case can check that
blk_aio_zone_append() produces the right offset value.

(The tests should also check zone_report output, but they should verify
that offset is correctly updated by zone_append too.)

> +
> +out:
> +    qemu_io_free(blk, buf, qiov.size,
> +                 flags & BDRV_REQ_REGISTERED_BUF);
> +    qemu_iovec_destroy(&qiov);
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_append_cmd =3D {
> +    .name =3D "zone_append",
> +    .altname =3D "zap",
> +    .cfunc =3D zone_append_f,
> +    .argmin =3D 3,
> +    .argmax =3D 3,
> +    .args =3D "offset len [len..]",
> +    .oneline =3D "append write a number of bytes at a specified offset",
> +};
> +
>  static int truncate_f(BlockBackend *blk, int argc, char **argv);
>  static const cmdinfo_t truncate_cmd =3D {
>      .name       =3D "truncate",
> @@ -2672,6 +2736,7 @@ static void __attribute((constructor)) init_qemuio_=
commands(void)
>      qemuio_add_command(&zone_close_cmd);
>      qemuio_add_command(&zone_finish_cmd);
>      qemuio_add_command(&zone_reset_cmd);
> +    qemuio_add_command(&zone_append_cmd);
>      qemuio_add_command(&truncate_cmd);
>      qemuio_add_command(&length_cmd);
>      qemuio_add_command(&info_cmd);
> diff --git a/tests/qemu-iotests/tests/zoned.out b/tests/qemu-iotests/test=
s/zoned.out
> index 0c8f96deb9..b3b139b4ec 100644
> --- a/tests/qemu-iotests/tests/zoned.out
> +++ b/tests/qemu-iotests/tests/zoned.out
> @@ -50,4 +50,11 @@ start: 0x80000, len 0x80000, cap 0x80000, wptr 0x10000=
0, zcond:14, [type: 2]
>  (5) resetting the second zone
>  After resetting a zone:
>  start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type: =
2]
> +
> +
> +(6) append write
> +After appending the first zone:
> +start: 0x0, len 0x80000, cap 0x80000, wptr 0x18, zcond:2, [type: 2]
> +After appending the second zone:
> +start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80018, zcond:2, [type: =
2]
>  *** done
> diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests=
/zoned.sh
> index 9d7c15dde6..6c3ded6c4c 100755
> --- a/tests/qemu-iotests/tests/zoned.sh
> +++ b/tests/qemu-iotests/tests/zoned.sh
> @@ -79,6 +79,15 @@ echo "(5) resetting the second zone"
>  sudo $QEMU_IO $IMG -c "zrs 268435456 268435456"
>  echo "After resetting a zone:"
>  sudo $QEMU_IO $IMG -c "zrp 268435456 1"
> +echo
> +echo
> +echo "(6) append write" # physical block size of the device is 4096
> +sudo $QEMU_IO $IMG -c "zap 0 0x1000 0x2000"
> +echo "After appending the first zone:"
> +sudo $QEMU_IO $IMG -c "zrp 0 1"
> +sudo $QEMU_IO $IMG -c "zap 268435456 0x1000 0x2000"
> +echo "After appending the second zone:"
> +sudo $QEMU_IO $IMG -c "zrp 268435456 1"
> =20
>  # success, all done
>  echo "*** done"
> --=20
> 2.39.2
>=20

--belQWximohIJe/x9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQTZw4ACgkQnKSrs4Gr
c8iAXggAk6BhPELWYaFG8jsEDci5Ivhp+cNQ50POCiZIV4D50KFpSNnPDMZclnsL
p9XC6e9yAUoB6XLBCRkZYMm2wU4+T2I+H48Wq36b07JS1BYbspf0L12mZ4vbAhwz
K2/qk2VaZ6iVLP0VQXFodURJpzWxLikqJSlnzzlbvbcXsJ6kVqHclvONZ+BOxWzL
+1glO7/yAjFlq+BFksJVsyQNBcVVkyVqlSFmeZ9ji914lSJOM1zYfQQ6dpY+d40Q
VlTiTKJBQbru3hGfcTOZeOrvB3p7uwOI/qx6MO36NF3mkI+OdLyzP9Xmn+II2Xrx
5ib+GdFYDOeXxt+qgn1oOm/dAXua1A==
=v2/D
-----END PGP SIGNATURE-----

--belQWximohIJe/x9--


