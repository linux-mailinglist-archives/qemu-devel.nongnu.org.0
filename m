Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4078C3BF38C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:26:32 +0200 (CEST)
Received: from localhost ([::1]:51210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IoB-0000sB-86
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1IX2-0004IA-6D
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:08:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58403 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1IWz-0000gt-8X
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:08:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GKypn3c9tz9sXV; Thu,  8 Jul 2021 11:08:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625706513;
 bh=H+SNVali05qUZ+kgiNYkCnNph7BvJ0caSJtAy7Xz/Ew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cfab8D6WAlvlXNTnUUkhVOTZuLlhAQ8QQ5dRVekNMTKK/45Cnh3IeGU31ncTqGwfA
 nCE8tVRG9B3+pIN4xdYMUkvZMka2SAVVlksBBAXgcEK3IdvJ/I3pX5eBLJm/GavjBL
 t6QAO8G7/RDq/lQm+FFljyaOVz57MAcNExBZh2hU=
Date: Thu, 8 Jul 2021 10:58:11 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 2/2] docs/system: ppc: Update ppce500 documentation with
 eTSEC support
Message-ID: <YOZNo9N0hpcVRV6Q@yekko>
References: <20210706043124.1871866-1-bmeng.cn@gmail.com>
 <20210706043124.1871866-2-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iUXiIigvfMIijbzn"
Content-Disposition: inline
In-Reply-To: <20210706043124.1871866-2-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iUXiIigvfMIijbzn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 12:31:24PM +0800, Bin Meng wrote:
> This adds eTSEC support to the PowerPC `ppce500` machine documentation.
>=20
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Applied to ppc-for-6.1, thanks.

> ---
>=20
>  docs/system/ppc/ppce500.rst | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
> index 7a815c1881..afc58f60f5 100644
> --- a/docs/system/ppc/ppce500.rst
> +++ b/docs/system/ppc/ppce500.rst
> @@ -19,6 +19,7 @@ The ``ppce500`` machine supports the following devices:
>  * Power-off functionality via one GPIO pin
>  * 1 Freescale MPC8xxx PCI host controller
>  * VirtIO devices via PCI bus
> +* 1 Freescale Enhanced Triple Speed Ethernet controller (eTSEC)
> =20
>  Hardware configuration information
>  ----------------------------------
> @@ -121,7 +122,7 @@ To boot the 32-bit Linux kernel:
>  Running U-Boot
>  --------------
> =20
> -U-Boot mainline v2021.04 release is tested at the time of writing. To bu=
ild a
> +U-Boot mainline v2021.07 release is tested at the time of writing. To bu=
ild a
>  U-Boot mainline bootloader that can be booted by the ``ppce500`` machine=
, use
>  the qemu-ppce500_defconfig with similar commands as described above for =
Linux:
> =20
> @@ -154,3 +155,10 @@ interface at PCI address 0.1.0, but we can switch th=
at to an e1000 NIC by:
>                      -display none -serial stdio \
>                      -bios u-boot \
>                      -nic tap,ifname=3Dtap0,script=3Dno,downscript=3Dno,m=
odel=3De1000
> +
> +The QEMU ``ppce500`` machine can also dynamically instantiate an eTSEC d=
evice
> +if =E2=80=9C-device eTSEC=E2=80=9D is given to QEMU:
> +
> +.. code-block:: bash
> +
> +  -netdev tap,ifname=3Dtap0,script=3Dno,downscript=3Dno,id=3Dnet0 -devic=
e eTSEC,netdev=3Dnet0

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--iUXiIigvfMIijbzn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDmTaIACgkQbDjKyiDZ
s5IY+Q//YMpfHL7wBHHZSdW+B/ajwEXODfx3ml/D/TunQHAHppn8MgHP2ppghI7c
qa4XU0Q14o1ZKLXlc8c4gtJBdD7bXhlFoASN9Q8dhXCrNoCKf5rLTPO2mmyrOBzj
wW8ZXs3EFPxkRQ3et+zpk8PSPKtBCVcyqDarg8MBlN2STMzhqDBsPWmSw0so3Goz
4hT6wIBt+YIfMRUH6If6aJwt+G71mch5Ifowpd65eEZQAuS6iBA6aT0iU6G+tly8
Vd2uhlUwQqV64tzcoKNCfZnnk2Nyi1IBrR9EbA9bYlIqW1F8EEYXW3BiEe2P5ztr
d4RaJc/t+gBO3JjGSaJ1034fTDoFvh2IPF1aXZp9Cz7UXKrkSGIn9mk/CPiqBBAr
ZxmHctIjr8qW9jhwThf3b1V+vqcys6b3zRajiVRlsdMVebY08O8/OBXwobbHmiW4
v/JuNlPwezMdJ6HCIgYgzOYcUy9D4oXttSiaRHD2jlCZxdjw/YKAmiRd1O11oTng
sMO77arIuEXR5mN9HNfZFjxmBo+4BH/JErhmjB8R0dFj4dfM6j8Bcst2X1nY1zLB
pKCVryvsa7cLko1ViQv9z5lfEOokzr79qGYxt8SPpmIs41PX+ye/8Ag0ja1zT4cN
BW6F0p1+69OmdBrCGwD2WzutOat6Vel1WRcrJmxxm0bqAgVvVm4=
=o+Xw
-----END PGP SIGNATURE-----

--iUXiIigvfMIijbzn--

