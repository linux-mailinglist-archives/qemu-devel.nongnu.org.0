Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88860380107
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 02:01:07 +0200 (CEST)
Received: from localhost ([::1]:40852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhLGM-0006ZH-94
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 20:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lhLEB-0003r3-FB; Thu, 13 May 2021 19:58:51 -0400
Received: from ozlabs.org ([203.11.71.1]:38799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lhLE9-0007o5-7O; Thu, 13 May 2021 19:58:51 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fh7sd2h0Mz9sRR; Fri, 14 May 2021 09:58:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620950325;
 bh=NGJiw+c3v8+0qcNLQ6IUDvyme+4rcHUqAJCzFyuWRno=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IiutoygCXINUUB2uzb6/JSkCyWbEb5Mm7rMMw8CwP52ORTLtfobBZhEtJuuSoDYwR
 QtCoUNqVDN2nzJq9a62wOxPSITyGOEJt4vafOgYZZJPvx3j7kydfma/qsiRm+HgaoM
 oQU+olQzGDAaWx1pnKJm4HYwz2RacW7j8EEdkquQ=
Date: Fri, 14 May 2021 09:36:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 08/10] hw/ppc/Kconfig: Add missing dependency E500 ->
 DS1338 RTC
Message-ID: <YJ24EXL8GTOV4H9y@yekko>
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-9-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d3MpvB8CdXoGWJCp"
Content-Disposition: inline
In-Reply-To: <20210513163858.3928976-9-philmd@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org,
 Amit Singh Tomar <amit.tomar@freescale.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Randrianasulu <randrianasulu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--d3MpvB8CdXoGWJCp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 06:38:56PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Commit 7abb479c7ab ("PPC: E500: Add FSL I2C controller and integrate
> RTC with it") added a global dependency on the DS1338 model, instead
> of a machine one (via Kconfig). This gives trouble when building
> standalone machines not exposing I2C bus:
>=20
>   The following clauses were found for DS1338
>=20
>       CONFIG_DS1338=3Dy
>       config DS1338 depends on I2C
>=20
> Fix by selecting the DS1338 symbol in the single machine requiring
> it, the E500.
>=20
> Fixes: 7abb479c7ab ("PPC: E500: Add FSL I2C controller and integrate RTC =
with it")
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> Cc: Amit Singh Tomar <amit.tomar@freescale.com>
> Cc: Andrew Randrianasulu <randrianasulu@gmail.com>
> ---
>  default-configs/devices/ppc-softmmu.mak | 1 -
>  hw/ppc/Kconfig                          | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/default-configs/devices/ppc-softmmu.mak b/default-configs/de=
vices/ppc-softmmu.mak
> index c2d41198cde..5a7f99d1e45 100644
> --- a/default-configs/devices/ppc-softmmu.mak
> +++ b/default-configs/devices/ppc-softmmu.mak
> @@ -1,7 +1,6 @@
>  # Default configuration for ppc-softmmu
> =20
>  # For embedded PPCs:
> -CONFIG_DS1338=3Dy
>  CONFIG_E500=3Dy
>  CONFIG_PPC405=3Dy
>  CONFIG_PPC440=3Dy
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 66e0b15d9ef..2e4c56eb770 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -128,6 +128,7 @@ config E500
>      select SERIAL
>      select MPC_I2C
>      select FDT_PPC
> +    select DS1338
> =20
>  config VIRTEX
>      bool

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--d3MpvB8CdXoGWJCp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCduBEACgkQbDjKyiDZ
s5LPDhAAjhEC/5EgnuuZObt3Pivvy+Bnc5QZEtUyIzFfdKhkKjnHvYNXjrxFRNS5
PLWDgh4SVFWsI+R4W2O0XgxYTBN0ZLbhg6VDJhzlGaeKxAZ3dTtReJlVqvQ8FRA2
nXkLWWgliXUC/IUBEWCITUjW+0AMoeoHACzjBgDvaVzNj2fIi4umileFQbXgEG3W
chMKwzvdGrodfiR3JHKvAEOCbtwdaHhcVw718wuyt3Qr7mM7emWIsDKn20jwCq8M
738pxPFNW5lrHn3NtS2NtjrjK0jr7Eu0hty9JDl2j6dHThsiGu935UeCxixuniVw
7rFk4kbms4HiOFNVkaaCvuV8I3/pbo2Jsee0sX/mrjIZgm4f927Sc/FqPdFq78H2
1kZqcaRquie4XVIVf+aT46doNGLJsOs9OoZJgyCU7Bd03/dNu6gcCr44VI/1LZ6S
hhjrD20OPKIamq2YY8MmmbLXJkW2m50rn/VbaAVE3w+OE9JVivLzP6SaAQno1HYC
i4nkXUKLOJGbGaKvPZOw57it9koHm6jD/glV2Gn4AgnVUOGNJc4iKmrrVtMEJLfO
0p3mc7KfD57iLaXSVu2+v4SDjzwNMDoY+3WldVha76WFPi5xyny095mBAqMjt1hT
cUWrEEwwl2byEmFZflb33CTcE+7OvIDzzeNUX0ZJZSUu01hZaAA=
=nHAb
-----END PGP SIGNATURE-----

--d3MpvB8CdXoGWJCp--

