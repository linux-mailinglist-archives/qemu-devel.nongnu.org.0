Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2AD37B42F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 04:34:04 +0200 (CEST)
Received: from localhost ([::1]:38082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgehH-0003lV-Ly
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 22:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lgeff-0001o4-01; Tue, 11 May 2021 22:32:23 -0400
Received: from ozlabs.org ([203.11.71.1]:48267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lgefc-0003uY-Vp; Tue, 11 May 2021 22:32:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FfzMg1FJbz9sX2; Wed, 12 May 2021 12:32:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620786735;
 bh=zWdzIevbLWun4MXmfWXa1h05wVUtNcgnYYA3jie2884=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aqzBghEfJpZwyPnz0SVfzkVOEMAVTRuRGREEuR6NF4mhOqB4Yi2VjKNzCMK5sw4AW
 o4MSVQ3n8+8I1ZAby1ieQ2uJwVTLBH8VGDZ1f7Vtoc5qt80XaROCONcLSg0gfQkIdM
 cz+pFy4sWv4Skq+Xn0uhqNqX4eXuyL1yn9jf3RqA=
Date: Wed, 12 May 2021 12:24:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
Message-ID: <YJs8anLs1zL3nPdS@yekko>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qMWwRlmE27uFItL/"
Content-Disposition: inline
In-Reply-To: <20210511155354.3069141-2-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qMWwRlmE27uFItL/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 05:53:50PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Per the kconfig.rst:
>=20
>   A device should be listed [...] ``imply`` if (depending on
>   the QEMU command line) the board may or  may not be started
>   without it.
>=20
> This is the case with the NVDIMM device, so use the 'imply'
> weak reverse dependency to select the symbol.

Uh.. It should definitely be possible to start a pseries machine
without NVDIMM.  I would have guessed the same for PC.

>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  default-configs/devices/ppc64-softmmu.mak | 1 -
>  hw/arm/Kconfig                            | 1 +
>  hw/i386/Kconfig                           | 1 +
>  hw/mem/Kconfig                            | 2 --
>  hw/ppc/Kconfig                            | 1 +
>  5 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/=
devices/ppc64-softmmu.mak
> index ae0841fa3a1..cca52665d90 100644
> --- a/default-configs/devices/ppc64-softmmu.mak
> +++ b/default-configs/devices/ppc64-softmmu.mak
> @@ -8,4 +8,3 @@ CONFIG_POWERNV=3Dy
> =20
>  # For pSeries
>  CONFIG_PSERIES=3Dy
> -CONFIG_NVDIMM=3Dy
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index b887f6a5b17..67723d9ea6a 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -6,6 +6,7 @@ config ARM_VIRT
>      imply VFIO_PLATFORM
>      imply VFIO_XGMAC
>      imply TPM_TIS_SYSBUS
> +    imply NVDIMM
>      select ARM_GIC
>      select ACPI
>      select ARM_SMMUV3
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 7f91f30877f..66838fa397b 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -23,6 +23,7 @@ config PC
>      imply TPM_TIS_ISA
>      imply VGA_PCI
>      imply VIRTIO_VGA
> +    imply NVDIMM
>      select FDC
>      select I8259
>      select I8254
> diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
> index a0ef2cf648e..8b19fdc49f1 100644
> --- a/hw/mem/Kconfig
> +++ b/hw/mem/Kconfig
> @@ -7,6 +7,4 @@ config MEM_DEVICE
> =20
>  config NVDIMM
>      bool
> -    default y
> -    depends on (PC || PSERIES || ARM_VIRT)
>      select MEM_DEVICE
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index e51e0e5e5ac..66e0b15d9ef 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -3,6 +3,7 @@ config PSERIES
>      imply PCI_DEVICES
>      imply TEST_DEVICES
>      imply VIRTIO_VGA
> +    imply NVDIMM
>      select DIMM
>      select PCI
>      select SPAPR_VSCSI

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qMWwRlmE27uFItL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCbPGYACgkQbDjKyiDZ
s5IhMw//XHuWL0LI52jnQCIrwW5E5UE+x9LXCm+gDEg5BtjCpmTeE2esuGGpoOrC
W3Q2sgDe434cj4wXvCPZJ+aXPt0ktFhScDS1aGA5mkvhn2pZ6k2j63ELk/jot68x
DMDy5NK+z8UQo3nAKc+lS3j2oECh75oBVaXvI0I8QZqIzrhzqIKwb1meJTSoAa1H
kq5houW6R42TvPQCfbPKuMpPxnuTTpxpyvIKvHX03qqFqyayxFf5FrvEU6ccm/RX
0Ow+f5efCGzM9FhWzWpw0ukXey7RSeYO92YtrW1c3aLJrHRuZZaA6ZUpER4tLjiG
t/kK790CvQflts3Ge+NzMfpPFkOPtuJiqnhM353NSC3rYagNrTlnxOCa+BHTvEW+
E2ISj5B3G+bcslrt1IgAsJGM/pkgZLT3dl1h2P+Li66mAizuWijTMvH1SjWXqHJF
EU6xyZhaN06P0BoCR2MRhVvLKkdtI/1CZyyhlcTWXjuKORmPagfIysvldAuMmkzX
mmZpPss5GJ18Ny1WY1fZ4jdUZa333uUoIMceays0jSlMUgUIQxAAhOXmzfgznAkV
nDIO6ay2/JXSKzPcOmoOBA/xzs2Gt67rPhcBLuojHqD+jcQkaSLJulfJl2k1MTgF
6R2yqeVMiBDugl4tctNF6E+plPzilTr4FnUiADifgrUZPUWD/tY=
=AgV4
-----END PGP SIGNATURE-----

--qMWwRlmE27uFItL/--

