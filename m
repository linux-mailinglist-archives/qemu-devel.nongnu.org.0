Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA6E31A594
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:43:29 +0100 (CET)
Received: from localhost ([::1]:39802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAeLg-0005cM-3x
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAdeH-0002E4-NW
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:58:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAde6-00037B-Tp
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:58:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613156305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3jYWpGD/VFruX4VW2TdVugGhPaCbYhrzoZTdjw6Pljs=;
 b=BpgdMyKgQdVb4F3J1SO+BLhaDvegcvgUbMdSQFDOyNRReblMXx0fCXFagXmj8ZNXC3GO+r
 oEaIpR9UvQmX0XUdmTjcWtvN9UmZq7WNR512hP6XfLsoMI61CUQxnPmFUnarpAhXYjpdZu
 3SH3vf6tCA6HFXa2zABh3FEzpPvmMIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-lVCMT2uXP8K9q29DAsa51g-1; Fri, 12 Feb 2021 13:58:20 -0500
X-MC-Unique: lVCMT2uXP8K9q29DAsa51g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD24979EC2;
 Fri, 12 Feb 2021 18:58:19 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 400C15D9FC;
 Fri, 12 Feb 2021 18:58:16 +0000 (UTC)
Date: Fri, 12 Feb 2021 13:58:14 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] virtiofs_submounts.py test: Note on vmlinuz param
Message-ID: <20210212185814.GA2653579@localhost.localdomain>
References: <20210212151649.252440-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210212151649.252440-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

--8t9RHnE3ZwKMSgU+
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
>

Hi Max,

This looks good to me, and I've also tested your kernel build and
works like a charm.

As further work on top of this, it may be beneficial to have test
documentation in a predictable place.  The possibilities that come to
my mind:

 * docs/devel/testing.rst
 * tests/acceptance/$test_file.py/data/README

On a different topic, the "https://avocado-project.org/data/assets" has
enough bandwidth and can be used to hold this type asset.  Alternatively,
we can add a bit more automation to this test by letting people do somethin=
g
like:

 $ avocado assets register virtiofs-auto-submounts-vmlinuz /path/to/vmlinuz

And on the test:

 vmlinuz =3D self.fetch_asset('virtiofs-auto-submounts-vmlinuz')

And the test should cancel if that asset has not been previously registered=
.

Anyway,

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAmz8QACgkQZX6NM6Xy
CfOfyg//abhb3mP7ZbKXkRFznx17GZ6Bo/5O0lWnJI7/lrZbsrSrn6sS2EaJKmam
03xd7D6DU+m1DrlRjcNh+cQ6oLfJJH6uHrSF+gESv6mzHxbNLsk+7bhLpY/FxCFq
FMWb3KBIkMiThiSHGlryKr8SYz770Wnh2Mtp/8IHLW35D4ka16Whbe+p4dnpRWc+
d8uIoaHU1mEg/LJg5HUnI0atcgdtqlesDE3Bp4IYFMCluj8pKtC3TpfvS6h1DEl3
fGhRyGVx+vSwJFP5WNwI4Wf+v5bO571lV8jfbkRoY1OhDyXFDHGqVGXKX5HvLohe
JuGwY/pFLU4HJ8u2AumScOGCQrO32ubK8Cui79b3JuL8uEjUOTOcVKNoe1gyNw2n
7TEyJbLjLpmyYK8FnezZbYXdozdG7D9NrCbfnLf4XRHNpN/7n1EdJ/arHXVU122/
ZYYrS1f94JBndbF7p76aSdT+GaJQ40ek7AdpJWpgOvlhiNxhnzLjGvgEOohS0UAr
SFhd6NPuH0yh/mMxEkey17JJj/JRc2QzCTqbd5thkeqTV7fPWIrRFRD6Fi3BASOy
/a5b760cVZVh2tCIgSlXx04TAAAP+5rFi3v4sVaw9U3iGGgSYhViHW03j8gCZfTQ
lx2iwq8e865fQh3ZR6aJi/AR89Vohe4yUNdIJgCP4IsrLKJuaU4=
=L6dk
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--


