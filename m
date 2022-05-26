Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49DA534C72
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:20:50 +0200 (CEST)
Received: from localhost ([::1]:54316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu9fl-0000VA-Gu
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9Ln-0001NN-JJ
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:00:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9Ll-0006WQ-Pa
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653555609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BnCjzeZv/L9JETVzpdLxtD+nK3QZiItNhuyHSQJx2Uk=;
 b=P/RcAeSQJErbLq5Jn255EpLsH7/yP/ydIOGEUj2sGrXHxXDLurxdr8Ce9SwSqLoK3FO0mI
 Uqp41LGeKYyD3ljvLPdT3s3+HoUHcutcCs9yfzvQ4ak2J2SnZf/O5FKSD+gYAbuz5x6yRH
 /gXzim8nZ52HFCiLFQgXzrFafhlYl3Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-irHMIogDOMait1FfYo3EDw-1; Thu, 26 May 2022 05:00:04 -0400
X-MC-Unique: irHMIogDOMait1FfYo3EDw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A92FC80B71A;
 Thu, 26 May 2022 09:00:03 +0000 (UTC)
Received: from localhost (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F12C2400DB3A;
 Thu, 26 May 2022 09:00:02 +0000 (UTC)
Date: Thu, 26 May 2022 10:00:00 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>,
 Ari Sundholm <ari@tuxera.com>
Subject: Re: [PATCH v3 06/10] block: Make 'bytes' param of
 bdrv_co_{pread,pwrite,preadv,pwritev}() an int64_t
Message-ID: <Yo9BkD5gNPSVwHgn@stefanha-x1.localdomain>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-7-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7AVku7SL/GZ+h062"
Content-Disposition: inline
In-Reply-To: <20220519144841.784780-7-afaria@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


--7AVku7SL/GZ+h062
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 03:48:36PM +0100, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement bdrv_{pread,pwrite}() using generated_co_wrapper.
>=20
> unsigned int fits in int64_t, so all callers remain correct.
>=20
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>  block/coroutines.h           | 4 ++--
>  include/block/block_int-io.h | 8 ++++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/block/coroutines.h b/block/coroutines.h
> index 830ecaa733..3f41238b33 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -91,11 +91,11 @@ int coroutine_fn blk_co_do_flush(BlockBackend *blk);
>   */
> =20
>  int generated_co_wrapper
> -bdrv_preadv(BdrvChild *child, int64_t offset, unsigned int bytes,
> +bdrv_preadv(BdrvChild *child, int64_t offset, int64_t bytes,
>              QEMUIOVector *qiov, BdrvRequestFlags flags);
> =20
>  int generated_co_wrapper
> -bdrv_pwritev(BdrvChild *child, int64_t offset, unsigned int bytes,
> +bdrv_pwritev(BdrvChild *child, int64_t offset, int64_t bytes,
>               QEMUIOVector *qiov, BdrvRequestFlags flags);
> =20
>  int generated_co_wrapper
> diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
> index d4d3bed783..e31f2b4311 100644
> --- a/include/block/block_int-io.h
> +++ b/include/block/block_int-io.h
> @@ -56,20 +56,24 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *chil=
d,
>      QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
> =20
>  static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
> -    int64_t offset, unsigned int bytes, void *buf, BdrvRequestFlags flag=
s)
> +    int64_t offset, int64_t bytes, void *buf, BdrvRequestFlags flags)
>  {
>      QEMUIOVector qiov =3D QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
>      IO_CODE();
> =20
> +    assert(bytes <=3D SIZE_MAX);

Maybe let the existing bdrv_check_request32() call in bdrv_co_preadv()
check this? It returns -EIO if bytes is too large.

--7AVku7SL/GZ+h062
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKPQZAACgkQnKSrs4Gr
c8iZWgf/TQIyGhh6vdKc31YazmytjshCohqTwq8vJguC66w3Cc85QJ9Ovj3k9u/j
WKdqbD4+XN/CAOA7z4DPWa7cExc3MEtuuxIofA+Q+uDrOqvX9Njt2bqRgVCKXzOy
4MN5mTtCvotOAAs/I2TMx6fqTqRzfjOXu6BlA3AJYrCESOFhKZxMQvfKUXxrHJsQ
kcdnmzCFR1B9YZMBMNMDy9XbmDbEZegw5StVPbh6sbjirksI9aNu5Hh/kbH2h1F6
qlMFKF5zAVTh7SHctktJamXhkickxpfUvlVW8KcPZ8kIrynw4d+LQwk5gX7GGF4T
xSxZqcFY8BExl+laADUyblBTfpfgCQ==
=py4r
-----END PGP SIGNATURE-----

--7AVku7SL/GZ+h062--


