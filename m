Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E2337B430
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 04:35:48 +0200 (CEST)
Received: from localhost ([::1]:41578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgeix-00068D-Cy
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 22:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lgeff-0001oL-Pn; Tue, 11 May 2021 22:32:23 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50383 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lgefc-0003ub-Om; Tue, 11 May 2021 22:32:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FfzMg2hldz9sXb; Wed, 12 May 2021 12:32:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620786735;
 bh=yVGx8LT1jpenzhzRS9CC+kR2Rw7k5aQKWVRC6W8hOgo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TEZYvS+z11jMFWWkOvPHoaRuoeNDkEVlh3XTONrh8zp8h6xJVHfHsh06aKfGVbvd4
 oB0JqStDGaJnaWkv0Z3c1Av1JwAxwQhoipfX66yO6bqYTWoCtX+EAzgE5G1W/2xiiM
 JRq+vUViLRa/jMTGWbabPLu7yLdIM8q6KQ+9uEOg=
Date: Wed, 12 May 2021 12:30:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 4/5] hw/ppc/fdt: Drop dependency on libfdt
Message-ID: <YJs938JVdO5SRYSs@yekko>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-5-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Li/0E0h/KzyZbp22"
Content-Disposition: inline
In-Reply-To: <20210511155354.3069141-5-philmd@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Li/0E0h/KzyZbp22
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 05:53:53PM +0200, Philippe Mathieu-Daud=E9 wrote:
> hw/ppc/fdt.c defines the ppc_create_page_sizes_prop() function,
> which is unrelated to the libfdt. Remove the incorrect library
> dependency on the file.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

This is definitely wrong as it stands.  AFAICT this doesn't add a
build of hw/ppc/fdt.c anywhere, but it is definitely needed by both
pseries and powernv machine types, who select FDT_PPC for this exact
reason.

I will grant you that it is badly named.  It is in fact related to
libfdt, just rather indirectly.

> ---
>  hw/ppc/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index e82a6b4105b..580e6e42c8a 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -3,9 +3,9 @@
>    'ppc.c',
>    'ppc_booke.c',
>  ))
> -ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: [files(
> +ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: files(
>    'fdt.c',
> -), fdt])
> +))
>  ppc_ss.add(when: 'CONFIG_FW_CFG_PPC', if_true: files('fw_cfg.c'))
> =20
>  # IBM pSeries (sPAPR)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Li/0E0h/KzyZbp22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCbPd8ACgkQbDjKyiDZ
s5JcDxAAoB9Ux+n1eMG3kp9OXWOzWkEfAtzzsqMG3MM46yZl9aWF1eSTnAoUvNV0
qswJ9UaGz54L9v+ejSag9iBZ3Mp7SEvZd6mK33mi5u/iMHynQCKQ4oZLD6XJTR0R
MNQW0lvxvrx4q6vJ+Oo+YEUJClRb04HCF8mOfsRPBBKFt0VqYyAPgTsaLc7mQB1B
2o7pKh10/BLhVrbGhxme0L+DNRppf4bePlmBqPxJKF3LSVCj/FCOg6EcPsBVwRtv
GN3ci/PY32tJpLRSDAqubIvKlk7tuFxX6LAIozK5G66Z6bk4MYvh8j8qGNuvWzXU
yMdyjX7XhqEugW48+lHmsQbVRU5PHuMyN8fZ4QdhDjUrDJ7wwVhy2jU85jUfaSO+
xnv6jLKm3GUmZiR7AmpCGd9RZA++889Herm7+wAcpFu6puro+r8NTuvEM4p4RsoN
Lj/26MLnUcjuIYbRHBq+F9F3aX4dwLg13n5txxaNVu01BgPBKKuNdelvacRgXnqH
91f8VM2a6SCaxZUep4UIahQ0jrG5TjiOa2YmmxAh8O4FAjZwGpVgtkXnjlNqXbA2
nQTDTCVMtpbAeP4BlstoJeglY4tHfx7+HzJmfAzSjIXkJr1J/dqcdpwdDbq6oPQQ
d26ooSaBodTS6C6+6Ixtm4BhgUjDGw1cE1vs8Q2aSYqsAiuqfrM=
=qT59
-----END PGP SIGNATURE-----

--Li/0E0h/KzyZbp22--

