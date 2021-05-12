Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADED37B42E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 04:33:57 +0200 (CEST)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgeh9-0003OA-VN
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 22:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lgeff-0001oP-Um; Tue, 11 May 2021 22:32:23 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54701 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lgefc-0003uc-OA; Tue, 11 May 2021 22:32:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FfzMg23T1z9sWp; Wed, 12 May 2021 12:32:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620786735;
 bh=QBDQe7BMDYa6P+4r5s/GEdWl2ZJLbxBOPxiykdH6Bfc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PmebKdPRu1qG6xEGKxEDqWmw2if2IzTjZTmPYkMqN6XyesswLrVOJlsvo94+kWrtL
 YDhPyrEXKjN48E/2SggUkrjFqgOXVFQm1Gn8m1sUwVcvQc8uEULcmxqAJTLTKlpLTk
 21kkR+VvORmUxWcQpQ/VjLZ+UN6Mdl+Z8dd7VKA0=
Date: Wed, 12 May 2021 12:27:16 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 3/5] hw/ppc: Have pSeries depends on libfdt (via host
 Kconfig FDT symbol)
Message-ID: <YJs9BH+j1FAMIOjP@yekko>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IGULLemGSK/rbfx9"
Content-Disposition: inline
In-Reply-To: <20210511155354.3069141-4-philmd@redhat.com>
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


--IGULLemGSK/rbfx9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 05:53:52PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Since commit fea35ca4b8e ("ppc/spapr: Receive and store device
> tree blob from SLOF") the pSeries machine depends on the libfdt
> fdt_check_full() call, which is available in libfdt v1.4.7.
>=20
> Add the corresponding Kconfig dependency.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

I don't love making this conditional.  Pseries is by far the best
tested and most widely used ppc machine type, so it seems like it
would break expectations to not compile this in rather than giving an
error saying you need a newer libfdt.

> ---
>  hw/ppc/Kconfig     | 1 +
>  hw/ppc/meson.build | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 66e0b15d9ef..3935b73456f 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -1,5 +1,6 @@
>  config PSERIES
>      bool
> +    depends on FDT
>      imply PCI_DEVICES
>      imply TEST_DEVICES
>      imply VIRTIO_VGA
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index 86d6f379d1c..e82a6b4105b 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -9,7 +9,7 @@
>  ppc_ss.add(when: 'CONFIG_FW_CFG_PPC', if_true: files('fw_cfg.c'))
> =20
>  # IBM pSeries (sPAPR)
> -ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
> +ppc_ss.add(when: 'CONFIG_PSERIES', if_true: [files(
>    'spapr.c',
>    'spapr_caps.c',
>    'spapr_vio.c',
> @@ -28,7 +28,7 @@
>    'spapr_rtas_ddw.c',
>    'spapr_numa.c',
>    'pef.c',
> -))
> +), fdt])
>  ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
>  ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
>    'spapr_pci_vfio.c',

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IGULLemGSK/rbfx9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCbPQQACgkQbDjKyiDZ
s5JrTxAApQOG3jcT+LbVqeMVkoKENko+jpJW62mBOV1LK7ZRgYgEEPXbJe67cqKb
cvxpl1hQBPXIZhC8KR0wncGRtYmzXrW7+EOqc6PB0+IJasgK/NCGqB8Fk9fx5PjO
g8v/PVBkAnxN2ZocUtnaMONkq1/jkvOTDfOnBgtfR35+qgV5wevRG59d9f8iklKc
EyNoWGmtUguj2K/iCcTJKx5CeZ6lgJucJOrOj1O428wcOqEvBOHto9FCpKUDMhG5
Gx3KrOafySwhAUzo3eErbs+WCCeSEsqdZdeVTZN3ofHIOnZn+NcJB0e5WNy3EG/b
HceRCQ58U/H5TIlIuPyuw/y8nVPGK96FoRjJKgWtDRsLHqNddQzupf7pyjzPfpbo
PEVWTNmqgynx7GD2gQicKOKaQPRDAx4sA3ciXK2A+tS+QsX/W71zgXqp4YEJq0eM
O89EdgpAcK+vPnxlvcVpYpEs4udX030r5YHDnhAdzteqtzZRCyJnh356NdZgTBVI
fAsXoGI4YB0f1VLDZ86y0Sb8pBF6SajSu9tEZnVPhe3HNmkFB6SswVLqKMUQ2G+1
moaHA1TySYNSb3ZB+S2VqRmU6zvr+40237dkDQESoqjOUU+AUJhxkTXoH8Xr/5mN
HY5CpYag2p7aHsjx1wu9sqxJrN2QNMv9wDTqzs/vpfPLXMl8S10=
=RT5x
-----END PGP SIGNATURE-----

--IGULLemGSK/rbfx9--

