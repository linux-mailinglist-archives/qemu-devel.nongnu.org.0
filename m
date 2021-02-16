Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28CB31C47A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 01:03:07 +0100 (CET)
Received: from localhost ([::1]:44914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBnpa-00025i-4w
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 19:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBnnh-00010b-Qv
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:01:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBnnf-0000IW-5c
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613433665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tin75Cl9Z+LD3wXxGMRwHYzYQj4uYkrXnkKiPq/9unE=;
 b=eETVQBfUtaLOQwSL6Wc3NwgnV6n3HNxj5MS/m7EdIxRuPPOHZ95scF+e6zQmOonnHZACWW
 i0GbDw6rc0h6s65soYQgNxjicaqfNaPNiE4owdFAE3zIpCHYR7c9m1RTrhgXzQWj9iFFnT
 YQnB4H08zAzLzEkwUbtKTpCRHf7uPxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-hkA98ex_PICmmaK3q9J0sg-1; Mon, 15 Feb 2021 19:01:01 -0500
X-MC-Unique: hkA98ex_PICmmaK3q9J0sg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8087E7B9E;
 Tue, 16 Feb 2021 00:01:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 649BB5C541;
 Tue, 16 Feb 2021 00:00:56 +0000 (UTC)
Date: Mon, 15 Feb 2021 19:00:54 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] virtiofs_submounts.py test: Note on vmlinuz param
Message-ID: <20210216000054.GA117147@localhost.localdomain>
References: <20210212151649.252440-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210212151649.252440-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2021 at 04:16:49PM +0100, Max Reitz wrote:
> From the cancel message, it is not entirely clear why this parameter is
> mandatory now, or that it will be optional in the future.  Add such a
> more detailed explanation as a comment in the test source file.
>=20
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
> I=E2=80=99ve uploaded a build of Linux 5.10 here:
>   https://xanclic.moe/linux-5.10
>=20
> But I=E2=80=99ve decided against mentioning it in this new comment or the=
 cancel
> message, because, well, it=E2=80=99s my private server and I have limited
> bandwidth.
> ---
>  tests/acceptance/virtiofs_submounts.py | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/vi=
rtiofs_submounts.py
> index 949ca87a83..9a69b6b17b 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -228,6 +228,18 @@ class VirtiofsSubmountsTest(BootLinux):
>      def setUp(self):
>          vmlinuz =3D self.params.get('vmlinuz')
>          if vmlinuz is None:
> +            """
> +            The Linux kernel supports FUSE auto-submounts only as of 5.1=
0.
> +            boot_linux.py currently provides Fedora 31, whose kernel is =
too
> +            old, so this test cannot pass with the on-image kernel (you =
are
> +            welcome to try, hence the option to force such a test with
> +            -p vmlinuz=3D'').  Therefore, for now the user must provide =
a
> +            sufficiently new custom kernel, or effectively explicitly
> +            request failure with -p vmlinuz=3D''.
> +            Once an image with a sufficiently new kernel is available
> +            (probably Fedora 34), we can make -p vmlinuz=3D'' the defaul=
t, so
> +            that this parameter no longer needs to be specified.
> +            """
>              self.cancel('vmlinuz parameter not set; you must point it to=
 a '
>                          'Linux kernel binary to test (to run this test w=
ith ' \
>                          'the on-image kernel, set it to an empty string)=
')
> --=20
> 2.29.2
>=20

Hi Max,

FIY I'm queueing this patch.

Thanks,
- Cleber.

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmArCzIACgkQZX6NM6Xy
CfM3BQ//SE7c3mgxfQdD1FIlRhYwOuXHeBmEyuuVXGT1FtNbY1v9xqtOZDGfSnju
d0rGAaH4Zi6jGJKrhrAqKtouG86xuPd9/W43w1Spbp8RE9bfh58notsmBw6z4M1s
JC3dPykAe1ZWpcv+R3I7swo1MKR2qBNJ0adjLPRV+GxyfpzaOKEaS1ExxMTh/ZhX
FwpRDKmXqLM6Zvng7KUASZw67QroVFJHnDJwkwwbAeUKN/63uUN7NA9wF5f2EUUA
R0fjCGTPsUktEHrcijmfjuRRlBUAdafQrF0xqlhpF3nUshTD6+UEiAXwtFVPZAo6
RwxKXPJiJzfJ4BtGvXORDhKC1pYeIVbYYbahWFwFOq4V4L8/uTJjzqHJuGL9gmb8
l+sJHhhdV8zLp0ZQjgfbYGv+d0GfGVwb0J9XQUVSK3E5moDsiUJJQAJIiNiWazgj
v+Lj1sFpULjEqtp/zB5CgIchDGnG6nhmd/7jnaO68CrZoporgxTIWOTIklc+jDKy
VMa+HKSzxa6DZHRxRWT9lut01cYMh6h/a/GKb/D273FwT5PyqSBkUcelA3qJPZAJ
8dMF6k22VXeIp82glSnnrUe8xcfuz1sSVv3rS8yrEDyKU8fGe6UFCdZL4Uw/Q+1k
gjEGgLOxxNLU1U6KH8jMM+c5zB8Uq0o6TSa8PqT4b3lSpakLQCA=
=WRwT
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--


